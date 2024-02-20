-- Q1
select customer_name as name
from customers c
join orders o on c.customer_id = o.customer_id
where o.order_id = (select order_id
from  payments 
order by amount desc limit 1);
-- Q2 
SELECT product_name
FROM products p
JOIN order_details od ON p.product_id = od.product_id
GROUP BY product_name
HAVING COUNT(*) > 1;
-- Q3 
SELECT DISTINCT c.customer_name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_details od ON o.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
WHERE p.product_name = 'Sugar - Brown';
-- Q4 
SELECT DISTINCT p.product_name
FROM products p
JOIN order_details od ON p.product_id = od.product_id
JOIN orders o ON od.order_id = o.order_id
JOIN customers c ON o.customer_id = c.customer_id
WHERE c.customer_id = '71-4595008';
-- Q5 
SELECT c.customer_name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_details od ON o.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(*) <= 1 AND MIN(p.unit_price) > 50;
-- Q6 
SELECT c.customer_name AS name,
       COUNT(DISTINCT o.order_id) AS total_orders,
       SUM(p.amount) AS total_payment
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN payments p ON o.order_id = p.order_id
GROUP BY c.customer_id, c.customer_name;
-- Q7 
SELECT c.customer_name AS Name,
       o.order_id AS ID,
       p.payment_method AS Method
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN payments p ON o.order_id = p.order_id
GROUP BY c.customer_id, c.customer_name, o.order_id, p.payment_method
HAVING SUM(p.amount) > 100;
-- Q8 
SELECT c.customer_name AS Name,
       o.order_id AS ID,
       SUM(p.amount) AS total_payment
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN payments p ON o.order_id = p.order_id
WHERE o.order_date >= '2023-01-01'
GROUP BY c.customer_id, c.customer_name, o.order_id;