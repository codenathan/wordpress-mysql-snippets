/*
  A simple command for updating wordpress urls when moving websites
*/

/* REPLACE THE THREE BELOW  @prefix (if different from default) , @oldurl , @newurl */

SET @prefix = "wp";
SET @oldurl = "http://oldurl";
SET @newurl = 'http://newurl';


/* That's all, stop editing! Happy WP. */

SET @options_table = CONCAT(@prefix,'_options');
SET @posts_table = CONCAT(@prefix,'_posts');
SET @postmeta_table = CONCAT(@prefix,'_postmeta');

SET @prepare_update_options = CONCAT("UPDATE ",@options_table," SET option_value = replace(option_value, '",@oldurl,"', '",@newurl,"') WHERE option_name = 'home' OR option_name = 'siteurl';");
SET @prepare_update_posts_guid = CONCAT("UPDATE ",@posts_table," SET guid = replace(guid, '",@oldurl,"','",@newurl,"');");
SET @prepare_update_posts_content = CONCAT("UPDATE ",@posts_table," SET post_content = replace(post_content, '",@oldurl,"', '",@newurl,"');");
SET @prepare_update_postsmeta = CONCAT("UPDATE ",@postmeta_table," SET meta_value = replace(meta_value, '",@oldurl,"', '",@newurl,"');");


PREPARE stmt1 FROM @prepare_update_options; 
EXECUTE stmt1; 
DEALLOCATE PREPARE stmt1;

PREPARE stmt2 FROM @prepare_update_posts_guid; 
EXECUTE stmt2; 
DEALLOCATE PREPARE stmt2;


PREPARE stmt3 FROM @prepare_update_posts_content; 
EXECUTE stmt3; 
DEALLOCATE PREPARE stmt3;


PREPARE stmt4 FROM @prepare_update_postsmeta; 
EXECUTE stmt4; 
DEALLOCATE PREPARE stmt4;
