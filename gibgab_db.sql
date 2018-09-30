-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Campus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Campus` (
  `pk_campus_id` INT NOT NULL AUTO_INCREMENT,
  `campus_name` VARCHAR(45) NULL,
  `latitude` DOUBLE NULL,
  `longitude` DOUBLE NULL,
  PRIMARY KEY (`pk_campus_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`User` (
  `pk_user_id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NULL,
  `username` VARCHAR(45) NULL,
  `is_moderator` TINYINT NULL,
  `password_hash` VARCHAR(45) NULL,
  `fk_campus_id` INT NOT NULL,
  PRIMARY KEY (`pk_user_id`),
  INDEX `fk_User_Campus1_idx` (`fk_campus_id` ASC),
  CONSTRAINT `fk_User_Campus1`
    FOREIGN KEY (`fk_campus_id`)
    REFERENCES `mydb`.`Campus` (`pk_campus_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Post`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Post` (
  `pk_post_id` INT NOT NULL AUTO_INCREMENT,
  `text` VARCHAR(300) NULL,
  `image` BLOB NULL,
  `author_name` VARCHAR(45) NULL,
  `latitude` DOUBLE NULL,
  `longitude` DOUBLE NULL,
  `fk_author_id` INT NOT NULL,
  `fk_campus_id` INT NOT NULL,
  PRIMARY KEY (`pk_post_id`),
  INDEX `fk_Content_User1_idx` (`fk_author_id` ASC),
  INDEX `fk_Content_Campus1_idx` (`fk_campus_id` ASC),
  CONSTRAINT `fk_Content_User10`
    FOREIGN KEY (`fk_author_id`)
    REFERENCES `mydb`.`User` (`pk_user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Content_Campus10`
    FOREIGN KEY (`fk_campus_id`)
    REFERENCES `mydb`.`Campus` (`pk_campus_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Comment` (
  `pk_comment_id` INT NOT NULL AUTO_INCREMENT,
  `text` VARCHAR(300) NULL,
  `author_name` VARCHAR(45) NULL,
  `latitude` DOUBLE NULL,
  `longitude` DOUBLE NULL,
  `fk_author_id` INT NOT NULL,
  `fk_post_id` INT NOT NULL,
  PRIMARY KEY (`pk_comment_id`),
  INDEX `fk_Content_User1_idx` (`fk_author_id` ASC),
  INDEX `fk_Comment_Post1_idx` (`fk_post_id` ASC),
  CONSTRAINT `fk_Content_User1`
    FOREIGN KEY (`fk_author_id`)
    REFERENCES `mydb`.`User` (`pk_user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comment_Post1`
    FOREIGN KEY (`fk_post_id`)
    REFERENCES `mydb`.`Post` (`pk_post_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CommentVote`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CommentVote` (
  `pk_comment_vote_id` INT NOT NULL AUTO_INCREMENT,
  `upvote` TINYINT NULL,
  `fk_author_id` INT NOT NULL,
  `fk_content_id` INT NOT NULL,
  PRIMARY KEY (`pk_comment_vote_id`),
  INDEX `fk_Vote_User_idx` (`fk_author_id` ASC),
  INDEX `fk_Vote_Content1_idx` (`fk_content_id` ASC),
  CONSTRAINT `fk_Vote_User`
    FOREIGN KEY (`fk_author_id`)
    REFERENCES `mydb`.`User` (`pk_user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vote_Content1`
    FOREIGN KEY (`fk_content_id`)
    REFERENCES `mydb`.`Comment` (`pk_comment_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`BanEvent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`BanEvent` (
  `pk_ban_event_id` INT NOT NULL AUTO_INCREMENT,
  `start_date` DATETIME NOT NULL,
  `end_date` DATETIME NOT NULL,
  `fk_banner_id` INT NOT NULL,
  `fk_banned_id` INT NOT NULL,
  PRIMARY KEY (`pk_ban_event_id`),
  INDEX `fk_BanEvent_User1_idx` (`fk_banner_id` ASC),
  INDEX `fk_BanEvent_User2_idx` (`fk_banned_id` ASC),
  CONSTRAINT `fk_BanEvent_User1`
    FOREIGN KEY (`fk_banner_id`)
    REFERENCES `mydb`.`User` (`pk_user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_BanEvent_User2`
    FOREIGN KEY (`fk_banned_id`)
    REFERENCES `mydb`.`User` (`pk_user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PostVote`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PostVote` (
  `pk_post_vote_id` INT NOT NULL AUTO_INCREMENT,
  `upvote` TINYINT NULL,
  `fk_author_id` INT NOT NULL,
  `pk_post_id` INT NOT NULL,
  PRIMARY KEY (`pk_post_vote_id`),
  INDEX `fk_Vote_User_idx` (`fk_author_id` ASC),
  INDEX `fk_PostVote_Post1_idx` (`pk_post_id` ASC),
  CONSTRAINT `fk_Vote_User0`
    FOREIGN KEY (`fk_author_id`)
    REFERENCES `mydb`.`User` (`pk_user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PostVote_Post1`
    FOREIGN KEY (`pk_post_id`)
    REFERENCES `mydb`.`Post` (`pk_post_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Username`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Username` (
  `pk_username_id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NULL,
  `fk_user_id` INT NOT NULL,
  `set_date` DATETIME NULL,
  PRIMARY KEY (`pk_username_id`),
  INDEX `fk_Usernames_User1_idx` (`fk_user_id` ASC),
  CONSTRAINT `fk_Usernames_User1`
    FOREIGN KEY (`fk_user_id`)
    REFERENCES `mydb`.`User` (`pk_user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
