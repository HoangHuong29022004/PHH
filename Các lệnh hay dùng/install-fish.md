# Hướng dẫn Cài đặt và Cấu hình Fish Shell

## Cài đặt Fish Shell

1. **Cài đặt Fish từ kho mặc định:**
   ```bash
   sudo apt update
   sudo apt install fish
   ```

2. **Cài đặt phiên bản mới nhất của Fish:**
   ```bash
   sudo apt-add-repository ppa:fish-shell/release-3
   sudo apt update
   sudo apt install fish
   ```

3. **Chạy Fish shell:**
   ```bash
   fish
   ```

4. **Đặt Fish làm shell mặc định:**
   ```bash
   chsh -s /usr/bin/fish
   ```

## Cài đặt Phím Tắt

1. **Tạo phím tắt:**
   - Mở file cấu hình Fish:
     ```bash
     nano ~/.config/fish/config.fish
     ```
   - Thêm alias:
     ```fish
     alias p='php artisan'
     ```
   - Lưu và thoát, sau đó tải lại cấu hình:
     ```bash
     source ~/.config/fish/config.fish
     ```

## Xóa Phím Tắt

1. **Xóa phím tắt:**
   - Mở file cấu hình Fish:
     ```bash
     nano ~/.config/fish/config.fish
     ```
   - Xóa dòng alias đã thêm.
   - Lưu và thoát, sau đó tải lại cấu hình:
     ```bash
     source ~/.config/fish/config.fish
     ```

## Tùy chỉnh Prompt

1. **Tùy chỉnh prompt:**
   - Mở file cấu hình Fish:
     ```bash
     nano ~/.config/fish/config.fish
     ```
   - Thêm hàm tùy chỉnh prompt:
     ```fish
     function fish_prompt
         set -l cwd (prompt_pwd)
         set -l short_cwd (string split -m 1 -r '/' $cwd | string join '/')
         echo -n (whoami) ' ' $short_cwd ' > '
     end
     ```
   - Lưu và thoát, sau đó tải lại cấu hình:
     ```bash
     source ~/.config/fish/config.fish
     ``` 