-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema nortew
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema nortew
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `nortew` DEFAULT CHARACTER SET utf8 ;
USE `nortew` ;

-- -----------------------------------------------------
-- Table `nortew`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nortew`.`Cliente` (
  `NIF` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NULL,
  PRIMARY KEY (`NIF`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nortew`.`Fornecedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nortew`.`Fornecedor` (
  `idFornecedor` INT NOT NULL AUTO_INCREMENT,
  `Email` VARCHAR(45) NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Nr_Telefone` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idFornecedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nortew`.`Produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nortew`.`Produto` (
  `Referência` INT NOT NULL AUTO_INCREMENT,
  `Modelo` VARCHAR(45) NOT NULL,
  `Marca` VARCHAR(45) NOT NULL,
  `Código_EAN` BIGINT NOT NULL,
  `Preço` DOUBLE NOT NULL,
  `Categoria` VARCHAR(45) NULL,
  PRIMARY KEY (`Referência`),
  UNIQUE INDEX `Código_EAN_UNIQUE` (`Código_EAN` ASC) VISIBLE,
  UNIQUE INDEX `Marca_Modelo_UNIQUE` (`Modelo` ASC, `Marca` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nortew`.`Armazém`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nortew`.`Armazém` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Rua` VARCHAR(45) NOT NULL,
  `Cidade` VARCHAR(45) NOT NULL,
  `Código Postal` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nortew`.`Loja`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nortew`.`Loja` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Rua` VARCHAR(45) NOT NULL,
  `Cidade` VARCHAR(45) NOT NULL,
  `Código Postal` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nortew`.`Funcionário`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nortew`.`Funcionário` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Salário` DOUBLE NOT NULL,
  `Nr_Telefone` VARCHAR(15) NOT NULL,
  `Loja_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Funcionário_Loja1_idx` (`Loja_id` ASC) VISIBLE,
  CONSTRAINT `fk_Funcionário_Loja1`
    FOREIGN KEY (`Loja_id`)
    REFERENCES `nortew`.`Loja` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nortew`.`Venda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nortew`.`Venda` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Data_Realização` DATE NOT NULL,
  `Montante_Total` DOUBLE NOT NULL,
  `Loja_id` INT NOT NULL,
  `Cliente_NIF` INT NOT NULL,
  `Funcionário_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Venda_Loja1_idx` (`Loja_id` ASC) VISIBLE,
  INDEX `fk_Venda_Cliente1_idx` (`Cliente_NIF` ASC) VISIBLE,
  INDEX `fk_Venda_Funcionário1_idx` (`Funcionário_id` ASC) VISIBLE,
  CONSTRAINT `fk_Venda_Loja1`
    FOREIGN KEY (`Loja_id`)
    REFERENCES `nortew`.`Loja` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Venda_Cliente1`
    FOREIGN KEY (`Cliente_NIF`)
    REFERENCES `nortew`.`Cliente` (`NIF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Venda_Funcionário1`
    FOREIGN KEY (`Funcionário_id`)
    REFERENCES `nortew`.`Funcionário` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nortew`.`ForneceProd`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nortew`.`ForneceProd` (
  `Produto_Referência` INT NOT NULL,
  `Fornecedor_idFornecedor` INT NOT NULL,
  PRIMARY KEY (`Produto_Referência`, `Fornecedor_idFornecedor`),
  INDEX `fk_Produto_has_Fornecedor_Fornecedor1_idx` (`Fornecedor_idFornecedor` ASC) VISIBLE,
  INDEX `fk_Produto_has_Fornecedor_Produto_idx` (`Produto_Referência` ASC) VISIBLE,
  CONSTRAINT `fk_Produto_has_Fornecedor_Produto`
    FOREIGN KEY (`Produto_Referência`)
    REFERENCES `nortew`.`Produto` (`Referência`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produto_has_Fornecedor_Fornecedor1`
    FOREIGN KEY (`Fornecedor_idFornecedor`)
    REFERENCES `nortew`.`Fornecedor` (`idFornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nortew`.`Guardado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nortew`.`Guardado` (
  `Armazém_id` INT NOT NULL,
  `Produto_Referência` INT NOT NULL,
  `Quantidade` INT NOT NULL,
  PRIMARY KEY (`Armazém_id`, `Produto_Referência`),
  INDEX `fk_Armazém_has_Produto_Produto1_idx` (`Produto_Referência` ASC) VISIBLE,
  INDEX `fk_Armazém_has_Produto_Armazém1_idx` (`Armazém_id` ASC) VISIBLE,
  CONSTRAINT `fk_Armazém_has_Produto_Armazém1`
    FOREIGN KEY (`Armazém_id`)
    REFERENCES `nortew`.`Armazém` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Armazém_has_Produto_Produto1`
    FOREIGN KEY (`Produto_Referência`)
    REFERENCES `nortew`.`Produto` (`Referência`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nortew`.`Vendido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nortew`.`Vendido` (
  `Venda_id` INT NOT NULL,
  `Produto_Referência` INT NOT NULL,
  `Montante` DOUBLE NOT NULL,
  `Quantidade` INT NOT NULL,
  PRIMARY KEY (`Venda_id`, `Produto_Referência`),
  INDEX `fk_Venda_has_Produto_Produto1_idx` (`Produto_Referência` ASC) VISIBLE,
  INDEX `fk_Venda_has_Produto_Venda1_idx` (`Venda_id` ASC) VISIBLE,
  CONSTRAINT `fk_Venda_has_Produto_Venda1`
    FOREIGN KEY (`Venda_id`)
    REFERENCES `nortew`.`Venda` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Venda_has_Produto_Produto1`
    FOREIGN KEY (`Produto_Referência`)
    REFERENCES `nortew`.`Produto` (`Referência`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nortew`.`Disponivel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nortew`.`Disponivel` (
  `Produto_Referência` INT NOT NULL,
  `Loja_id` INT NOT NULL,
  `Quantidade` INT NOT NULL,
  PRIMARY KEY (`Produto_Referência`, `Loja_id`),
  INDEX `fk_Produto_has_Loja_Loja1_idx` (`Loja_id` ASC) VISIBLE,
  INDEX `fk_Produto_has_Loja_Produto1_idx` (`Produto_Referência` ASC) VISIBLE,
  CONSTRAINT `fk_Produto_has_Loja_Produto1`
    FOREIGN KEY (`Produto_Referência`)
    REFERENCES `nortew`.`Produto` (`Referência`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produto_has_Loja_Loja1`
    FOREIGN KEY (`Loja_id`)
    REFERENCES `nortew`.`Loja` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nortew`.`ForneceLoja`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nortew`.`ForneceLoja` (
  `Armazém_id` INT NOT NULL,
  `Loja_id` INT NOT NULL,
  PRIMARY KEY (`Armazém_id`, `Loja_id`),
  INDEX `fk_Armazém_has_Loja_Loja1_idx` (`Loja_id` ASC) VISIBLE,
  INDEX `fk_Armazém_has_Loja_Armazém1_idx` (`Armazém_id` ASC) VISIBLE,
  CONSTRAINT `fk_Armazém_has_Loja_Armazém1`
    FOREIGN KEY (`Armazém_id`)
    REFERENCES `nortew`.`Armazém` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Armazém_has_Loja_Loja1`
    FOREIGN KEY (`Loja_id`)
    REFERENCES `nortew`.`Loja` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
