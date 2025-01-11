#!/bin/bash

# Colors
NORMAL="\\033[0;39m"
GREEN="\\033[1;32m"
RED="\\033[1;31m"
BLUE="\\033[1;34m"
ORANGE="\\033[1;33m"

# Function to check if command executed successfully
check_status() {
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✓ $1${NORMAL}"
    else
        echo -e "${RED}✗ $1${NORMAL}"
        return 1
    fi
}

echo -e "${BLUE}=== Create Virtual Host ===${NORMAL}"

# Get PHP version
echo -e "${BLUE}Available PHP versions:${NORMAL}"
ls /usr/sbin/php-fpm* | grep -o 'php-fpm[0-9.]*' | sort
read -p "Enter PHP version (e.g., 8.2): " PHP_VERSION

# Validate PHP version
if [ ! -f "/usr/sbin/php-fpm$PHP_VERSION" ]; then
    echo -e "${RED}PHP-FPM version $PHP_VERSION not found!${NORMAL}"
    exit 1
fi

# Get domain name
read -p "Enter domain name: " DOMAIN
if [ -z "$DOMAIN" ]; then
    echo -e "${RED}Domain name cannot be empty!${NORMAL}"
    exit 1
fi

# Create project directory
echo -e "${BLUE}Creating project directory...${NORMAL}"
sudo mkdir -p "/var/www/$DOMAIN/public"
sudo chown -R $USER:www-data "/var/www/$DOMAIN"
sudo chmod -R 775 "/var/www/$DOMAIN"
sudo chmod g+s "/var/www/$DOMAIN"
check_status "Project directory created and permissions set" || exit 1

# Create index.php
echo -e "${BLUE}Creating index.php...${NORMAL}"
sudo tee "/var/www/$DOMAIN/public/index.php" > /dev/null << EOF
<!DOCTYPE html>
<html>
<head>
    <title>Welcome to $DOMAIN</title>
    <style>
        body { 
            font-family: Arial, sans-serif;
            margin: 40px;
            text-align: center;
        }
        h1 { color: #333; }
    </style>
</head>
<body>
    <h1>Project $DOMAIN created successfully!</h1>
    <p>PHP Version: <?php echo PHP_VERSION; ?></p>
</body>
</html>
EOF
check_status "Index.php created" || exit 1

# Create Nginx configuration
echo -e "${BLUE}Creating Nginx configuration...${NORMAL}"
sudo tee "/etc/nginx/sites-available/$DOMAIN" > /dev/null << EOF
server {
    listen 80;
    listen [::]:80;
    server_name $DOMAIN;
    return 301 https://\$server_name\$request_uri;
}

server {
    listen 443 ssl http2;
    listen [::]:443 ssl http2;
    server_name $DOMAIN;
    root /var/www/$DOMAIN/public;

    ssl_certificate     /etc/ssl/certs/ssl-cert-snakeoil.pem;
    ssl_certificate_key /etc/ssl/private/ssl-cert-snakeoil.key;
    
    add_header X-Frame-Options "SAMEORIGIN";
    add_header X-XSS-Protection "1; mode=block";
    add_header X-Content-Type-Options "nosniff";
    
    index index.php index.html;
    charset utf-8;

    location / {
        try_files \$uri \$uri/ /index.php?\$query_string;
    }

    location = /favicon.ico { access_log off; log_not_found off; }
    location = /robots.txt  { access_log off; log_not_found off; }

    location ~ \.php$ {
        fastcgi_pass unix:/run/php/php$PHP_VERSION-fpm.sock;
        fastcgi_param SCRIPT_FILENAME \$realpath_root\$fastcgi_script_name;
        include fastcgi_params;
    }

    location ~ /\.(?!well-known).* {
        deny all;
    }
}
EOF
check_status "Nginx configuration created" || exit 1

# Create symbolic link
echo -e "${BLUE}Creating symbolic link...${NORMAL}"
sudo ln -sf "/etc/nginx/sites-available/$DOMAIN" "/etc/nginx/sites-enabled/"
check_status "Symbolic link created" || exit 1

# Update hosts file
echo -e "${BLUE}Updating hosts file...${NORMAL}"
if ! grep -q "127.0.0.1.*$DOMAIN" /etc/hosts; then
    echo "127.0.0.1       $DOMAIN" | sudo tee -a /etc/hosts > /dev/null
    check_status "Hosts file updated" || exit 1
fi

# Install SSL certificate if needed
if [ ! -f "/etc/ssl/certs/ssl-cert-snakeoil.pem" ]; then
    echo -e "${BLUE}Installing SSL certificate...${NORMAL}"
    sudo apt-get install -y ssl-cert
    sudo make-ssl-cert generate-default-snakeoil --force-overwrite
    check_status "SSL certificate installed" || exit 1
fi

# Test and restart Nginx
echo -e "${BLUE}Testing Nginx configuration...${NORMAL}"
sudo nginx -t && sudo service nginx restart
check_status "Nginx restarted" || exit 1

echo -e "\n${GREEN}Virtual host created successfully!${NORMAL}"
echo -e "${ORANGE}Site available at: https://$DOMAIN${NORMAL}"
echo -e "${ORANGE}Project folder: /var/www/$DOMAIN${NORMAL}"