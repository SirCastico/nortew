use nortew;

SELECT * 
	FROM venda ORDER BY Data_Realização DESC;

SELECT produto.*
	FROM produto ORDER BY Marca;

SELECT P.*, COUNT(V.Venda_id) AS N_Vendas
	FROM produto AS P LEFT OUTER JOIN vendido AS V 
		ON P.Referência = V.Produto_Referência
    GROUP BY P.Referência
    ORDER BY N_Vendas DESC;

DELIMITER $$
CREATE PROCEDURE vendas_loja(loja_id_in INT)
BEGIN
	SELECT * FROM 
		venda WHERE Loja_id = loja_id_in;
END $$
    
CALL vendas_loja(2);

DELIMITER $$
CREATE PROCEDURE produtos_loja(loja_id_in INT)
BEGIN
	SELECT P.*, D.Quantidade FROM 
		(SELECT * FROM disponivel WHERE Loja_id=loja_id_in) AS D 
			INNER JOIN produto AS P ON P.Referência=D.Produto_Referência;
END $$

CALL produtos_loja(2);

DELIMITER $$
CREATE PROCEDURE produtos_fornecedor(fornecedor_in INT)
BEGIN
	SELECT P.* FROM 
		(SELECT * FROM forneceprod WHERE Fornecedor_idFornecedor=fornecedor_in) AS FP 
			INNER JOIN produto AS P ON P.Referência=FP.Produto_Referência;
END $$

CALL produtos_fornecedor(1);

DELIMITER $$
CREATE PROCEDURE armazens_de_loja(loja_in INT)
BEGIN
	SELECT A.* FROM 
		(SELECT * FROM forneceloja WHERE Loja_id=loja_in) AS FL 
			INNER JOIN armazém AS A ON A.id=FL.Armazém_id;
END $$

CALL armazens_de_loja(1);


DELIMITER $$
CREATE PROCEDURE armazens_de_produto(produto_in INT)
BEGIN
	SELECT A.*, G.Quantidade FROM 
		(SELECT * FROM guardado WHERE Produto_Referência=produto_in) AS G 
			INNER JOIN armazém AS A ON A.id=G.Armazém_id;
END $$

CALL armazens_de_produto(1);


