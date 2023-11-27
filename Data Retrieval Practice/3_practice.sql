-- SELECT ALL ---------------------------------------

SELECT id, name, price, stock_quantity, image_url 
FROM products;

SELECT *
FROM products;


-- Filter records ------------------------------------

SELECT id, name, price, stock_quantity, image_url 
FROM products
WHERE stock_quantity > 0;

SELECT id, name, price, stock_quantity 
FROM products
WHERE name = 'Power Monitor';

-- Comparison with >, <, >=, <= 

SELECT id, name, price, stock_quantity 
FROM products
WHERE price >= 300;


-- BETWEEN

SELECT id, name, price, stock_quantity
FROM products
WHERE price BETWEEN 1 AND 99;


-- LIKE search

SELECT id, name, price, stock_quantity
FROM products
WHERE name LIKE 'Power%';

SELECT id, name, price, stock_quantity
FROM products
WHERE name LIKE '%keyboard';

-- Filter specific records with IN

SELECT id, name, price, stock_quantity
FROM products
WHERE id IN (2,3,4,5,6,7);


-- Taking unmatched records with NOT
SELECT id, name, price, stock_quantity
FROM products
WHERE name NOT LIKE 'Power%';


-- Combining Conditions ------------------------------------


-- Joing conditions with AND
SELECT id, name, price, stock_quantity, image_url, shipment_type
FROM products
WHERE price > 300 
      AND shipment_type = 'physical'
      AND stock_quantity != 0;


-- Joing conditions with OR
SELECT id, name, price, stock_quantity, image_url, shipment_type
FROM products
WHERE price > 300 
      OR shipment_type = 'digital'
      OR name LIKE 'Ultra%';


-- Joing conditions AND OR recidence issue (id 4 is unexpected because price is not above 400)

SELECT id, name, price, stock_quantity, image_url, shipment_type
FROM products
WHERE price > 400 
      AND shipment_type = 'digital'
      OR stock_quantity > 0;

-- Joing conditions AND OR recidence fixed with brackets
SELECT id, name, price, stock_quantity, image_url, shipment_type
FROM products
WHERE price > 400 
      AND 
      (shipment_type = 'digital' OR stock_quantity > 0);



-- SORTING ----------------------------------------

SELECT id, name, price, stock_quantity, created_at, shipment_type
FROM products
WHERE price > 900
ORDER BY created_at DESC;

SELECT id, name, price, stock_quantity, created_at, shipment_type
FROM products
WHERE price > 900
ORDER BY shipment_type DESC;

SELECT id, name, price, stock_quantity, created_at, shipment_type
FROM products
WHERE price > 900
ORDER BY shipment_type, price DESC;
;


-- Slicing result with LIMIT OFFSET ----------------------------------------

SELECT id, name, price, stock_quantity, shipment_type
FROM products
WHERE stock_quantity > 0 AND price > 900
ORDER BY created_at DESC, price
LIMIT 3;

SELECT id, name, price, stock_quantity, shipment_type
FROM products
WHERE stock_quantity > 0 AND price > 900
ORDER BY created_at DESC, price
LIMIT 3 OFFSET 3;
