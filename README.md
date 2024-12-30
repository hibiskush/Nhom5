# NHÓM 5: QUẢN LÝ VÍ EVM 

## Thành viên:
- Nguyễn Nhật Minh 22010265
- Đỗ Tùng Dương 22010263
- Hà Trung Dũng 22010433

## Chức năng:
### 1. Lưu trữ và quản lý nhiều ví:
- Chức năng lưu trữ ví sẽ cho phép người dùng tạo và lưu trữ các ví điện tử. Mỗi ví sẽ bao gồm một cặp khóa (public và private key) giúp bảo vệ tài khoản và các giao dịch của người dùng.
- Khi người dùng tạo ví mới, một cặp khóa được tạo tự động và lưu trữ trong hệ thống.
- Người dùng có thể nhập khóa riêng (private key) từ ví cũ nếu muốn phục hồi ví đã có.

### 2. Chuyển tiền giữa các ví
- Người dùng có thể thực hiện giao dịch chuyển tiền từ ví của mình sang ví của người khác.
- Giao dịch này sẽ bao gồm thông tin như người gửi, người nhận, số tiền và chữ ký (signature) từ khóa riêng của người gửi để xác thực giao dịch.
- Hệ thống sẽ tạo một ID giao dịch (Transaction ID) duy nhất để theo dõi và kiểm tra các giao dịch đã thực hiện.

### 3. Xem lịch sử giao dịch
- Người dùng có thể xem lại các giao dịch đã thực hiện, bao gồm thông tin người gửi, người nhận, số tiền, ngày giờ giao dịch và trạng thái của giao dịch.
- Mỗi giao dịch được gán một mã ID duy nhất để dễ dàng tra cứu.

### 4. Bảo mật và xác thực
- Mỗi giao dịch sẽ cần phải được xác thực bằng chữ ký số, đảm bảo tính bảo mật cho mọi giao dịch thực hiện từ ví điện tử.
- Hệ thống sử dụng cặp khóa công khai và khóa riêng để mã hóa và xác nhận giao dịch.
- Các ví chỉ có thể thực hiện giao dịch khi người dùng có quyền truy cập vào khóa riêng của ví đó.


## Structural Diagram:
![Class Diagram](http://www.plantuml.com/plantuml/proxy?src=https://raw.githubusercontent.com/hibiskush/Nhom5/refs/heads/main/diagram.puml)


