#!/bin/bash

# Colors
NORMAL="\\033[0;39m"
GREEN="\\033[1;32m"
BLUE="\\033[1;34m"
YELLOW="\\033[1;33m"

echo -e "${BLUE}=== HTTPS Sites List ===${NORMAL}\n"

# Kiểm tra thư mục sites-enabled
if [ ! -d "/etc/nginx/sites-enabled" ]; then
    echo -e "${RED}Nginx sites-enabled directory not found!${NORMAL}"
    exit 1
fi

# Đọc và phân tích các file config
for config in /etc/nginx/sites-enabled/*; do
    if [ -f "$config" ]; then
        domain=$(basename "$config")
        project_path=$(grep "root" "$config" | head -n 1 | awk '{print $2}' | sed 's/;$//')
        
        # Kiểm tra xem có phải là HTTPS site không
        if grep -q "listen.*443.*ssl" "$config"; then
            echo -e "${GREEN}Domain:${NORMAL} https://$domain"
            echo -e "${YELLOW}Project Path:${NORMAL} $project_path"
            echo "----------------------------------------"
        fi
    fi
done 