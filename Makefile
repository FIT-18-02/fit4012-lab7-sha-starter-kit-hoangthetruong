CXX = g++

CXXFLAGS = -std=c++17 -Wall -Wextra -pedantic

TARGET_SHA256 = sha256
TARGET_FILE = file_integrity
TARGET_PASSWORD = password_hash
TARGET_SALTED = salted_password_hash

all: $(TARGET_SHA256) $(TARGET_FILE) $(TARGET_PASSWORD) $(TARGET_SALTED)

# SHA256 main program
$(TARGET_SHA256): sha_procedure.cpp
	$(CXX) $(CXXFLAGS) sha_procedure.cpp -o $(TARGET_SHA256)

# File integrity checker
$(TARGET_FILE): file_integrity.cpp
	$(CXX) $(CXXFLAGS) file_integrity.cpp -o $(TARGET_FILE)

# Password hashing
$(TARGET_PASSWORD): password_hash.cpp
	$(CXX) $(CXXFLAGS) password_hash.cpp -o $(TARGET_PASSWORD)

# Salted password hashing
$(TARGET_SALTED): salted_password_hash.cpp
	$(CXX) $(CXXFLAGS) salted_password_hash.cpp -o $(TARGET_SALTED)

# Run tests
test:
	bash tests/test_sha_compile.sh
	bash tests/test_known_vectors.sh
	bash tests/test_file_integrity_tamper.sh
	bash tests/test_password_hash.sh
	bash tests/test_salted_password.sh

# Clean build files
clean:
	rm -f $(TARGET_SHA256)
	rm -f $(TARGET_FILE)
	rm -f $(TARGET_PASSWORD)
	rm -f $(TARGET_SALTED)
	rm -f *.hash
	rm -f sample.txt
