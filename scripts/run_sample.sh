#!/bin/bash

set -e

echo "[RUN] Building project"

make

echo
echo "[RUN] SHA-256 self test"

./sha256 --self-test

echo
echo "[RUN] Hash string example"

./sha256 --hash-string "abc"

echo
echo "[RUN] Create sample file"

printf "FIT4012 SHA sample\n" > sample.txt

echo
echo "[RUN] Hash sample file"

FILE_HASH=$(./sha256 --hash-file sample.txt)

echo "$FILE_HASH"

echo
echo "[RUN] Verify file integrity"

./file_integrity sample.txt "$FILE_HASH"

echo
echo "[RUN] Tamper file"

echo "tampered" >> sample.txt

echo
echo "[RUN] Detect tampered file"

./file_integrity sample.txt "$FILE_HASH" || true

echo
echo "[RUN] Password hash demo"

./password_hash register 123456

./password_hash login 123456

./password_hash login wrongpassword || true

echo
echo "[RUN] Salted password demo"

./salted_password_hash register 123456

./salted_password_hash login 123456

./salted_password_hash login wrongpassword || true

echo
echo "[RUN] Completed"
