# FIT4012 Lab 7 - Báo cáo 1 trang: SHA-256

## 1. Mục tiêu / Objective

Mục tiêu của bài thực hành là tìm hiểu thuật toán SHA-256 và ứng dụng của nó trong việc:

- băm chuỗi và file
- kiểm tra toàn vẹn dữ liệu
- lưu mật khẩu dưới dạng hash
- sử dụng salt để tăng độ an toàn cho mật khẩu

---

## 2. Cách làm / Approach

Các bước thực hiện:

- Biên dịch chương trình bằng Makefile.
- Chạy `sha_procedure.cpp` để băm chuỗi và file.
- Kiểm thử SHA-256 bằng known answer test vector.
- Chạy `file_integrity.cpp` để kiểm tra file bị sửa đổi.
- Chạy `password_hash.cpp` để kiểm tra mật khẩu đúng/sai.
- Chạy `salted_password_hash.cpp` để tạo salted password hash.
- Chạy toàn bộ test bằng:

```bash
make test
