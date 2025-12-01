USE peer_teacher;

-- Clear previous data
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE PeerTeachers;
TRUNCATE TABLE Courses;
TRUNCATE TABLE PeerTeacherCourses;
TRUNCATE TABLE OfficeHours;
TRUNCATE TABLE Users;
TRUNCATE TABLE PTRatings;
SET FOREIGN_KEY_CHECKS = 1;


INSERT INTO Courses (course_name) VALUES
('CSCE 121'), ('CSCE 181'), ('CSCE 206'), ('CSCE 221'), ('CSCE 222'),
('CSCE 312'), ('CSCE 313'), ('CSCE 314'), ('CSCE 315'), ('CSCE 331'),
('CSCE 411'), ('CSCE 412'), ('CSCE 420'), ('CSCE 434'), ('CSCE 435'),
('CSCE 436'), ('CSCE 440'), ('CSCE 444'), ('CSCE 447'), ('CSCE 489');


INSERT INTO PeerTeachers (first_name, last_name, email, picture_url, rating)
VALUES
('Sarah', 'Johnson', 'sarah.johnson@tamu.edu', 'https://images.unsplash.com/photo-1524504388940-b1c1722653e1', 4.8),
('Michael', 'Chen', 'michael.chen@tamu.edu', 'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde', 4.6),
('Emily', 'Rodriguez', 'emily.rodriguez@tamu.edu', 'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e', 4.9),
('David', 'Thompson', 'david.thompson@tamu.edu', 'https://images.unsplash.com/photo-1595152772835-219674b2a8a6', 4.7),
('Jessica', 'Martinez', 'jessica.martinez@tamu.edu', 'https://images.unsplash.com/photo-1494790108377-be9c29b29330', 4.5),
('Ryan', 'Patel', 'ryan.patel@tamu.edu', 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e', 4.8),
('Alyssa', 'Chang', 'alyssa.chang@tamu.edu', 'https://images.unsplash.com/photo-1502685104226-ee32379fefbe', 4.6),
('Jason', 'Rivera', 'jason.rivera@tamu.edu', 'https://images.unsplash.com/photo-1544005313-94ddf0286df2', 4.2),
('Meghan', 'Lee', 'meghan.lee@tamu.edu', 'https://images.unsplash.com/photo-1520813792240-56fc4a3765a7', 4.7),
('Daniel', 'Nguyen', 'daniel.nguyen@tamu.edu', 'https://images.unsplash.com/photo-1614436163996-25cff40cde94', 4.8),

('Hannah', 'Price', 'hannah.price@tamu.edu', 'https://images.unsplash.com/photo-1554151228-14d9def656e4', 4.3),
('Jacob', 'Edwards', 'jacob.edwards@tamu.edu', 'https://images.unsplash.com/photo-1547425260-76bcadfb4f2c', 4.4),
('Natalie', 'Brooks', 'natalie.brooks@tamu.edu', 'https://images.unsplash.com/photo-1544725176-7c40e5a2c9f9', 4.9),
('Anthony', 'Reyes', 'anthony.reyes@tamu.edu', 'https://images.unsplash.com/photo-1552374196-c4e7ffc6e126', 4.5),
('Maya', 'Shah', 'maya.shah@tamu.edu', 'https://images.unsplash.com/photo-1523475496153-3d6ccfd7ed82', 4.6),
('Owen', 'Hall', 'owen.hall@tamu.edu', 'https://images.unsplash.com/photo-1599566150163-29194dcaad36', 4.4),
('Sophia', 'Davis', 'sophia.davis@tamu.edu', 'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e', 4.7),
('Liam', 'Roberts', 'liam.roberts@tamu.edu', 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d', 4.5),
('Zoe', 'Henderson', 'zoe.henderson@tamu.edu', 'https://images.unsplash.com/photo-1519085360753-af0119f7cbe7', 4.8),
('Ethan', 'Wong', 'ethan.wong@tamu.edu', 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e', 4.6),

('Madison', 'Gray', 'madison.gray@tamu.edu', 'https://images.unsplash.com/photo-1524503033411-c9566986fc8f', 4.7),
('Tyler', 'Simmons', 'tyler.simmons@tamu.edu', 'https://images.unsplash.com/photo-1531427186611-ecfd6d936c79', 4.5),
('Isabella', 'Vargas', 'isabella.vargas@tamu.edu', 'https://images.unsplash.com/photo-1520813792240-56fc4a3765a7', 4.9),
('Logan', 'Perry', 'logan.perry@tamu.edu', 'https://images.unsplash.com/photo-1584999734482-0361a557b8f6', 4.6),
('Grace', 'Miller', 'grace.miller@tamu.edu', 'https://images.unsplash.com/photo-1544005313-94ddf0286df2', 4.7),
('Caleb', 'Ford', 'caleb.ford@tamu.edu', 'https://images.unsplash.com/photo-1552374196-c4e7ffc6e126', 4.4),
('Ariana', 'Kim', 'ariana.kim@tamu.edu', 'https://images.unsplash.com/photo-1492562080023-ab3db95bfbce', 4.8),
('Noah', 'Sanders', 'noah.sanders@tamu.edu', 'https://images.unsplash.com/photo-1607746882042-944635dfe10e', 4.6),
('Kate', 'Bennett', 'kate.bennett@tamu.edu', 'https://images.unsplash.com/photo-1534528741775-53994a69daeb', 4.5),
('Oliver', 'Coleman', 'oliver.coleman@tamu.edu', 'https://images.unsplash.com/photo-1544725176-7c40e5a2c9f9', 4.7),

('Victoria', 'Young', 'victoria.young@tamu.edu', 'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e', 4.9),
('Henry', 'Clarke', 'henry.clarke@tamu.edu', 'https://images.unsplash.com/photo-1554151228-14d9def656e4', 4.6),
('Ava', 'Scott', 'ava.scott@tamu.edu', 'https://images.unsplash.com/photo-1502685104226-ee32379fefbe', 4.8),
('Jackson', 'Torres', 'jackson.torres@tamu.edu', 'https://images.unsplash.com/photo-1552374196-c4e7ffc6e126', 4.6),
('Ella', 'Murphy', 'ella.murphy@tamu.edu', 'https://images.unsplash.com/photo-1520813792240-56fc4a3765a7', 4.7),
('Jayden', 'Cruz', 'jayden.cruz@tamu.edu', 'https://images.unsplash.com/photo-1519085360753-af0119f7cbe7', 4.4),
('Lucy', 'Stewart', 'lucy.stewart@tamu.edu', 'https://images.unsplash.com/photo-1544725176-7c40e5a2c9f9', 4.8),
('Elias', 'Hughes', 'elias.hughes@tamu.edu', 'https://images.unsplash.com/photo-1523475496153-3d6ccfd7ed82', 4.5),
('Brooklyn', 'Price', 'brooklyn.price@tamu.edu', 'https://images.unsplash.com/photo-1547425260-76bcadfb4f2c', 4.7),
('Samuel', 'Barnes', 'samuel.barnes@tamu.edu', 'https://images.unsplash.com/photo-1599566150163-29194dcaad36', 4.6),

('Aubrey', 'Fisher', 'aubrey.fisher@tamu.edu', 'https://images.unsplash.com/photo-1520813792240-56fc4a3765a7', 4.8),
('Jack', 'Mason', 'jack.mason@tamu.edu', 'https://images.unsplash.com/photo-1552374196-c4e7ffc6e126', 4.5),
('Scarlett', 'Knight', 'scarlett.knight@tamu.edu', 'https://images.unsplash.com/photo-1524503033411-c9566986fc8f', 4.9),
('Leo', 'Owens', 'leo.owens@tamu.edu', 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d', 4.7),
('Mackenzie', 'Garcia', 'mackenzie.garcia@tamu.edu', 'https://images.unsplash.com/photo-1494790108377-be9c29b29330', 4.8),
('Wyatt', 'Harris', 'wyatt.harris@tamu.edu', 'https://images.unsplash.com/photo-1523475496153-3d6ccfd7ed82', 4.6),
('Hailey', 'Cooper', 'hailey.cooper@tamu.edu', 'https://images.unsplash.com/photo-1523475496153-3d6ccfd7ed82', 4.8),
('Luke', 'Ward', 'luke.ward@tamu.edu', 'https://images.unsplash.com/photo-1595152772835-219674b2a8a6', 4.7),
('Claire', 'Bishop', 'claire.bishop@tamu.edu', 'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e', 4.8),
('Mason', 'Porter', 'mason.porter@tamu.edu', 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e', 4.6);


INSERT INTO PeerTeacherCourses (pt_id, course_id) VALUES
(1, 1), (1, 4),
(2, 4), (2, 10),
(3, 2), (3, 14),
(4, 1), (4, 3),
(5, 5), (5, 9),
(6, 1), (6, 2),
(7, 6), (7, 7),
(8, 3), (8, 11),
(9, 12), (9, 14),
(10, 8), (10, 9),

(11, 10), (11, 12),
(12, 3), (12, 15),
(13, 11), (13, 13),
(14, 8), (14, 6),
(15, 18), (15, 19),
(16, 5), (16, 7),
(17, 9), (17, 1),
(18, 10), (18, 4),
(19, 11), (19, 12),
(20, 2), (20, 3),

(21, 14), (21, 9),
(22, 5), (22, 6),
(23, 10), (23, 14),
(24, 13), (24, 18),
(25, 1), (25, 2),
(26, 6), (26, 8),
(27, 9), (27, 7),
(28, 11), (28, 3),
(29, 10), (29, 5),
(30, 8), (30, 1),

(31, 19), (31, 4),
(32, 11), (32, 14),
(33, 13), (33, 2),
(34, 15), (34, 6),
(35, 5), (35, 7),
(36, 17), (36, 14),
(37, 9), (37, 10),
(38, 11), (38, 19),
(39, 12), (39, 3),
(40, 13), (40, 15),

(41, 4), (41, 8),
(42, 1), (42, 6),
(43, 9), (43, 12),
(44, 10), (44, 13),
(45, 14), (45, 17),
(46, 2), (46, 18),
(47, 7), (47, 11),
(48, 3), (48, 5),
(49, 12), (49, 14),
(50, 9), (50, 10);

INSERT INTO OfficeHours (pt_id, day_of_week, start_time, end_time, location) VALUES
-- PT 1
(1, 'Monday', '09:00', '11:00', 'ZACH Room 201'),
(1, 'Wednesday', '13:00', '15:00', 'ZACH Room 201'),

-- PT 2
(2, 'Tuesday', '10:00', '12:00', 'EABB Room 110'),
(2, 'Thursday', '14:00', '16:00', 'EABB Room 110'),

-- PT 3
(3, 'Monday', '12:00', '14:00', 'ZACH Room 312'),
(3, 'Friday', '09:00', '11:00', 'ZACH Room 312'),

-- PT 4
(4, 'Tuesday', '11:00', '13:00', 'EABB Room 210'),
(4, 'Thursday', '09:00', '11:00', 'EABB Room 210'),

-- PT 5
(5, 'Wednesday', '12:00', '14:00', 'ZACH Room 120'),
(5, 'Friday', '13:00', '15:00', 'ZACH Room 120'),

-- PT 6
(6, 'Monday', '10:00', '12:00', 'EABB Room 305'),
(6, 'Wednesday', '14:00', '16:00', 'EABB Room 305'),

-- PT 7
(7, 'Tuesday', '15:00', '17:00', 'ZACH Room 404'),
(7, 'Thursday', '09:00', '11:00', 'ZACH Room 404'),

-- PT 8
(8, 'Monday', '11:00', '13:00', 'ZACH Room 115'),
(8, 'Friday', '14:00', '16:00', 'ZACH Room 115'),

-- PT 9
(9, 'Wednesday', '10:00', '12:00', 'EABB Room 101'),
(9, 'Thursday', '13:00', '15:00', 'EABB Room 101'),

-- PT 10
(10, 'Tuesday', '09:00', '11:00', 'ZACH Room 501'),
(10, 'Friday', '12:00', '14:00', 'ZACH Room 501'),

-- PT 11
(11, 'Monday', '14:00', '16:00', 'ZACH Room 223'),
(11, 'Thursday', '10:00', '12:00', 'ZACH Room 223'),

-- PT 12
(12, 'Tuesday', '11:00', '13:00', 'EABB Room 212'),
(12, 'Friday', '09:00', '11:00', 'EABB Room 212'),

-- PT 13
(13, 'Wednesday', '13:00', '15:00', 'ZACH Room 334'),
(13, 'Thursday', '11:00', '13:00', 'ZACH Room 334'),

-- PT 14
(14, 'Monday', '10:00', '12:00', 'ZACH Room 142'),
(14, 'Friday', '15:00', '17:00', 'ZACH Room 142'),

-- PT 15
(15, 'Tuesday', '14:00', '16:00', 'EABB Room 303'),
(15, 'Thursday', '09:00', '11:00', 'EABB Room 303'),

-- PT 16
(16, 'Wednesday', '12:00', '14:00', 'ZACH Room 128'),
(16, 'Friday', '14:00', '16:00', 'ZACH Room 128'),

-- PT 17
(17, 'Monday', '13:00', '15:00', 'EABB Room 118'),
(17, 'Thursday', '12:00', '14:00', 'EABB Room 118'),

-- PT 18
(18, 'Tuesday', '10:00', '12:00', 'ZACH Room 240'),
(18, 'Friday', '11:00', '13:00', 'ZACH Room 240'),

-- PT 19
(19, 'Wednesday', '09:00', '11:00', 'EABB Room 411'),
(19, 'Thursday', '14:00', '16:00', 'EABB Room 411'),

-- PT 20
(20, 'Monday', '15:00', '17:00', 'ZACH Room 350'),
(20, 'Friday', '10:00', '12:00', 'ZACH Room 350'),

-- PT 21
(21, 'Tuesday', '12:00', '14:00', 'ZACH Room 220'),
(21, 'Thursday', '15:00', '17:00', 'ZACH Room 220'),

-- PT 22
(22, 'Wednesday', '10:00', '12:00', 'EABB Room 102'),
(22, 'Friday', '13:00', '15:00', 'EABB Room 102'),

-- PT 23
(23, 'Monday', '09:00', '11:00', 'ZACH Room 510'),
(23, 'Thursday', '12:00', '14:00', 'ZACH Room 510'),

-- PT 24
(24, 'Tuesday', '13:00', '15:00', 'EABB Room 221'),
(24, 'Friday', '09:00', '11:00', 'EABB Room 221'),

-- PT 25
(25, 'Wednesday', '14:00', '16:00', 'ZACH Room 340'),
(25, 'Thursday', '10:00', '12:00', 'ZACH Room 340'),

-- PT 26
(26, 'Monday', '11:00', '13:00', 'EABB Room 305'),
(26, 'Friday', '15:00', '17:00', 'EABB Room 305'),

-- PT 27
(27, 'Tuesday', '12:00', '14:00', 'ZACH Room 129'),
(27, 'Thursday', '14:00', '16:00', 'ZACH Room 129'),

-- PT 28
(28, 'Wednesday', '09:00', '11:00', 'EABB Room 218'),
(28, 'Friday', '13:00', '15:00', 'EABB Room 218'),

-- PT 29
(29, 'Monday', '10:00', '12:00', 'ZACH Room 410'),
(29, 'Thursday', '15:00', '17:00', 'ZACH Room 410'),

-- PT 30
(30, 'Tuesday', '11:00', '13:00', 'EABB Room 330'),
(30, 'Friday', '10:00', '12:00', 'EABB Room 330'),

-- PT 31
(31, 'Wednesday', '13:00', '15:00', 'ZACH Room 132'),
(31, 'Thursday', '11:00', '13:00', 'ZACH Room 132'),

-- PT 32
(32, 'Monday', '12:00', '14:00', 'EABB Room 207'),
(32, 'Friday', '14:00', '16:00', 'EABB Room 207'),

-- PT 33
(33, 'Tuesday', '09:00', '11:00', 'ZACH Room 515'),
(33, 'Thursday', '13:00', '15:00', 'ZACH Room 515'),

-- PT 34
(34, 'Wednesday', '12:00', '14:00', 'EABB Room 410'),
(34, 'Friday', '09:00', '11:00', 'EABB Room 410'),

-- PT 35
(35, 'Monday', '10:00', '12:00', 'ZACH Room 260'),
(35, 'Thursday', '12:00', '14:00', 'ZACH Room 260'),

-- PT 36
(36, 'Tuesday', '14:00', '16:00', 'EABB Room 322'),
(36, 'Friday', '10:00', '12:00', 'EABB Room 322'),

-- PT 37
(37, 'Wednesday', '13:00', '15:00', 'ZACH Room 122'),
(37, 'Thursday', '15:00', '17:00', 'ZACH Room 122'),

-- PT 38
(38, 'Monday', '09:00', '11:00', 'EABB Room 319'),
(38, 'Friday', '13:00', '15:00', 'EABB Room 319'),

-- PT 39
(39, 'Tuesday', '12:00', '14:00', 'ZACH Room 441'),
(39, 'Thursday', '10:00', '12:00', 'ZACH Room 441'),

-- PT 40
(40, 'Wednesday', '14:00', '16:00', 'EABB Room 305'),
(40, 'Friday', '11:00', '13:00', 'EABB Room 305'),

-- PT 41
(41, 'Monday', '11:00', '13:00', 'ZACH Room 152'),
(41, 'Thursday', '12:00', '14:00', 'ZACH Room 152'),

-- PT 42
(42, 'Tuesday', '10:00', '12:00', 'EABB Room 114'),
(42, 'Friday', '14:00', '16:00', 'EABB Room 114'),

-- PT 43
(43, 'Wednesday', '09:00', '11:00', 'ZACH Room 470'),
(43, 'Thursday', '13:00', '15:00', 'ZACH Room 470'),

-- PT 44
(44, 'Monday', '14:00', '16:00', 'EABB Room 281'),
(44, 'Friday', '10:00', '12:00', 'EABB Room 281'),

-- PT 45
(45, 'Tuesday', '11:00', '13:00', 'ZACH Room 160'),
(45, 'Thursday', '14:00', '16:00', 'ZACH Room 160'),

-- PT 46
(46, 'Wednesday', '12:00', '14:00', 'EABB Room 330'),
(46, 'Friday', '13:00', '15:00', 'EABB Room 330'),

-- PT 47
(47, 'Monday', '10:00', '12:00', 'ZACH Room 404'),
(47, 'Thursday', '15:00', '17:00', 'ZACH Room 404'),

-- PT 48
(48, 'Tuesday', '12:00', '14:00', 'EABB Room 290'),
(48, 'Friday', '11:00', '13:00', 'EABB Room 290'),

-- PT 49
(49, 'Wednesday', '13:00', '15:00', 'ZACH Room 334'),
(49, 'Thursday', '09:00', '11:00', 'ZACH Room 334'),

-- PT 50
(50, 'Monday', '12:00', '14:00', 'EABB Room 101'),
(50, 'Friday', '15:00', '17:00', 'EABB Room 101');

INSERT INTO Users (user_id, email) VALUES
(1, 'user1@tamu.edu'),
(2, 'user2@tamu.edu'),
(3, 'user3@tamu.edu'),
(4, 'user4@tamu.edu'),
(5, 'user5@tamu.edu'),
(6, 'user6@tamu.edu'),
(7, 'user7@tamu.edu'),
(8, 'user8@tamu.edu'),
(9, 'user9@tamu.edu'),
(10, 'user10@tamu.edu'),
(11, 'user11@tamu.edu'),
(12, 'user12@tamu.edu'),
(13, 'user13@tamu.edu'),
(14, 'user14@tamu.edu'),
(15, 'user15@tamu.edu'),
(16, 'user16@tamu.edu'),
(17, 'user17@tamu.edu'),
(18, 'user18@tamu.edu'),
(19, 'user19@tamu.edu'),
(20, 'user20@tamu.edu'),
(21, 'user21@tamu.edu'),
(22, 'user22@tamu.edu'),
(23, 'user23@tamu.edu'),
(24, 'user24@tamu.edu'),
(25, 'user25@tamu.edu'),
(26, 'user26@tamu.edu'),
(27, 'user27@tamu.edu'),
(28, 'user28@tamu.edu'),
(29, 'user29@tamu.edu'),
(30, 'user30@tamu.edu'),
(31, 'user31@tamu.edu'),
(32, 'user32@tamu.edu'),
(33, 'user33@tamu.edu'),
(34, 'user34@tamu.edu'),
(35, 'user35@tamu.edu'),
(36, 'user36@tamu.edu'),
(37, 'user37@tamu.edu'),
(38, 'user38@tamu.edu'),
(39, 'user39@tamu.edu'),
(40, 'user40@tamu.edu');

INSERT INTO PTRatings (user_id, pt_id, rating) VALUES
-- USER 1
(1, 11, 5),(1, 12, 4),(1, 13, 5),(1, 17, 4),

-- USER 2
(2, 9, 5),(2, 14, 4),(2, 16, 3),(2, 22, 5),

-- USER 3
(3, 4, 5),(3, 7, 4),(3, 11, 5),(3, 20, 5),

-- USER 4
(4, 2, 4),(4, 6, 5),(4, 18, 4),(4, 21, 5),(4, 25, 4),

-- USER 5
(5, 3, 5),(5, 8, 3),(5, 12, 4),(5, 14, 5),(5, 22, 4),

-- USER 6
(6, 7, 5),(6, 9, 4),(6, 11, 5),(6, 30, 4),(6, 32, 5),

-- USER 7
(7, 1, 4),(7, 7, 5),(7, 15, 4),(7, 28, 5),(7, 33, 4),

-- USER 8
(8, 5, 3),(8, 6, 4),(8, 13, 5),(8, 18, 5),(8, 24, 4),

-- USER 9
(9, 4, 5),(9, 10, 4),(9, 14, 3),(9, 26, 5),(9, 35, 4),

-- USER 10
(10, 11, 5),(10, 20, 4),(10, 23, 4),(10, 27, 5),(10, 36, 4),

-- USER 11
(11, 8, 4),(11, 12, 5),(11, 21, 4),(11, 33, 5),(11, 44, 4),

-- USER 12
(12, 9, 5),(12, 14, 4),(12, 19, 3),(12, 37, 4),(12, 49, 5),

-- USER 13
(13, 3, 5),(13, 6, 4),(13, 22, 5),(13, 29, 4),(13, 41, 5),

-- USER 14
(14, 5, 4),(14, 7, 5),(14, 27, 4),(14, 32, 4),(14, 48, 5),

-- USER 15
(15, 10, 5),(15, 13, 5),(15, 17, 3),(15, 20, 4),(15, 46, 5),

-- USER 16
(16, 14, 4),(16, 21, 5),(16, 24, 4),(16, 39, 5),(16, 50, 4),

-- USER 17
(17, 1, 3),(17, 5, 4),(17, 16, 5),(17, 28, 5),(17, 37, 4),

-- USER 18
(18, 3, 4),(18, 12, 5),(18, 22, 4),(18, 26, 3),(18, 40, 5),

-- USER 19
(19, 4, 5),(19, 7, 3),(19, 20, 4),(19, 35, 5),(19, 44, 4),

-- USER 20
(20, 8, 5),(20, 13, 4),(20, 23, 5),(20, 30, 4),(20, 38, 3),

-- USER 21
(21, 6, 4),(21, 7, 5),(21, 13, 4),(21, 19, 5),(21, 31, 4),

-- USER 22
(22, 2, 4),(22, 10, 3),(22, 17, 5),(22, 25, 4),(22, 48, 5),

-- USER 23
(23, 3, 5),(23, 7, 4),(23, 12, 5),(23, 29, 4),(23, 49, 5),

-- USER 24
(24, 9, 5),(24, 14, 4),(24, 22, 5),(24, 28, 3),(24, 40, 4),

-- USER 25
(25, 4, 4),(25, 8, 5),(25, 11, 4),(25, 32, 5),(25, 46, 5),

-- USER 26
(26, 5, 4),(26, 9, 3),(26, 20, 5),(26, 27, 4),(26, 33, 5),

-- USER 27
(27, 1, 5),(27, 6, 4),(27, 13, 4),(27, 30, 3),(27, 42, 5),

-- USER 28
(28, 3, 5),(28, 9, 4),(28, 12, 5),(28, 28, 4),(28, 41, 3),

-- USER 29
(29, 8, 4),(29, 15, 5),(29, 24, 4),(29, 31, 3),(29, 37, 5),

-- USER 30
(30, 10, 5),(30, 16, 4),(30, 23, 5),(30, 28, 4),(30, 43, 5),

-- USER 31
(31, 2, 4),(31, 6, 5),(31, 14, 4),(31, 25, 5),(31, 47, 4),

-- USER 32
(32, 9, 5),(32, 13, 4),(32, 18, 5),(32, 30, 4),(32, 50, 3),

-- USER 33
(33, 5, 4),(33, 10, 5),(33, 21, 4),(33, 36, 3),(33, 48, 5),

-- USER 34
(34, 6, 5),(34, 11, 4),(34, 19, 5),(34, 28, 4),(34, 42, 4),

-- USER 35
(35, 3, 5),(35, 7, 4),(35, 15, 5),(35, 26, 4),(35, 33, 3),

-- USER 36
(36, 4, 5),(36, 12, 4),(36, 18, 3),(36, 20, 5),(36, 45, 4),

-- USER 37
(37, 1, 4),(37, 8, 5),(37, 12, 4),(37, 29, 3),(37, 47, 5),

-- USER 38
(38, 5, 5),(38, 9, 4),(38, 13, 5),(38, 22, 4),(38, 39, 4),

-- USER 39
(39, 7, 4),(39, 11, 5),(39, 17, 4),(39, 24, 5),(39, 34, 3),

-- USER 40
(40, 3, 5),(40, 6, 4),(40, 16, 4),(40, 25, 5),(40, 30, 3);
