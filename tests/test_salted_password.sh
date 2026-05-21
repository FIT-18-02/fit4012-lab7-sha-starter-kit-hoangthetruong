#!/bin/bash

set -e

echo "[TEST] salted password hash test"

# Build project
make

# Remove old file
rm -f password.hash

# Register password with salt
./salted_password_hash register 123456

# Correct password
if ./salted_password_hash login 123456; then

    echo "[PASS] correct salted password accepted"

else

    echo "[FAIL] correct salted password rejected"
    exit 1
fi

# Wrong password
if ./salted_password_hash login wrongpassword; then

    echo "[FAIL] wrong salted password accepted"
    exit 1

else

    echo "[PASS] wrong salted password rejected"
fi

# Same password + different salt
HASH1=$(./salted_password_hash hash-with-salt 123456 aaaabbbb)

HASH2=$(./salted_password_hash hash-with-salt 123456 ccccdddd)

if [ "$HASH1" != "$HASH2" ]; then

    echo "[PASS] different salts create different hashes"

else

    echo "[FAIL] different salts produced same hash"
    exit 1
fi
