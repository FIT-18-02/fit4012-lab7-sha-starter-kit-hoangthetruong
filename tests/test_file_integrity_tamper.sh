#!/bin/bash

set -e

echo "[TEST] file integrity tamper test"

# Build project
make

# Create sample file
printf "FIT4012 SHA sample\n" > sample.txt

# Generate original hash
ORIGINAL_HASH=$(./sha256 --hash-file sample.txt)

# Verify original file
./file_integrity sample.txt "$ORIGINAL_HASH"

# Tamper file
echo "tampered" >> sample.txt

# Verify tampered file should fail
if ./file_integrity sample.txt "$ORIGINAL_HASH"; then

    echo "[FAIL] tampered file was accepted"
    exit 1

else

    echo "[PASS] tampered file detected"
fi
