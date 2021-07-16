-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema housereportdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `housereportdb` ;

-- -----------------------------------------------------
-- Schema housereportdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `housereportdb` DEFAULT CHARACTER SET utf8 ;
USE `housereportdb` ;

-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(45) NOT NULL,
  `street2` VARCHAR(45) NULL,
  `city` VARCHAR(45) NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  `postal_code` VARCHAR(10) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(200) NOT NULL,
  `enabled` TINYINT NOT NULL DEFAULT 1,
  `role` VARCHAR(45) NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `property`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `property` ;

CREATE TABLE IF NOT EXISTS `property` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `price` DOUBLE NULL,
  `square_feet` INT NULL,
  `bed_number` INT NULL,
  `bath_number` INT NULL,
  `property_type` VARCHAR(45) NULL,
  `crime_rate` DOUBLE NULL,
  `hoa_cost` DOUBLE NULL,
  `created_on` DATETIME NOT NULL,
  `year_built` INT NOT NULL,
  `lot_size` INT NULL,
  `property_tax` DOUBLE NULL,
  `parking_type` VARCHAR(45) NULL,
  `address_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_property_address1_idx` (`address_id` ASC),
  INDEX `fk_property_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_property_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_property_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `events`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `events` ;

CREATE TABLE IF NOT EXISTS `events` (
  `id` INT NOT NULL,
  `event_type` VARCHAR(45) NOT NULL,
  `event_date` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `property_likes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `property_likes` ;

CREATE TABLE IF NOT EXISTS `property_likes` (
  `Property_id` INT NOT NULL,
  `User_id` INT NOT NULL,
  `like_dislike` TINYINT NULL DEFAULT 0,
  PRIMARY KEY (`Property_id`, `User_id`),
  INDEX `fk_Property_has_User_User1_idx` (`User_id` ASC),
  INDEX `fk_Property_has_User_Property_idx` (`Property_id` ASC),
  CONSTRAINT `fk_Property_has_User_Property`
    FOREIGN KEY (`Property_id`)
    REFERENCES `property` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Property_has_User_User1`
    FOREIGN KEY (`User_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `comments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `comments` ;

CREATE TABLE IF NOT EXISTS `comments` (
  `id` INT NOT NULL,
  `comment` VARCHAR(500) NULL,
  `timestamp` DATETIME NOT NULL,
  `user_id` INT NOT NULL,
  `property_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_comments_user1_idx` (`user_id` ASC),
  INDEX `fk_comments_property1_idx` (`property_id` ASC),
  CONSTRAINT `fk_comments_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comments_property1`
    FOREIGN KEY (`property_id`)
    REFERENCES `property` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `property_has_events`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `property_has_events` ;

CREATE TABLE IF NOT EXISTS `property_has_events` (
  `property_id` INT NOT NULL,
  `events_id` INT NOT NULL,
  PRIMARY KEY (`property_id`, `events_id`),
  INDEX `fk_property_has_events_events1_idx` (`events_id` ASC),
  INDEX `fk_property_has_events_property1_idx` (`property_id` ASC),
  CONSTRAINT `fk_property_has_events_property1`
    FOREIGN KEY (`property_id`)
    REFERENCES `property` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_property_has_events_events1`
    FOREIGN KEY (`events_id`)
    REFERENCES `events` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS housereportuser@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'housereportuser'@'localhost' IDENTIFIED BY 'housereportuser';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'housereportuser'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `housereportdb`;
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `email`) VALUES (1, 'admin', 'adminPassWord', 1, NULL, NULL, NULL, NULL);

COMMIT;

