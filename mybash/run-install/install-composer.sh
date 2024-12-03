#!/bin/bash

# Colors for output
NORMAL="\\033[0;39m"
GREEN="\\033[1;32m"
RED="\\033[1;31m"
BLUE="\\033[1;34m"
ORANGE="\\033[1;33m"

echo -e "${BLUE}=== Composer Installation Script ===${NORMAL}"

# Download the installer
echo -e "${GREEN}Downloading Composer installer...${NORMAL}"
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"

# Verify the installer SHA-384
EXPECTED_SIGNATURE=$(wget -q -O - https://composer.github.io/installer.sig)
ACTUAL_SIGNATURE=$(php -r "echo hash_file('sha384', 'composer-setup.php');")

if [ "$EXPECTED_SIGNATURE" != "$ACTUAL_SIGNATURE" ]; then
    echo -e "${RED}ERROR: Invalid installer signature${NORMAL}"
    rm composer-setup.php
    exit 1
fi

# Install Composer
echo -e "${GREEN}Installing Composer...${NORMAL}"
php composer-setup.php --quiet

# Move Composer to global bin directory
sudo mv composer.phar /usr/local/bin/composer

# Clean up
rm composer-setup.php

# Verify installation
echo -e "${BLUE}Composer version installed:${NORMAL}"
composer --version 