use nortew;

# O sistema deve ser capaz de apresentar uma lista de vendas ordenada por data.
SELECT * 
	FROM venda ORDER BY Data_Realização DESC;

# O sistema deve ser capaz de apresentar uma lista de produtos ordenada alfabeticamente por marca.
SELECT produto.*
	FROM produto ORDER BY Marca;

# O sistema deve ser capaz de apresentar uma lista de produtos ordenada decrescentemente pelos mais vendidos.
SELECT P.*, COUNT(V.Venda_id) AS N_Vendas
	FROM produto AS P LEFT OUTER JOIN vendido AS V 
		ON P.Referência = V.Produto_Referência
    GROUP BY P.Referência
    ORDER BY N_Vendas DESC;


# O sistema deve conseguir apresentar uma lista de vendas de uma dada loja.
DELIMITER $$
CREATE PROCEDURE vendas_loja(loja_id_in INT)
BEGIN
	SELECT * FROM 
		venda WHERE Loja_id = loja_id_in;
END $$
    
    
# O sistema deve conseguir apresentar uma lista de produtos de uma dada loja, incluindo a sua quantidade.
DELIMITER $$
CREATE PROCEDURE produtos_loja(loja_id_in INT)
BEGIN
	SELECT P.*, D.Quantidade FROM 
		(SELECT * FROM disponivel WHERE Loja_id=loja_id_in) AS D 
			INNER JOIN produto AS P ON P.Referência=D.Produto_Referência;
END $$


DELIMITER $$
CREATE PROCEDURE produtos_fornecedor(fornecedor_in INT)
BEGIN
	SELECT P.* FROM 
		(SELECT * FROM forneceprod WHERE Fornecedor_idFornecedor=fornecedor_in) AS FP 
			INNER JOIN produto AS P ON P.Referência=FP.Produto_Referência;
END $$


# O sistema deve permitir ver que armazéns fornecem uma dada loja
DELIMITER $$
CREATE PROCEDURE armazens_de_loja(loja_in INT)
BEGIN
	SELECT A.* FROM 
		(SELECT * FROM forneceloja WHERE Loja_id=loja_in) AS FL 
			INNER JOIN armazém AS A ON A.id=FL.Armazém_id;
END $$


# O sistema deve ter capacidade de pesquisar em que armazens um dado produto existe, incluindo a sua quantidade no resultado
DELIMITER $$
CREATE PROCEDURE armazens_de_produto(produto_in INT)
BEGIN
	SELECT A.*, G.Quantidade FROM 
		(SELECT * FROM guardado WHERE Produto_Referência=produto_in) AS G 
			INNER JOIN armazém AS A ON A.id=G.Armazém_id;
END $$


CREATE VIEW produtos_vendas_view AS
	SELECT P.*, COUNT(V.Venda_id) AS N_Vendas
	FROM produto AS P LEFT OUTER JOIN vendido AS V 
		ON P.Referência = V.Produto_Referência
    GROUP BY P.Referência
    ORDER BY N_Vendas DESC;

