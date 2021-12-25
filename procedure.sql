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
END;
$$;

CALL new_table_difficulty('Begginer');
SELECT * FROM new_course_difficulty;
