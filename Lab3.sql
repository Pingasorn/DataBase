create database Sales;
use Sales;
-- Q1
select * from customers where city = 'Mora';
-- Q2
insert into customers value('07-1137077','Audi','SU-Land','0');
-- Q3
update customers set customer_name = 'Anna' where customer_id ='71-4595008';
-- Q4
select customer_id,Max(order_date) As latest_your_order from orders group by customer_id;
-- Q5
select customer_id,count(order_id) as total_orders  from orders group by customer_id;
-- Q6
select product_name,unit_price from products where unit_price < 20;
-- Q7
select city,avg(order_count) as avg_order_count from customers group by city;
-- Q8
select product_name,unit_price from products where unit_price >=20 and unit_price<=50 ;
-- Q9
select * from customers where customer_name = 'Anna';
-- Q10
select product_name from expired_products where expiration_date < '2023-01-01' ;


