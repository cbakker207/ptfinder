from flask import Flask, jsonify, request
from flask_cors import CORS
import mysql.connector
import datetime

app = Flask(__name__)
CORS(app)

db_config = {
    "host": "localhost",
    "user": "root",
    "password": "", #INSERT MYSQL PASSWORD
    "database": "peer_teacher"
}

def get_conn():
    return mysql.connector.connect(**db_config)


# Convert MySQL TIME → "10:00 AM"
def convert_time(t):
    t = datetime.datetime.strptime(str(t), "%H:%M:%S")
    return t.strftime("%I:%M %p").lstrip("0")


@app.get("/pts")
def get_pts():
    conn = get_conn()
    cur = conn.cursor(dictionary=True)

    # Get base PT list
    cur.execute("""
        SELECT pt_id, first_name, last_name, email, picture_url, rating
        FROM PeerTeachers
    """)
    pts = cur.fetchall()

    full_data = []

    for pt in pts:
        pt_id = pt["pt_id"]

        # Convert rating to float (avoid toFixed() crash)
        pt_rating = float(pt["rating"]) if pt["rating"] is not None else 0.0

        # Get classes taught
        cur.execute("""
            SELECT course_name
            FROM Courses c
            JOIN PeerTeacherCourses pc ON c.course_id = pc.course_id
            WHERE pc.pt_id = %s
        """, (pt_id,))
        classes = [row["course_name"] for row in cur.fetchall()]

        # Get office hours
        cur.execute("""
            SELECT day_of_week, start_time, end_time, location
            FROM OfficeHours
            WHERE pt_id = %s
            ORDER BY FIELD(day_of_week, 
                'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday')
        """, (pt_id,))
        office_rows = cur.fetchall()

        office_hours = []
        for row in office_rows:
            office_hours.append({
                "day": row["day_of_week"],
                "time": f"{convert_time(row['start_time'])} - {convert_time(row['end_time'])}",
                "location": row["location"]
            })

        full_data.append({
            "pt_id": pt_id,
            "name": f"{pt['first_name']} {pt['last_name']}",
            "email": pt["email"],
            "picture_url": pt["picture_url"],
            "rating": pt_rating,
            "numRatings": 20,  # Placeholder
            "classes": classes,
            "officeHours": office_hours
        })

    cur.close()
    conn.close()

    return jsonify(full_data)



@app.post("/rate")
def rate_pt():
    data = request.json
    pt_id = data["ptId"]
    rating = data["rating"]

    conn = get_conn()
    cur = conn.cursor()

    cur.execute("""
        UPDATE PeerTeachers 
        SET rating = %s
        WHERE pt_id = %s
    """, (rating, pt_id))

    conn.commit()
    cur.close()
    conn.close()

    return jsonify({"message": "Rating updated"}), 200



if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5001, debug=True)

