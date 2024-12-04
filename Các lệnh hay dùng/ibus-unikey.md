# Hướng Dẫn Cài Đặt Bộ Gõ Tiếng Việt (ibus-unikey) cho Ubuntu 24.04

## Giới Thiệu
Hướng dẫn này sẽ giúp bạn cài đặt và cấu hình bộ gõ tiếng Việt ibus-unikey trên Ubuntu 24.04.

## Các Bước Cài Đặt

### Bước 1: Cập Nhật Hệ Thống
```bash
sudo apt update
sudo apt upgrade -y
```

### Bước 2: Cài Đặt ibus và ibus-unikey
```bash
sudo apt install ibus ibus-unikey -y
```

### Bước 3: Khởi Động lại ibus
```bash
ibus restart
```

### Bước 4: Cấu Hình Input Method
1. Mở **Settings** (Cài đặt)
2. Chọn **Region & Language** (Khu vực & Ngôn ngữ)
3. Nhấp vào **Input Sources** (Nguồn nhập)
4. Nhấp vào nút "+" để thêm ngôn ngữ mới
5. Chọn **Vietnamese**
6. Chọn **Vietnamese (Unikey)**

### Bước 5: Cấu Hình Phím Tắt
1. Mở **Settings** (Cài đặt)
2. Chọn **Keyboard** (Bàn phím)
3. Cuộn xuống phần **Typing**
4. Tìm và cấu hình phím tắt cho:
   - Switch to next input source
   - Switch to previous input source
   (Thường dùng: Super+Space hoặc Ctrl+Space)

### Bước 6: Cấu Hình Kiểu Gõ
1. Nhấp vào biểu tượng bàn phím trên thanh trạng thái
2. Chọn **Vietnamese (Unikey)**
3. Chuột phải vào biểu tượng bàn phím > **Preferences**
4. Trong tab **Input Method**, chọn:
   - Input Method: Telex hoặc VNI
   - Charset: Unicode
   - Auto send after: 0.1s
   - Enable spell check: tùy chọn

## Kiểm Tra Cài Đặt
1. Mở một trình soạn thảo văn bản
2. Chuyển đổi bộ gõ bằng phím tắt đã cấu hình
3. Thử gõ tiếng Việt

## Xử Lý Sự Cố

### Nếu ibus-unikey không hoạt động
```bash
# Khởi động lại ibus
ibus restart

# Hoặc khởi động lại máy tính
sudo reboot
```

### Nếu không thấy tùy chọn Vietnamese
```bash
# Cài đặt lại ibus-unikey
sudo apt remove ibus-unikey
sudo apt install ibus-unikey
ibus restart
```

### Nếu gặp lỗi font chữ
```bash
# Cài đặt fonts tiếng Việt
sudo apt install fonts-vietnamese
```

## Lưu Ý
- Sau khi cài đặt, bạn nên đăng xuất và đăng nhập lại hoặc khởi động lại máy tính
- Nếu sử dụng nhiều bộ gõ, có thể chuyển đổi nhanh bằng phím tắt đã cấu hình
- Có thể điều chỉnh tốc độ gõ trong phần cài đặt ibus-unikey
- Nên sao lưu dữ liệu quan trọng trước khi thực hiện các thay đổi hệ thống

## Gỡ Cài Đặt (nếu cần)
```bash
sudo apt remove ibus-unikey
sudo apt autoremove
```