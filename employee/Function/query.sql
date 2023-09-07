
//Sub rotina executa um serie de comandos que são repetitivos
//ja função são comandos que vão ser executados mais que retornam um valor


USE fruitjuice;

SELECT * FROM clients;

DELIMITER //
CREATE FUNCTION countValuesIsAddress(vAddress VARCHAR(50)) 
RETURNS INT
BEGIN 
    DECLARE vCount INT DEFAULT 0;

    SELECT COUNT(*) INTO vCount FROM clients WHERE address = vAddress;
    
    RETURN vCount;
END //
DELIMITER ;

//Formato da consulta que pode ser feita para verificar quantos endereços de um determinado local esta cadastrado no banco de dados
SELECT countValuesIsAddress('Rua da Paz') as countAddress;

/*Função para vericar quantos usuarios tem dentro do banco de dados com o mesmo nome*/
DELIMITER //
CREATE FUNCTION countNameIsClients(vName VARCHAR(50))
RETURNS INT
BEGIN
    DECLARE vCount INT DEFAULT 0;

    SELECT COUNT(*) INTO vCount FROM clients WHERE name = vName;

    RETURN vCount;
END //
DELIMITER ;

SELECT countNameIsClients('Carlos') AS countName;
