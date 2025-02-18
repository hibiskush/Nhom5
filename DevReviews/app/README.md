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

## UML Diagram:
<img width="978" alt="UML" src="https://uml.planttext.com/plantuml/png/bLPDRzim3Bq7o7yGV78nPpli5Wpz2hOkM0_3kg67OGTLPceXjkH9ShQWw7yV9Tkn9DihcW298lAHV7mIdKjjg39DLIuNUiz5JHMjICa5c6CDH2fJoEN2lbb9jIRtj2p1aAVbWk1hHMYUAz1wJUwCukAntwuLFr03N-0OMy0KeAugsGYp9hbi7aheJU7lzlDDbp4T8cQaHY_ES7dMEnqapyaE32kkQKa5WtJ2z5Ln1fk2YiVON4gQVrTKQCeCbq9Ry_D0sZCDp7TALkkkkdxFo7Y7Tan5K_LRET88kzBNukL9RVWC0sPTYCpX9bZTKFq985N0W1z0PRR3RNz3Pmt2vpW3y5Xl91StmFRo3jG1E-U9NlC9PPMK9jvxe1f-g3BUBe3ce7J8FiutQDGUYmlo26QZZhMHJicKkVKspmXhb0B1ZYyWEkqdSTDoZwZF468b1ojpOKpzTkD-p4hRqtlod2-w2C-XPam1YkwhPeRroVMMQ_F1SpgtjFtZV7syG_51fTfzlGRu3HYlRMNslBIhry2lsl6GTcCYxFD7EmgWgKPDLZMREZJOhirSdzrWwQttyF0-DBA2Sh7DruJ7maH5f6tkpCjs5hYsDyKoxIVDm6ti1jhm2YNiBcdR_umCTu-6DxLbFBghU0voh8JJKcVanI0USYjsKc41kBo8r4dDtyzK5oVKTIdPtlEtxhTOkZRE4arCLaeDfp6Pj4Cl8QlLEKcy90aEzQGznVhTxmOK1vsWV-0IWpef75RJ0sWSWqcS99uMpjiDHFIlxMqVGIAf7QAh2U-r4zDYHcuEt4T2J5FRKHnWndocabdbD3bmEfzcr3ifTbnLSTFcGGEdn2eJtx7LpuBdU9P-DJKY-sTLzrG_6NFvHw0vxl7OqKM9Sio6yyfSBlndwdySJp4dXd9OHH1zkRZ4NkE_cdy0" />
