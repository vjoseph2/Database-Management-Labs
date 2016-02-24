CREATE TABLE example(
NAME varchar(255) null,
num int null
);

INSERT INTO example (NAME, num)
VALUES (NULL, NULL);
Insert INTO example (NAME, num)
VALUES('Pablo', 7);
SELECT * FROM example;
SELECT * FROM example;
SELECT count(*) FROM example
SELECT count(num) FROM example
SELECT COALESCE(NAME, 'Jorden')FROM example
SELECT COALESCE (NAME 'Jorden'), COALESCE (num, 34) FROM example;

SELECT * FROM customers as c, orders as o WHERE c.cid=o.cid;

SELECT * FROM customers c, orders o WHERE c.cid=o.cid AND o.pid= 'p07'

SELECT * from customers WHERE cid in (SELECT cid FROM orders WHERE pid = 'p07');

SELECT * FROM customers c INNER JOIN orders o on c.cid= o.cid;

SELECT * FROM customers c INNER JOIN orders o on c.cid= o.cid and mon='feb';

SELECT * FROM orders o INNER JOIN customers c on o.cid= o.cid and mon='feb';

SELECT * FROM orders o INNER JOIN customers c on o.cid= o.cid INNER JOIN agents a on o.aid= a.aid;

SELECT * FROM orders o 
INNER JOIN customers c on o.cid= o.cid 
INNER JOIN agents a on o.aid= a.aid 
INNER JOIN products p on o.pid=p.pid;

SELECT o.ordno, c.name, c.discount, a.name, p.name, o.qty 
FROM orders o 
INNER JOIN customers c on o.cid= o.cid 
INNER JOIN agents a on o.aid= a.aid 
INNER JOIN products p on o.pid=p.pid;

SELECT * FROM agents a INNER JOIN orders o on a.aid=o.aid

SELECT * FROM agents a LEFT OUTER JOIN orders o on a.aid=o.aid

SELECT *  FROM orders o
LEFT OUTER JOIN products p ON o.pid = p.pid

SELECT *  FROM orders o
RIGHT OUTER JOIN products p ON o.pid = p.pid
--6. Show the names of customer and agents living in the same--
--city along with the name of the shared city, regardless of --
--whether or not the customer has ever placed an order with that agent.--
SELECT c.name, a.name FROM customers c, agents a WHERE c.city= a.city;
--7. Show the name and city of the customers who live inthe city that --
--makes the fewest differnt kinds of products (Hint: use coutn and group--
-- by on the Products Table)--
--SELECT orders.pid, sum(qty) FROM orders GROUP BY pid ORDER BY pid--

SELECT c.name, city FROM customers WHERE city IN(
SELECT city FROM products GROUP BY city ORDER BY count(pid) ASC
)LIMIT 1;