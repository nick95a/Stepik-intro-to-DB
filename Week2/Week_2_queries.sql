
#Выведите все позиций списка товаров принадлежащие какой-либо категории с названиями товаров и названиями категорий. Список должен быть отсортирован по названию товара, названию категории. Для соединения таблиц необходимо использовать оператор 
SELECT good.name as good_name, category.name as category_name
FROM category_has_good
INNER JOIN good
ON category_has_good.good_id = good.id
INNER JOIN category
ON category_has_good.category_id = category.id
ORDER BY good_name, category_name;

#Выведите список клиентов (имя, фамилия) и количество заказов данных клиентов, имеющих статус "new".
SELECT client.first_name as first, client.last_name as last, COUNT(first_name)
FROM client
INNER JOIN sale 
ON client.id = sale.client_id
INNER JOIN status
ON sale.status_id = status.id
WHERE status.name = "new"
GROUP BY first, last;

#Выведите список товаров с названиями товаров и названиями категорий, в том числе товаров, не принадлежащих ни одной из категорий.
SELECT good.name, category.name
FROM category_has_good
LEFT JOIN category
ON category_has_good.category_id = category.id
RIGHT JOIN good
ON category_has_good.good_id = good.id

#Выведите список товаров с названиями категорий, в том числе товаров, не принадлежащих ни к одной из категорий, в том числе категорий не содержащих ни одного товара.
SELECT good.name, category.name
FROM category_has_good
LEFT JOIN category
ON category_has_good.category_id = category.id
RIGHT JOIN good
ON category_has_good.good_id = good.id
UNION
SELECT good.name, category.name
FROM category_has_good
LEFT JOIN good
ON category_has_good.good_id = good.id
RIGHT JOIN category
ON category_has_good.category_id = category.id

