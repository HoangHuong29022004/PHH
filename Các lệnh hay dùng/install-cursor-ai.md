# Hướng Dẫn Cài Đặt Cursor AI (AppImage)

## 1. Cấp quyền thực thi
```bash
chmod +x ~/Downloads/cursor-*.AppImage
```

## 2. Giải nén AppImage
```bash
~/Downloads/cursor-*.AppImage --appimage-extract
```
> Kết quả sẽ tạo ra thư mục `squashfs-root` trong thư mục Downloads

## 3. Cài đặt icon
```bash
# Kiểm tra icon trong thư mục squashfs-root
ls ~/Downloads/squashfs-root/

# Copy icon vào thư mục icons
cp ~/Downloads/squashfs-root/cursor.png ~/.local/share/icons/
```

## 4. Tạo shortcut
```bash
# Tạo file desktop entry
nano ~/.local/share/applications/cursor.desktop
```

Nội dung file cursor.desktop (copy và paste vào nano):
```plaintext
[Desktop Entry]
Name=Cursor
Exec=/home/huong/Downloads/cursor-0.43.6-build-241206z7j6me2e2-x86_64.AppImage --no-sandbox
Icon=/home/huong/.local/share/icons/cursor.png
Type=Application
Terminal=false
Categories=Development;
```

> Sau khi paste:
> 1. Nhấn `Ctrl + O` để lưu
> 2. Nhấn `Enter` để xác nhận
> 3. Nhấn `Ctrl + X` để thoát

## 5. Cập nhật hệ thống
```bash
update-desktop-database ~/.local/share/applications/
```

## 6. Chạy ứng dụng
```bash
~/Downloads/cursor-0.43.6-build-241206z7j6me2e2-x86_64.AppImage --no-sandbox
```

### Lưu ý:
- Thay đổi đường dẫn `/home/huong` trong file desktop entry theo tên user của bạn
- Nếu gặp lỗi trong quá trình cài đặt, hãy gửi log để được hỗ trợ
- Sau khi cài đặt, bạn có thể tìm Cursor trong menu ứng dụng của hệ thống
