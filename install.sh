#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

clear

echo "  _____  _                       _   _           _   "
echo " |  __ \(_)                     | | | |         | |  "
echo " | |  | |_ ___  ___ ___  _ __ __| | | |__   ___ | |_ "
echo " | |  | | / __|/ __/ _ \| '__/ _  | | '_ \ / _ \| __|"
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