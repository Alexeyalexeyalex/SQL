USE myfirstdb;

-- Отсортируйте поле “зарплата” в порядке убывания и возрастания

SELECT *
FROM staff
ORDER BY salary;

SELECT *
FROM staff
ORDER BY salary DESC;


-- ** Отсортируйте по возрастанию поле “Зарплата” и выведите 5 строк с наибольшей заработной платой (возможен подзапрос)

SELECT *
FROM (SELECT * FROM staff ORDER BY salary DESC LIMIT 5) AS A
ORDER BY A.salary;


-- Выполните группировку всех сотрудников по специальности , суммарная зарплата которых превышает 100000

SELECT post, SUM(salary) AS salary
FROM staff
GROUP BY post
HAVING salary>10000;