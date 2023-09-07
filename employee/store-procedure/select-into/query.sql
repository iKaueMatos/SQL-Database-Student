//Problema do select into em um banco de dados

DELIMITER //
CREATE PROCEDURE 'select_into_problems' ()
BEGIN 
    DECLARE vName VARCHAR(50);
    // Quando utilizamos o select into em uma aplicação temos que garantir que o 
    // select que estamos utilizando retorne apenas uma linha sendo assim ai podemos armazenar em uma variavel para futuramente 
    // utilizarmos o dado dentro da aplicação
    SELECT name INTO vName FROM clients;
    SELECT vName;
END //
DELIMITER ;