--Lab 6--
--Database Management--
--Vallie Joseph--

--1.Display the name and city of customers who live in any city that makes the most different kinds of
--products. (There are two cities that make the most different products. Return the name and city of
--customers from either one of those.)

SELECT name, city FROM customers WHERE city in (SELECT city from products WHERE priceusd > (SELECT AVG(priceusd) from products)) 

--2 Display the names of products whose priceUSD is strictly above the average priceUSD, in reversealphabetical
--order.

SELECT name, priceusd from products WHERE priceUSD > (SELECT avg(products.priceUSD)FROM products) ;


--3.Display the customer name, pid ordered, and the total for all orders, sorted by total from high to low--
SELECT customers.name, o.pid, o.dollars FROM orders o INNER JOIN customers ON o.cid = customers.cid ORDER BY o.dollars DESC;

