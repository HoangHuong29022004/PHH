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

## 4. Cài đặt các thư viện hữu ích

### 4.1. Thư viện xử lý ngày tháng
```bash
# Cài đặt Moment.js
yarn add moment

# Hoặc Day.js (nhẹ hơn Moment.js)
yarn add dayjs
```

### 4.2. Thư viện Icons
```bash
# React Icons (tổng hợp nhiều bộ icon)
yarn add react-icons

# Hoặc Material Icons
yarn add @mui/icons-material @mui/material @emotion/styled @emotion/react
```

### 4.3. Thư viện UI Components
```bash
# Tailwind CSS (đã có sẵn với Breeze)
# Headless UI
yarn add @headlessui/react

# Material UI
yarn add @mui/material @emotion/styled @emotion/react

# Ant Design
yarn add antd
```

### 4.4. Thư viện tiện ích
```bash
# Axios (đã có sẵn với Laravel)
# Lodash
yarn add lodash
```

## 5. Chạy dự án
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

## 6. Truy cập dự án
- Laravel server: http://localhost:8000
- Vite dev server: http://localhost:5173

## Lưu ý quan trọng
- Đảm bảo đã cài đặt các công cụ cần thiết:
  - Composer (PHP package manager)
  - Node.js
  - Yarn hoặc NPM
- Cần chạy đồng thời cả Laravel server và Vite server
- Kiểm tra và cấu hình file `.env` trước khi chạy dự án
- Sau khi cài đặt thư viện mới, cần chạy lại `yarn dev` hoặc `npm run dev`

## Ví dụ sử dụng các thư viện

### Moment.js
```typescript
import moment from 'moment';

// Định dạng ngày tháng
const formattedDate = moment().format('DD/MM/YYYY');
```

### React Icons
```typescript
import { FaReact } from 'react-icons/fa';
import { AiFillHome } from 'react-icons/ai';

function MyComponent() {
  return (
    <div>
      <FaReact size={24} />
      <AiFillHome color="blue" />
    </div>
  );
}
```

### Lodash
```typescript
import { debounce, isEmpty } from 'lodash';

// Debounce function
const handleSearch = debounce((searchTerm) => {
  // Xử lý tìm kiếm
}, 300);