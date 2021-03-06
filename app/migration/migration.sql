-- MySQL Script generated by MySQL Workbench
-- dom 29 set 2019 03:00:00 -03
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema store
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema store
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `store` DEFAULT CHARACTER SET utf8 ;
USE `store` ;

-- -----------------------------------------------------
-- Table `store`.`tb_product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `store`.`tb_product` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 74
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `store`.`tb_price_product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `store`.`tb_price_product` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `tb_product_id` INT(11) NOT NULL,
  `price_purchase` DECIMAL(5,2) NOT NULL,
  `price_sale` DECIMAL(5,2) NOT NULL,
  `quantity` INT(11) NOT NULL,
  `status` TINYINT(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_tb_price_product_tb_product1`
    FOREIGN KEY (`tb_product_id`)
    REFERENCES `store`.`tb_product` (`id`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 15
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `store`.`tb_status_sale`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `store`.`tb_status_sale` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


INSERT INTO `tb_status_sale` (`id`, `name`) VALUES (1, 'active');

-- -----------------------------------------------------
-- Table `store`.`tb_type_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `store`.`tb_type_user` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;

INSERT INTO `tb_type_user` (`id`, `name`) VALUES (1, 'user');

-- -----------------------------------------------------
-- Table `store`.`tb_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `store`.`tb_user` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `tb_type_user_id` INT(11) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_tb_user_tb_type_user`
    FOREIGN KEY (`tb_type_user_id`)
    REFERENCES `store`.`tb_type_user` (`id`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `store`.`tb_sale`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `store`.`tb_sale` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `tb_status_sale_id` INT(11) NOT NULL,
  `tb_user_id` INT(11) NOT NULL,
  `date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_tb_sale_tb_status_sale1`
    FOREIGN KEY (`tb_status_sale_id`)
    REFERENCES `store`.`tb_status_sale` (`id`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_tb_sale_tb_user1`
    FOREIGN KEY (`tb_user_id`)
    REFERENCES `store`.`tb_user` (`id`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 14
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `store`.`tb_item_sale`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `store`.`tb_item_sale` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `tb_sale_id` INT(11) NOT NULL,
  `tb_price_product_id` INT(11) NOT NULL,
  `quantity` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_tb_item_sale_tb_price_product1`
    FOREIGN KEY (`tb_price_product_id`)
    REFERENCES `store`.`tb_price_product` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_tb_item_sale_tb_sale1`
    FOREIGN KEY (`tb_sale_id`)
    REFERENCES `store`.`tb_sale` (`id`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
