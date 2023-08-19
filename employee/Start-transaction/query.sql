

START TRANSACTION; /* Inicia uma transação, para que seja possível fazer alterações no banco de dados*/

SELECT * FROM sellers;

UPDATE sellers SET committee = committee * 1.15;

ROLLBACK; /* Para voltar as alterações e Commit para salvar dentro do banco de dados as alterações*/

COMMIT; /* Para salvar dentro do banco de dados as alterações*/