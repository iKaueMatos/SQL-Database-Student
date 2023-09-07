USE fruitjuice;


/* Acha o produto */
/* finds_the_product */
DELIMITER //
CREATE PROCEDURE finds_the_product (vproduct INT)
BEGIN 
    DECLARE vflavor VARCHAR(50);
    SELECT flavor INTO vflavor 
        FROM products WHERE product_id = vproduct;

    CASE vflavor
    WHEN 'melancia' THEN  SELECT 'Citrico';
    WHEN 'aquinia' THEN  SELECT 'Neutro';
    WHEN 'coco' THEN  SELECT 'Citrico';
    ELSE SELECT 'sem sabor';
    END CASE;

END //
DELIMITER ;

CALL finds_the_product(7);