# Hướng dẫn Cài đặt và Quản lý OpenVPN Service

## 1. Tạo Service File
Tạo file service để quản lý OpenVPN:
```bash
sudo nano /etc/systemd/system/openvpn-autostart.service
```

Nội dung file service:
```ini
[Unit]
Description=Auto start OpenVPN connection
After=network-online.target
Wants=network-online.target
StartLimitIntervalSec=0

[Service]
Type=simple
User=root
ExecStart=/usr/sbin/openvpn --config /home/huong/VisualWeber_IP150.ovpn --auth-user-pass /home/huong/openvpn_login.conf
Restart=always
RestartSec=30
TimeoutStopSec=60

[Install]
WantedBy=multi-user.target
```

## 2. Thiết lập Quyền và Kích hoạt Service

### Cấp quyền cho các file
```bash
# Cấp quyền cho service file
sudo chmod 644 /etc/systemd/system/openvpn-autostart.service

# Cấp quyền cho file cấu hình OpenVPN
sudo chmod 600 ~/openvpn_login.conf
sudo chmod 600 ~/VisualWeber_IP150.ovpn
```

### Kích hoạt và khởi động service
```bash
# Reload systemd
sudo systemctl daemon-reload

# Kích hoạt service để tự động chạy khi khởi động
sudo systemctl enable openvpn-autostart

# Khởi động service
sudo systemctl start openvpn-autostart
```

## 3. Các Lệnh Quản lý Service

### Kiểm tra trạng thái
```bash
# Xem trạng thái service
sudo systemctl status openvpn-autostart

# Kiểm tra kết nối VPN
ip addr show tun0

# Xem log chi tiết
journalctl -u openvpn-autostart -f
```

### Điều khiển service
```bash
# Dừng service
sudo systemctl stop openvpn-autostart

# Khởi động lại service
sudo systemctl restart openvpn-autostart

# Tắt tự động khởi động
sudo systemctl disable openvpn-autostart
```
