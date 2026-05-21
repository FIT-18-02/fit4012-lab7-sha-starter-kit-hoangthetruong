#include "sha256_lib.h"

#include <iostream>
#include <string>

int main(int argc, char* argv[]) {

    // Self test
    if (argc == 2 && std::string(argv[1]) == "--self-test") {

        std::string result =
            sha256::calculate_sha256_string("abc");

        std::cout << "SHA256(abc)=" << std::endl;
        std::cout << result << std::endl;

        return 0;
    }

    // Hash string
    if (argc == 3 &&
        std::string(argv[1]) == "--hash-string") {

        std::string text = argv[2];

        std::cout
            << sha256::calculate_sha256_string(text)
            << std::endl;

        return 0;
    }

    // Hash file
    if (argc == 3 &&
        std::string(argv[1]) == "--hash-file") {

        try {

            std::string hash =
                sha256::calculate_sha256_file(argv[2]);

            std::cout << hash << std::endl;

        } catch (const std::exception& e) {

            std::cerr << e.what() << std::endl;
            return 1;
        }

        return 0;
    }

    // Interactive input
    std::string input_text;

    std::cout << "Enter text: ";
    std::getline(std::cin, input_text);

    std::cout
        << sha256::calculate_sha256_string(input_text)
        << std::endl;

    return 0;
}
