--1. Show the cities of agents booking an order for a customer whose id is ‘c002’. Use joins; no subqueries --
SELECT city FROM agents a, orders o WHERE a.aid=o.aid and o.cid='c002'
--2.Show the ids of products ordered through any agent who makes at least one order for a customer in--
--Dallas, sorted by pid from highest to lowest. Use joins; no subqueries.--
SELECT pid from customers c, orders o WHERE c.cid=o.cid AND c.city='Dallas'
--3.Show the names of customers who have never placed an order. Use a subquery.--
SELECT name FROM customers WHERE cid in (SELECT cid FROM orders WHERE cid NOT IN(SELECT cid FROM orders));
