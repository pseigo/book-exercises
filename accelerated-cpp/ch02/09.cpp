#include <iostream>

using std::cout; using std::endl;
using std::cin;

int main()
{
    cout << "Please enter two different numbers." << endl;

    int a, b;
    cin >> a >> b;

    if (a > b)
        cout << a;
    else
        cout << b;

    cout << " is the larger number.";
    return 0;
}
