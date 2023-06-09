USE learnsql;


-- Создайте представление, в которое попадут автомобили стоимостью до 25 000 долларов;

CREATE VIEW expensive_cars AS
 SELECT *
   FROM cars
    WHERE cost > 25000;

SELECT * FROM expensive_cars;


-- Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW);

ALTER VIEW expensive_cars AS
 SELECT *
  FROM cars
   WHERE cost > 30000;

SELECT * FROM expensive_cars;


-- Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди” (аналогично)

CREATE VIEW schoda_audi AS
 SELECT *
  FROM cars
   WHERE name = 'Skoda' OR name = 'Audi';
   
SELECT * FROM schoda_audi;


/* Добавьте новый столбец под названием «время до следующей станции». Чтобы получить это значение, мы вычитаем время станций для пар смежных станций. 
 Мы можем вычислить это значение без использования оконной функции SQL, но это может быть очень сложно. Проще это сделать с помощью оконной функции LEAD . 
  Эта функция сравнивает значения из одной строки со следующей строкой, чтобы получить результат. 
   В этом случае функция сравнивает значения в столбце «время» для станции со станцией сразу после нее. */

SELECT
train_id, 
station_time,
station_time = station_time - LEAD(station_time,1,0) OVER(PARTITION BY train_id) AS TIME_TO_NEXT_STATION
FROM stations



