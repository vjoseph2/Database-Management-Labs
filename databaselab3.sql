--Vallie Joseph--
--CMPT_308L_200_16S--
--Feb, 2, 2016--


--#1 ordno and dollars of all orders--
SELECT ordno, dollars
FROM orders;

--#2`name and city of agents named Smith--
SELECT name, city
FROM agents WHERE name='Smith';

--#3  pid, name, and priceUSD of products with quantity more than 208,000.--
SELECT pid, name, priceUSD 
FROM products WHERE quantity > 208000;

--#4 names and cities of customers in Dallas--
SELECT name, city
FROM customers WHERE city= 'Dallas';

--#5  the names of agents not in New York and not in Tokyo --
SELECT name 
FROM agents WHERE city NOT IN ('New York','Tokyo');

-- #6  data for products not in Dallas or Duluth that cost US$1 or more--
SELECT * 
FROM products WHERE city NOT IN('Dallas', 'Duluth') and products.priceusd >=1;

--#7 data for orders in January or March--
SELECT *
FROM orders WHERE month = 'Janurary' or month='February';

--#8 data for orders in February less than US$500--
SELECT *
FROM orders WHERE mon='feb' and dollars <500;

--#9 orders from the customer whose cid is C005--
SELECT * 
FROM customers WHERE cid='c005';