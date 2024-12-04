# Hướng Dẫn Cài Đặt Thủ Công File .deb và AppImage

## Cài Đặt File .deb

### Bước 1: Tìm File .deb
- Đảm bảo file `.deb` của bạn nằm trong thư mục `~/Downloads` hoặc một thư mục khác mà bạn biết.

### Bước 2: Cài Đặt File .deb
1. Mở terminal và điều hướng đến thư mục chứa file `.deb`:
   ```bash
   cd ~/Downloads
   ```

2. Sử dụng `dpkg` để cài đặt file:
   ```bash
   sudo dpkg -i tên-file.deb
   ```

3. Nếu có lỗi phụ thuộc, sửa lỗi bằng `apt-get`:
   ```bash
   sudo apt-get install -f
   ```

## Cài Đặt File AppImage

### Bước 1: Tìm File AppImage
- Đảm bảo file `.AppImage` của bạn nằm trong thư mục `~/Downloads` hoặc một thư mục khác mà bạn biết.

### Bước 2: Cài Đặt File AppImage
1. Mở terminal và điều hướng đến thư mục chứa file `.AppImage`:
   ```bash
   cd ~/Downloads
   ```

2. Cấp quyền thực thi cho file AppImage:
   ```bash
   chmod +x tên-file.AppImage
   ```

3. Chạy file AppImage:
   ```bash
   ./tên-file.AppImage
   ```

### Tùy Chọn: Tạo Shortcut cho AppImage
1. Di chuyển file AppImage vào thư mục `/opt`:
   ```bash
   sudo mv tên-file.AppImage /opt/
   ```

2. Tạo file `.desktop` để thêm ứng dụng vào menu:
   ```bash
   sudo nano /usr/share/applications/tên-file.desktop
   ```

3. Thêm nội dung sau vào file `.desktop`:
   ```plaintext
   [Desktop Entry]
   Name=Tên Ứng Dụng
   Exec=/opt/tên-file.AppImage --no-sandbox
   Type=Application
   Categories=Development;
   ```

4. Lưu và thoát (`Ctrl + O`, `Enter`, `Ctrl + X`).

5. Cấp quyền thực thi cho file AppImage trong `/opt`:
   ```bash
   sudo chmod +x /opt/tên-file.AppImage
   ```

## Lưu Ý
- Đảm bảo bạn có quyền `sudo` để thực hiện các thao tác cài đặt.
- Chỉ cài đặt các file từ nguồn đáng tin cậy để tránh rủi ro bảo mật.
- Nếu gặp lỗi, kiểm tra lại các bước và đảm bảo rằng bạn đã thực hiện đúng các lệnh.