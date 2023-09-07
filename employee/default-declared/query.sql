/* Nome - nome da variavel deve ter apenas letras, numeros, $ e underscore( _);

* Deve ser unico dentro da SP
* E case SENSITIVE
* Tamanho maximo 255 caracteres;
* Se não hoiuver DEFAULT o valor da variavel sera NULL
* A linha da declaração deve terminar com ponto e virgula

*/

/* Tipos de variaveis que podem ser utilizados

* VARCHAR(n) - caracteres textos com tamanho maximo de n caracteres
* INTEGER variavel do tipo inteiro
* DECIMAL (p,s) - variavel decimal com p digitos e s ponto decimais
* DATE - para guardar uma DATA
* TIMESTAMP - Para guardar data e hora

 */

/* Name - variable name should consist only of letters, numbers, $, and underscores (_);

Must be unique within the SP
Is case sensitive
Maximum length of 255 characters;
If there is no DEFAULT, the variable's value will be NULL
The declaration line must end with a semicolon
*/

/* Variable types that can be used

VARCHAR(n) - text characters with a maximum length of n characters
INTEGER - integer variable type
DECIMAL(p,s) - decimal variable with p digits and s decimal places
DATE - to store a DATE
TIMESTAMP - to store both date and time
*/

 /*Para declarar uma variavel*/

 DECLARE variable char(12);

 /* acess value */
SELECT variable;



DELIMITER //
CREATE PROCEDURE acessVariable ()
BEGIN 
DECLARE variable char(12) default 'hello';
SELECT variable;

END //
DELIMITER;