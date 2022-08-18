-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema FinalProj_Team1_724
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema FinalProj_Team1_724
-- -----------------------------------------------------
#Can change the name for convenience
CREATE SCHEMA IF NOT EXISTS `FinalProj_Team1_724` DEFAULT CHARACTER SET utf8;
-- -----------------------------------------------------
-- Schema FinalProj_Team1_724_shr
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema Collapse
-- -----------------------------------------------------
USE `FinalProj_Team1_724`;

-- -----------------------------------------------------
-- Table `FinalProj_Team1_724`.`Customer_Dim`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FinalProj_Team1_724`.`Customer_Dim` (
  `Customer_SK` INT NOT NULL AUTO_INCREMENT,
  `CustID` INT NULL,
  `Name` VARCHAR(100) NULL,
  `CustTypeID` VARCHAR(1) NULL,
  `TypeName` VARCHAR(45) NULL,
  `Addr1` VARCHAR(100) NULL,
  `Addr2` VARCHAR(100) NULL,
  `City` VARCHAR(45) NULL,
  `State` VARCHAR(45) NULL,
  `ZIP` VARCHAR(10) NULL,
  `Div` VARCHAR(5) NULL,
  PRIMARY KEY (`Customer_SK`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FinalProj_Team1_724`.`Supplier_Dim`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FinalProj_Team1_724`.`Supplier_Dim` (
  `Supplier_SK` INT NOT NULL AUTO_INCREMENT,
  `SupplierID` INT NULL,
  `Name` VARCHAR(45) NULL,
  `Address` VARCHAR(100) NULL,
  `City` VARCHAR(45) NULL,
  `State` VARCHAR(45) NULL,
  `Zip` VARCHAR(10) NULL,
  PRIMARY KEY (`Supplier_SK`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FinalProj_Team1_724`.`Product_Dim`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FinalProj_Team1_724`.`Product_Dim` (
  `Product_SK` INT NOT NULL AUTO_INCREMENT,
  `ProdID` INT NULL,
  `ProdDesc` VARCHAR(45) NULL,
  `Price1` INT NULL,
  `Price2` INT NULL,
  `UnitCost` INT NULL,
  `Supplier_Name` VARCHAR(45) NULL,
  `ProdTypeID` INT NULL,
  `BusinessName` VARCHAR(45) NULL,
  `Abbrev` VARCHAR(45) NULL,
  `BUID` VARCHAR(1) NULL,
  `TypeDesc` VARCHAR(45) NULL,
  `Address` VARCHAR(100) NULL,
  `City` VARCHAR(45) NULL,
  `State` VARCHAR(45) NULL,
  `ZIP` VARCHAR(10) NULL,
  `Div` VARCHAR(5) NULL,
  `Discounted` TINYINT NULL,
  PRIMARY KEY (`Product_SK`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FinalProj_Team1_724`.`Order_Date_Dim`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FinalProj_Team1_724`.`Order_Date_Dim` (
  `OrderDate_SK` INT NOT NULL AUTO_INCREMENT,
  `orderDate` DATE NULL,
  `Order_Calendar_Year` INT NULL,
  `Order_Calendar_Qtr` INT NULL,
  `Order_Calendar_Month` INT NULL,
  `Order_Calendar_Week` INT NULL,
  `Order_Date` INT NULL,
  `Order_Fiscal_Year` INT NULL,
  `Order_Fiscal_Qtr` INT NULL,
  `Order_Fiscal_Month` INT NULL,
  `Order_Fiscal_Week` INT NULL,
  PRIMARY KEY (`OrderDate_SK`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FinalProj_Team1_724`.`Sale_Date_Dim`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FinalProj_Team1_724`.`Sale_Date_Dim` (
  `SaleDate_SK` INT NOT NULL AUTO_INCREMENT,
  `salesDate` DATE NULL,
  `Sale_Calendar_Year` INT NULL,
  `Sale_Calendar_Qtr` INT NULL,
  `Sale_Calendar_Month` INT NULL,
  `Sale_Calendar_Week` INT NULL,
  `Sale_Date` INT NULL,
  `Sale_Fiscal_Year` INT NULL,
  `Sale_Fiscal_Qtr` INT NULL,
  `Sale_Fiscal_Month` INT NULL,
  `Sale_Fiscal_Week` INT NULL,
  PRIMARY KEY (`SaleDate_SK`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FinalProj_Team1_724`.`Payment_Method_JunkDim`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FinalProj_Team1_724`.`Payment_Method_JunkDim` (
  `Payment_Method_Junk_SK` INT NOT NULL AUTO_INCREMENT,
  `Order_Method` VARCHAR(45) NULL,
  `Ship_Method` VARCHAR(45) NULL,
  `Payment_Method` VARCHAR(45) NULL,
  PRIMARY KEY (`Payment_Method_Junk_SK`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FinalProj_Team1_724`.`Invoice_FactTable`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FinalProj_Team1_724`.`Invoice_FactTable` (
  `Customer_SK` INT NOT NULL,
  `Product_SK` INT NOT NULL,
  `Supplier_SK` INT NOT NULL,
  `OrderDate_SK` INT NOT NULL,
  `SaleDate_SK` INT NOT NULL,
  `Payment_Method_Junk_SK` INT NOT NULL,
  `Gross_Profit` DECIMAL(10,2) NULL,
  `Cost` DECIMAL(10,2) NULL,
  `Sales` DECIMAL(10,2) NULL,
  `Quantity` INT NULL,
  PRIMARY KEY (`Customer_SK`, `Product_SK`, `Supplier_SK`, `OrderDate_SK`, `SaleDate_SK`, `Payment_Method_Junk_SK`),
  INDEX `Product_SK_idx` (`Product_SK` ASC) VISIBLE,
  INDEX `Supplier_SK_idx` (`Supplier_SK` ASC) VISIBLE,
  INDEX `OrderDate_SK_idx` (`OrderDate_SK` ASC) VISIBLE,
  INDEX `SaleDate_SK_idx` (`SaleDate_SK` ASC) VISIBLE,
  INDEX `Order_ship_payment_junkdim_SK_idx` (`Payment_Method_Junk_SK` ASC) VISIBLE,
  CONSTRAINT `Customer_SK`
    FOREIGN KEY (`Customer_SK`)
    REFERENCES `FinalProj_Team1_724`.`Customer_Dim` (`Customer_SK`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Product_SK`
    FOREIGN KEY (`Product_SK`)
    REFERENCES `FinalProj_Team1_724`.`Product_Dim` (`Product_SK`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Supplier_SK`
    FOREIGN KEY (`Supplier_SK`)
    REFERENCES `FinalProj_Team1_724`.`Supplier_Dim` (`Supplier_SK`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `OrderDate_SK`
    FOREIGN KEY (`OrderDate_SK`)
    REFERENCES `FinalProj_Team1_724`.`Order_Date_Dim` (`OrderDate_SK`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `SaleDate_SK`
    FOREIGN KEY (`SaleDate_SK`)
    REFERENCES `FinalProj_Team1_724`.`Sale_Date_Dim` (`SaleDate_SK`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Payment_Method_Junk_SK`
    FOREIGN KEY (`Payment_Method_Junk_SK`)
    REFERENCES `FinalProj_Team1_724`.`Payment_Method_JunkDim` (`Payment_Method_Junk_SK`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
