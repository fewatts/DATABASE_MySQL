-- MySQL Script generated by MySQL Workbench
-- Fri Mar 10 17:49:43 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema The_Green_Market
-- -----------------------------------------------------
-- Projeto Integrador Ecommerce 

-- -----------------------------------------------------
-- Schema The_Green_Market
--
-- Projeto Integrador Ecommerce 
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `The_Green_Market` DEFAULT CHARACTER SET utf16 ;
USE `The_Green_Market` ;

-- -----------------------------------------------------
-- Table `The_Green_Market`.`tb_categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `The_Green_Market`.`tb_categorias` (
  `idCategoria` BIGINT NOT NULL AUTO_INCREMENT,
  `nomeCategoria` VARCHAR(255) NOT NULL,
  `descriçaoCategoria` TEXT NOT NULL,
  PRIMARY KEY (`idCategoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `The_Green_Market`.`Usuário`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `The_Green_Market`.`Usuário` (
  `idUsuario` BIGINT NOT NULL AUTO_INCREMENT,
  `nome_usuario` VARCHAR(255) NOT NULL,
  `cpf` VARCHAR(11) NOT NULL,
  `endereco` VARCHAR(255) NOT NULL,
  `cep` VARCHAR(8) NOT NULL,
  `telefone` VARCHAR(9) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `senha` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE INDEX `endereco_UNIQUE` (`endereco` ASC) VISIBLE,
  UNIQUE INDEX `telefone_UNIQUE` (`telefone` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `senha_UNIQUE` (`senha` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `The_Green_Market`.`Produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `The_Green_Market`.`Produtos` (
  `idProdutos` BIGINT NOT NULL AUTO_INCREMENT,
  `nome_produto` VARCHAR(255) NOT NULL,
  `quantidade` INT NOT NULL,
  `valor` DECIMAL(6,2) NOT NULL,
  `categoria_id` BIGINT NULL,
  `descricao` VARCHAR(255) NOT NULL,
  `tb_categorias_idCategoria` BIGINT NOT NULL,
  `Usuário_idUsuario` BIGINT NOT NULL,
  PRIMARY KEY (`idProdutos`),
  INDEX `fk_Produtos_tb_categorias_idx` (`tb_categorias_idCategoria` ASC) VISIBLE,
  INDEX `fk_Produtos_Usuário1_idx` (`Usuário_idUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_Produtos_tb_categorias`
    FOREIGN KEY (`tb_categorias_idCategoria`)
    REFERENCES `The_Green_Market`.`tb_categorias` (`idCategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produtos_Usuário1`
    FOREIGN KEY (`Usuário_idUsuario`)
    REFERENCES `The_Green_Market`.`Usuário` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;