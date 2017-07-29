/*
 * Generates the product of numbers in the range [1, 10).
 *   1 * 2 * 3 * ... * 8 * 9.
*/

#include <iostream>

int main()
{
    int product = 1;

    // range [1, 10), which does not include 10.
    for (int i = 1; i != 10; ++i)
        product *= i;

    std::cout << product << std::endl;
}
