#include <iostream>

using namespace std;

int main()
{
    int a = 3, b = 4;       // `a` and `b` are ints
    decltype(a) c = a;      // c is an int; a copy of a
    decltype((b)) d = a;    // d is int&; an alias for a
    // a == 3, b == 4, c == 3, d == 3

    ++c; // a == 3, b == 4, c == 4, d == 3
    ++d; // a == 4, b == 4, c == 4, d == 4

    cout << a << " " << b << " " << c << " " << d << endl;
    return 0;
}
