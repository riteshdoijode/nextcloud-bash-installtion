#!/bin/bash

# Stop Apache server
echo "Stopping Apache server..."
sudo systemctl stop apache2

# Disable Apache service
echo "Disabling Apache server..."
sudo systemctl disable apache2

# Remove Nextcloud files
echo "Removing Nextcloud files..."
sudo rm -rf /var/www/nextcloud

# Remove Apache configuration for Nextcloud
echo "Removing Apache configuration..."
sudo rm -f /etc/apache2/sites-available/nextcloud.conf
sudo a2dissite nextcloud.conf

# Remove Apache modules (optional, if no longer needed)
echo "Disabling Apache modules..."
sudo a2dismod rewrite headers env dir mime

# Remove Apache and PHP packages
echo "Removing Apache, PHP, and related packages..."
sudo apt-get purge -y apache2 libapache2-mod-php php php-gd php-json php-mysql php-curl php-mbstring php-xml php-zip php-bz2 php-intl

# Remove MariaDB and database setup
echo "Removing MariaDB and cleaning up databases..."
sudo apt-get purge -y mariadb-server mariadb-client
sudo apt-get autoremove -y
sudo apt-get clean

# Remove Nextcloud user and group (if any)
echo "Removing Nextcloud database and user..."
sudo mysql -e "DROP DATABASE IF EXISTS nextcloud;"
sudo mysql -e "DROP USER IF EXISTS 'nextclouduser'@'localhost';"
sudo mysql -e "FLUSH PRIVILEGES;"

# Remove any leftover logs and config files
echo "Cleaning up residual config and log files..."
sudo rm -rf /var/log/apache2
sudo rm -rf /etc/apache2

# Clean up remaining dependencies
echo "Removing unnecessary dependencies..."
sudo apt-get autoremove -y

# Final message
echo "Uninstallation complete!"
