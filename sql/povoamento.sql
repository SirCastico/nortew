INSERT INTO `nortew`.`Cliente` (`NIF`, `Nome`, `Email`) VALUES
(1, 'John Doe', 'johndoe@example.com'),
(2, 'Jane Smith', 'janesmith@example.com'),
(3, 'Michael Johnson', 'michaeljohnson@example.com'),
(4, 'Emily Brown', 'emilybrown@example.com'),
(5, 'David Wilson', 'davidwilson@example.com');


INSERT INTO `nortew`.`Fornecedor` (`idFornecedor`, `Email`, `Nome`, `Nr_Telefone`) VALUES
(1, 'supplier1@example.com', 'Supplier 1', '1234567890'),
(2, 'supplier2@example.com', 'Supplier 2', '9876543210'),
(3, 'supplier3@example.com', 'Supplier 3', '5555555555'),
(4, 'supplier4@example.com', 'Supplier 4', '9999999999'),
(5, 'supplier5@example.com', 'Supplier 5', '1111111111');


INSERT INTO `nortew`.`Produto` (`Referência`, `Modelo`, `Marca`, `Código_EAN`, `Preço`, `Categoria`) VALUES
(1, 'Model 1', 'Brand 1', 1234567890123, 9.99, 'Category 1'),
(2, 'Model 2', 'Brand 2', 2345678901234, 19.99, 'Category 2'),
(3, 'Model 3', 'Brand 3', 3456789012345, 29.99, 'Category 1'),
(4, 'Model 4', 'Brand 4', 4567890123456, 39.99, 'Category 3'),
(5, 'Model 5', 'Brand 5', 5678901234567, 49.99, 'Category 2');


INSERT INTO `nortew`.`Armazém` (`id`, `Rua`, `Cidade`, `Código Postal`) VALUES
(1, 'Street 1', 'City 1', '12345'),
(2, 'Street 2', 'City 2', '23456'),
(3, 'Street 3', 'City 3', '34567'),
(4, 'Street 4', 'City 4', '45678'),
(5, 'Street 5', 'City 5', '56789');


INSERT INTO `nortew`.`Loja` (`id`, `Rua`, `Cidade`, `Código Postal`) VALUES
(1, 'Street 1', 'City 1', '12345'),
(2, 'Street 2', 'City 2', '23456'),
(3, 'Street 3', 'City 3', '34567'),
(4, 'Street 4', 'City 4', '45678'),
(5, 'Street 5', 'City 5', '56789');


INSERT INTO `nortew`.`Funcionário` (`id`, `Nome`, `Email`, `Salário`, `Nr_Telefone`, `Loja_id`) VALUES
(1, 'Employee 1', 'employee1@example.com', 1000.0, '1234567890', 1),
(2, 'Employee 2', 'employee2@example.com', 1500.0, '9876543210', 2),
(3, 'Employee 3', 'employee3@example.com', 2000.0, '5555555555', 3),
(4, 'Employee 4', 'employee4@example.com', 2500.0, '9999999999', 4),
(5, 'Employee 5', 'employee5@example.com', 3000.0, '1111111111', 5);


INSERT INTO `nortew`.`Venda` (`id`, `Data_Realização`, `Montante_Total`, `Loja_id`, `Cliente_NIF`, `Funcionário_id`) VALUES
(1, '2023-01-01', 100.0, 1, 1, 1),
(2, '2023-01-02', 200.0, 2, 2, 2),
(3, '2023-01-03', 300.0, 3, 3, 3),
(4, '2023-01-04', 400.0, 4, 4, 4),
(5, '2023-01-05', 500.0, 5, 5, 5);


INSERT INTO `nortew`.`ForneceProd` (`Produto_Referência`, `Fornecedor_idFornecedor`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);


INSERT INTO `nortew`.`Guardado` (`Armazém_id`, `Produto_Referência`, `Quantidade`) VALUES
(1, 1, 10),
(2, 2, 20),
(3, 3, 30),
(4, 4, 40),
(5, 5, 50);


INSERT INTO `nortew`.`Vendido` (`Venda_id`, `Produto_Referência`, `Montante`, `Quantidade`) VALUES
(1, 1, 50, 5),
(2, 2, 100, 10),
(3, 3, 150, 15),
(4, 4, 200, 20),
(5, 5, 250, 25);


INSERT INTO `nortew`.`Disponivel` (`Produto_Referência`, `Loja_id`, `Quantidade`) VALUES
(1, 1, 5),
(2, 2, 10),
(3, 3, 15),
(4, 4, 20),
(5, 5, 25);

INSERT INTO `nortew`.`ForneceLoja` (`Armazém_id`, `Loja_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);
