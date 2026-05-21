# FIT4012 Lab 7 - Báo cáo 1 trang: SHA-256

## 1. Mục tiêu / Objective

Mục tiêu của bài thực hành là tìm hiểu nguyên lý hoạt động của thuật toán SHA-256 và ứng dụng của nó trong:

- băm chuỗi dữ liệu
- kiểm tra toàn vẹn file
- băm mật khẩu
- sử dụng salt để tăng độ an toàn khi lưu mật khẩu

Ngoài ra, bài lab còn giúp quan sát trực tiếp quá trình padding và cơ chế hoạt động của SHA-256.

---

## 2. Cách làm / Approach

Các bước thực hiện:

- Biên dịch và chạy `sha_procedure.cpp` bằng Makefile.
- Kiểm tra SHA-256 bằng known answer test vector với chuỗi `abc`.
- Viết chương trình `file_integrity.cpp` để kiểm tra file có bị thay đổi hay không.
- Viết chương trình `password_hash.cpp` để lưu và xác thực hash mật khẩu.
- Viết chương trình `salted_password_hash.cpp` để thêm salt trước khi băm mật khẩu.
- Chạy toàn bộ test bằng:

```bash
make test
