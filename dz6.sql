USE myfirstdb;

-- Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов. Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
 
DELIMITER //

DROP PROCEDURE IF EXISTS time_converter//
CREATE PROCEDURE time_converter (IN num INT)
BEGIN
  DECLARE i INT DEFAULT 0;
  
  IF (num > 60) THEN
	SET @minutes = num DIV 60;
    SET @seconds = num % 60;
  ELSE
	SET @seconds = num;
  END IF;
  
  IF (@minutes > 60) THEN
	SET @hours = @minutes DIV 60;
    SET @minutes = @minutes % 60;
  END IF;
  
  IF (@hours > 24) THEN
	SET @days = @hours DIV 24;
    SET @hours = @hours % 24;
  END IF;
    SET @result = concat(@days, ' days  ', @hours, ' hours  ', @minutes, ' minutes  ', @seconds, ' seconds');
END//


CALL time_converter(123456)//

SELECT @result




/*  Выведите только четные числа от 1 до 10. Пример: 2,4,6,8,10  слушатель выведили только четные числа от 1 до 10. */

DELIMITER //

DROP PROCEDURE IF EXISTS chet//
CREATE PROCEDURE chet (IN num INT)
BEGIN
  DECLARE i INT DEFAULT 3;
  
  SET @numbers = '2';
  WHILE i <= num DO
  	  IF (i % 2 = 0) THEN
        SET @numbers = concat(@numbers,',',i);
      END IF;
      SET i = i + 1;
  END WHILE;
  
  SELECT @numbers;
END//

CALL chet(10)//




