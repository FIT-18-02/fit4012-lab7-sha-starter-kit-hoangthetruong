#!/bin/bash

set -e

echo "[TEST] compile test"

# Clean old binaries
make clean || true

# Build project
make

# Check executables
if [ ! -f sha256 ]; then
    echo "[FAIL] sha256 executable missing"
    exit 1
fi

if [ ! -f file_integrity ]; then
    echo "[FAIL] file_integrity executable missing"
    exit 1
fi

if [ ! -f password_hash ]; then
    echo "[FAIL] password_hash executable missing"
    exit 1
fi

if [ ! -f salted_password_hash ]; then
    echo "[FAIL] salted_password_hash executable missing"
    exit 1
fi

echo "[PASS] all programs compiled successfully"
