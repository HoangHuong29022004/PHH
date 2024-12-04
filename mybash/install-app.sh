#!/bin/bash

# Colors for output
NORMAL="\\033[0;39m"
GREEN="\\033[1;32m"
RED="\\033[1;31m"
BLUE="\\033[1;34m"
ORANGE="\\033[1;33m"

# Store the original directory
MYBASH_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Function to check and grant execute permissions
setup_permissions() {
    echo -e "${BLUE}=== Checking and Setting Up Permissions ===${NORMAL}"
    
    # Check if mybash directory exists
    if [ ! -d "$MYBASH_DIR" ]; then
        echo -e "${RED}Error: mybash directory not found${NORMAL}"
        exit 1
    fi
    
    # Grant execute permissions to all .sh files in mybash and its subdirectories
    echo -e "${GREEN}Granting execute permissions to all scripts...${NORMAL}"
    find "$MYBASH_DIR" -type f -name "*.sh" -exec chmod +x {} \;
    
    echo -e "${GREEN}Permissions setup completed!${NORMAL}"
}

# Run permissions setup
setup_permissions

# Get directories path
DOWNLOADS_DIR="$HOME/Downloads"
ADDAPP_DIR="$MYBASH_DIR/add-app"

# Function to install .deb package
install_deb() {
    local deb_file="$1"
    echo -e "${BLUE}Installing .deb package: $(basename "$deb_file")${NORMAL}"
    sudo dpkg -i "$deb_file"
    
    # Fix any dependencies if needed
    if [ $? -ne 0 ]; then
        echo -e "${ORANGE}Fixing dependencies...${NORMAL}"
        sudo apt-get install -f -y
    fi
}

# Function to install AppImage
install_appimage() {
    local appimage_file="$1"
    local app_name=$(basename "$appimage_file" | sed 's/-[0-9].*$//' | sed 's/\.AppImage$//')
    
    echo -e "${BLUE}Installing AppImage: $(basename "$appimage_file")${NORMAL}"
    
    # Make the AppImage executable
    chmod +x "$appimage_file"
    
    # Move to /opt directory
    sudo mv "$appimage_file" "/opt/${app_name}.appimage"
    
    # Create .desktop entry
    cat << EOF | sudo tee "/usr/share/applications/${app_name}.desktop"
[Desktop Entry]
Name=${app_name^}
Exec=/opt/${app_name}.appimage --no-sandbox
Type=Application
Categories=Development;
EOF
    
    # Make sure it's still executable
    sudo chmod +x "/opt/${app_name}.appimage"
    
    echo -e "${GREEN}AppImage installation completed!${NORMAL}"
    echo -e "${ORANGE}You can now launch ${app_name^} from your application menu${NORMAL}"
    echo -e "${ORANGE}or run: /opt/${app_name}.appimage --no-sandbox${NORMAL}"
}

# Function to scan folders and list installable files
scan_downloads() {
    echo -e "${BLUE}=== Available Installation Files ===${NORMAL}"
    
    # Initialize arrays for different file types
    declare -a DEB_FILES=()
    declare -a APPIMAGE_FILES=()
    
    # Function to scan directory for files
    scan_directory() {
        local dir="$1"
        local prefix="$2"
        
        # Scan for .deb files
        while IFS= read -r file; do
            DEB_FILES+=("$file")
        done < <(find "$dir" -maxdepth 1 -name "*.deb" 2>/dev/null)
        
        # Scan for .AppImage files
        while IFS= read -r file; do
            APPIMAGE_FILES+=("$file")
        done < <(find "$dir" -maxdepth 1 -name "*.AppImage" 2>/dev/null)
    }
    
    # Scan both directories
    scan_directory "$DOWNLOADS_DIR" "Downloads"
    scan_directory "$ADDAPP_DIR" "Add-App"
    
    # Display .deb files
    if [ ${#DEB_FILES[@]} -gt 0 ]; then
        echo -e "\n${GREEN}Debian Packages (.deb):${NORMAL}"
        for i in "${!DEB_FILES[@]}"; do
            local location=$(dirname "${DEB_FILES[$i]}")
            if [ "$location" = "$DOWNLOADS_DIR" ]; then
                echo -e "${GREEN}[$i]${NORMAL} [Downloads] $(basename "${DEB_FILES[$i]}")"
            else
                echo -e "${GREEN}[$i]${NORMAL} [Add-App] $(basename "${DEB_FILES[$i]}")"
            fi
        done
    fi
    
    # Display .AppImage files
    if [ ${#APPIMAGE_FILES[@]} -gt 0 ]; then
        echo -e "\n${GREEN}AppImage Files:${NORMAL}"
        for i in "${!APPIMAGE_FILES[@]}"; do
            local offset=$((i + ${#DEB_FILES[@]}))
            local location=$(dirname "${APPIMAGE_FILES[$i]}")
            if [ "$location" = "$DOWNLOADS_DIR" ]; then
                echo -e "${GREEN}[$offset]${NORMAL} [Downloads] $(basename "${APPIMAGE_FILES[$i]}")"
            else
                echo -e "${GREEN}[$offset]${NORMAL} [Add-App] $(basename "${APPIMAGE_FILES[$i]}")"
            fi
        done
    fi
    
    # Store all files in a single array
    ALL_FILES=("${DEB_FILES[@]}" "${APPIMAGE_FILES[@]}")
    
    if [ ${#ALL_FILES[@]} -eq 0 ]; then
        echo -e "${RED}No installable files found in Downloads or Add-App directories${NORMAL}"
        return 1
    fi
    
    return 0
}

# Function to install selected file
install_file() {
    local file="$1"
    local extension="${file##*.}"
    
    case "$extension" in
        "deb")
            install_deb "$file"
            ;;
        "AppImage")
            install_appimage "$file"
            ;;
        *)
            echo -e "${RED}Unsupported file type${NORMAL}"
            return 1
            ;;
    esac
}

# Main loop
while true; do
    if scan_downloads; then
        echo -e "\n${ORANGE}[b] Back to main menu${NORMAL}"
        read -p "Please enter your choice: " REPLY
        
        if [ "$REPLY" = "b" ]; then
            exit 0
        elif [[ $REPLY =~ ^[0-9]+$ ]] && [ "$REPLY" -ge 0 ] && [ "$REPLY" -lt ${#ALL_FILES[@]} ]; then
            install_file "${ALL_FILES[$REPLY]}"
            echo -e "${GREEN}Installation process completed.${NORMAL}"
        else
            echo -e "${RED}Invalid choice. Please enter a valid number or 'b' to go back.${NORMAL}"
        fi
    fi
    echo -e "${BLUE}Press Enter to refresh the list...${NORMAL}"
    read
done 