#!/bin/bash

# Colors for output
NORMAL="\\033[0;39m"
GREEN="\\033[1;32m"
RED="\\033[1;31m"
BLUE="\\033[1;34m"
ORANGE="\\033[1;33m"

# Store the original directory
MYBASH_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Setup permissions for all scripts
find "$MYBASH_DIR" -type f -name "*.sh" -exec chmod +x {} \;

# Function to manage services
manage_services() {
    while true; do
        echo -e "${BLUE}=== Service Management ===${NORMAL}"
        echo -e "${GREEN}[1]${NORMAL} Restart Nginx"
        echo -e "${GREEN}[2]${NORMAL} Start PHP-FPM"
        echo -e "${GREEN}[3]${NORMAL} Restart All Services"
        echo -e "${GREEN}[4]${NORMAL} Check Services Status"
        echo -e "${ORANGE}[b]${NORMAL} Back to main menu"
        
        read -p "Please enter your choice: " SERVICE_CHOICE
        
        case $SERVICE_CHOICE in
            1)
                echo -e "${ORANGE}Restarting Nginx...${NORMAL}"
                sudo service nginx restart
                ;;
            2)
                echo -e "${BLUE}Available PHP versions:${NORMAL}"
                ls /usr/sbin/php-fpm* | grep -o 'php-fpm[0-9.]*' | sort
                read -p "Enter PHP version (e.g., 8.2): " PHP_VERSION
                if [ -f "/usr/sbin/php-fpm$PHP_VERSION" ]; then
                    echo -e "${ORANGE}Starting PHP-FPM $PHP_VERSION...${NORMAL}"
                    sudo mkdir -p /run/php
                    sudo killall php-fpm$PHP_VERSION 2>/dev/null
                    sudo php-fpm$PHP_VERSION
                else
                    echo -e "${RED}PHP-FPM version $PHP_VERSION not found!${NORMAL}"
                fi
                ;;
            3)
                echo -e "${ORANGE}Restarting all services...${NORMAL}"
                read -p "Enter PHP version (e.g., 8.2): " PHP_VERSION
                if [ -f "/usr/sbin/php-fpm$PHP_VERSION" ]; then
                    sudo mkdir -p /run/php
                    sudo killall php-fpm$PHP_VERSION 2>/dev/null
                    sudo php-fpm$PHP_VERSION
                    sudo service nginx restart
                    echo -e "${GREEN}All services restarted successfully!${NORMAL}"
                else
                    echo -e "${RED}PHP-FPM version $PHP_VERSION not found!${NORMAL}"
                fi
                ;;
            4)
                echo -e "${BLUE}=== Services Status ===${NORMAL}"
                echo -e "${GREEN}Nginx Status:${NORMAL}"
                sudo service nginx status
                echo -e "\n${GREEN}PHP-FPM Processes:${NORMAL}"
                ps aux | grep php-fpm
                ;;
            b|B)
                return
                ;;
            *)
                echo -e "${RED}Invalid choice!${NORMAL}"
                ;;
        esac
        echo -e "${BLUE}Press Enter to continue...${NORMAL}"
        read
    done
}

# Function to scan the folder and list scripts
scan_folder() {
    FILES_PATH=$(ls run/*.sh)
    INDEX=0
    FILES=()

    echo -e "${BLUE}=== Available Scripts ===${NORMAL}"
    for EACH_FILE in $FILES_PATH; do
        FILES+=("$EACH_FILE")
        echo -e "${GREEN}[$INDEX]${NORMAL} ${FILES[$INDEX]}"
        INDEX=$((INDEX + 1))
    done
    echo -e "${GREEN}[$INDEX]${NORMAL} Manage Services"
    echo -e "${ORANGE}[b] Exit${NORMAL}"
}

while true; do
    cd "$MYBASH_DIR"
    scan_folder
    read -p "Please enter your choice: " REPLY
    
    if [ "$REPLY" = "b" ]; then
        exit 0
    elif [ "$REPLY" = "$INDEX" ]; then
        manage_services
    elif [[ $REPLY =~ ^[0-9]+$ ]] && [ $REPLY -ge 0 ] && [ $REPLY -lt $INDEX ]; then
        echo -e "${ORANGE}---> Selected Script: ${FILES[$REPLY]}...${NORMAL}"
        bash ${FILES[$REPLY]}
        cd "$MYBASH_DIR"
        echo -e "${GREEN}Script execution completed.${NORMAL}"
    else
        echo -e "${RED}Invalid choice. Please enter a valid number or 'b' to exit.${NORMAL}"
    fi
    echo -e "${BLUE}Press Enter to continue...${NORMAL}"
    read
done