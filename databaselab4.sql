--Lab 4--

/* Get the cities of agents 
booking an order for a customer whose cid is 'c002'. */

SELECT city
FROM agents WHERE aid in(
			SELECT aid
			FROM orders WHERE cid ='c002'
			);

SELECT name 
FROM agents
WHERE  aid in ( SELECT aid 
		FROM orders 
		WHERE pid in (SELECT pid 
				FROM products where name='pencil'
				)
		);

--Shows only unique elements--
SELECT distinct mon
FROM orders ;

--Order By--
SELECT distinct mon
FROM orders 
ORDER by mon DESC/ASC;

--Maximum and Minimum--
SELECT min(dollars)/max
FROM orders;


SELECT max(mon)
FROM orders;

SELECT sum(dollars)
FROM orders;

SELECT AVG(dollars)
FROM orders;

SELECT* 
FROM orders WHERE dollars > (SELECT AVG(dollars) FROM orders);

--union--
SELECT count(*)
WHERE city in ( SELECT city 
FROM customers union all
SELECT city
FROM agents);

-- what is the total of orders by month--
SELECT sum(dollars)
FROM orders
WHERE mon='jan'
