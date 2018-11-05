CREATE TABLE IF NOT EXISTS `gibgab`.`verification` (
  `pk_verification_id` INT NOT NULL AUTO_INCREMENT,
  `token` VARCHAR(36) NOT NULL,
  `fk_user_id` INT NOT NULL,
  `expiration_date` DATETIME NULL,
  PRIMARY KEY (`pk_verification_id`),
  INDEX `fk_verification_User1_idx` (`fk_user_id` ASC),
  CONSTRAINT `fk_verification_User1`
    FOREIGN KEY (`fk_user_id`)
    REFERENCES `gibgab`.`user` (`pk_user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;