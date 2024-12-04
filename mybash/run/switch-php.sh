#!/bin/bash

# Colors for output
NORMAL="\\033[0;39m"
GREEN="\\033[1;32m"
RED="\\033[1;31m"
BLUE="\\033[1;34m"
ORANGE="\\033[1;33m"

echo -e "${BLUE}=== PHP Version Switcher ===${NORMAL}"

# Show current PHP version
current_version=$(php -v | grep -oP "PHP \K[0-9]+\.[0-9]+")
echo -e "\n${GREEN}Current PHP version: ${ORANGE}$current_version${NORMAL}"

# Show all installed PHP versions
echo -e "\n${BLUE}Installed PHP versions:${NORMAL}"
update-alternatives --display php | grep -oP "/usr/bin/php\K[0-9]+\.[0-9]+" | while read version; do
    if [ "$version" == "$current_version" ]; then
        echo -e "${GREEN}* $version (current)${NORMAL}"
    else
        echo -e "${ORANGE}  $version${NORMAL}"
    fi
done

# Prompt for version choice
read -p "Enter PHP version to switch to (e.g., 8.1, 8.2, 8.3): " version

# Check if the version is installed
if [ -x "/usr/bin/php$version" ]; then
    sudo update-alternatives --set php /usr/bin/php$version
    sudo update-alternatives --set phar /usr/bin/phar$version
    sudo update-alternatives --set phar.phar /usr/bin/phar.phar$version
    sudo update-alternatives --set phpize /usr/bin/phpize$version
    sudo update-alternatives --set php-config /usr/bin/php-config$version
    echo -e "${GREEN}Switched to PHP $version${NORMAL}"
else
    echo -e "${RED}PHP version $version is not installed.${NORMAL}"
fi

# Show new PHP version
echo -e "\n${BLUE}New PHP version:${NORMAL}"
php -v
