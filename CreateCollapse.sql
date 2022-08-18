-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Lab03
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema lab03_shr
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema Collapse
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Collapse
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Collapse` ;
USE `Collapse` ;

-- -----------------------------------------------------
-- Table `Collapse`.`Invoice_FactTable`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Collapse`.`Invoice_FactTable` (
  `Customer_SK` INT NOT NULL,
  `Product_SK` INT NOT NULL,
  `SaleDate_SK` INT NOT NULL,
  `Gross_Profit` DECIMAL(10,2) NULL,
  `Cost` DECIMAL(10,2) NULL,
  `Sales` DECIMAL(10,2) NULL,
  `Quantity` INT NULL,
  `Name` VARCHAR(100) NULL,
  `State` VARCHAR(45) NULL,
  `Sale_Calendar_Year` INT NULL,
  `Sale_Calendar_Qtr` INT NULL,
  `Sale_Fiscal_Year` INT NULL,
  `Sale_Fiscal_Qtr` INT NULL,
  `ProdDesc` VARCHAR(45) NULL,
  `Price1` INT NULL,
  `Price2` INT NULL,
  `UnitCost` INT NULL,
  `BusinessName` VARCHAR(45) NULL,
  `Discounted` TINYINT NULL,
  PRIMARY KEY (`Customer_SK`, `Product_SK`, `SaleDate_SK`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
