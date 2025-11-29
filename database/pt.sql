CREATE DATABASE IF NOT EXISTS peer_teacher;
USE peer_teacher;

CREATE TABLE IF NOT EXISTS PeerTeachers (
    pt_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    picture_url VARCHAR(255),
    rating DECIMAL(3,2)
);


CREATE TABLE IF NOT EXISTS Courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS PeerTeacherCourses (
    pt_id INT,
    course_id INT,
    PRIMARY KEY (pt_id, course_id),
    FOREIGN KEY (pt_id) REFERENCES PeerTeachers(pt_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id) ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS OfficeHours (
    oh_id INT PRIMARY KEY AUTO_INCREMENT,
    pt_id INT NOT NULL,
    day_of_week ENUM('Monday','Tuesday','Wednesday','Thursday','Friday') NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    location VARCHAR(100),
    FOREIGN KEY (pt_id) REFERENCES PeerTeachers(pt_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS PTRatings (
    rating_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    pt_id INT NOT NULL,
    rating INT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    UNIQUE(user_id, pt_id), -- prevents duplicate ratings
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (pt_id) REFERENCES PeerTeachers(pt_id)
);
