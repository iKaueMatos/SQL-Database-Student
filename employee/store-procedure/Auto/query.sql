USE fruitjuice;

DELIMITER //

CREATE PROCEDURE InsertCustomData(
    IN p_name VARCHAR(40), 
    IN p_description VARCHAR(100), 
    IN p_flavor VARCHAR(20), 
    IN p_size INT, 
    IN p_packing VARCHAR(50), 
    IN p_price_list DECIMAL(10, 2),
    IN p_barcode INT,
    IN p_quantity INT
)
BEGIN
    DECLARE init_ INT DEFAULT 0;
    DECLARE current_dat DATETIME;
    DECLARE default_value DECIMAL(10, 2);

    SET default_value = 50.00;

    REPEAT
        SET current_dat = NOW();
        SET @sql = CONCAT('INSERT INTO products (name, descriptor, flavor, size, packing, price_list, barcode) VALUES (?, ?, ?, ?, ?, ?, ?)');
        PREPARE stmt FROM @sql;
        EXECUTE stmt USING p_name, p_description, p_flavor, p_size, p_packing, p_price_list, p_barcode;
        DEALLOCATE PREPARE stmt;
        SET init_ = init_ + 1;
    UNTIL init_ >= p_quantity END REPEAT;
END //

DELIMITER ;

