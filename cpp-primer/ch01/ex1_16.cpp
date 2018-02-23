#include <iostream>

using std::cin;
using std::cout;
using std::endl;

int main()
{
    int sum = 0, in = 0;

    while (cin >> in)
        sum += in;

    cout << "Sum: " << sum;
    return 0;
}
