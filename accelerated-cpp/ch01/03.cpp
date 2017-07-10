#include <iostream>
#include <string>

using namespace std;

int main()
{
    { const string s = "a string";
      cout << s << endl; }

    { const std::string s = "another string";
      std::cout << s << std::endl; }

    return 0;
}
