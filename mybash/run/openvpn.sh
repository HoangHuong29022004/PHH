#!/bin/bash

# Author: NakamuraOS
# https://github.com/nakamuraos
# Latest update: 30/03/2022
# Tested on Navicat 15.x, 16.x on Linux
# Log file
LOG_FILE="/var/log/visualweber-vpn.log"
ENDCOLOR="\e[0m"
# Function to log messages
log_message() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | sudo tee -a $LOG_FILE
}
echo -e "======================================="
log_message "Starting VPN connection..."
echo -e "|                                     |"
# Check if config files exist
if [ ! -f "$HOME/VisualWeber_IP150.ovpn" ] || [ ! -f "$HOME/openvpn_login.conf" ]; then
    log_message "Error: VPN config files not found"
    exit 1
fi
echo "Open vpn is running..."
