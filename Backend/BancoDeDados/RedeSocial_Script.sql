-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema DB_REDE_SOCIAL
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema DB_REDE_SOCIAL
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `DB_REDE_SOCIAL` DEFAULT CHARACTER SET utf8 ;
USE `DB_REDE_SOCIAL` ;

-- -----------------------------------------------------
-- Table `DB_REDE_SOCIAL`.`TB_TEMA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_REDE_SOCIAL`.`TB_TEMA` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `DESCRICAO` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB_REDE_SOCIAL`.`TB_USUARIOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_REDE_SOCIAL`.`TB_USUARIOS` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `NOME` VARCHAR(255) NOT NULL,
  `USUARIO` VARCHAR(255) NOT NULL,
  `SENHA` VARCHAR(255) NOT NULL,
  `FOTO` VARCHAR(255) NULL,
  `DEFICIENCIA` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB_REDE_SOCIAL`.`TB_POSTAGENS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_REDE_SOCIAL`.`TB_POSTAGENS` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `TITULO` VARCHAR(100) NOT NULL,
  `TEXTO` VARCHAR(1000) NOT NULL,
  `FOTO` VARCHAR(255) NULL,
  `DATA` DATE NULL,
  `TEMA_id` BIGINT NULL,
  `USUARIOS_id` BIGINT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_TB_POSTAGENS_TB_TEMA_idx` (`TEMA_id` ASC) VISIBLE,
  INDEX `fk_TB_POSTAGENS_TB_USUARIOS1_idx` (`USUARIOS_id` ASC) VISIBLE,
  CONSTRAINT `fk_TB_POSTAGENS_TB_TEMA`
    FOREIGN KEY (`TEMA_id`)
    REFERENCES `DB_REDE_SOCIAL`.`TB_TEMA` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TB_POSTAGENS_TB_USUARIOS1`
    FOREIGN KEY (`USUARIOS_id`)
    REFERENCES `DB_REDE_SOCIAL`.`TB_USUARIOS` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
