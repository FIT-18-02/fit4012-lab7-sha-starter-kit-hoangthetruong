#!/bin/bash

set -e

echo "[TEST] known SHA-256 vectors"

# Build project
make

# Test vector: abc
EXPECTED_ABC="ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad"

RESULT_ABC=$(./sha256 --hash-string "abc")

if [ "$RESULT_ABC" = "$EXPECTED_ABC" ]; then

    echo "[PASS] abc vector correct"

else

    echo "[FAIL] abc vector incorrect"
    echo "Expected: $EXPECTED_ABC"
    echo "Got: $RESULT_ABC"

    exit 1
fi

# Test vector: empty string
EXPECTED_EMPTY="e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"

RESULT_EMPTY=$(./sha256 --hash-string "")

if [ "$RESULT_EMPTY" = "$EXPECTED_EMPTY" ]; then

    echo "[PASS] empty string vector correct"

else

    echo "[FAIL] empty string vector incorrect"
    echo "Expected: $EXPECTED_EMPTY"
    echo "Got: $RESULT_EMPTY"

    exit 1
fi

echo "[PASS] all known vectors passed"
