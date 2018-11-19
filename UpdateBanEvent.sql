use gibgab;

ALTER TABLE gibgab.ban_event 
DROP FOREIGN KEY fk_BanEvent_User1;

ALTER TABLE gibgab.ban_event 
DROP FOREIGN KEY fk_BanEvent_User2;

ALTER TABLE ban_event MODIFY fk_banner_id INT;

ALTER TABLE `ban_event`  
	ADD CONSTRAINT `fk_banner_id` 
	FOREIGN KEY (`fk_banner_id`) REFERENCES `user` (`pk_user_id`) ON DELETE SET NULL; 
    
ALTER TABLE `ban_event`  
	ADD CONSTRAINT `fk_banned_id` 
	FOREIGN KEY (`fk_banned_id`) REFERENCES `user` (`pk_user_id`) ON DELETE CASCADE; 