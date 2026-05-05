select * from world.country limit 10;

select region, SUM(amount) as total_sales
from day3.sales
group by region;

select region, sum(amount) as tital_sales
from day3.sales s 
group by region
having sum(amount) > 1000;

select region, sum(amount) as total_sales
from day3.sales s 
where region in ('华东','华南')
group by region;

select region, product_category, sum(amount) as total_sales
from day3.sales s 
where product_category like '%服%'
group by region, product_category;

create table regions (
region_id INT primary key,
region_name varchar(20),
manager varchar(50)
);

insert into regions (region_id, region_name, manager) values
(1,'华东','张经理'),
(2,'华南','李经理'),
(3,'华北','王经理');

select 
r.region_name,
s.region,
sum(s.amount) as total_sales,
r.manager
from
day3.sales s 
join
regions r on s.region = r.region_name
group by
r.region_name, s.region, r.manager;

select region,sum(amount) as total_sales
from day3.sales s
group by region 
having sum(amount) > (
select avg(total_sales)
from(
select sum(amount) as total_sales 
from day3.sales
group by region 
) as subqueryregion 
);

select product_category, sum(amount) as total_sales
from day3.sales s 
group by product_category 


