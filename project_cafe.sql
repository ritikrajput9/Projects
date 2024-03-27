# the project name is cafe sales
#created a database ritik_proect and now using it 
create database ritik_project;

#now use the database created
use ritik_project;

# data has been imported 
#created 2 table cafe and customer
#basic command select * for both the table are working fine
select*from cafe;
select * from customer;

#select all the different selling prices 
select distinct selling_price from cafe;

#select the item and price which is in range between 100 and 150
select product_name,selling_price from cafe
where selling_price between 100 and 150;

#insert a new row in table cafe
insert into cafe(product_name,selling_price,cost_price,rating ,category)
values("chai",30,10,5,"breverage");
select * from cafe;

#display those customer who opted for takeaway service
select Customer_name,service_mode from customer 
where service_mode='takeaway';

#display only those customer who have paid online and  online by upi
select customer_name,paymet_method,payment_mode from customer 
where payment_method="upi";

#display the method by which a customer can pay
select distinct payment_method from customer;

#in the table customer correct the colomn name paymet_method
alter table customer rename column paymet_method to payment_method; 
ALTER TABLE customer RENAME COLUMN `order` TO `orders`; 

select * from customer;

#display the customer name on base of no. of order
select customer_name,orders from customer 
order by Orders asc;

#display the avg time to prepare the product 

select avg(prepare_time) from customer;

#display the avg round off time to prepare the product 
select round(avg(prepare_time)) from customer;


#display the customer name who have to wait more than the average time    (subquery is used)
select customer_name,prepare_time from customer 
where prepare_time>(select avg(prepare_time)
from customer)
order by prepare_time asc;


select * from customer;
#tell the name of the customer with the items they ordered
select customer_name,product_name,orders from customer as c 
left join cafe as t
on c.product_id=t.product_id;

select* from cafe;

#tell the avg selling price of cafe
select avg(selling_price) from cafe;
 
#tell the product name and id with the selling price more than the avg
select product_name,product_id,selling_price from cafe
where selling_price>(select avg(selling_price) from cafe);

#tell the name of the customer with poduct id who ordered chinese food 
select customer_name,product_name,category from customer as c
left join cafe as t
on c.product_id=t.product_id
where category="chinese";

#calculate the avg profit of the cafe on all the product
select (select avg(selling_price) from cafe)-
(select avg(cost_price) from cafe) as profit from cafe;

select * from cafe;
#select the product name and based on rating tell weather th product is good or bad
select product_name,rating,
case
when rating>3 then "good"
else "bad"
end as review
from cafe;


#tell the coustmer name who has the  orders more han 3
select customer_name,orders from customer
where orders>3;

#select the catogory  with group by function
select category as eating_options from  cafe
group by category;
select * from customer;


#select only those chinese eating customer who have more than 2 orders
select customer_name,product_name,category,orders from customer as c
left join cafe as t
on c.product_id=t.product_id
where orders>"2" and category="chinese";
