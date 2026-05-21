#include "sha256_lib.h"

#include <fstream>
#include <iostream>
#include <stdexcept>
#include <string>

void print_usage(const char* program_name) {

    std::cout
        << "Usage:\n"
        << "  " << program_name
        << " <file_path> <expected_hash>\n";
}

int main(int argc, char* argv[]) {

    try {

        if (argc != 3) {

            print_usage(argv[0]);
            return 1;
        }

        const std::string file_path =
            argv[1];

        const std::string expected_hash =
            argv[2];

        // Calculate current hash
        const std::string current_hash =
            sha256::calculate_sha256_file(
                file_path
            );

        std::cout
            << "Current hash:\n"
            << current_hash
            << "\n";

        std::cout
            << "Expected hash:\n"
            << expected_hash
            << "\n";

        // Compare hash
        if (current_hash == expected_hash) {

            std::cout
                << "[PASS] File integrity verified\n";

            return 0;
        }

        std::cout
            << "[FAIL] File has been modified "
            << "(tampered)\n";

        return 1;

    } catch (const std::exception& ex) {

        std::cerr
            << "[ERROR] "
            << ex.what()
            << "\n";

        return 1;
    }
}
