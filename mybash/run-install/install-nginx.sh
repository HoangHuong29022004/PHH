#!/bin/bash

# Định nghĩa màu sắc
NORMAL="\033[0;39m"
GREEN="\033[1;32m"
RED="\033[1;31m"
BLUE="\033[1;34m"
ORANGE="\033[1;33m"

# Hàm in thông báo
print_message() {
    echo -e "${2}${1}${NORMAL}"
}

# Hàm kiểm tra lỗi
check_error() {
    if [ $? -ne 0 ]; then
        print_message "Lỗi: $1" "$RED"
        exit 1
    fi
}

# Kiểm tra quyền root
if [[ $EUID -ne 0 ]]; then
    print_message "Script này cần được chạy với quyền root" "$RED"
    exit 1
fi

# Cập nhật package list
print_message "Đang cập nhật package list..." "$BLUE"
apt update
check_error "Không thể cập nhật package list"

# Cài đặt Nginx
print_message "Đang cài đặt Nginx..." "$BLUE"
apt install -y nginx
check_error "Không thể cài đặt Nginx"

# Cài đặt SSL
print_message "Đang cài đặt SSL..." "$BLUE"
apt install -y ssl-cert
check_error "Không thể cài đặt SSL"

# Tạo SSL certificate
print_message "Đang tạo SSL certificate..." "$BLUE"
make-ssl-cert generate-default-snakeoil --force-overwrite
check_error "Không thể t��o SSL certificate"

# Tạo thư mục sites
mkdir -p /etc/nginx/sites-available
mkdir -p /etc/nginx/sites-enabled
check_error "Không thể tạo thư mục sites"

# Cấu hình Nginx mặc định
cat > /etc/nginx/nginx.conf << 'EOL'
user www-data;
worker_processes auto;
pid /run/nginx.pid;
include /etc/nginx/modules-enabled/*.conf;

events {
    worker_connections 768;
}

http {
    sendfile on;
    tcp_nopush on;
    tcp_nodelay on;
    keepalive_timeout 65;
    types_hash_max_size 2048;

    include /etc/nginx/mime.types;
    default_type application/octet-stream;

    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_prefer_server_ciphers on;

    access_log /var/log/nginx/access.log;
    error_log /var/log/nginx/error.log;

    gzip on;

    include /etc/nginx/conf.d/*.conf;
    include /etc/nginx/sites-enabled/*;
}
EOL
check_error "Không thể tạo file cấu hình nginx.conf"

# Khởi động Nginx
print_message "Đang khởi động Nginx..." "$BLUE"
systemctl start nginx
systemctl enable nginx
check_error "Không thể khởi động Nginx"

# Mở port cho Nginx trong firewall
if command -v ufw >/dev/null; then
    print_message "Đang cấu hình firewall..." "$BLUE"
    ufw allow 'Nginx Full'
    check_error "Không thể cấu hình firewall"
fi

# Kiểm tra trạng thái
nginx_status=$(systemctl is-active nginx)
if [ "$nginx_status" = "active" ]; then
    print_message "Nginx đã được cài đặt và đang chạy!" "$GREEN"
    print_message "Truy cập http://localhost để kiểm tra" "$GREEN"
else
    print_message "Có lỗi xảy ra, Nginx không hoạt động" "$RED"
    exit 1
fi

# In thông tin hữu ích
print_message "\nThông tin hữu ích:" "$BLUE"
print_message "- Thư mục web root: /var/www/html" "$ORANGE"
print_message "- Thư mục cấu hình: /etc/nginx" "$ORANGE"
print_message "- File cấu hình chính: /etc/nginx/nginx.conf" "$ORANGE"
print_message "- Thư mục sites: /etc/nginx/sites-available" "$ORANGE"
print_message "- Log files: /var/log/nginx" "$ORANGE"

# Các lệnh quản lý
print_message "\nCác lệnh quản lý:" "$BLUE"
print_message "- Khởi động: sudo systemctl start nginx" "$ORANGE"
print_message "- Dừng: sudo systemctl stop nginx" "$ORANGE"
print_message "- Khởi động lại: sudo systemctl restart nginx" "$ORANGE"
print_message "- Kiểm tra trạng thái: sudo systemctl status nginx" "$ORANGE"
print_message "- Kiểm tra cấu hình: sudo nginx -t" "$ORANGE" 