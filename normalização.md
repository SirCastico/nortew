## Fornecedor
(id, email, nome, telefone)
- id -> (email, nome, telefone)

## ForneceProd
(prod_ref, forn_id)

## Produto
(referencia, modelo, marca, código EAN, preço, tipo)
- referencia -> (modelo, marca, código EAN, preço, tipo)
- código EAN -> (referencia, modelo, marca, preço, tipo)
- (modelo, marca) -> (referencia, código EAN, preço, tipo)

## Vendido
(venda_id, prod_ref, montante, quantidade)
- (venda_id, prod_ref) -> (montante, quantidade)

## Venda
(id, data, montante_total, loja_id, cliente_nif, func_id)
- id -> (data, montante_total, loja_id, cliente_nif, func_id)

## Cliente
(NIF, nome, email)
NIF -> (nome, email)

## Loja
(id, rua, cidade, código postal)
id -> (rua, cidade, código postal)

## Disponivel
(prod_ref, loja_id, quantidade)
- (prod_ref, loja_id) -> (quantidade)

## ForneceLoja
(armazém_id, loja_id)

## Armazém
(id, rua, cidade, código postal)
id -> (rua, cidade, código, postal)

## Guardado
(armazém_id, prod_ref, quantidade)
- (armazém_id, prod_ref) -> (quantidade)

## Funcionário
(id, nome, email, salário, telefone, loja_id)
id -> (nome, email, salário, telefone, loja_id)

---

Está na 3º forma normal
Está em FNBC, todos os determinantes funcionais são chaves candidatas
Está na 3ºFN, determinantes de multivalorados são chaves candidatas