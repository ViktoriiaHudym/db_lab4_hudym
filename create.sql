DROP TABLE IF EXISTS Courses_Organizations CASCADE;
DROP TABLE IF EXISTS Course;
DROP TABLE IF EXISTS Organization;
DROP TABLE IF EXISTS Certification CASCADE;
DROP TABLE IF EXISTS DifficultyType CASCADE;
DROP TABLE IF EXISTS Ratings;
DROP TABLE IF EXISTS Students;
DROP TABLE IF EXISTS Course_DifficultyType;
DROP TABLE IF EXISTS Course_Certification;

CREATE TABLE Course(
    course_id SERIAL PRIMARY KEY,
	course_title VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE Organization(
    organization_id SERIAL PRIMARY KEY,
	organization_name VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE Certification(
    certificate_id SERIAL PRIMARY KEY,
	certificate_name VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE DifficultyType(
    type_id SERIAL PRIMARY KEY,
	type_name VARCHAR(20) UNIQUE NOT NULL	
);

CREATE TABLE Courses_Organizations(
	course_number SERIAL UNIQUE NOT NULL PRIMARY KEY,
    course_id       INT NOT NULL REFERENCES Course(course_id) ON DELETE CASCADE,
    organization_id INT NOT NULL REFERENCES Organization(organization_id) ON DELETE CASCADE
);

CREATE TABLE Ratings(
	id SERIAL PRIMARY KEY,
    course_number INT REFERENCES Courses_Organizations(course_number) ON DELETE CASCADE,
	rating_value  NUMERIC CHECK (rating_value >= 0 and rating_value <= 5),
	relevant_on TIMESTAMP NOT NULL,
	UNIQUE(course_number, relevant_on)
);

CREATE TABLE Students(
	id SERIAL PRIMARY KEY,
    course_number INT REFERENCES Courses_Organizations(course_number) ON DELETE CASCADE,
	students_enrolled  INT,
	relevant_on TIMESTAMP NOT NULL,
	UNIQUE(course_number, relevant_on)
);

CREATE TABLE Course_DifficultyType(
	id SERIAL PRIMARY KEY,
	type_id INT REFERENCES DifficultyType(type_id) ON DELETE RESTRICT,
	course_number INT REFERENCES Courses_Organizations(course_number) ON DELETE CASCADE
	
);

CREATE TABLE Course_Certification(
	id SERIAL PRIMARY KEY,
	certificate_id INT REFERENCES Certification(certificate_id) ON DELETE RESTRICT,
	course_number INT REFERENCES Courses_Organizations(course_number) ON DELETE CASCADE
);

