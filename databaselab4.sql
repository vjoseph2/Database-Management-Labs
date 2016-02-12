--Lab 4--

/* Get the cities of agents 
booking an order for a customer whose cid is 'c002'. */

SELECT city
FROM agents WHERE aid in(
			SELECT aid
			FROM orders WHERE cid ='c002'
			);

SELECT * FROM agents;