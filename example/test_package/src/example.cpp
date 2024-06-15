#include "example.h"
#include <vector>
#include <string>
#include <iostream>

// Not available - package sum::sum has empty includes
#include <sum.h>

int main() {
    example();

    std::cout << "Sum from test_package: 3 + 4 = " << sum(3, 4) << std::endl;
    std::vector<std::string> vec;
    vec.push_back("test_package");

    example_print_vector(vec);
}
