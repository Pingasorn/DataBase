-- Q1
select customer_name, max(amount) as highest_order_amount from Customers c
join Orders o 
	on o.customer_id = c.customer_id
join Payments p
	on p.order_id = o.order_id
group by c.customer_id;
-- Q2
select payment_method, sum(amount) as sum_amount from Payments
group by payment_method
having sum(amount) < 200;
-- Q3
select product_name, sum(quantity) as total_quantity_sold from Products p
join Order_Details od
	on od.product_id = p.product_id
group by p.product_id;
-- Q4
select payment_method ,(sum(amount) / (select sum(amount) from payments)) * 100 as percentage_of_total_sales from Payments
group by payment_method;
-- Q5
select sum(od.quantity * p.unit_price) as total_revenue from Order_Details od
join Products p
	on od.product_id = p.product_id;
-- Extra
select c.customer_id, c.customer_name, sum(p.amount) as total_order_amount from Customers c
join Orders o
	on c.customer_id = o.customer_id
join Payments p
	on o.order_id = p.order_id
group by c.customer_id, c.customer_name
order by total_order_amount desc limit 5;