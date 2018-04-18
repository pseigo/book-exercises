#include <iostream>

using namespace std;

int main()
{
    int i = 42;
    const int &r1 = i;      // we can bind a const int& to a plain int object
    const int &r2 = 42;     // ok: r2 is a reference to const
    const int &r3 = r1 * 2; // ok: r3 is a reference to const
    int &r4 = r1 * 2;       // error: r4 is a plain, nonconst reference

    // the compiler transforms this...
    double dval = 3.14;
    const int &ri = dval;

    // ... into something like this:
    double dval = 3.14;
    const int temp = dval;
    const int &ri = temp;

    // if ri were NOT const, we would be changing a temporary variable.
    // this is surely NOT intended by the programmer, so it is forbidden.
}
