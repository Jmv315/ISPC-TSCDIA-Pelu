
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `peluqueria` DEFAULT CHARACTER SET utf8mb3 ;
USE `peluqueria` ;

-- -----------------------------------------------------
-- Table `peluqueria`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peluqueria`.`cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `dni` INT NOT NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `peluqueria`.`servicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peluqueria`.`servicio` (
  `idServicio` INT NOT NULL AUTO_INCREMENT,
  `lavado` VARCHAR(45) NOT NULL,
  `tinturas` VARCHAR(45) NOT NULL,
  `mechas` VARCHAR(45) NOT NULL,
  `permanente` VARCHAR(45) NOT NULL,
  `bañoCrema` VARCHAR(45) NOT NULL,
  `brushing` VARCHAR(45) NOT NULL,
  `peinado` VARCHAR(45) NOT NULL,
  `idCliente` INT NOT NULL,
  PRIMARY KEY (`idServicio`),
  INDEX `idCliente_idx` (`idCliente` ASC) VISIBLE,
  CONSTRAINT `idCliente`
    FOREIGN KEY (`idCliente`)
    REFERENCES `peluqueria`.`cliente` (`idCliente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `peluqueria`.`productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peluqueria`.`productos` (
  `idproductos` INT NOT NULL AUTO_INCREMENT,
  `tintura` VARCHAR(45) NOT NULL,
  `oxidante` VARCHAR(45) NOT NULL,
  `crema` VARCHAR(45) NOT NULL,
  `champu` VARCHAR(45) NOT NULL,
  `decolorante` VARCHAR(45) NOT NULL,
  `protector` VARCHAR(45) NOT NULL,
  `brillo` VARCHAR(45) NOT NULL,
  `horquillas` VARCHAR(45) NOT NULL,
  `aceite` VARCHAR(45) NOT NULL,
  `reparador` VARCHAR(45) NOT NULL,
  `idServicio` INT NOT NULL,
  PRIMARY KEY (`idproductos`),
  INDEX `idServicio_idx` (`idServicio` ASC) VISIBLE,
  CONSTRAINT `idServicio`
    FOREIGN KEY (`idServicio`)
    REFERENCES `peluqueria`.`servicio` (`idServicio`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
