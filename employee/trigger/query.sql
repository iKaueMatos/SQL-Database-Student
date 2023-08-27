/* TRIGGER */

/* Um gatilho e um tipo especial de procedimento armazenado executado automaticamente quando um evento ocorre no servidor de banco de dados

Ex: ao incluir dados em uma tabela,atualiza um log com data e hora

 */

 USE fruitjuice;

 SELECT * FROM billing;

CREATE TABLE billing (
    date_of_sale DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    product_code_id INT(11),
    total_sale FLOAT
); 

ALTER TABLE billing ADD CONSTRAINT fk_product_code_id 
FOREIGN KEY (product_code_id) REFERENCES products(product_id);
 

/*Basicamente com essa TRIGGER nos vamos dizer que quando um dado for inserido na tabela de items_invoices essa tabela de
 billing_trigger vai receber um novo dados que o total do valor do produto formando assim uma TRIGGER que inseri dados automaticamente */
DELIMITER //
CREATE TRIGGER billing_trigger AFTER INSERT ON items_invoices
FOR EACH ROW BEGIN
    INSERT INTO billing (date_of_sale, product_code_id, total_sale)
    VALUES (NOW(), NEW.product_id, NEW.price * NEW.quantity);
END //
DELIMITER ;
