--Lab 6--
--Database Management--
--Vallie Joseph--

--1.Display the name and city of customers who live in any city that makes the most different kinds of
--products. (There are two cities that make the most different products. Return the name and city of
--customers from either one of those.)

SELECT name, city FROM customers WHERE city in (SELECT city from products WHERE priceusd > (SELECT AVG(priceusd) from products)) 

--2