SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema 3810_Business_Project
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema 3810_Business_Project
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `3810_Business_Project` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema new_schema1
-- -----------------------------------------------------
USE `3810_Business_Project` ;

-- -----------------------------------------------------
-- Table `3810_Business_Project`.`company`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `3810_Business_Project`.`company` (
  `Company_Id` INT NOT NULL,
  `Company_Name` VARCHAR(45) NULL,
  PRIMARY KEY (`Company_Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `3810_Business_Project`.`accounts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `3810_Business_Project`.`accounts` (
  `Account_Num` INT NOT NULL,
  `Company_Id` INT NULL,
  `Account_Bal` DOUBLE NULL,
  PRIMARY KEY (`Account_Num`),
  INDEX `Company_Id_idx` (`Company_Id` ASC) VISIBLE,
  CONSTRAINT `Company_Id`
    FOREIGN KEY (`Company_Id`)
    REFERENCES `3810_Business_Project`.`company` (`Company_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `3810_Business_Project`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `3810_Business_Project`.`users` (
  `User_Id` INT NOT NULL,
  `User_Name` VARCHAR(45) NULL,
  `Company_Id` INT NULL,
  `Account_Num` INT NULL,
  `Admin` TINYINT NULL,
  `Phone_Num` INT NULL,
  `Email` VARCHAR(45) NULL,
  PRIMARY KEY (`User_Id`),
  INDEX `Company_Id_idx` (`Company_Id` ASC) VISIBLE,
  INDEX `Account_Num_idx` (`Account_Num` ASC) VISIBLE,
  CONSTRAINT `Company_Id_FK`
    FOREIGN KEY (`Company_Id`)
    REFERENCES `3810_Business_Project`.`company` (`Company_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Account_Num_FK`
    FOREIGN KEY (`Account_Num`)
    REFERENCES `3810_Business_Project`.`accounts` (`Account_Num`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `3810_Business_Project`.`invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `3810_Business_Project`.`invoices` (
  `Invoice_Num` INT NOT NULL,
  `Account_Num` INT NULL,
  `User_Id` INT NULL,
  `Inv_Charge` DECIMAL NULL,
  PRIMARY KEY (`Invoice_Num`),
  INDEX `Account_Num_idx` (`Account_Num` ASC) VISIBLE,
  INDEX `User_Id_idx` (`User_Id` ASC) VISIBLE,
  CONSTRAINT `Account_Num`
    FOREIGN KEY (`Account_Num`)
    REFERENCES `3810_Business_Project`.`accounts` (`Account_Num`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `User_Id`
    FOREIGN KEY (`User_Id`)
    REFERENCES `3810_Business_Project`.`users` (`User_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `3810_Business_Project`.`timestamps`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `3810_Business_Project`.`timestamps` (
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` TIMESTAMP NULL);


-- -----------------------------------------------------
-- Table `3810_Business_Project`.`invoice_line`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `3810_Business_Project`.`invoice_line` (
  `Line_ID` INT NULL,
  `Invoice_Num` INT NULL,
  `Quantity` INT NULL,
  `Price` DOUBLE NULL,
  CONSTRAINT `Invoice_Num`
    FOREIGN KEY (`Invoice_Num`)
    REFERENCES `3810_Business_Project`.`invoices` (`Invoice_Num`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `3810_Business_Project`.`outstanding_balance`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `3810_Business_Project`.`outstanding_balance` (
  `Account_Num` INT NOT NULL,
  INDEX `outstanding_balance_FK_idx` (`Account_Num` ASC) VISIBLE,
  CONSTRAINT `outstanding_balance_FK`
    FOREIGN KEY (`Account_Num`)
    REFERENCES `3810_Business_Project`.`accounts` (`Account_Num`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `3810_Business_Project`.`payments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `3810_Business_Project`.`payments` (
  `Payment_Id` INT NOT NULL,
  `Account_Num` INT NULL,
  `User_Id` INT NULL,
  PRIMARY KEY (`Payment_Id`),
  INDEX `Account_Num_FK_idx` (`Account_Num` ASC) VISIBLE,
  INDEX `User_Id_FK_idx` (`User_Id` ASC) VISIBLE,
  CONSTRAINT `Account_Num_FK`
    FOREIGN KEY (`Account_Num`)
    REFERENCES `3810_Business_Project`.`accounts` (`Account_Num`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `User_Id_FK`
    FOREIGN KEY (`User_Id`)
    REFERENCES `3810_Business_Project`.`users` (`User_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

