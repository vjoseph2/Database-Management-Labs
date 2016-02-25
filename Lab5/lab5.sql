--Lab 5--
--Database Management--
--Vallie Joseph 2.25.16--

--1. Show the cities of agents booking an order for a customer whose id is ‘c002’. Use joins; no subqueries --
SELECT city FROM agents a, orders o 
WHERE a.aid=o.aid and o.cid='c002';
--2.Show the ids of products ordered through any agent who makes at least one order for a customer in--
--Dallas, sorted by pid from highest to lowest. Use joins; no subqueries.--
SELECT DISTINCT pid FROM customers c, orders o, agents a 
WHERE c.cid=o.cid AND  a.aid=o.aid AND 
c.city='Dallas' ORDER BY pid DESC;
--3.Show the names of customers who have never placed an order. Use a subquery.--
SELECT name FROM customers 
WHERE cid NOT IN (
					SELECT cid FROM orders
				  );
--4. Show the names of customers who have never placed an order. Use an outer join.
SELECT name FROM customers c 
LEFT OUTER JOIN 
orders o on o.cid=c.cid 
WHERE ordno is NULL;
--5.Show the names of customers who placed at least one order through an agent in their own city, along
--with those agent(s’) names.

--6. Show the names of customer and agents living in the same--
--city along with the name of the shared city, regardless of --
--whether or not the customer has ever placed an order with that agent.--
SELECT c.name, a.name FROM customers c, agents a 
WHERE c.city= a.city;

--7. Show the name and city of the customers who live inthe city that --
--makes the fewest differnt kinds of products (Hint: use coutn and group--
-- by on the Products Table)--
--SELECT orders.pid, sum(qty) FROM orders GROUP BY pid ORDER BY pid--
SELECT c.name, city FROM customers WHERE city IN(
SELECT city FROM products GROUP BY city ORDER BY count(pid) ASC
)LIMIT 1;

