/*Update set generating a random number for each record is products*/

UPDATE products
SET barcode = FLOOR(RAND() * 1000000)
WHERE product_id >= 1 AND product_id <= 54;
