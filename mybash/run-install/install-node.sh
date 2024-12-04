#!/bin/bash

# Colors for output
NORMAL="\\033[0;39m"
GREEN="\\033[1;32m"
RED="\\033[1;31m"
BLUE="\\033[1;34m"
ORANGE="\\033[1;33m"

echo -e "${BLUE}=== Node.js Installation Script ===${NORMAL}"

# Function to install Node.js
install_node() {
    local version=$1
    echo -e "${GREEN}Installing Node.js version $version...${NORMAL}"

    # Remove existing nodejs if exists
    sudo apt-get remove nodejs -y

    # Download and run NodeSource setup script
    curl -fsSL https://deb.nodesource.com/setup_$version.x | sudo -E bash -

    # Install Node.js
    sudo apt-get install -y nodejs

    # Install pnpm globally
    echo -e "${GREEN}Installing pnpm...${NORMAL}"
    npm install -g pnpm

    # Display versions
    echo -e "${BLUE}Installed versions:${NORMAL}"
    echo -e "Node.js: $(node -v)"
    echo -e "npm: $(npm -v)"
    echo -e "pnpm: $(pnpm -v)"
}

# Check if Node.js is already installed
if command -v node &> /dev/null; then
    echo -e "${GREEN}Node.js is already installed!${NORMAL}"
    echo -e "${BLUE}Node.js version: ${NORMAL}$(node -v)"
    exit 0
fi

# Display available versions
echo -e "${ORANGE}Available Node.js versions:${NORMAL}"
echo "1) Node.js 16"
echo "2) Node.js 18"
echo "3) Node.js 20"
echo "4) Node.js 21"
echo "5) Node.js 22"

# Get user choice
read -p "Select Node.js version (1-5): " choice

# Install based on choice
case $choice in
1)
    install_node 16
    ;;
2)
    install_node 18
    ;;
3)
    install_node 20
    ;;
4)
    install_node 21
    ;;
5)
    install_node 22
    ;;
*)
    echo -e "${RED}Invalid choice. Please select a number between 1 and 5.${NORMAL}"
    exit 1
    ;;
esac

echo -e "${GREEN}Installation completed successfully!${NORMAL}"
