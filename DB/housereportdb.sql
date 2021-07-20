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
  `id` INT NOT NULL AUTO_INCREMENT,
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
  `id` INT NOT NULL AUTO_INCREMENT,
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
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state`, `postal_code`) VALUES (2, '811 E 98th Ave', '#505', 'Thornton', 'Colorado', '80229');
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state`, `postal_code`) VALUES (3, '4414 N Raleigh St', NULL, 'Dnver', 'Colorado', '80212');
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state`, `postal_code`) VALUES (4, '665 N Hooker St', NULL, 'Denver', 'Colorado', '80204');
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state`, `postal_code`) VALUES (5, '3065 N Gilpin St', NULL, 'Denver', 'Colorado', '80205');
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state`, `postal_code`) VALUES (6, '2549 Grape St', NULL, 'Denver', 'Colorado', '80207');
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state`, `postal_code`) VALUES (7, '3412 N Race St', NULL, 'Denver', 'Colorado', '80205');
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state`, `postal_code`) VALUES (8, '4211 E 69th Ave', NULL, 'Commerce City', 'Colorado', '80022');
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state`, `postal_code`) VALUES (9, '1409 E 21st St', NULL, 'Cheyenne', 'Wyoming', '82001');
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state`, `postal_code`) VALUES (10, '211 S Vennum St', NULL, 'Palisade', 'Nebraska', '69040');

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `housereportdb`;
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `email`) VALUES (1, 'admin', 'adminPassWord', 1, 'admin', 'Report', 'Guy', 'admin@housereport.com');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `email`) VALUES (2, 'giraffee', 'GeeRaff2', 1, 'user', 'Bob', 'Cobb', 'bcobb@yahoo.com');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `email`) VALUES (3, 'trifkin', 'Lloyd1972', 1, 'user', 'Todd', 'Rifkin', 'trifkin@gmail.com');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `email`) VALUES (4, 'JackieChiles', 'jc57298', 1, 'user', 'Jackie', 'Chiles', 'jchiles@gmail.com');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `email`) VALUES (5, 'dpuds', 'uhhhuhthatsright', 0, 'user', 'David ', 'Puddy', 'dpuddy@hotmail.com');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `email`) VALUES (6, 'mandelbaumRules', 'mandelbaum', 1, 'user', 'Izzy', 'Mandelbaum', 'imandelbaum@gmail.com');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `email`) VALUES (7, 'DrWhatley', 'antidentite', 1, 'user', 'Tim', 'Whatley', 'twhatley@gmail.com');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `email`) VALUES (8, 'LBraun', 'serenitynow', 1, 'user', 'Lloyd', 'Braun', 'lbraun@aol.com');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `email`) VALUES (9, 'SusanRoss', 'notthoseenvelopes', 1, 'user', 'Susan', 'Ross', 'sross@gmail.com');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `email`) VALUES (10, 'ovaltineLover', 'heyJerry!!!', 1, 'user', 'Kenny', 'Bania', 'kbania@gmail.com');

COMMIT;


-- -----------------------------------------------------
-- Data for table `property_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `housereportdb`;
INSERT INTO `property_type` (`id`, `type`) VALUES (1, 'Two-Story House - with Basement');
INSERT INTO `property_type` (`id`, `type`) VALUES (2, 'Condo');
INSERT INTO `property_type` (`id`, `type`) VALUES (3, 'Apartment');
INSERT INTO `property_type` (`id`, `type`) VALUES (4, 'Two-Story House - no Basement');
INSERT INTO `property_type` (`id`, `type`) VALUES (5, 'One Story House -with Basement');
INSERT INTO `property_type` (`id`, `type`) VALUES (6, 'One Story House - no Basement');

COMMIT;


-- -----------------------------------------------------
-- Data for table `listing`
-- -----------------------------------------------------
START TRANSACTION;
USE `housereportdb`;
INSERT INTO `listing` (`id`, `price`, `square_feet`, `bed_number`, `bath_number`, `property_crime_rate`, `violent_crime_rate`, `hoa_monthly_rate`, `created_on`, `year_built`, `lot_size_sqft`, `property_tax`, `parking_type`, `address_id`, `user_id`, `property_id`) VALUES (1, 795000, 3438, 3, 3, 64.5, 47.3, 0.0, '2021-06-16 20:45:20', 1890, 3920, 0.6, '2-Car Garage', 1, 1, 1);
INSERT INTO `listing` (`id`, `price`, `square_feet`, `bed_number`, `bath_number`, `property_crime_rate`, `violent_crime_rate`, `hoa_monthly_rate`, `created_on`, `year_built`, `lot_size_sqft`, `property_tax`, `parking_type`, `address_id`, `user_id`, `property_id`) VALUES (2, 424900, 2457, 3, 3, NULL, NULL, 285.00, '2021-06-18 11:11:41', 2020, 1862, 0.6, '2-Car Garage', 2, 2, 2);
INSERT INTO `listing` (`id`, `price`, `square_feet`, `bed_number`, `bath_number`, `property_crime_rate`, `violent_crime_rate`, `hoa_monthly_rate`, `created_on`, `year_built`, `lot_size_sqft`, `property_tax`, `parking_type`, `address_id`, `user_id`, `property_id`) VALUES (3, 684900, 1472, 2, 2, NULL, NULL, 0.0, '2021-06-18 11:29:21', 1946, 5000, 0.6, '2-Car Garage', 3, 3, 5);
INSERT INTO `listing` (`id`, `price`, `square_feet`, `bed_number`, `bath_number`, `property_crime_rate`, `violent_crime_rate`, `hoa_monthly_rate`, `created_on`, `year_built`, `lot_size_sqft`, `property_tax`, `parking_type`, `address_id`, `user_id`, `property_id`) VALUES (4, 359900, 805, 2, 1, NULL, NULL, 0.0, '2021-06-18 11:56:12', 1949, 6750, 0.6, 'Street Parking', 4, 7, 6);
INSERT INTO `listing` (`id`, `price`, `square_feet`, `bed_number`, `bath_number`, `property_crime_rate`, `violent_crime_rate`, `hoa_monthly_rate`, `created_on`, `year_built`, `lot_size_sqft`, `property_tax`, `parking_type`, `address_id`, `user_id`, `property_id`) VALUES (5, 575000, 1575, 3, 2, NULL, NULL, 0.0, '2021-06-18 12:22:18', 1891, 1880, 0.6, 'Street Parking', 5, 10, 4);
INSERT INTO `listing` (`id`, `price`, `square_feet`, `bed_number`, `bath_number`, `property_crime_rate`, `violent_crime_rate`, `hoa_monthly_rate`, `created_on`, `year_built`, `lot_size_sqft`, `property_tax`, `parking_type`, `address_id`, `user_id`, `property_id`) VALUES (6, 710000, 1822, 3, 2, NULL, NULL, 0.00, '2021-06-18 12:29:34', 1931, 4791, 0.6, '1-Car Garage', 6, 1, 5);
INSERT INTO `listing` (`id`, `price`, `square_feet`, `bed_number`, `bath_number`, `property_crime_rate`, `violent_crime_rate`, `hoa_monthly_rate`, `created_on`, `year_built`, `lot_size_sqft`, `property_tax`, `parking_type`, `address_id`, `user_id`, `property_id`) VALUES (7, 1050000, 3161, 5, 5, NULL, NULL, 0.0, '2021-06-18 12:36:12', 2015, 3500, 0.6, '2-Car Garage', 7, 1, 1);
INSERT INTO `listing` (`id`, `price`, `square_feet`, `bed_number`, `bath_number`, `property_crime_rate`, `violent_crime_rate`, `hoa_monthly_rate`, `created_on`, `year_built`, `lot_size_sqft`, `property_tax`, `parking_type`, `address_id`, `user_id`, `property_id`) VALUES (8, 299000, 1360, 3, 1, NULL, NULL, 0.0, '2021-06-18 12:44:15', 1955, 6098, 0.6, 'Street Parking', 8, 1, 5);
INSERT INTO `listing` (`id`, `price`, `square_feet`, `bed_number`, `bath_number`, `property_crime_rate`, `violent_crime_rate`, `hoa_monthly_rate`, `created_on`, `year_built`, `lot_size_sqft`, `property_tax`, `parking_type`, `address_id`, `user_id`, `property_id`) VALUES (9, 300000, 2210, 4, 2, NULL, NULL, 0.0, '2021-06-18 12:50:14', 1912, 6534, 0.58, 'Street Parking', 9, 6, 5);
INSERT INTO `listing` (`id`, `price`, `square_feet`, `bed_number`, `bath_number`, `property_crime_rate`, `violent_crime_rate`, `hoa_monthly_rate`, `created_on`, `year_built`, `lot_size_sqft`, `property_tax`, `parking_type`, `address_id`, `user_id`, `property_id`) VALUES (10, 75000, 822, 2, 1, NULL, NULL, 0.0, '2021-06-18 12:56:43', 1910, 10890, 1.61, '3-Car Garage', 10, 8, 6);

COMMIT;


-- -----------------------------------------------------
-- Data for table `event`
-- -----------------------------------------------------
START TRANSACTION;
USE `housereportdb`;
INSERT INTO `event` (`id`, `event_type`, `event_date`) VALUES (1, 'Hail Storm', '2012-05-21');
INSERT INTO `event` (`id`, `event_type`, `event_date`) VALUES (2, 'Tornado', '2019-10-01');
INSERT INTO `event` (`id`, `event_type`, `event_date`) VALUES (3, 'Meth Lab Explosion', '2020-12-25');
INSERT INTO `event` (`id`, `event_type`, `event_date`) VALUES (4, 'Shooting', '2018-10-12');
INSERT INTO `event` (`id`, `event_type`, `event_date`) VALUES (5, 'Shooting', '2017-04-10');
INSERT INTO `event` (`id`, `event_type`, `event_date`) VALUES (6, 'Shooting', '2019-07-15');
INSERT INTO `event` (`id`, `event_type`, `event_date`) VALUES (7, 'Tree Falls on House', '2020-11-11');
INSERT INTO `event` (`id`, `event_type`, `event_date`) VALUES (8, 'Tree Falls on House', '2021-04-30');
INSERT INTO `event` (`id`, `event_type`, `event_date`) VALUES (9, 'Fire', '2020-12-20');
INSERT INTO `event` (`id`, `event_type`, `event_date`) VALUES (10, 'Flood', '2001-05-16');

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
INSERT INTO `comment` (`id`, `comment`, `comment_date`, `user_id`, `listing_id`) VALUES (2, 'Musicians live next door', '2021-06-18 11:43:00', 9, 2);
INSERT INTO `comment` (`id`, `comment`, `comment_date`, `user_id`, `listing_id`) VALUES (3, 'Used to live nearby. Great neighborhood!', '2021-06-18 12:00:23', 2, 3);
INSERT INTO `comment` (`id`, `comment`, `comment_date`, `user_id`, `listing_id`) VALUES (4, 'Pretty sure the old owner got evicted for an illegal giraffe ring', '2021-06-18 12:48:13', 6, 8);

COMMIT;


-- -----------------------------------------------------
-- Data for table `listing_event`
-- -----------------------------------------------------
START TRANSACTION;
USE `housereportdb`;
INSERT INTO `listing_event` (`listing_id`, `event_id`) VALUES (1, 1);
INSERT INTO `listing_event` (`listing_id`, `event_id`) VALUES (4, 3);
INSERT INTO `listing_event` (`listing_id`, `event_id`) VALUES (8, 2);

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
INSERT INTO `listing_photo` (`id`, `img_url`, `listing_id`) VALUES (2, 'https://photos.zillowstatic.com/fp/1762b26447b09ee65cdb31f88e3d04bf-uncropped_scaled_within_1536_1152.webp', 1);
INSERT INTO `listing_photo` (`id`, `img_url`, `listing_id`) VALUES (3, 'https://photos.zillowstatic.com/fp/54daeca06f7cee5578a29669e187bfd8-uncropped_scaled_within_1536_1152.webp', 1);
INSERT INTO `listing_photo` (`id`, `img_url`, `listing_id`) VALUES (4, 'https://photos.zillowstatic.com/fp/5582c4e111b8f69ef3e2d10658ae4e12-uncropped_scaled_within_1536_1152.webp', 1);
INSERT INTO `listing_photo` (`id`, `img_url`, `listing_id`) VALUES (5, 'https://photos.zillowstatic.com/fp/d33cd7c6c2b48808991c14a64af4a52f-uncropped_scaled_within_1536_1152.webp', 1);
INSERT INTO `listing_photo` (`id`, `img_url`, `listing_id`) VALUES (6, 'https://photos.zillowstatic.com/fp/9d98af1126ff2887807c329b969c5372-uncropped_scaled_within_1536_1152.webp', 2);
INSERT INTO `listing_photo` (`id`, `img_url`, `listing_id`) VALUES (7, 'https://photos.zillowstatic.com/fp/1abf1b9052be33025f904697c033c05f-uncropped_scaled_within_1536_1152.webp', 2);
INSERT INTO `listing_photo` (`id`, `img_url`, `listing_id`) VALUES (8, 'https://photos.zillowstatic.com/fp/953fd80a5686ce51359a12cba5487692-uncropped_scaled_within_1536_1152.webp', 2);
INSERT INTO `listing_photo` (`id`, `img_url`, `listing_id`) VALUES (9, 'https://photos.zillowstatic.com/fp/3ea792605b90abc549c37d9993501bc7-uncropped_scaled_within_1536_1152.webp', 2);
INSERT INTO `listing_photo` (`id`, `img_url`, `listing_id`) VALUES (10, 'https://photos.zillowstatic.com/fp/f69e74f2b480f851a3bb42b2e9bfc9de-uncropped_scaled_within_1536_1152.webp', 2);
INSERT INTO `listing_photo` (`id`, `img_url`, `listing_id`) VALUES (11, 'https://photos.zillowstatic.com/fp/dd85ad4db3925b4a3007b0c15bd6b400-uncropped_scaled_within_1536_1152.webp', 3);
INSERT INTO `listing_photo` (`id`, `img_url`, `listing_id`) VALUES (12, 'https://photos.zillowstatic.com/fp/235dbd573bc94846c3ed725b266485c5-uncropped_scaled_within_1536_1152.webp', 3);
INSERT INTO `listing_photo` (`id`, `img_url`, `listing_id`) VALUES (13, 'https://photos.zillowstatic.com/fp/25e367820dd94aa13c0013b92bdfe4fe-uncropped_scaled_within_1536_1152.webp', 3);
INSERT INTO `listing_photo` (`id`, `img_url`, `listing_id`) VALUES (14, 'https://photos.zillowstatic.com/fp/4ffcb47e0405ce9eeca1e1da3cd8c6fa-uncropped_scaled_within_1536_1152.webp', 3);
INSERT INTO `listing_photo` (`id`, `img_url`, `listing_id`) VALUES (15, 'https://photos.zillowstatic.com/fp/923a427f428932dfe54bffe1b028aee1-uncropped_scaled_within_1536_1152.webp', 3);
INSERT INTO `listing_photo` (`id`, `img_url`, `listing_id`) VALUES (16, 'https://photos.zillowstatic.com/fp/66ca27bd45dc68cf9db6858a547cf6ec-uncropped_scaled_within_1536_1152.webp', 4);
INSERT INTO `listing_photo` (`id`, `img_url`, `listing_id`) VALUES (17, 'https://photos.zillowstatic.com/fp/3935b52cd2083b7bc93179b19f239d92-uncropped_scaled_within_1536_1152.webp', 4);
INSERT INTO `listing_photo` (`id`, `img_url`, `listing_id`) VALUES (18, 'https://photos.zillowstatic.com/fp/83f2a641ded7d0b7440f3ef0f8a57d61-uncropped_scaled_within_1536_1152.webp', 5);
INSERT INTO `listing_photo` (`id`, `img_url`, `listing_id`) VALUES (19, 'https://photos.zillowstatic.com/fp/6f5e9af5ac25c353977ecf10abf55897-uncropped_scaled_within_1536_1152.webp', 5);
INSERT INTO `listing_photo` (`id`, `img_url`, `listing_id`) VALUES (20, 'https://photos.zillowstatic.com/fp/989241411a298aee25746ad50d2c205d-uncropped_scaled_within_1536_1152.webp', 5);
INSERT INTO `listing_photo` (`id`, `img_url`, `listing_id`) VALUES (21, 'https://photos.zillowstatic.com/fp/f8593ec254a6e486ac701a20d4f626b1-uncropped_scaled_within_1536_1152.webp', 5);
INSERT INTO `listing_photo` (`id`, `img_url`, `listing_id`) VALUES (22, 'https://photos.zillowstatic.com/fp/22ffb243fc414b47019029572a4fd99b-uncropped_scaled_within_1536_1152.webp', 5);
INSERT INTO `listing_photo` (`id`, `img_url`, `listing_id`) VALUES (23, 'https://photos.zillowstatic.com/fp/d4a90d63264a562973aa0c74b933a1b2-uncropped_scaled_within_1536_1152.webp', 6);
INSERT INTO `listing_photo` (`id`, `img_url`, `listing_id`) VALUES (24, 'https://photos.zillowstatic.com/fp/ce7cc45349ef1021a2002dce5f054575-uncropped_scaled_within_1536_1152.webp', 6);
INSERT INTO `listing_photo` (`id`, `img_url`, `listing_id`) VALUES (25, 'https://photos.zillowstatic.com/fp/b7622bd3ccf1de374f1480bfebbf6076-uncropped_scaled_within_1536_1152.webp', 6);
INSERT INTO `listing_photo` (`id`, `img_url`, `listing_id`) VALUES (26, 'https://photos.zillowstatic.com/fp/d2462e005fb7ce0d074e95d0e2cdb7f7-uncropped_scaled_within_1536_1152.webp', 6);
INSERT INTO `listing_photo` (`id`, `img_url`, `listing_id`) VALUES (27, 'https://photos.zillowstatic.com/fp/66f686d6cf2d1943ac99acfa3ccb7022-uncropped_scaled_within_1536_1152.webp', 6);
INSERT INTO `listing_photo` (`id`, `img_url`, `listing_id`) VALUES (28, 'https://photos.zillowstatic.com/fp/2efad2cbbcf43e2145e9b50b99388c01-uncropped_scaled_within_1536_1152.webp', 7);
INSERT INTO `listing_photo` (`id`, `img_url`, `listing_id`) VALUES (29, 'https://photos.zillowstatic.com/fp/144d104fc0528954b08fa5d2654dafa2-uncropped_scaled_within_1536_1152.webp', 7);
INSERT INTO `listing_photo` (`id`, `img_url`, `listing_id`) VALUES (30, 'https://photos.zillowstatic.com/fp/a1a2cb6aeb92b33bc87ad42553fa9d93-uncropped_scaled_within_1536_1152.webp', 7);
INSERT INTO `listing_photo` (`id`, `img_url`, `listing_id`) VALUES (31, 'https://photos.zillowstatic.com/fp/a8e127e3544d9fa85405e67e526f3132-uncropped_scaled_within_1536_1152.webp', 7);
INSERT INTO `listing_photo` (`id`, `img_url`, `listing_id`) VALUES (32, 'https://photos.zillowstatic.com/fp/e1e64240f54ad49eed6483399ff00dd2-uncropped_scaled_within_1536_1152.webp', 7);
INSERT INTO `listing_photo` (`id`, `img_url`, `listing_id`) VALUES (33, 'https://photos.zillowstatic.com/fp/a8ce968e57db910a1712542d4c0c23d6-uncropped_scaled_within_1536_1152.webp', 8);
INSERT INTO `listing_photo` (`id`, `img_url`, `listing_id`) VALUES (34, 'https://photos.zillowstatic.com/fp/56b537a117e8a8fe3e2d9cac35e1f1f8-uncropped_scaled_within_1536_1152.webp', 8);
INSERT INTO `listing_photo` (`id`, `img_url`, `listing_id`) VALUES (35, 'https://photos.zillowstatic.com/fp/95797b545ead065b2dbd12a38fd17e28-uncropped_scaled_within_1536_1152.webp', 8);
INSERT INTO `listing_photo` (`id`, `img_url`, `listing_id`) VALUES (36, 'https://photos.zillowstatic.com/fp/015cfc5595e845794dc8829df05a4899-uncropped_scaled_within_1536_1152.webp', 8);
INSERT INTO `listing_photo` (`id`, `img_url`, `listing_id`) VALUES (37, 'https://photos.zillowstatic.com/fp/0ae7edf66d8fcee05b4a383e51b1fe4f-uncropped_scaled_within_1536_1152.webp', 8);
INSERT INTO `listing_photo` (`id`, `img_url`, `listing_id`) VALUES (38, 'https://photos.zillowstatic.com/fp/b625fb918010cbaa3b76b347fab19f2c-uncropped_scaled_within_1536_1152.webp', 9);
INSERT INTO `listing_photo` (`id`, `img_url`, `listing_id`) VALUES (39, 'https://photos.zillowstatic.com/fp/2b28c1272498f819c0ef1d764e14c302-uncropped_scaled_within_1536_1152.webp', 9);
INSERT INTO `listing_photo` (`id`, `img_url`, `listing_id`) VALUES (40, 'https://photos.zillowstatic.com/fp/a2f4284717e86a85958da71dd8eb3580-uncropped_scaled_within_1536_1152.webp', 9);
INSERT INTO `listing_photo` (`id`, `img_url`, `listing_id`) VALUES (41, 'https://photos.zillowstatic.com/fp/48b58c25d3496929a4d6d384be2fa674-uncropped_scaled_within_1536_1152.webp', 9);
INSERT INTO `listing_photo` (`id`, `img_url`, `listing_id`) VALUES (42, 'https://photos.zillowstatic.com/fp/83a8a3122ef2cd33b27c28c3e2623d5c-uncropped_scaled_within_1536_1152.webp', 9);
INSERT INTO `listing_photo` (`id`, `img_url`, `listing_id`) VALUES (43, 'https://photos.zillowstatic.com/fp/d6b8c52aa96a8f6997cf4140f34f7437-uncropped_scaled_within_1536_1152.webp', 10);
INSERT INTO `listing_photo` (`id`, `img_url`, `listing_id`) VALUES (44, 'https://photos.zillowstatic.com/fp/586a5b65fa4d1914bcf8efc9402c6ade-uncropped_scaled_within_1536_1152.webp', 10);
INSERT INTO `listing_photo` (`id`, `img_url`, `listing_id`) VALUES (45, 'https://photos.zillowstatic.com/fp/7c171fc06a5a93595a1357342e0c1de7-uncropped_scaled_within_1536_1152.webp', 10);
INSERT INTO `listing_photo` (`id`, `img_url`, `listing_id`) VALUES (46, 'https://photos.zillowstatic.com/fp/905c726bbf0a6b6099b355cd5dcba2b5-uncropped_scaled_within_1536_1152.webp', 10);
INSERT INTO `listing_photo` (`id`, `img_url`, `listing_id`) VALUES (47, 'https://photos.zillowstatic.com/fp/f3d4b3ac129ea2c2e3a7a77666df3317-uncropped_scaled_within_1536_1152.webp', 10);

COMMIT;

