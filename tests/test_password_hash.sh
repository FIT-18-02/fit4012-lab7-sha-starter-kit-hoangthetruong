#!/bin/bash

set -e

echo "[TEST] password hash test"

# Build project
make

# Remove old password file
rm -f password.hash

# Register password
./password_hash register 123456

# Correct password test
if ./password_hash login 123456; then

    echo "[PASS] correct password accepted"

else

    echo "[FAIL] correct password rejected"
    exit 1
fi

# Wrong password test
if ./password_hash login wrongpassword; then

    echo "[FAIL] wrong password accepted"
    exit 1

else

    echo "[PASS] wrong password rejected"
fi
