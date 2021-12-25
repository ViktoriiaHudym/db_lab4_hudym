-- Процедура, яка створює нову таблицю на основі типу складності, де полями є id курсу, 
-- назва та тип складності, який передається як аргумент у процедуру

CREATE OR REPLACE PROCEDURE new_table_difficulty(difficulty varchar(50))
LANGUAGE 'plpgsql'
AS $$
BEGIN
	DROP TABLE IF EXISTS new_course_difficulty;
	CREATE TABLE new_course_difficulty
	AS
    (SELECT course_id, course_title, type_name FROM course 
	JOIN courses_organizations USING(course_id)
	JOIN course_difficultytype USING(course_number)
	JOIN difficultytype USING(type_id)
	WHERE type_name = difficulty);
	RAISE INFO 'Procedure run successfully. Table new_course_difficulty created';
END;
$$;

CALL new_table_difficulty('Begginer');
SELECT * FROM new_course_difficulty;


-- Функція, яка повертає кількість курсів, які хоча б один раз перевищували рейтинг 4.5
-- (за весь час)

CREATE OR REPLACE FUNCTION count_high_rating() RETURNS INT
LANGUAGE plpgsql
AS $$
DECLARE counter INT;
BEGIN 
   SELECT COUNT(DISTINCT(course_number)) INTO counter FROM ratings WHERE rating_value >= 4.5;
   RAISE INFO 'Function run successfully. Count of courses: %', counter;
   RETURN counter;  
END;
$$; 

SELECT count_high_rating();


-- Триггер додає у таблицю changes_in_students дані коли таблиця students оновлюється,
-- а саме додається рядок з датою та часом оновлення, старою актуальною датою для к-сті студентів, к-стю студентів яка була,
-- новою актуальною датою для к-сті студентів та к-стю студентів яка стала.

DROP TABLE IF EXISTS changes_in_students;
DROP TRIGGER IF EXISTS students_update ON students;

CREATE TABLE changes_in_students(
	id SERIAL PRIMARY KEY,
	updated TIMESTAMP DEFAULT NOW(),
	relevant_on_before TIMESTAMP NOT NULL,
	old_students INT NOT NULL,
	relevant_on_after TIMESTAMP NOT NULL,
	new_students INT NOT NULL
);

CREATE OR REPLACE FUNCTION update_table() RETURNS trigger AS
$$
BEGIN
 	IF (NEW.students_enrolled <> OLD.students_enrolled) AND (NEW.relevant_on <> OLD.relevant_on) THEN
		INSERT INTO changes_in_students(relevant_on_before, old_students, relevant_on_after, new_students)
		VALUES(OLD.relevant_on, OLD.students_enrolled, NEW.relevant_on, NEW.students_enrolled);
		RAISE INFO 'Trigger run successfully. Table changes_in_students has updates';
	END IF;
	
	RETURN NEW;
END;
$$ LANGUAGE 'plpgsql';


CREATE TRIGGER students_update 
BEFORE UPDATE ON students
FOR EACH ROW EXECUTE FUNCTION update_table();

UPDATE students
SET (students_enrolled, relevant_on) = (600000, '2021-11-19 10:00:00') WHERE id = 2;

UPDATE students
SET (students_enrolled, relevant_on) = (880000, '2021-10-20 10:00:00') WHERE id = 6;

SELECT * FROM changes_in_students;