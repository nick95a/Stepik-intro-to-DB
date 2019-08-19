/* 
Week 1 queries
*/

# 1.2 Базовые операции SQL

# Запросы ниже относятся к базе данных 'billing_simple' и таблице 'billing'
# Выведите поступления денег от пользователя с email 'vasya@mail.com'.
SELECT * 
FROM billing
WHERE payer_email = "vasya@mail.com";

/*
Добавьте в таблицу одну запись о платеже со следующими значениями:
email плательщика: 'pasha@mail.com'
email получателя: 'katya@mail.com'
сумма: 300.00
валюта: 'EUR'
дата операции: 14.02.2016
комментарий: 'Valentines day present)'
*/
INSERT INTO billing 
VALUES (
        'pasha@mail.com',
        'katya@mail.com',
        '300.00',
        'EUR',
        '2016-02-14',    
        'Valentines day present)'
);

# Измените адрес плательщика на 'igor@mail.com' для всех записей таблицы, где адрес плательщика 'alex@mail.com'.
UPDATE billing
SET payer_email = 'igor@mail.com'
WHERE payer_email = 'alex@mail.com';

# Удалите из таблицы записи, где адрес плательщика или адрес получателя установлен в неопределенное значение или пустую строку.

DELETE FROM billing
WHERE payer_email IS NULL OR payer_email = '' OR recipient_email IS NULL OR recipient_email = '';


# 1.3 Агрегация данных
# Запросы ниже относятся к базе данных 'project_simple' и таблице 'project'

# Выведите общее количество заказов компании.
SELECT COUNT(project_name)
FROM project;

/*
Выведите количество товаров в каждой категории. Результат должен содержать два столбца: 
название категории, 
количество товаров в данной категории.
*/

SELECT category, COUNT(product_name)
FROM store
GROUP BY category;

/*
Выведите 5 категорий товаров, продажи которых принесли наибольшую выручку. Под выручкой понимается сумма произведений стоимости товара на количество проданных единиц. Результат должен содержать два столбца: 
название категории,
выручка от продажи товаров в данной категории.
*/

SELECT category, SUM(price * sold_num) as total
FROM store
GROUP by category
ORDER BY total DESC
LIMIT 5;

/*
Выведите в качестве результата одного запроса общее количество заказов, сумму стоимостей (бюджетов) всех проектов, средний срок исполнения заказа в днях.NB! Для вычисления длительности проекта удобно использовать встроенную функцию datediff().
*/

SELECT COUNT(project_name), SUM(budget), SUM(DATEDIFF(project_finish, project_start)) / COUNT(project_name)
FROM project;








