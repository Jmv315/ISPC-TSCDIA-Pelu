-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema peluqueria
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema peluqueria
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema peluqueria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `peluqueria` DEFAULT CHARACTER SET utf8mb3 ;
USE `peluqueria` ;

-- -----------------------------------------------------
-- Table `peluqueria`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peluqueria`.`cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellido` VARCHAR(45) NOT NULL,
  `Telefono` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB
AUTO_INCREMENT = 38
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `peluqueria`.`servicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peluqueria`.`servicio` (
  `idServicio` INT NOT NULL AUTO_INCREMENT,
  `idCliente` INT NOT NULL,
  `lavado` VARCHAR(45) NOT NULL,
  `tintura` VARCHAR(45) NOT NULL,
  `mechas` VARCHAR(45) NOT NULL,
  `permanente` VARCHAR(45) NOT NULL,
  `bañoCrema` VARCHAR(45) NOT NULL,
  `brushing` VARCHAR(45) NOT NULL,
  `peinado` VARCHAR(45) NOT NULL,
  `fecha` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idServicio`),
  INDEX `idCliente_idx` (`idCliente` ASC) VISIBLE,
  CONSTRAINT `idClienteFK`
    FOREIGN KEY (`idCliente`)
    REFERENCES `peluqueria`.`cliente` (`idCliente`))
ENGINE = InnoDB
AUTO_INCREMENT = 31
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `peluqueria`.`productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peluqueria`.`productos` (
  `idProductos` INT NOT NULL AUTO_INCREMENT,
  `Tintura` VARCHAR(45) NOT NULL,
  `Oxidante` VARCHAR(45) NOT NULL,
  `Crema` VARCHAR(45) NOT NULL,
  `Champu` VARCHAR(45) NOT NULL,
  `Decolorante` VARCHAR(45) NOT NULL,
  `Protector termico` VARCHAR(45) NOT NULL,
  `Brillo` VARCHAR(45) NOT NULL,
  `Horquillas` VARCHAR(45) NOT NULL,
  `Aceite` VARCHAR(45) NOT NULL,
  `Reparador` VARCHAR(45) NOT NULL,
  `idServicio` INT NOT NULL,
  INDEX `idServicio_idx` (`idServicio` ASC) VISIBLE,
  PRIMARY KEY (`idProductos`),
  CONSTRAINT `idServicioFK`
    FOREIGN KEY (`idServicio`)
    REFERENCES `peluqueria`.`servicio` (`idServicio`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `peluqueria`.`registro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peluqueria`.`registro` (
  `idregistro` INT NOT NULL AUTO_INCREMENT,
  `dni` INT NOT NULL,
  `cliente_idCliente` INT NOT NULL,
  PRIMARY KEY (`idregistro`, `cliente_idCliente`),
  INDEX `fk_registro_cliente1_idx` (`cliente_idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_registro_cliente1`
    FOREIGN KEY (`cliente_idCliente`)
    REFERENCES `peluqueria`.`cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
