#!/bin/bash

# Colors for output
NORMAL="\\033[0;39m"
GREEN="\\033[1;32m"
RED="\\033[1;31m"
BLUE="\\033[1;34m"
ORANGE="\\033[1;33m"

echo -e "${BLUE}=== OpenVPN Auto-Start Setup ===${NORMAL}"

# Check if service already exists and is running
if systemctl is-active --quiet visualweber-vpn; then
    echo -e "${GREEN}OpenVPN auto-start is already setup and running!${NORMAL}"
    echo -e "${BLUE}You can check the status with:${NORMAL}"
    echo -e "${ORANGE}sudo systemctl status visualweber-vpn${NORMAL}"
    exit 0
fi

# Check if OpenVPN is installed
if ! command -v openvpn &> /dev/null; then
    echo -e "${ORANGE}Installing OpenVPN...${NORMAL}"
    sudo apt update
    sudo apt install -y openvpn
fi

# Create service file
echo -e "${BLUE}Creating systemd service...${NORMAL}"
SERVICE_FILE="/etc/systemd/system/visualweber-vpn.service"

# Create service content
sudo tee $SERVICE_FILE > /dev/null << EOF
[Unit]
Description=VisualWeber VPN Connection
After=network.target

[Service]
Type=simple
ExecStart=/bin/bash $HOME/PHH/mybash/run/openvpn.sh
Restart=on-failure
RestartSec=5
User=$USER

[Install]
WantedBy=multi-user.target
EOF

# Setup log file
sudo touch /var/log/visualweber-vpn.log
sudo chown $USER:$USER /var/log/visualweber-vpn.log

# Check for config files
if [ ! -f "$HOME/VisualWeber_IP150.ovpn" ] || [ ! -f "$HOME/openvpn_login.conf" ]; then
    echo -e "${RED}Error: VPN config files not found${NORMAL}"
    echo -e "${ORANGE}Please place these files in your home directory:${NORMAL}"
    echo -e "1. VisualWeber_IP150.ovpn"
    echo -e "2. openvpn_login.conf"
    exit 1
fi

# Enable and start service
echo -e "${GREEN}Enabling and starting VPN service...${NORMAL}"
sudo systemctl daemon-reload
sudo systemctl enable visualweber-vpn
sudo systemctl start visualweber-vpn

echo -e "${GREEN}OpenVPN auto-start setup completed!${NORMAL}"
echo -e "${BLUE}You can check the status with:${NORMAL}"
echo -e "${ORANGE}sudo systemctl status visualweber-vpn${NORMAL}"
echo -e "${BLUE}View logs with:${NORMAL}"
echo -e "${ORANGE}tail -f /var/log/visualweber-vpn.log${NORMAL}"
