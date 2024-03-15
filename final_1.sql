create database lab5;
use lab5;
-- Q1 เเสดงชื่อลูกค้าเเละจำนวนเงินที่มาจากคำสั่งซื้อสูงสุด (highest_order_amount)  ของลูกค้า
select customer_name, max(amount) as highest_order_amount from Customers c
join Orders o 
	on o.customer_id = c.customer_id
join Payments p
	on p.order_id = o.order_id
group by c.customer_id;
-- Q2 แสดงข้อมูลวิธีการชำระเงินและจำนวนเงินรวม (sum_amount) ของแต่ละวิธีการชำระเงินจากตาราง “Payments” โดยที่จำนวนเงินรวมน้อยกว่า $200
select payment_method,sum(amount) as sum_amount from payments
group by payment_method
having sum(amount) < 200;
-- Q3 แสดงรายการสินค้าทั้งหมดพร้อมกับปริมาณรวมที่ขายได้(total_quantity_sold)
select product_name,sum(quantity) as  total_quantity_sold from products p
join order_details od on od.product_id = p.product_id
group by p.product_id;
-- Q4 แสดงข้อมูลวิธีการชำระเงินและคำนวณเปอร์เซ็นต์ของยอดขายรวมสำหรับแต่ละวิธีการชำระเงิน(percentage_of_total_sales)
select payment_method ,(sum(amount) / (select sum(amount) from payments)) * 100 as percentage_of_total_sales from Payments
group by payment_method;
-- Q5 คำนวณรายได้รวม (total_revenue) โดยการคูณปริมาณ “quantity” และราคาต่อชิ้น “unit_price”
select sum(od.quantity * p.unit_price) as total_revenue from Order_Details od
join Products p
	on od.product_id = p.product_id;
-- Extra แสดงรหัสประจำตัวลูกค้าและชื่อลูกค้าของ 5 อันดับแรกที่มียอดสั่งซื้อรวมสูงสุด(total_order_amount)
select c.customer_id, c.customer_name, sum(p.amount) as total_order_amount from Customers c
join Orders o
	on c.customer_id = o.customer_id
join Payments p
	on o.order_id = p.order_id
group by c.customer_id, c.customer_name
order by total_order_amount desc limit 5;