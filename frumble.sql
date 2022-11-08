-- 4.1
CREATE TABLE Sales (
    name VARCHAR(20),
    discount VARCHAR(5),
    month VARCHAR(20),
    price INT
);

-- 4.2
-- PROVEN:
-- name -> price
-- discount -> month
-- month -> discount
-- name, month -> price, discount
-- name, discount -> price, month

-- DISPROVEN:
-- price -> name


-- no rows where they are the same product but have different prices,
-- proves name -> price
SELECT *
FROM Sales S, Sales S2
WHERE S.name = S2.name AND
      S.price != S2.price;

-- no rows where the product is in the same month but have different discounts,
-- proves month -> discount
SELECT * 
FROM Sales S, Sales S2
WHERE S.month = S2.month AND 
      S.discount != S2.discount;

-- no rows where they have the same discount but different months,
-- proves discount -> month
SELECT *
FROM Sales S, Sales S2
WHERE S.discount = S2.discount AND
      S.month != S.month;

-- if month -> discount and name -> price, then month, name -> discount, price
-- this is proven with this query returning no rows
SELECT *
FROM Sales S, Sales S2
WHERE S.month = S2.month AND
      S.name = S2.name AND
      S.discount != S2.discount AND
      S.price != S2.price;

-- if discount -> month and name -> price, then discount, name -> price, month
-- this is proven with this query returning no rows
SELECT *
FROM Sales S, Sales S2
WHERE S.discount = S2.discount AND
      S.name = S2.name AND
      S.month != S2.month AND
      S.price != S2.price;

-- more than one name with the price 99
-- disproves price -> name
-- 4 rows
SELECT DISTINCT name
FROM Sales
WHERE price = 99;

-- 4.3

-- to solve name -> price, we split Sales(name, price, month, discount) into
-- S1(name, price) and S2(name, month, discount). S2 can be further decomposed.
-- Since discount -> month, we can split the table on month, creating S3(name, month)
-- and S4(month, discount). This solves our discount -> month.

-- Our final BCNF is S1(name, price), S3(name, month), and S4(month, discount).

-- S1(name, price)
CREATE TABLE S1 (
      name VARCHAR(20) PRIMARY KEY,
      price INT
);

-- S3(name, month)
CREATE TABLE S3(
      name VARCHAR(20) REFERENCES S1,
      month VARCHAR(20) REFERENCES S4
);

-- S4(month, discount)
CREATE TABLE S4(
      month VARCHAR(20) PRIMARY KEY,
      discount VARCHAR(5)
);

-- 4.4

-- S1(name, price)
INSERT INTO S1 (name, price)
SELECT DISTINCT name, price
FROM Sales;

-- 36 rows
SELECT COUNT(*) FROM S1;

-- S3(name, month)
INSERT INTO S3 (name, month)
SELECT DISTINCT name, month
FROM Sales;

-- 426 rows
SELECT COUNT(*) FROM S3;

-- S4(month, discount)
INSERT INTO S4 (month, discount)
SELECT DISTINCT month, discount
FROM Sales;

-- 12 rows
SELECT COUNT(*) FROM S4;