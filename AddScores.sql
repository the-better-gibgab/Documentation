use gibgab;

ALTER TABLE comment ADD COLUMN score INT DEFAULT 0;
ALTER TABLE comment_vote CHANGE `fk_content_id` `fk_comment_id` INT;
ALTER TABLE comment_vote DROP FOREIGN KEY fk_Vote_Content1;
ALTER TABLE comment_vote 
	ADD CONSTRAINT fk_comment_id 
	FOREIGN KEY (`fk_comment_id`) REFERENCES `comment` (`pk_comment_id`) ON DELETE CASCADE; 

ALTER TABLE post ADD COLUMN score INT DEFAULT 0;
ALTER TABLE post_vote CHANGE `pk_post_id` `fk_post_id` INT;
ALTER TABLE post_vote DROP FOREIGN KEY fk_PostVote_Post1;
ALTER TABLE post_vote 
	ADD CONSTRAINT fk_post_id 
	FOREIGN KEY (`fk_post_id`) REFERENCES `post` (`pk_post_id`) ON DELETE CASCADE; 

DELIMITER $$ 
CREATE TRIGGER update_post_score 
AFTER INSERT ON post_vote
FOR EACH ROW
BEGIN
	IF NEW.upvote THEN
		UPDATE post SET score = score + 1 WHERE pk_post_id = NEW.fk_post_id;
    ELSE
		UPDATE post SET score = score - 1 WHERE pk_post_id = NEW.fk_post_id;
    END IF;
END $$    
DELIMITER ;

DELIMITER $$ 
CREATE TRIGGER update_comment_score 
AFTER INSERT ON comment_vote
FOR EACH ROW
BEGIN
	IF NEW.upvote THEN
		UPDATE comment SET score = score + 1 WHERE pk_comment_id = NEW.fk_comment_id;
    ELSE
		UPDATE comment SET score = score - 1 WHERE pk_comment_id = NEW.fk_comment_id;
    END IF;
END $$    
DELIMITER ;