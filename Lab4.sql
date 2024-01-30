use sales;
-- Q1
alter table customers drop column Order_count;
-- Q2
alter table customers change column Customer_name Cus_name VARCHAR(50);
-- Q3
SELECT * FROM CUSTOMERS WHERE Cus_name NOT LIKE 'A%' AND Cus_name NOT LIKE 'B%' AND Cus_name NOT LIKE 'C%';
-- Q4 
SELECT * FROM CUSTOMERS WHERE Customer_id LIKE '%1%';
-- Q5
SELECT Customer_id FROM orders ORDER BY order_date DESC;
-- Q6 
SELECT Customer_id FROM orders ORDER BY order_date ASC;
-- Q7 
ALTER TABLE ORDERS MODIFY COLUMN Order_date VARCHAR(60);
-- Q8
SELECT COUNT(*) FROM expired_products WHERE expiration_date < CURRENT_DATE;
