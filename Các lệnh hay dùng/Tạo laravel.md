# Hướng dẫn tạo dự án Laravel với React và TypeScript

## 1. Tạo dự án Laravel mới
```bash
# Tạo dự án Laravel mới
composer create-project laravel/laravel laravel-react-ts

# Di chuyển vào thư mục dự án
cd laravel-react-ts
```

## 2. Cài đặt Laravel Breeze
```bash
# Cài đặt Laravel Breeze
composer require laravel/breeze --dev

# Cài đặt Breeze với React và TypeScript
php artisan breeze:install react --typescript
```

## 3. Cài đặt dependencies
```bash
# Sử dụng Yarn
yarn install

# Hoặc sử dụng NPM
npm install
```

## 4. Chạy dự án
Mở 2 terminal riêng biệt và chạy các lệnh sau:

```bash
# Terminal 1: Chạy Laravel server
php artisan serve
```

```bash
# Terminal 2: Chạy Vite development server
yarn dev
# Hoặc
npm run dev
```

## 5. Truy cập dự án
- Laravel server: http://localhost:8000
- Vite dev server: http://localhost:5173

## Lưu ý quan trọng
- Đảm bảo đã cài đặt các công cụ cần thiết:
  - Composer (PHP package manager)
  - Node.js
  - Yarn hoặc NPM
- Cần chạy đồng thời cả Laravel server và Vite server
- Kiểm tra và cấu hình file `.env` trước khi chạy dự án