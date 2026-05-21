cmake_minimum_required(VERSION 3.10)

project(FIT4012_SHA256_LAB)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Main SHA256 program
add_executable(
    sha256
    sha_procedure.cpp
)

# File integrity checker
add_executable(
    file_integrity
    file_integrity.cpp
)

# Password hashing demo
add_executable(
    password_hash
    password_hash.cpp
)

# Salted password hashing demo
add_executable(
    salted_password_hash
    salted_password_hash.cpp
)
