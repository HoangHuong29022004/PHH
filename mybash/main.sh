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

# Main menu function
show_main_menu() {
    echo -e "${BLUE}=== MyBash Main Menu ===${NORMAL}"
    echo -e "${GREEN}[1]${NORMAL} Run Scripts (app.sh)"
    echo -e "${GREEN}[2]${NORMAL} Install Programs (installs.sh)"
    echo -e "${GREEN}[3]${NORMAL} Install AppImage (install-app.sh)"
    echo -e "${ORANGE}[q]${NORMAL} Quit"
}

# Main loop
while true; do
    cd "$MYBASH_DIR"
    show_main_menu
    read -p "Please enter your choice: " REPLY

    case $REPLY in
        1)
            echo -e "${ORANGE}---> Running app.sh...${NORMAL}"
            bash app.sh
            ;;
        2)
            echo -e "${ORANGE}---> Running installs.sh...${NORMAL}"
            bash installs.sh
            ;;
        3)
            echo -e "${ORANGE}---> Running install-app.sh...${NORMAL}"
            bash install-app.sh
            ;;
        q|Q)
            echo -e "${BLUE}Goodbye!${NORMAL}"
            exit 0
            ;;
        *)
            echo -e "${RED}Invalid choice. Please enter 1, 2 or q${NORMAL}"
            ;;
    esac
done 