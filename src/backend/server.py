from flask import Flask, jsonify, request
from flask_cors import CORS
import mysql.connector
import datetime

app = Flask(__name__)
CORS(app)

db_config = {
    "host": "localhost",
    "user": "root",
    "password": "@06s21p04Aamil062104",
    "database": "peer_teacher"
}

def get_conn():
    return mysql.connector.connect(**db_config)


# Convert MySQL TIME → 12-hour format
def convert_time(t):
    t = datetime.datetime.strptime(str(t), "%H:%M:%S")
    return t.strftime("%I:%M %p").lstrip("0")


# -----------------------------------------------------------
# LOGIN (email only)
# -----------------------------------------------------------
@app.post("/login")
def login():
    email = request.json.get("email")

    conn = get_conn()
    cur = conn.cursor(dictionary=True)

    cur.execute("SELECT user_id FROM Users WHERE email = %s", (email,))
    row = cur.fetchone()

    if row:
        return jsonify({"user_id": row["user_id"]})

    cur.execute("INSERT INTO Users (email) VALUES (%s)", (email,))
    conn.commit()

    return jsonify({"user_id": cur.lastrowid})


# -----------------------------------------------------------
# CHECK IF USER HAS RATED A PT
# -----------------------------------------------------------
@app.get("/user-rating")
def user_rating():
    user_id = request.args.get("userId")
    pt_id = request.args.get("ptId")

    conn = get_conn()
    cur = conn.cursor(dictionary=True)

    cur.execute("""
        SELECT rating FROM PTRatings
        WHERE user_id = %s AND pt_id = %s
    """, (user_id, pt_id))

    row = cur.fetchone()

    return jsonify({"hasRated": row is not None})


# -----------------------------------------------------------
# RATE PT (ONE PER USER)
# -----------------------------------------------------------
@app.post("/rate")
def rate_pt():
    data = request.json
    user_id = data["userId"]
    pt_id = data["ptId"]
    rating = data["rating"]

    conn = get_conn()
    cur = conn.cursor()

    cur.execute("""
        INSERT INTO PTRatings (user_id, pt_id, rating)
        VALUES (%s, %s, %s)
        ON DUPLICATE KEY UPDATE rating = VALUES(rating)
    """, (user_id, pt_id, rating))

    conn.commit()
    return jsonify({"message": "Rating saved"}), 200


# -----------------------------------------------------------
# GET ALL PEER TEACHERS (WITH AVG RATING)
# -----------------------------------------------------------
@app.get("/pts")
def get_pts():
    conn = get_conn()
    cur = conn.cursor(dictionary=True)

    cur.execute("""
        SELECT pt_id, first_name, last_name, email, picture_url
        FROM PeerTeachers
    """)
    pts = cur.fetchall()

    full_data = []

    for pt in pts:
        pt_id = pt["pt_id"]

        cur.execute("""
            SELECT course_name 
            FROM Courses c
            JOIN PeerTeacherCourses pc ON c.course_id = pc.course_id
            WHERE pc.pt_id = %s
        """, (pt_id,))
        classes = [r["course_name"] for r in cur.fetchall()]

        cur.execute("""
            SELECT COALESCE(AVG(rating), 0) AS avg_rating,
                   COUNT(*) AS total
            FROM PTRatings
            WHERE pt_id = %s
        """, (pt_id,))
        rating_data = cur.fetchone()

        cur.execute("""
            SELECT day_of_week, start_time, end_time, location
            FROM OfficeHours
            WHERE pt_id = %s
            ORDER BY FIELD(day_of_week,'Monday','Tuesday','Wednesday','Thursday','Friday')
        """, (pt_id,))
        office_rows = cur.fetchall()

        office_hours = [
            {
                "day": r["day_of_week"],
                "time": f"{convert_time(r['start_time'])} - {convert_time(r['end_time'])}",
                "location": r["location"]
            }
            for r in office_rows
        ]

        full_data.append({
            "pt_id": pt_id,
            "name": f"{pt['first_name']} {pt['last_name']}",
            "email": pt["email"],
            "picture_url": pt["picture_url"],
            "rating": float(rating_data["avg_rating"]),
            "numRatings": rating_data["total"],
            "classes": classes,
            "officeHours": office_hours,
        })

    return jsonify(full_data)


# -----------------------------------------------------------
# RUN
# -----------------------------------------------------------
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5001, debug=True)
