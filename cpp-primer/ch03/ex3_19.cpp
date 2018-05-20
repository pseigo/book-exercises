#include <iostream>
#include <vector>

int main()
{
    // easiest to understand and most efficient
    std::vector<int> v1(10, 42);

    // efficient, but not necessary
    std::vector<int> v2;
    for (int i = 0; i != 10; ++i) {
        v2.push_back(42);
    }

    // verbose
    std::vector<int> v3 = {42, 42, 42, 42, 42, 42, 42, 42, 42, 42};
}
