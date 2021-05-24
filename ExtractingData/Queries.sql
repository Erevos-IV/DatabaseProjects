-- Classicmodels Database.

-- Selecting all offices in specific countries.
SELECT * 				
FROM offices
WHERE country IN ("USA", "France", "UK");

-- Using Order BY
SELECT *
FROM Products
WHERE productLine IN ("Classic Cars", "Vintage Cars")
ORDER BY buyprice DESC;


