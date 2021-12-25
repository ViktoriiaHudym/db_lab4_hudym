DELETE FROM Courses_Organizations;
DELETE FROM Course;
DELETE FROM Organization;
DELETE FROM Certification;
DELETE FROM DifficultyType;
DELETE FROM Ratings;
DELETE FROM Students;
DELETE FROM Course_DifficultyType;
DELETE FROM Course_Certification;

INSERT INTO Certification(certificate_name) 
VALUES
('COURSE'),
('SPECIALIZATION'),
('PROFESSIONAL CERTIFICATE');

INSERT INTO DifficultyType(type_name) 
VALUES
('Begginer'),
('Intermediate'),
('Advanced'),
('Mixed');

INSERT INTO Course(course_title) 
VALUES
('Google IT Support'),
('Python for Everybody'),
('Machine Learning'),
('Data Science'),
('Architecting with Google Compute Engine'),
('Excel Skills for Business'),
('The Science of Well-Being'),
('IBM Data Science'),
('Business Foundations'),
('Java Programming and Software Engineering Fundamentals'),
('Deep Learning');		

INSERT INTO Organization(organization_name) 
VALUES
('IBM'),
('Yale University'),
('University of Michigan'),
('Google'),
('Stanford University'),
('University of Pennsylvania'),
('Google Cloud'),
('Macquarie University'),
('Johns Hopkins University'),
('deeplearning.ai'),
('Duke University');

INSERT INTO Courses_Organizations(course_id, organization_id)
VALUES 
(8, 1),
(7, 2),
(2, 3),
(1, 4),
(11, 10),
(3, 5),
(9, 6),
(5, 7),
(6, 8),
(4, 9),
(10, 11);

INSERT INTO Ratings(course_number, rating_value, relevant_on)
VALUES 
(1, 4.6, '2020-10-19 10:23:54'),
(1, 4.7, '2020-12-19 10:23:50'),
(2, 4.9, '2020-10-19 10:44:54'),
(3, 2.3, '2020-10-19 10:23:54'),
(4, 4.8, '2020-11-19 23:23:54'),
(5, 4.8, '2020-10-19 10:23:54'),
(6, 4.9, '2020-10-19 10:23:54'),
(7, 4.7, '2020-10-11 10:23:54'),
(8, 3.0, '2020-10-19 10:33:54'),
(9, 3.2, '2020-12-19 10:23:50'),
(10, 4.5, '2020-10-19 11:23:54'),
(11, 4.6, '2020-10-28 10:23:56');

INSERT INTO Students(course_number, students_enrolled, relevant_on)
VALUES 
(1, 480000, '2020-10-15 14:23:54'),
(1, 550000, '2020-11-19 10:58:54'),
(2, 2500000, '2020-07-19 10:23:54'),
(3, 1500000, '2020-10-19 10:23:23'),
(4, 350000, '2020-10-19 10:23:54'),
(5, 690000, '2020-04-19 10:45:54'),
(6, 3200000, '2020-10-19 10:23:54'),
(7, 510000, '2020-10-05 10:23:17'),
(8, 310000, '2020-08-19 10:23:54'),
(9, 240000, '2020-10-19 10:23:54'),
(10, 830000, '2020-11-19 10:58:54'),
(11, 380000, '2020-10-19 10:23:54');

INSERT INTO Course_DifficultyType(course_number, type_id)
VALUES
(1, 1),
(2, 4),
(3, 1),
(4, 1),
(5, 2),
(6, 4),
(7, 1),
(8, 2),
(9, 1),
(10, 1),
(11, 1);

INSERT INTO Course_Certification(course_number, certificate_id)
VALUES
(1, 3),
(2, 1),
(3, 2),
(4, 3),
(5, 2),
(6, 1),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 2);
