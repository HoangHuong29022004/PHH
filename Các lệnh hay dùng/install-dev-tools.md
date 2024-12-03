# Hướng dẫn Cài đặt Git, Composer, PHP 8.3, Node.js 22, và pnpm

## Cài đặt Git

1. **Cập nhật hệ thống:**
   ```bash
   sudo apt update
   ```

2. **Cài đặt Git:**
   ```bash
   sudo apt install git
   ```

3. **Kiểm tra phiên bản Git:**
   ```bash
   git --version
   ```

## Cài đặt Composer

1. **Cài đặt các phụ thuộc:**
   ```bash
   sudo apt install curl php-cli php-mbstring unzip
   ```

2. **Tải và cài đặt Composer:**
   ```bash
   curl -sS https://getcomposer.org/installer | php
   sudo mv composer.phar /usr/local/bin/composer
   ```

3. **Kiểm tra phiên bản Composer:**
   ```bash
   composer --version
   ```

## Cài đặt PHP 8.3

1. **Thêm PPA cho PHP:**
   ```bash
   sudo add-apt-repository ppa:ondrej/php
   sudo apt update
   ```

2. **Cài đặt PHP 8.3:**
   ```bash
   sudo apt install php8.3
   ```

3. **Cài đặt các tiện ích mở rộng phổ biến:**
   ```bash
   sudo apt install php8.3-cli php8.3-fpm php8.3-mysql php8.3-xml php8.3-mbstring php8.3-curl php8.3-zip
   ```

4. **Kiểm tra phiên bản PHP:**
   ```bash
   php -v
   ```

## Cài đặt Node.js 22 và pnpm

1. **Cài đặt Node.js 22:**
   - Thêm NodeSource repository:
     ```bash
     curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -
     ```
   - Cài đặt Node.js:
     ```bash
     sudo apt install -y nodejs
     ```

2. **Kiểm tra phiên bản Node.js và npm:**
   ```bash
   node -v
   npm -v
   ```

3. **Cài đặt pnpm:**
   ```bash
   npm install -g pnpm
   ```

4. **Kiểm tra phiên bản pnpm:**
   ```bash
   pnpm -v
   ```

## Lưu ý

- Đảm bảo bạn đã cập nhật hệ thống trước khi cài đặt các công cụ.
- Kiểm tra các phiên bản sau khi cài đặt để đảm bảo quá trình cài đặt thành công. 