#!/bin/bash

set -e  # Exit on any error

echo "🧹 Removing existing Apache, PHP, and Nextcloud..."
sudo systemctl stop apache2

# Remove Apache, PHP, Nextcloud
sudo apt remove --purge -y apache2 php* libapache2-mod-php* 
sudo apt autoremove --purge -y
sudo apt autoclean

# Remove old Nextcloud files
sudo rm -rf /var/www/html/nextcloud
sudo rm -rf /var/www/html/index.html
sudo rm -rf /etc/apache2
sudo rm -rf /etc/php

echo "✅ Clean uninstall complete."

echo "🔧 Adding PHP 8.2 Sury Repo..."
sudo apt install -y ca-certificates apt-transport-https software-properties-common curl gnupg lsb-release

# Add the Sury PHP PPA GPG key and repo
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://packages.sury.org/php/apt.gpg | gpg --dearmor | sudo tee /etc/apt/keyrings/sury-php.gpg > /dev/null
echo "deb [signed-by=/etc/apt/keyrings/sury-php.gpg] https://packages.sury.org/php/ $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/php.list

sudo apt update

echo "⬇️ Installing Apache and PHP 8.2 with modules..."
sudo apt install -y apache2 php8.2 libapache2-mod-php8.2 php8.2-{cli,gd,curl,mbstring,xml,zip,intl,bcmath,gmp,imagick,apcu,redis,sqlite3,common,opcache}

echo "✅ Apache and PHP installed."

echo "🔧 Configuring Apache..."
sudo a2enmod php8.2
sudo systemctl restart apache2

# Optionally download and extract Nextcloud
echo "📦 Downloading latest Nextcloud..."
cd /tmp
wget https://download.nextcloud.com/server/releases/latest.zip
unzip latest.zip
sudo mv nextcloud /var/www/html/

# Set permissions
echo "🔒 Setting permissions..."
sudo chown -R www-data:www-data /var/www/html/nextcloud
sudo find /var/www/html/nextcloud -type d -exec chmod 755 {} \;
sudo find /var/www/html/nextcloud -type f -exec chmod 644 {} \;

echo "✅ Nextcloud is ready at http://<your-device-ip>/nextcloud"
echo "🌟 You can now open it in your browser to finish the setup!"
