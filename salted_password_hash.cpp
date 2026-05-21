#include "sha256_lib.h"

#include <ctime>
#include <fstream>
#include <iostream>
#include <string>

int main() {

    std::string password;

    std::cout << "Enter password: ";
    std::getline(std::cin, password);

    // Generate simple salt using current time
    std::string salt =
        std::to_string(std::time(nullptr));

    // Salt + password
    std::string salted_password =
        salt + password;

    // Hash salted password
    std::string hash =
        sha256::calculate_sha256_string(
            salted_password
        );

    // Save salt:hash
    std::ofstream output(
        "salted_password.hash"
    );

    if (!output) {

        std::cerr
            << "Cannot create file"
            << std::endl;

        return 1;
    }

    output << salt
           << ":"
           << hash
           << std::endl;

    output.close();

    std::cout
        << "Saved salted password hash:"
        << std::endl;

    std::cout
        << salt
        << ":"
        << hash
        << std::endl;

    return 0;
}
