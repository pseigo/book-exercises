/*
 * Replacing all letters in a string with 'x'. I prefer
 * the range based for loop or maybe even the while loop.
 * Ranged based is really short and easy to read. I prefer
 * the while loop over the for because it's easier to
 * digest IMO what's going on. Plus it fulfills the idea
 * that we should use while loops when we DON'T know how
 * many times we'll be looping for.
*/

#include <iostream>
#include <string>

using std::string;
using std::getline;
using std::cin;
using std::cout;
using std::endl;


string rangeBasedLoop(string s);
string whileLoop(string s);
string forLoop(string s);
void noPunc();

int main()
{
    string str = "Hello, World!";

    cout << rangeBasedLoop(str) << endl; // favourable #1
    cout << whileLoop(str) << endl; // favourable #2
    cout << forLoop(str) << endl; // favourable #3

    //noPunc();

    const char ca[] = {'h', 'e', 'l', 'l', 'o'};
    const char *cp = ca;
    while (*cp) {
        cout << *cp;
        cp++;
    }

    return 0;
}


string rangeBasedLoop(string s)
{
    if (!s.empty()) {
        for (auto &c : s) c = 'x'; // auto &c = char &c
    }

    return s;
}

string whileLoop(string s)
{
    if (!s.empty()) {
        decltype(s.size()) i = 0;

        while (i < s.size()) {
            s[i++] = 'x';
        }
    }

    return s;
}

string forLoop(string s)
{
    if (!s.empty()) {
        decltype(s.size()) i = 0;
        for (i = 0; i < s.size(); i++) {
            s[i] = 'x';
        }
    }

    return s;
}

void noPunc()
{
    cout << "Enter a string of characters including punctuation." << endl;
    string s;
    while (getline(cin, s)) {
        for (auto &c : s)
            if (!ispunct(c)) cout << c;
        cout << endl;
    }
}
