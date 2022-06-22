#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

clear

echo "  _____  _                       _   _           _   "
echo " |  __ \(_)                     | | | |         | |  "
echo " | |  | |_ ___  ___ ___  _ __ __| | | |__   ___ | |_ "
echo " | |  | | / __|/ __/ _ \| '__/ _' | | '_ \ / _ \| __|"
echo " | |__| | \__ \ (_| (_) | | | (_| | | |_) | (_) | |_ "
echo " |_____/|_|___/\___\___/|_|  \__,_| |_.__/ \___/ \__|"
echo ""                                
echo "Script version 1 for V1 release"
echo "Welcome to discord bot installation script"
echo "This script will install the discord bot on your system"
echo "If you had a previous installation, it will be overwritten"
echo ""
echo "It will install the following packages:"
echo " - curl"
echo " - zip"
echo " - node.js 16.X"
echo " - npm"
echo " - npm-node-fetch"
echo " - npm-typescript (globally)"
echo " - npm-ts-node (globally)"
echo ""
echo "This script will create a service file in /etc/systemd/system/DiscordBot.service"
echo "The sourcecode can be found in /usr/local/DiscordBot/"
echo "It will create a folder /etc/DiscordBot/ where all the config files are linked to"
echo ""
read -p "-- Press Enter to continue --" </dev/tty

echo "Installing curl"
apt-get update > /dev/null
apt-get install curl -y &> /dev/null

echo "Getting node.js install script"
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash - &> /dev/null

echo "Installing node.js"
sudo apt-get install -y nodejs &> /dev/null

echo "Current node version:"
node --version

echo "Installing global npm packages"
npm install -g typescript &> /dev/null
npm install -g ts-node &> /dev/null

echo "Removing old discord bot folders"
rm -rf /tmp/V1-22-release.zip &> /dev/null
rm -rf /usr/local/DiscordBot &> /dev/null
rm -f /etc/systemd/system/DiscordBot.service &> /dev/null

echo "Getting source code and unzipping"
wget https://github.com/BakxY/DiscordApexBotJS/archive/refs/tags/V1-release.zip -P /tmp/ &> /dev/null
unzip /tmp/V1-release.zip -d /usr/local/ &> /dev/null
mv /usr/local/DiscordApexBotJS-1-release /usr/local/DiscordBot

echo "Getting service file"
wget https://raw.githubusercontent.com/BakxY/DiscordApexBotJSInstall/V1-release/DiscordBot.service -P /etc/systemd/system/ &> /dev/null

echo "Reloading systemd"
systemctl daemon-reload

echo "Starting DynDNSCloudflare"
systemctl start DynDNSCloudflare.service

echo "DynDNSCloudflare is now installed"
echo "Bye!"