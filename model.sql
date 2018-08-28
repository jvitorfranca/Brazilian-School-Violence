-- MySQL Script generated by MySQL Workbench
-- Ter 28 Ago 2018 10:09:32 -03
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Tipo_Instituicao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tipo_Instituicao` (
  `idTipoInstituicao` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipoInstituicao`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Instituicao_Ensino`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Instituicao_Ensino` (
  `idInstituicao` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `estado` VARCHAR(2) NOT NULL,
  `idTipoInstituicao` INT NOT NULL,
  PRIMARY KEY (`idInstituicao`),
  INDEX `fk_Instituicao Ensino_Tipo Instituicao1_idx` (`idTipoInstituicao` ASC),
  CONSTRAINT `fk_Instituicao Ensino_Tipo Instituicao1`
    FOREIGN KEY (`idTipoInstituicao`)
    REFERENCES `mydb`.`Tipo_Instituicao` (`idTipoInstituicao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Caso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Caso` (
  `idCaso` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(120) NOT NULL,
  `data` DATE NOT NULL,
  `numeroFeridos` INT NOT NULL,
  `numeroVitimasFatais` INT NOT NULL,
  `idInstituicao` INT NOT NULL,
  PRIMARY KEY (`idCaso`),
  UNIQUE INDEX `idCaso_UNIQUE` (`idCaso` ASC),
  INDEX `fk_Caso_Instituicao Ensino1_idx` (`idInstituicao` ASC),
  CONSTRAINT `fk_Caso_Instituicao Ensino1`
    FOREIGN KEY (`idInstituicao`)
    REFERENCES `mydb`.`Instituicao_Ensino` (`idInstituicao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Raca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Raca` (
  `idRaca` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idRaca`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Vinculo_Instituicao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Vinculo_Instituicao` (
  `idVinculo_Instituicao` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idVinculo_Instituicao`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Vitima`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Vitima` (
  `idVitima` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `idade` INT NOT NULL,
  `sexo` VARCHAR(9) NOT NULL,
  `idCaso` INT NOT NULL,
  `idRaca` INT NOT NULL,
  `idVinculo_Instituicao` INT NOT NULL,
  PRIMARY KEY (`idVitima`),
  INDEX `fk_Vitima_Caso1_idx` (`idCaso` ASC),
  INDEX `fk_Vitima_Raca1_idx` (`idRaca` ASC),
  INDEX `fk_Vitima_Vinculo com Instituicao1_idx` (`idVinculo_Instituicao` ASC),
  CONSTRAINT `fk_Vitima_Caso1`
    FOREIGN KEY (`idCaso`)
    REFERENCES `mydb`.`Caso` (`idCaso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vitima_Raca1`
    FOREIGN KEY (`idRaca`)
    REFERENCES `mydb`.`Raca` (`idRaca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vitima_Vinculo com Instituicao1`
    FOREIGN KEY (`idVinculo_Instituicao`)
    REFERENCES `mydb`.`Vinculo_Instituicao` (`idVinculo_Instituicao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Destino`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Destino` (
  `idDestino` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idDestino`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Criminoso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Criminoso` (
  `idCriminoso` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `idade` INT NOT NULL,
  `sexo` VARCHAR(45) NOT NULL,
  `motivacao` VARCHAR(45) NOT NULL,
  `idDestino` INT NOT NULL,
  `idRaca` INT NOT NULL,
  `idVinculo_Instituicao` INT NOT NULL,
  PRIMARY KEY (`idCriminoso`),
  INDEX `fk_Criminoso_Destino1_idx` (`idDestino` ASC),
  INDEX `fk_Criminoso_Raca1_idx` (`idRaca` ASC),
  INDEX `fk_Criminoso_Vinculo com Instituicao1_idx` (`idVinculo_Instituicao` ASC),
  CONSTRAINT `fk_Criminoso_Destino1`
    FOREIGN KEY (`idDestino`)
    REFERENCES `mydb`.`Destino` (`idDestino`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Criminoso_Raca1`
    FOREIGN KEY (`idRaca`)
    REFERENCES `mydb`.`Raca` (`idRaca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Criminoso_Vinculo com Instituicao1`
    FOREIGN KEY (`idVinculo_Instituicao`)
    REFERENCES `mydb`.`Vinculo_Instituicao` (`idVinculo_Instituicao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Fonte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Fonte` (
  `idFonte` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idFonte`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Antecedente_Criminal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Antecedente_Criminal` (
  `idAntecedente_Criminal` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idAntecedente_Criminal`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tipo_Arma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tipo_Arma` (
  `idTipo_Arma` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipo_Arma`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Arma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Arma` (
  `idArma` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `idTipo_Arma` INT NOT NULL,
  PRIMARY KEY (`idArma`),
  INDEX `fk_Arma_Tipo de Arma1_idx` (`idTipo_Arma` ASC),
  CONSTRAINT `fk_Arma_Tipo de Arma1`
    FOREIGN KEY (`idTipo_Arma`)
    REFERENCES `mydb`.`Tipo_Arma` (`idTipo_Arma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Vitima_Criminoso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Vitima_Criminoso` (
  `idVitima` INT NOT NULL,
  `idCriminoso` INT NOT NULL,
  PRIMARY KEY (`idVitima`, `idCriminoso`),
  INDEX `fk_Vitima_has_Criminoso_Criminoso1_idx` (`idCriminoso` ASC),
  INDEX `fk_Vitima_has_Criminoso_Vitima1_idx` (`idVitima` ASC),
  CONSTRAINT `fk_Vitima_has_Criminoso_Vitima1`
    FOREIGN KEY (`idVitima`)
    REFERENCES `mydb`.`Vitima` (`idVitima`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vitima_has_Criminoso_Criminoso1`
    FOREIGN KEY (`idCriminoso`)
    REFERENCES `mydb`.`Criminoso` (`idCriminoso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Antecedente_Criminoso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Antecedente_Criminoso` (
  `idAntecedente_Criminal` INT NOT NULL,
  `idCriminoso` INT NOT NULL,
  PRIMARY KEY (`idAntecedente_Criminal`, `idCriminoso`),
  INDEX `fk_Antecedente Criminal_has_Criminoso_Criminoso1_idx` (`idCriminoso` ASC),
  INDEX `fk_Antecedente Criminal_has_Criminoso_Antecedente Criminal1_idx` (`idAntecedente_Criminal` ASC),
  CONSTRAINT `fk_Antecedente Criminal_has_Criminoso_Antecedente Criminal1`
    FOREIGN KEY (`idAntecedente_Criminal`)
    REFERENCES `mydb`.`Antecedente_Criminal` (`idAntecedente_Criminal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Antecedente Criminal_has_Criminoso_Criminoso1`
    FOREIGN KEY (`idCriminoso`)
    REFERENCES `mydb`.`Criminoso` (`idCriminoso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Criminoso_Arma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Criminoso_Arma` (
  `idCriminoso` INT NOT NULL,
  `idArma` INT NOT NULL,
  PRIMARY KEY (`idCriminoso`, `idArma`),
  INDEX `fk_Criminoso_has_Arma_Arma1_idx` (`idArma` ASC),
  INDEX `fk_Criminoso_has_Arma_Criminoso1_idx` (`idCriminoso` ASC),
  CONSTRAINT `fk_Criminoso_has_Arma_Criminoso1`
    FOREIGN KEY (`idCriminoso`)
    REFERENCES `mydb`.`Criminoso` (`idCriminoso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Criminoso_has_Arma_Arma1`
    FOREIGN KEY (`idArma`)
    REFERENCES `mydb`.`Arma` (`idArma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Fonte_Caso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Fonte_Caso` (
  `idFonte` INT NOT NULL,
  `idCaso` INT NOT NULL,
  PRIMARY KEY (`idFonte`, `idCaso`),
  INDEX `fk_Fonte_has_Caso_Caso1_idx` (`idCaso` ASC),
  INDEX `fk_Fonte_has_Caso_Fonte1_idx` (`idFonte` ASC),
  CONSTRAINT `fk_Fonte_has_Caso_Fonte1`
    FOREIGN KEY (`idFonte`)
    REFERENCES `mydb`.`Fonte` (`idFonte`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Fonte_has_Caso_Caso1`
    FOREIGN KEY (`idCaso`)
    REFERENCES `mydb`.`Caso` (`idCaso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`timestamps`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`timestamps` (
  `create_time`  NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time`  NULL);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
