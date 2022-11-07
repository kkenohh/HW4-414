CREATE TABLE Sales (
    name VARCHAR(20),
    discount VARCHAR(5),
    month VARCHAR(20),
    price INT
);


-- month -> discount
-- name -> price

SELECT *
FROM Sales
ORDER BY name, discount;