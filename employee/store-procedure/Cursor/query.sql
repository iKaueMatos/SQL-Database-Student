//CURSOR o que é ?

USE fruitjuice;
//Cursor e uma estrutura implementada no mysql que permite uma interatividade linha a 
//linha atraves de uma determinada ordem.

//Frases para o uso do Cursor: 

//declaração - onde definimos qual consulta SQL estará sendo carregada ao Cursor; 
//Abertura abrimos o cursor para percorre-lo linha a linha
//percorre linha a linha ate o seu final
//fecha o CURSOR
//limpa o cursor da memória

DELIMITER //
CREATE PROCEDURE filter_name()
BEGIN
    DECLARE vName VARCHAR(30);
    DECLARE done INT DEFAULT 0;
    DECLARE c_filter CURSOR FOR 
        SELECT name FROM clients;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    
    OPEN c_filter;
    //FETCH -> Chama o proximo elemento
    FETCH c_filter INTO vName;  -- Primeira chamada
    SELECT vName;
    //FETCH -> Chama o proximo elemento
    FETCH c_filter INTO vName;  -- Segunda chamada
    SELECT vName;
    //FETCH -> Chama o proximo elemento
    FETCH c_filter INTO vName;  -- Terceira chamada
    SELECT vName;
    
    CLOSE c_filter;
END;
//
DELIMITER ;

CALL filter_name();

DELIMITER //
CREATE PROCEDURE filter_name3()
BEGIN
    DECLARE vName VARCHAR(30);
    DECLARE done INT DEFAULT 0;
    DECLARE c_filter CURSOR FOR 
        SELECT name FROM clients LIMIT 4;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    
    OPEN c_filter;
    WHILE done = 0
    DO
        FETCH c_filter INTO vName;
        SELECT vName;
        END WHILE;
    CLOSE c_filter;
END //
DELIMITER ;

CALL filter_name3();

DELIMITER // 
CREATE PROCEDURE filter_date() 
BEGIN
    DECLARE vName VARCHAR(40);
    DECLARE vAddress VARCHAR(40);
    DECLARE vCpf VARCHAR(11);
    DECLARE init INT DEFAULT 0;
    DECLARE c_filter_date CURSOR FOR
        SELECT name,cpf,address FROM clients LIMIT 10;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET init = 1;

    OPEN c_filter_date;
    FETCH c_filter_date INTO vName,vCpf,vAddress;

    WHILE init = 0
    DO 
        SELECT vName,vCpf,vAddress;
        FETCH c_filter_date INTO vName,vCpf,vAddress;
        END WHILE;
    CLOSE c_filter_date;
END //
DELIMITER ;

CALL filter_date();