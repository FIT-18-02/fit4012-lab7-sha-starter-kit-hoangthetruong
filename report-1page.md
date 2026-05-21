# FIT4012 - SHA-256 Beginner Repository Report

## 1. Objective

The objective of this lab is to understand how the SHA-256 hashing algorithm works and how it is used in practical situations such as:

- hashing strings and files
- checking file integrity
- password hashing
- salted password hashing

This lab also demonstrates why SHA-256 alone is not ideal for real password storage systems.

---

## 2. Method

The SHA-256 implementation was built in C++ using the standard SHA-256 procedure:

- initialize SHA-256 constants and hash state
- generate the message schedule W[0..63]
- run 64 compression rounds
- apply Merkle-Damgård padding
- convert the final 256-bit result to hexadecimal

Programs included in the repo:

- `sha_procedure.cpp`
  - hashes input strings or files

- `file_integrity.cpp`
  - checks whether a file has been modified

- `password_hash.cpp`
  - stores SHA-256 password hashes

- `salted_password_hash.cpp`
  - adds random salt before hashing passwords

Main commands used:

```bash
make
./sha256 --self-test
./sha256 --hash-string "abc"
make test
