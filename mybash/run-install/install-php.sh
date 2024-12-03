#!/bin/bash

# Colors for output
NORMAL="\\033[0;39m"
GREEN="\\033[1;32m"
RED="\\033[1;31m"
BLUE="\\033[1;34m"
ORANGE="\\033[1;33m"

echo -e "${BLUE}=== PHP Installation Script ===${NORMAL}"

# Prompt user for PHP version
read -p "Enter PHP version to install (e.g., 8.1): " version

# Check if PHP is already installed
if php -v | grep -q "PHP $version"; then
    echo -e "${GREEN}PHP $version is already installed!${NORMAL}"
    php -v
    exit 0
fi

# Function to install PHP
install_php() {
    local version=$1

    # Update package list
    echo -e "${GREEN}Updating package list...${NORMAL}"
    sudo apt update

    # Add the PHP PPA
    echo -e "${GREEN}Adding PHP PPA...${NORMAL}"
    sudo add-apt-repository ppa:ondrej/php -y

    # Update package list again
    echo -e "${GREEN}Updating package list...${NORMAL}"
    sudo apt update

    # Install PHP with selected version
    echo -e "${GREEN}Installing PHP $version and extensions...${NORMAL}"
    sudo apt install -y php$version \
        php$version-cli \
        php$version-common \
        php$version-fpm \
        php$version-mysql \
        php$version-xml \
        php$version-curl \
        php$version-gd \
        php$version-imagick \
        php$version-mbstring \
        php$version-zip \
        php$version-bcmath \
        php$version-intl \
        php$version-readline \
        php$version-soap \
        php$version-xsl \
        php$version-yaml

    # Verify installation
    echo -e "${BLUE}PHP version installed:${NORMAL}"
    php -v
}

# Validate input
if [[ $version =~ ^[0-9]+\.[0-9]+$ ]]; then
    install_php "$version"
else
    echo -e "${RED}Invalid version format. Please enter a version like '8.1'.${NORMAL}"
    exit 1
fi

echo -e "${GREEN}PHP installation completed successfully!${NORMAL}"
echo -e "${BLUE}Note: You can switch between PHP versions using:${NORMAL}"
echo -e "${ORANGE}sudo update-alternatives --config php${NORMAL}"
