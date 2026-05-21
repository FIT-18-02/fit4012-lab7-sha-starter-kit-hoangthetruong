# FIT4012 Lab 7 - Báo cáo 1 trang: SHA-256

## 1. Mục tiêu / Objective

Mục tiêu của bài thực hành là tìm hiểu thuật toán SHA-256 và ứng dụng của nó trong:

- băm chuỗi và file
- kiểm tra toàn vẹn dữ liệu
- lưu mật khẩu dưới dạng hash
- sử dụng salt để tăng độ an toàn cho mật khẩu

## 2. Cách làm / Approach

Các bước thực hiện:

- Biên dịch chương trình bằng Makefile
- Chạy sha_procedure.cpp để băm chuỗi và file
- Kiểm thử SHA-256 bằng known answer test vector
- Chạy file_integrity.cpp để kiểm tra file bị sửa đổi
- Chạy password_hash.cpp để kiểm tra mật khẩu đúng/sai
- Chạy salted_password_hash.cpp để tạo salted password hash

Lệnh sử dụng:

```bash
make
make test
bash .github/scripts/check_submission.sh
```

## 3. Kết quả / Result

Hash của chuỗi abc:

```text
ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad
```

Hash của file mẫu:

```text
6bffacf670f0b13347f13c4013cc93714e62707a642f3873e90f5135fca94a95
```

Kết quả khi file bị sửa:

```text
[FAIL] File has been modified (tampered)
```

Kết quả đăng nhập đúng:

```text
[PASS] Login success
```

Kết quả đăng nhập sai:

```text
[FAIL] Login failed: wrong password
```

Kết quả salted password:

```text
Different salts create different hashes
```

## 4. Kết luận / Conclusion

SHA-256 giúp phát hiện thay đổi dữ liệu bằng cách tạo ra giá trị hash cố định cho dữ liệu đầu vào.

Nếu dữ liệu thay đổi dù chỉ một ký tự, hash cũng thay đổi hoàn toàn.

Salt giúp tăng độ an toàn cho mật khẩu vì cùng một mật khẩu sẽ tạo ra các hash khác nhau.

Tuy nhiên SHA-256 quá nhanh nên chưa phù hợp để lưu mật khẩu trong hệ thống thực tế.

Trong thực tế nên dùng:

- Argon2id
- bcrypt
- scrypt
