#include <iostream>

using namespace std;

int main()
{
    string str = "Hello, World!";

    // Using the type that str.size() returns
    auto size1 = str.size();

    // Explicitly using the type
    string::size_type size2 = str.size();

    // Using a synonym for the explicit type
    typedef string::size_type str_sz;
    str_sz size3 = str.size();

    // Using the type that str.size() returns
    decltype(str.size()) size4 = str.size();
    return 0;
}
