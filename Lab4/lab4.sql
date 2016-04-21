--Lab 4--
--Database Management--

--1.Get the cities of agents booking an order for a customer whose cid is ‘c002’.--
SELECT city FROM agents WHERE aid in(
			SELECT aid
			FROM orders WHERE cid ='c002'
			);
--2.Get the ids of products ordered through any agent who takes at least one order from a customer in Dallas, sorted by pid from highest to lowest.--
SELECT pid FROM orders WHERE aid in (
			SELECT aid 
			from agents WHERE city ='Dallas'
			) ORDER BY pid ASC;

--3.Get the ids and names of customers who did not place an order through agent a01.--
SELECT cid, name  from customers WHERE cid in(
			SELECT cid 
			FROM orders WHERE aid NOT IN ('a01')
			);
--4.Get the ids of customers who ordered both product p01 and p07.--
SELECT cid 
FROM orders 
WHERE pid = 'p01'
	INTERSECT
SELECT cid 
FROM orders 
WHERE pid='p07';
--5.Get the ids of products not ordered by any customers who placed any order through agent a07 in pid order from highest to lowest.-
SELECT DISTINCT pid FROM orders WHERE cid in (
			SELECT cid 
			FROM orders WHERE aid NOT IN ('a07')
			) ORDER BY pid DESC;
--6.Get the name, discounts, and city for all customers who place orders through agents in London or New York.--
SELECT name, city, discount FROM customers WHERE cid in (
							SELECT cid 
							FROM orders WHERE aid in (
										SELECT aid 
										FROM agents WHERE city= 'London' or city ='New York')
							);
--7.Get all customers who have the same discount as that of any customers in Dallas or London--
SELECT * FROM customers WHERE discount in (
					SELECT discount FROM customers 
					WHERE city in ('Dallas', 'London'));
