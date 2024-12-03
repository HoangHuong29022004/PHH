# Hướng dẫn Tạo và Thêm SSH Key vào GitHub hoặc GitLab

## Tạo SSH Key

1. **Tạo SSH key mới:**
   ```bash
   ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
   ```
   Thay thế `"your_email@example.com"` bằng email của bạn. Khi được hỏi về vị trí lưu trữ, nhấn `Enter` để chấp nhận vị trí mặc định.

2. **Khởi động ssh-agent:**
   ```bash
   eval "$(ssh-agent -s)"
   ```

3. **Thêm SSH key vào ssh-agent:**
   ```bash
   ssh-add ~/.ssh/id_rsa
   ```

## Sao chép SSH Key

1. **Sao chép SSH public key vào clipboard:**
   ```bash
   cat ~/.ssh/id_rsa.pub
   ```
   Sao chép toàn bộ nội dung của SSH public key.

## Thêm SSH Key vào GitHub

1. **Truy cập GitHub:**
   - Đăng nhập vào tài khoản GitHub của bạn.
   - Vào **Settings** > **SSH and GPG keys** > **New SSH key**.

2. **Thêm SSH key:**
   - Dán SSH public key đã sao chép vào trường "Key".
   - Đặt tên cho SSH key trong trường "Title".
   - Nhấn **Add SSH key**.

## Thêm SSH Key vào GitLab

1. **Truy cập GitLab:**
   - Đăng nhập vào tài khoản GitLab của bạn.
   - Vào **Profile Settings** > **SSH Keys**.

2. **Thêm SSH key:**
   - Dán SSH public key đã sao chép vào trường "Key".
   - Đặt tên cho SSH key trong trường "Title".
   - Nhấn **Add key**.

## Kiểm tra kết nối

1. **Kiểm tra kết nối với GitHub:**
   ```bash
   ssh -T git@github.com
   ```

2. **Kiểm tra kết nối với GitLab:**
   ```bash
   ssh -T git@gitlab.com
   ```

Nếu kết nối thành công, bạn sẽ nhận được thông báo chào mừng từ GitHub hoặc GitLab. 