# Hướng dẫn Kiểm tra và Chọn Phiên bản PHP

## Các lệnh kiểm tra phiên bản PHP

1. Kiểm tra phiên bản PHP hiện tại:
   ```bash
   php -v
   ```

2. Liệt kê tất cả các phiên bản PHP đã cài đặt:
   ```bash
   sudo update-alternatives --display php
   ```

## Thay đổi phiên bản PHP

1. Chọn phiên bản PHP mặc định:
   ```bash
   sudo update-alternatives --config php
   ```
   Sau khi chạy lệnh này, bạn sẽ thấy danh sách các phiên bản PHP. Nhập số tương ứng với phiên bản bạn muốn sử dụng.

2. Cài đặt phiên bản PHP cụ thể (ví dụ PHP 7.4):
   ```bash
   sudo apt install php7.4
   ```

3. Gỡ cài đặt phiên bản PHP không sử dụng (ví dụ PHP 7.4):
   ```bash
   sudo apt remove php7.4
   ```

## Kiểm tra sau khi thay đổi

1. Xác nhận phiên bản PHP đang hoạt động:
   ```bash
   php -v
   ```

2. Kiểm tra vị trí cài đặt PHP:
   ```bash
   which php
   ```

## Lưu ý

- Đảm bảo bạn đã backup dữ liệu quan trọng trước khi thay đổi phiên bản PHP
- Một số ứng dụng có thể yêu cầu phiên bản PHP cụ thể để hoạt động
- Sau khi thay đổi phiên bản PHP, có thể cần khởi động lại web server:
  ```bash
  sudo service apache2 restart
  ```
  hoặc
  ```bash
  sudo systemctl restart nginx
  ``` 