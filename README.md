# Тестовое задание

Написать SQL запросы:

1.1.	на выборку всех сотрудников, упорядоченных по полю name по алфавиту проживающих в городах, начинающихся с буквы А;
```
SELECT * FROM `Emploee` WHERE city LIKE 'А%' ORDER BY name ASC
```
1.2.	на выборку сотрудников, у которых в день выполнения запроса день рождения;
```
SELECT * FROM `Emploee` WHERE DATE_FORMAT(birthday, '%m-%d') = DATE_FORMAT(NOW(), '%m-%d')
```
1.3.	на выборку сотрудников с минимальной и максимальной заработной платой;
```
select * from Emploee where salary = (select min(salary) from Emploee) or salary = (select max(salary) from Emploee)
```

1.4.	на выборку максимальной заработной платы в каждом отделе;
```
SELECT  d.*, e.* FROM  Department AS d LEFT JOIN Emploee AS e ON (d.id = e.department_id) WHERE e.salary = (SELECT MAX(salary) FROM Emploee AS e2 WHERE e2.department_id = d.id)
```
