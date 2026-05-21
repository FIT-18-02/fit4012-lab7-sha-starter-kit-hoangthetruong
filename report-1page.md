# FIT4012 Lab 7 - Báo cáo 1 trang: SHA-256

## 1. Mục tiêu / Objective

Mục tiêu của bài thực hành là tìm hiểu thuật toán SHA-256 và ứng dụng của nó trong việc:

- băm dữ liệu dạng chuỗi và file
- kiểm tra toàn vẹn dữ liệu
- lưu trữ mật khẩu dưới dạng hash
- sử dụng salt để tăng độ an toàn khi lưu mật khẩu

Ngoài ra, bài lab còn giúp hiểu cơ chế padding và quá trình xử lý khối dữ liệu của SHA-256.

---

## 2. Cách làm / Approach

Các bước thực hiện:

- Biên dịch chương trình bằng Makefile và CMake.
- Chạy `sha_procedure.cpp` để băm chuỗi và file.
- Kiểm thử bằng known answer test vector với chuỗi `abc`.
- Viết và chạy `file_integrity.cpp` để kiểm tra file có bị thay đổi hay không.
- Viết và chạy `password_hash.cpp` để lưu và xác thực mật khẩu bằng SHA-256.
- Viết và chạy `salted_password_hash.cpp` để thêm salt trước khi băm mật khẩu.
- Chạy các test trong thư mục `tests/` bằng:

```bash
make test
