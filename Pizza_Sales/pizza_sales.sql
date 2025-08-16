create database pizza_sales;
use pizza_sales;

create table orders(
order_id int not null,
order_date date not null,
order_time  time not null,
primary key (order_id)
);

create table orders_details(
orders_details_id int not null,
order_id int not null,
pizza_id varchar(255) not null,
quantity int not null,
primary key (orders_details_id)
);