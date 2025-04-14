# Nextcloud-Bash-Installtion
By running this bash file your linux system you can install Apache + PHP 8.2 + Nextcloud setup.


# 🚀 Nextcloud Auto-Setup for Raspberry Pi (PHP 8.2 + Apache2)

This repository contains a bash script that **completely uninstalls** any existing Apache, PHP, or Nextcloud setup on your Raspberry Pi and then **installs a fresh, clean Nextcloud instance** with **PHP 8.2** and **Apache2**.

> ✅ Tested on Raspberry Pi OS (Debian Bullseye)

## 📦 What this script does

- Stops and uninstalls Apache2, PHP (all versions), and removes any old Nextcloud files
- Cleans up residual config files
- Adds the [Sury PHP Repository](https://deb.sury.org/) to get newer PHP versions
- Installs PHP 8.2 along with all required Nextcloud modules
- Installs Apache2 and enables PHP 8.2 module
- Downloads the latest Nextcloud release
- Sets correct permissions for web access
- Prepares your Raspberry Pi to access Nextcloud at `http://<your-local-ip>/nextcloud`

## 🚀 How to Use

1. Clone this repo:
   ```bash
   git clone https://github.com/yourusername/nextcloud-raspberrypi-setup.git
   cd nextcloud-raspberrypi-setup
   ```

2. Make the script executable:
   ```bash
   chmod +x setup-nextcloud-clean.sh
   ```

3. Run the script:
   ```bash
   ./setup-nextcloud-clean.sh
   ```

4. Open your browser and visit:
   ```
   http://<your-device-ip>/nextcloud
   ```

## 📋 Requirements

- Raspberry Pi running Debian-based OS (Bullseye or similar)
- Internet connection for downloading packages
- Optional: Static IP for easier access to Nextcloud

## 🔐 Security Notes

- This setup uses **SQLite** by default. For production use, it’s recommended to configure **MariaDB** or **PostgreSQL**.
- Make sure to set a secure password during Nextcloud web installation.
- You may want to install SSL (HTTPS) using Let's Encrypt (`certbot`) later.

## To Uninstall 
Download the uninstall_nextcloud.sh 

```bash
chmod +x uninstall_nextcloud.sh
```

```bash
 ./uninstall_nextcloud.sh
```

## 🧠 Credits

This script was written by [Ritesh Doijode](https://github.com/riteshdoijode) with assistance from [ChatGPT](https://chat.openai.com/) to automate local Raspberry Pi-based server setups.

---

## 🛠️ License

This project is licensed under the [MIT License](LICENSE).
```
