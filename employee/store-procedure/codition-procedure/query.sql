USE fruitjuice;

SELECT * FROM clients;

/*Consult response verification date of birth*/
DELIMITER //
CREATE PROCEDURE CheckingAgeOfCustomersWithinTheDatabase (vCpf VARCHAR(11))
BEGIN
    DECLARE result VARCHAR (20);
    DECLARE vDate_of_birth DATE;
    
    SELECT date_of_birth INTO vDate_of_birth FROM clients WHERE cpf = vCpf;

    IF (vDate_of_birth < '20010101') THEN
        SET result = "cliente velho";
    ELSE
        SET result = "cliente novo";
    END IF;
    SELECT result;
END //
DELIMITER ;

/*Running the Role*/
CALL CheckingAgeOfCustomersWithinTheDatabase('12462879024');

DELIMITER //
CREATE PROCEDURE ChekingNameUsers ()
BEGIN 
    DECLARE done INT DEFAULT FALSE;
    DECLARE first_letter CHAR(1);
    DECLARE quantity INT;
    DECLARE result VARCHAR(100);
    
    DECLARE cur CURSOR FOR
        SELECT LEFT(name, 1) AS first_letter, COUNT(*) AS quantity
        FROM clients
        GROUP BY LEFT(name, 1)
        ORDER BY first_letter;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO first_letter, quantity;
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        IF (quantity > 4) THEN
            SET result = CONCAT("Existe bastante pessoas com a letra '", first_letter, "': ", quantity);
        ELSEIF (quantity < 4) THEN
            SET result = CONCAT("Existe poucas pessoas com a letra '", first_letter, "': ", quantity);
        ELSE 
            SET result = CONCAT("Não existe quase nenhum registro no banco de dados com a letra '", first_letter, "': ", quantity);
        END IF;
        
        SELECT result;
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;



CALL ChekingNameUsers ();



