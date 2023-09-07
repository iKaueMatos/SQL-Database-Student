/*Update set generating a random number for each record is products*/
UPDATE products
SET barcode = FLOOR(RAND() * 1000000)
WHERE product_id >= 1 AND product_id <= 54;

/* Update date client*/

UPDATE clients SET age = 30,date_of_birth = '1988-04-12' WHERE cpf = '73905187205' AND name = 'Bruna Lima' AND age = 23;

/* Update date client*/
UPDATE clients  SET first_purchase = 1 WHERE cpf = '73905187205' AND name = 'Bruna Lima' AND first_purchase = 0;