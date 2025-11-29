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

INSERT INTO Users (email) VALUES
('test1@tamu.edu'),
('student2@tamu.edu'),
('example@tamu.edu');

INSERT INTO PTRatings (user_id, pt_id, rating) VALUES
(1, 1, 5),
(1, 2, 4),
(2, 1, 4),
(2, 3, 5),
(3, 5, 5),
(3, 10, 4);
