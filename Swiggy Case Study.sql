SELECT * FROM swiggy.`zomato-schema - users`;
use swiggy;
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL
);
INSERT INTO users (user_id, name, email, password) VALUES
(1, 'Nitish', 'nitish@gmail.com', 'p252h'),
(2, 'Khushboo', 'khushboo@gmail.com', 'hxn9b'),
(3, 'Vartika', 'vartika@gmail.com', '9hu7j'),
(4, 'Ankit', 'ankit@gmail.com', 'lkko3'),
(5, 'Neha', 'neha@gmail.com', '3i7qm'),
(6, 'Anupama', 'anupama@gmail.com', '46rdw2'),
(7, 'Rishabh', 'rishabh@gmail.com', '4sw123');

select * from users;

CREATE TABLE restaurant (
    r_id INT PRIMARY KEY,
    r_name VARCHAR(100) NOT NULL,
    cuisine VARCHAR(100) NOT NULL
);

INSERT INTO restaurant (r_id, r_name, cuisine) VALUES
(1, 'dominos', 'Italian'),
(2, 'kfc', 'American'),
(3, 'box8', 'North Indian'),
(4, 'Dosa Plaza', 'South Indian'),
(5, 'China Town', 'Chinese');

CREATE TABLE food (
    f_id INT PRIMARY KEY,
    f_name VARCHAR(100) NOT NULL,
    type VARCHAR(50) NOT NULL
);

INSERT INTO food (f_id, f_name, type) VALUES
(1, 'Non-veg Pizza', 'Non-veg'),
(2, 'Veg Pizza', 'Veg'),
(3, 'Choco Lava cake', 'Veg'),
(4, 'Chicken Wings', 'Non-veg'),
(5, 'Chicken Popcorn', 'Non-veg'),
(6, 'Rice Meal', 'Veg'),
(7, 'Roti meal', 'Veg'),
(8, 'Masala Dosa', 'Veg'),
(9, 'Rava Idli', 'Veg'),
(10, 'Schezwan Noodles', 'Veg'),
(11, 'Veg Manchurian', 'Veg');


CREATE TABLE menu (
    menu_id INT PRIMARY KEY,
    r_id INT,
    f_id INT,
    price DECIMAL(10,2),
    FOREIGN KEY (r_id) REFERENCES restaurant(r_id),
    FOREIGN KEY (f_id) REFERENCES food(f_id)
);

INSERT INTO menu (menu_id, r_id, f_id, price) VALUES
(1, 1, 1, 450),
(2, 1, 2, 400),
(3, 1, 3, 100),
(4, 2, 3, 115),
(5, 2, 4, 230),
(6, 2, 5, 300),
(7, 3, 3, 80),
(8, 3, 6, 160),
(9, 3, 7, 140),
(10, 4, 6, 230),
(11, 4, 8, 180),
(12, 4, 9, 120),
(13, 5, 6, 250),
(14, 5, 10, 220),
(15, 5, 11, 180);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    r_id INT,
    amount DECIMAL(10,2),
    date DATE,
    partner_id INT,
    delivery_time INT,
    delivery_rating INT,
    restaurant_rating INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (r_id) REFERENCES restaurant(r_id)
);

INSERT INTO orders (order_id, user_id, r_id, amount, date, partner_id, delivery_time, delivery_rating, restaurant_rating) VALUES
(1001, 1, 1, 550, '2022-05-10', 1, 25, 5, 3),
(1002, 1, 2, 415, '2022-05-26', 1, 19, 5, 2),
(1003, 1, 3, 240, '2022-06-15', 5, 29, 4, NULL),
(1004, 1, 3, 240, '2022-06-29', 4, 42, 3, 5),
(1005, 1, 3, 220, '2022-07-10', 1, 58, 1, 4),
(1006, 2, 1, 950, '2022-06-10', 2, 16, 5, NULL),
(1007, 2, 2, 530, '2022-06-23', 3, 60, 1, 5),
(1008, 2, 3, 240, '2022-07-07', 5, 33, 4, 5),
(1009, 2, 4, 300, '2022-07-17', 4, 41, 1, NULL),
(1010, 2, 5, 650, '2022-07-31', 1, 67, 1, 4),
(1011, 3, 1, 450, '2022-05-10', 2, 25, 3, 1),
(1012, 3, 4, 180, '2022-05-20', 5, 33, 4, 1),
(1013, 3, 2, 230, '2022-05-30', 4, 45, 3, NULL),
(1014, 3, 2, 230, '2022-06-11', 2, 55, 1, 2),
(1015, 3, 2, 230, '2022-06-22', 3, 21, 5, NULL),
(1016, 4, 4, 300, '2022-05-15', 3, 31, 5, 5),
(1017, 4, 4, 300, '2022-05-30', 1, 50, 1, NULL),
(1018, 4, 4, 400, '2022-06-15', 2, 40, 3, 5),
(1019, 4, 5, 400, '2022-06-30', 1, 70, 2, 4),
(1020, 4, 5, 400, '2022-07-15', 3, 26, 5, 3),
(1021, 5, 1, 550, '2022-07-01', 5, 22, 2, NULL),
(1022, 5, 1, 550, '2022-07-08', 1, 34, 5, 1),
(1023, 5, 2, 645, '2022-07-15', 4, 38, 5, 1),
(1024, 5, 2, 645, '2022-07-21', 2, 58, 2, 1),
(1025, 5, 2, 645, '2022-07-28', 2, 44, 4, NULL);


CREATE TABLE delivery_partner (
    partner_id INT PRIMARY KEY,
    partner_name VARCHAR(100) NOT NULL
);

INSERT INTO delivery_partner (partner_id, partner_name) VALUES
(1, 'Suresh'),
(2, 'Amit'),
(3, 'Lokesh'),
(4, 'Kartik'),
(5, 'Gyandeep');


CREATE TABLE order_details (
    id INT PRIMARY KEY,
    order_id INT,
    f_id INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (f_id) REFERENCES food(f_id)
);

INSERT INTO order_details (id, order_id, f_id) VALUES
(1, 1001, 1),
(2, 1001, 3),
(3, 1002, 4),
(4, 1002, 3),
(5, 1003, 6),
(6, 1003, 3),
(7, 1004, 6),
(8, 1004, 3),
(9, 1005, 7),
(10, 1005, 3),
(11, 1006, 1),
(12, 1006, 2),
(13, 1006, 3),
(14, 1007, 4),
(15, 1007, 3),
(16, 1008, 6),
(17, 1008, 3),
(18, 1009, 8),
(19, 1009, 9),
(20, 1010, 10),
(21, 1010, 11),
(22, 1010, 6),
(23, 1011, 1),
(24, 1012, 8),
(25, 1013, 4),
(26, 1014, 4),
(27, 1015, 4),
(28, 1016, 8),
(29, 1016, 9),
(30, 1017, 8),
(31, 1017, 9),
(32, 1018, 10),
(33, 1018, 11),
(34, 1019, 10),
(35, 1019, 11),
(36, 1020, 10),
(37, 1020, 11),
(38, 1021, 1),
(39, 1021, 3),
(40, 1022, 1),
(41, 1022, 3),
(42, 1023, 3),
(43, 1023, 4),
(44, 1023, 5),
(45, 1024, 3),
(46, 1024, 4),
(47, 1024, 5),
(48, 1025, 3),
(49, 1025, 4),
(50, 1025, 5);


select * from users;

select * from restaurant;

select * from orders;

select * from order_details;

select * from menu;

select * from food;

select * from delivery_partner;
-- Q1  Find the customer who have never ordered
select user_id, name from swiggy.users 
where user_id 
not in ( select  user_id from orders);

-- Q2 avg Price/Dish

select f.f_name , avg(price) as "avg_price"
from menu m 
join food f 
on f.f_id = m.f_id
group by m.f_id;

-- Q3 find the top restaurant in terms of number of orders for a given month ( for myself)
select o.r_id,r_name,count(*) as "month" from orders o 
join restaurant r 
on r.r_id=o.r_id
group by r.r_id
order by month desc;


-- Q3 find the top restaurant in terms of number of orders for a given month
select r.r_name ,count(*) as "Month"
from orders o
join restaurant r on o.r_id = r.r_id
where monthname(date) like "june"      -- just change the name of the month for diff month 
group by o.r_id 
order by count(*) desc;



-- Q4 restaurant with montly sales > x
select r.r_name,o.r_id,sum(amount) as "revenue" 
from orders o
join restaurant r 
on r.r_id = o.r_id
where monthname(date) like "June"
group by  o.r_id
having revenue >500;

-- Q5 show all orders with orders details fro a particular customer in a date range (suppose user ankit ne 10 june  and 10 July ke beech me kaha  kaha se order kiye or kya kuya order kya har restaurant se 

select o.order_id,r.r_name,f.f_name from orders o
join restaurant r
on o.r_id = r.r_id
join order_details od
on od.order_id= o.order_id
join food f
on f.f_id = od.f_id
where o.user_id = (select u.user_id from users u where u.name like "ankit")
and date between "2022-06-10" and "2022-07-10";

-- Q6 find restaurant with max repeated customers
select r.r_name, count(*) as "loyal_customer"
from(
		select r_id,user_id,count(*) as "visits"
		from orders 
		group by r_id,user_id
	having visits>1
    )t
join restaurant r 
on r.r_id = t.r_id
group by t.r_id
order by loyal_customer desc limit 1;


-- Q7 Customer Favourite Food 
with temp as (
	select o.user_id,od.f_id,count(*) as "Frequency" from orders o
	join order_details od
	ON o.order_id=od.order_id
	group by o.user_id,od.f_id
)
select u.name,f.f_name,t1.frequency from 
temp t1 
join users u 
on u.user_id=t1.user_id
join food f
on f.f_id=t1.f_id
where t1.Frequency = (
select max(Frequency) 
from temp t2 
where t2.user_id=t1.user_id
);

-- Q8. month over month revenue 
select month ,((revenue -prev)/prev)*100 from (
	with sales as
    (
		select  monthname(date) as "month", sum(amount) as "revenue"
		from orders 
		group by month 
    )
select month,revenue,LAG(revenue,1) OVER (order by revenue) as prev from sales
)t;

-- Q9 month over month revenue for a particular restaurant 
WITH sales AS (
    SELECT YEAR(o.date) AS yr,MONTH(o.date) AS mon,MONTHNAME(o.date) AS month,SUM(o.amount) AS revenue,r.r_name
    FROM orders o
    JOIN restaurant r ON r.r_id = o.r_id
    WHERE o.r_id = 1
    GROUP BY YEAR(o.date), MONTH(o.date), MONTHNAME(o.date), r.r_name
)
SELECT yr,month,r_name,revenue,
    LAG(revenue,1) OVER (ORDER BY yr, mon) AS prev,
    ROUND(((revenue - LAG(revenue,1) OVER (ORDER BY yr, mon)) 
          / LAG(revenue,1) OVER (ORDER BY yr, mon)) * 100, 2) AS mom_growth_pct
FROM sales;


-- 10 Most Paired products 
SELECT 
    f1.f_name AS product1,
    f2.f_name AS product2,
    COUNT(*) AS pair_count
FROM order_details od1
JOIN order_details od2
    ON od1.order_id = od2.order_id
   AND od1.f_id < od2.f_id    -- avoid duplicate and self-pairing
JOIN food f1 ON f1.f_id = od1.f_id
JOIN food f2 ON f2.f_id = od2.f_id
GROUP BY f1.f_name, f2.f_name
ORDER BY pair_count DESC
LIMIT 10;   -- Top 10 most paired products

