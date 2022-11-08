CREATE TABLE Sales (
    name VARCHAR(20),
    discount VARCHAR(5),
    month VARCHAR(20),
    price INT
);


-- month -> discount
-- discount -> month
-- name -> price
-- month, name -> discount, price
-- name, discount -> price, month


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

-- lots of rows where the name is different but price is the same,
-- does not prove price -> name
SELECT *
FROM Sales S, Sales S2
WHERE S.price = S2.price AND
      S.name != S2.name;