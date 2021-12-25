-- Функція, яка повертає кількість курсів, які хоча б один раз перевищували рейтинг 4.5
-- (за весь час)

CREATE OR REPLACE FUNCTION count_high_rating() RETURNS INT
LANGUAGE plpgsql
AS $$
DECLARE counter INT;
BEGIN 
   SELECT COUNT(DISTINCT(course_number)) INTO counter FROM ratings WHERE rating_value >= 4.5;
   RETURN counter;
END;
$$; 

SELECT count_high_rating();
