#!/bin/bash
mkdir /var/www/ && mkdir /var/www/html
cd /var/www/html && rm -rf * #the remove is in case volumes left something stored.
wp core download --allow-root
# change lines in wp-config.php file to connect with database
wp config create --dbname=$DB_NAME --dbuser=$MYSQL_ADMIN_USER --dbpass=$MYSQL_ROOT_PASSWORD2 --dbhost=container-mariadb --allow-root
wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
# creates a new user account.
wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root
# installs the Astra theme and activates it for the site. The --activate flag tells WP-CLI to make the theme the active theme for the site.
	#wp theme install astra --activate --allow-root
mkdir /run/php #-->this is extremely necessary
# starts the PHP-FPM service in the foreground. The -F flag tells PHP-FPM to run in the foreground, rather than as a daemon in the background.
/usr/sbin/php-fpm7.3 -F
#another option
#exec php-fpm7.3 --nodaemonize