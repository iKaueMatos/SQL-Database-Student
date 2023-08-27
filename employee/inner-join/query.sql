
/* se o id da tabela sellers for igual ao id da tabela sales ira ser feito um Inner join e vai tranzer todos os dados de ambas as tabelas filtrando pelo cpf e pelas as 2 chaves estrangeiras*/

SELECT vendas.seller_id, vendas.name, vendas.neighborhood, vendas.Committee, vendas.date_issue, vendas.holiday,venda.sale_id,venda.data_sale,venda.cpf,venda.tax
FROM sellers vendas 
INNER JOIN sales venda ON vendas.seller_id = venda.seller_id
WHERE vendas.seller_id = 1 AND venda.sale_id <> 400.033 AND cpf = 12462879024;


/*inner join filtrando pelo id do usuario*/
SELECT vendas.*,venda.*
FROM sellers vendas 
INNER JOIN sales venda ON vendas.seller_id = venda.seller_id WHERE vendas.seller_id = 13;

/*Trazendo todos os resultados da tabela */ 

SELECT vendas.*,venda.*
FROM sellers vendas 
INNER JOIN sales venda ON vendas.seller_id = venda.seller_id;

/*Consulta utilizando o LEFT JOIN*/
SELECT vendas.*, venda.*
FROM sellers vendas 
LEFT JOIN sales venda ON vendas.seller_id = venda.seller_id
WHERE vendas.seller_id = 1 AND (venda.sale_id IS NULL OR venda.sale_id <> 400.033) AND venda.cpf = 12462879024;

use unipstudy;

SELECT aluno.nm_aluno, aluno.ds_endereco_aluno, campus.nm_campus, uf.nm_uf
FROM aluno
JOIN campus ON aluno.campus_cd_campus = campus.cd_campus
LEFT JOIN uf ON campus.uf_cd_uf = uf.cd_uf;
LEFT JOIN aluno_disciplina ON aluno.cd_aluno = aluno_disciplina.aluno_cd_aluno
LEFT JOIN disciplina ON aluno_disciplina.disciplina_cd_disciplina = disciplina.cd_disciplina
WHERE aluno_disciplina.disciplina_cd_disciplina IS NULL;