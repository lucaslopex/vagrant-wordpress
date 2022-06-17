sudo -u www-data cp /opt/www/wordpress/wp-config-sample.php /opt/www/wordpress/wp-config.php
#alteracao de nome e senha de banco
www-data sed -i 's/database_name_here/wordpress/' /opt/www/wordpress/wp-config.php
sudo -u www-data sed -i 's/username_here/wordpress/' /opt/www/wordpress/wp-config.php
sudo -u www-data sed -i 's/password_here/Word@321#BD/' /opt/www/wordpress/wp-config.php