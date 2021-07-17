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
-- Table `property_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `property_type` ;

CREATE TABLE IF NOT EXISTS `property_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `listing`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `listing` ;

CREATE TABLE IF NOT EXISTS `listing` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `price` DECIMAL(12,2) NULL,
  `square_feet` INT NULL,
  `bed_number` INT NULL,
  `bath_number` INT NULL,
  `property_crime_rate` DOUBLE NULL,
  `violent_crime_rate` DOUBLE NULL,
  `hoa_monthly_rate` DECIMAL(7,2) NULL,
  `created_on` DATETIME NOT NULL,
  `year_built` INT NOT NULL,
  `lot_size_sqft` INT NULL,
  `property_tax` DECIMAL(4,2) NULL,
  `parking_type` VARCHAR(45) NULL,
  `address_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `property_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_property_address1_idx` (`address_id` ASC),
  INDEX `fk_property_user1_idx` (`user_id` ASC),
  INDEX `fk_listing_property1_idx` (`property_id` ASC),
  CONSTRAINT `fk_property_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_property_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_listing_property1`
    FOREIGN KEY (`property_id`)
    REFERENCES `property_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `event`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `event` ;

CREATE TABLE IF NOT EXISTS `event` (
  `id` INT NOT NULL,
  `event_type` VARCHAR(45) NOT NULL,
  `event_date` DATE NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `favorite`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `favorite` ;

CREATE TABLE IF NOT EXISTS `favorite` (
  `listing_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`listing_id`, `user_id`),
  INDEX `fk_Property_has_User_User1_idx` (`user_id` ASC),
  INDEX `fk_Property_has_User_Property_idx` (`listing_id` ASC),
  CONSTRAINT `fk_Property_has_User_Property`
    FOREIGN KEY (`listing_id`)
    REFERENCES `listing` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Property_has_User_User1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `comment` ;

CREATE TABLE IF NOT EXISTS `comment` (
  `id` INT NOT NULL,
  `comment` VARCHAR(500) NULL,
  `comment_date` DATETIME NOT NULL,
  `user_id` INT NOT NULL,
  `listing_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_comments_user1_idx` (`user_id` ASC),
  INDEX `fk_comments_property1_idx` (`listing_id` ASC),
  CONSTRAINT `fk_comments_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comments_property1`
    FOREIGN KEY (`listing_id`)
    REFERENCES `listing` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `listing_event`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `listing_event` ;

CREATE TABLE IF NOT EXISTS `listing_event` (
  `listing_id` INT NOT NULL,
  `event_id` INT NOT NULL,
  PRIMARY KEY (`listing_id`, `event_id`),
  INDEX `fk_property_has_events_events1_idx` (`event_id` ASC),
  INDEX `fk_property_has_events_property1_idx` (`listing_id` ASC),
  CONSTRAINT `fk_property_has_events_property1`
    FOREIGN KEY (`listing_id`)
    REFERENCES `listing` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_property_has_events_events1`
    FOREIGN KEY (`event_id`)
    REFERENCES `event` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rating`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rating` ;

CREATE TABLE IF NOT EXISTS `rating` (
  `listing_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `rating` TINYINT NOT NULL,
  INDEX `fk_rating_listing1_idx` (`listing_id` ASC),
  INDEX `fk_rating_user1_idx` (`user_id` ASC),
  PRIMARY KEY (`listing_id`, `user_id`),
  CONSTRAINT `fk_rating_listing1`
    FOREIGN KEY (`listing_id`)
    REFERENCES `listing` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rating_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `listing_photo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `listing_photo` ;

CREATE TABLE IF NOT EXISTS `listing_photo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `img_url` VARCHAR(2000) NULL,
  `listing_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_listing_photo_listing1_idx` (`listing_id` ASC),
  CONSTRAINT `fk_listing_photo_listing1`
    FOREIGN KEY (`listing_id`)
    REFERENCES `listing` (`id`)
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
-- Data for table `address`
-- -----------------------------------------------------
START TRANSACTION;
USE `housereportdb`;
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state`, `postal_code`) VALUES (1, '595 N Gilpin St', NULL, 'Denver', 'Colorado', '80218');

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `housereportdb`;
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `email`) VALUES (1, 'admin', 'adminPassWord', 1, NULL, NULL, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `property_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `housereportdb`;
INSERT INTO `property_type` (`id`, `type`) VALUES (1, 'Two-Story House - with Basement');

COMMIT;


-- -----------------------------------------------------
-- Data for table `listing`
-- -----------------------------------------------------
START TRANSACTION;
USE `housereportdb`;
INSERT INTO `listing` (`id`, `price`, `square_feet`, `bed_number`, `bath_number`, `property_crime_rate`, `violent_crime_rate`, `hoa_monthly_rate`, `created_on`, `year_built`, `lot_size_sqft`, `property_tax`, `parking_type`, `address_id`, `user_id`, `property_id`) VALUES (1, 795000, 3438, 3, 3, 64.5, 47.3, 0.0, '2021-06-16 20:45:20', 1890, 3920, 0.6, '2-Car Garage', 1, 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `event`
-- -----------------------------------------------------
START TRANSACTION;
USE `housereportdb`;
INSERT INTO `event` (`id`, `event_type`, `event_date`) VALUES (1, 'Hail Storm', '2012-05-21');

COMMIT;


-- -----------------------------------------------------
-- Data for table `favorite`
-- -----------------------------------------------------
START TRANSACTION;
USE `housereportdb`;
INSERT INTO `favorite` (`listing_id`, `user_id`) VALUES (1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `housereportdb`;
INSERT INTO `comment` (`id`, `comment`, `comment_date`, `user_id`, `listing_id`) VALUES (1, '6th avenue nearby has a lot of sketchballs walking around', '2021-06-16 20:46:55', 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `listing_event`
-- -----------------------------------------------------
START TRANSACTION;
USE `housereportdb`;
INSERT INTO `listing_event` (`listing_id`, `event_id`) VALUES (1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `rating`
-- -----------------------------------------------------
START TRANSACTION;
USE `housereportdb`;
INSERT INTO `rating` (`listing_id`, `user_id`, `rating`) VALUES (1, 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `listing_photo`
-- -----------------------------------------------------
START TRANSACTION;
USE `housereportdb`;
INSERT INTO `listing_photo` (`id`, `img_url`, `listing_id`) VALUES (1, 'https://www.zillow.com/homedetails/595-N-Gilpin-St-Denver-CO-80218/13345693_zpid/?mmlb=g,0', 1);

COMMIT;

