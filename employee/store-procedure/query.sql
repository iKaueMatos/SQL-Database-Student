/* Para invocarmos essa store procedure basta chamarmos
 o CALL viewBilling(passando a data aqui dentro -> parametro) */
USE fruitjuice;

/*view Billing date_of_sale */
DELIMITER //
CREATE PROCEDURE viewBilling(IN p_date_of_sale DATE) 
    BEGIN
        SELECT * FROM Billing WHERE date_of_sale = p_date_of_sale;
    END//
DELIMITER;

DELIMITER //

/*view Billing total sale*/
DELIMITER //
CREATE PROCEDURE viewBillingTotalSale (valueBilling FLOAT) 
BEGIN 
    SELECT * FROM Billing WHERE total_sale > valueBilling;
END //
DELIMITER ;

/*Consult is join sales and sellers*/
DELIMITER //
CREATE PROCEDURE viewJoin (seller_id INT)
BEGIN
        SELECT sellers.name,sellers.neightborhood,sales.tax, sales.cpf FROM sellers 
        JOIN sales ON sellers.seller_id = sales.seller_id;
END //
DELIMITER ;

DELIMITER //


/*Consult is join sales and sellers for clients*/
DELIMITER // 
CREATE PROCEDURE joinViewClientsSellers ( )
BEGIN 
    SELECT clients.cpf, clients.address, clients.city, sellers.seller_id, sellers.name  FROM clients 
    JOIN sellers ON sellers.seller_id = clients.cpf
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE acessVariable ()
BEGIN 
    DECLARE variable char(12) default 'hello';
    SELECT variable;
END //
DELIMITER;
