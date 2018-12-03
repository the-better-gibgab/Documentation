use gibgab;

ALTER TABLE comment_vote 
DROP FOREIGN KEY fk_Vote_User;

ALTER TABLE comment_vote  
DROP FOREIGN KEY fk_comment_id;

ALTER TABLE `comment_vote`  
	ADD CONSTRAINT `fk_author_id` 
	FOREIGN KEY (`fk_author_id`) REFERENCES `user` (`pk_user_id`) ON DELETE CASCADE; 
    
ALTER TABLE `comment_vote`  
	ADD CONSTRAINT `fk_comment_id` 
	FOREIGN KEY (`fk_comment_id`) REFERENCES `comment` (`pk_comment_id`) ON DELETE CASCADE; 
    
ALTER TABLE post_vote 
DROP FOREIGN KEY fk_Vote_User0;

ALTER TABLE post_vote  
DROP FOREIGN KEY fk_post_id;

ALTER TABLE `post_vote`  
	ADD CONSTRAINT `fk_author_id_post_vote` 
	FOREIGN KEY (`fk_author_id`) REFERENCES `user` (`pk_user_id`) ON DELETE CASCADE;
    
ALTER TABLE `post_vote`  
	ADD CONSTRAINT `fk_post_id` 
	FOREIGN KEY (`fk_post_id`) REFERENCES `post` (`pk_post_id`) ON DELETE CASCADE;

ALTER TABLE comment 
DROP FOREIGN KEY fk_Comment_Post1;

ALTER TABLE comment  
DROP FOREIGN KEY fk_Content_User1;

ALTER TABLE `comment`  
	ADD CONSTRAINT `fk_author_id_comment` 
	FOREIGN KEY (`fk_author_id`) REFERENCES `user` (`pk_user_id`) ON DELETE CASCADE;
    
ALTER TABLE `comment`  
	ADD CONSTRAINT `fk_post_id_comment` 
	FOREIGN KEY (`fk_post_id`) REFERENCES `post` (`pk_post_id`) ON DELETE CASCADE;
    
ALTER TABLE post 
DROP FOREIGN KEY fk_Content_Campus10;

ALTER TABLE post  
DROP FOREIGN KEY fk_Content_User10;

ALTER TABLE `post`  
	ADD CONSTRAINT `fk_author_id_post` 
	FOREIGN KEY (`fk_author_id`) REFERENCES `user` (`pk_user_id`) ON DELETE CASCADE;
    
ALTER TABLE `post`  
	ADD CONSTRAINT `fk_campus_id` 
	FOREIGN KEY (`fk_campus_id`) REFERENCES `campus` (`pk_campus_id`) ON DELETE CASCADE;

