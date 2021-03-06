-- MySQL Script generated by MySQL Workbench
-- Sat Dec 18 20:57:29 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Sk_Libros
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Sk_Libros
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Sk_Libros` DEFAULT CHARACTER SET utf8 ;
USE `Sk_Libros` ;

-- -----------------------------------------------------
-- Table `Sk_Libros`.`Usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sk_Libros`.`Usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(20) NOT NULL,
  `apellido` VARCHAR(30) NOT NULL,
  `email` VARCHAR(30) NOT NULL,
  `contraseña` VARCHAR(60) NOT NULL,
  `imagen` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sk_Libros`.`Productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sk_Libros`.`Productos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `precio` INT NOT NULL,
  `descuento` INT NOT NULL,
  `imagen` VARCHAR(45) NOT NULL,
  `descripcion` LONGTEXT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sk_Libros`.`Usuarios_categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sk_Libros`.`Usuarios_categoria` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `usuarios_id`
    FOREIGN KEY (`id`)
    REFERENCES `Sk_Libros`.`Usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sk_Libros`.`Carrito_de_compras`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sk_Libros`.`Carrito_de_compras` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `precio_total` INT NOT NULL,
  `cantidad_items` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `usuario_id`
    FOREIGN KEY (`id`)
    REFERENCES `Sk_Libros`.`Usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sk_Libros`.`Productos_carrito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sk_Libros`.`Productos_carrito` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `producto` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `producto_id`
    FOREIGN KEY (`id`)
    REFERENCES `Sk_Libros`.`Productos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `carrito_id`
    FOREIGN KEY (`id`)
    REFERENCES `Sk_Libros`.`Carrito_de_compras` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sk_Libros`.`Generos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sk_Libros`.`Generos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
