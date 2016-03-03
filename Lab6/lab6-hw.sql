--Lab 6--
--Database Management--
--Vallie Joseph--

--1.Display the name and city of customers who live in any city that makes the most different kinds of
--products. (There are two cities that make the most different products. Return the name and city of
--customers from either one of those.)

SELECT name, city 
FROM customers WHERE city in (
								SELECT city 
								FROM products WHERE priceusd > (
																SELECT AVG(priceusd) 
																FROM products)
																); 

--2 Display the names of products whose priceUSD is strictly above the average priceUSD, in reversealphabetical
--order.

SELECT name, priceusd 
FROM products WHERE priceUSD > (
								SELECT avg(products.priceUSD)
								FROM products) ;


--3.Display the customer name, pid ordered, and the total for all orders, sorted by total from high to low--
SELECT customers.name, o.pid, o.dollars 
FROM orders o 
INNER JOIN customers ON o.cid = customers.cid 
ORDER BY o.dollars DESC;

--4. Display all customer names (in alphabetical order) and their total ordered, and nothing more. Use--
--coalesce to avoid showing NULLs--

SELECT c.name , coalesce(sum(o.qty),0) as totalQty 
from customers c 
LEFT OUTER JOIN orders o on c.cid=o.cid 
GROUP BY c.name 

--5. Display the names of all customers who bought products from agents based in Tokyo along with the
--names of the products they ordered, and the names of the agents who sold it to them.


SELECT c.name as customerName ,p.name as productName, a.name as agentName, a.city as agentCity 
FROM orders o 
INNER JOIN customers c ON c.cid=o.cid  
INNER JOIN agents a ON a.aid=o.aid
INNER JOIN products p on p.pid = o.pid 
--GROUP BY c.name, p.name, a.name 
WHERE a.city= 'Tokyo';

--6.Write a query to check the accuracy of the dollars column in the Orders table. This means calculating
--Orders.totalUSD from data in other tables and comparing those values to the values in Orders.totalUSD.
--Display all rows in Orders WHERE Orders.totalUSD is incorrect, if any.

SELECT *
FROM (SELECT o.*, o.qty*p.priceusd*(1-(discount/100)) as truedollars
      from orders o
      INNER JOIN products p on o.pid = p.pid
      INNER JOIN customers c on o.cid = c.cid) as tmptable
Where dollars != truedollars

--7. What is the difference between a LEFT OUTER JOIN and a RIGHT OUTER JOIN? Give example queries in SQL to demonstrate. (Feel free to use the CAP2 database to make your points here.)
--The difference between left and right outer joins lies in the inclusion. A left outer join will only include fields with matching pairs and right outer join will include all fields regardless of pair matches. For example, if we look at our orders table, we can see that all customers who bought products have agents, but not all agents have customers . When we run
--SELECT o.ordno, a.name FROM orders o LEFT OUTER JOIN agents a on a.aid= o.aid
--We get the order numbers and agents of orders who had both an agent and order. However, when we run
--SELECT o.ordno, a.name FROM orders o RIGHT OUTER JOIN agents a on a.aid= o.aid
--We now also get an agent who did not sell anything, so their name is displayed but not an order name  
