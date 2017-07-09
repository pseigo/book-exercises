#include <iostream>
#include <vector>

using namespace std;

int main()
{
    vector<int> v;

    // fill vector with things
    for (int i = 0; i < 10; ++i)
        v.push_back(i);

    // list vector contents
    for (auto i : v)
        cout << i << endl;

    cout << '\n' << '\n';
    
    // initialize v iterators
    auto b = v.begin(), e = v.end();

    // listing vector contents using iterators
    for (auto i = v.begin(); i < v.end(); ++i)
        cout << *i;
    cout << endl;

    /* NOTE: Iterators DIRECTLY access elements in the container! This means we don't access
     * the vector using the bracket v[] notation. When dereferencing the iterator with *i, it
     * returns a reference to the current element.
    */

    // capitalize first char in string (pg.155)
    string s = "some string";
    if (s.begin() != s.end()) { // make sure  s  is not empty.
       auto it = s.begin();     // it  denotes the first character in  s
       *it = toupper(*it);      // make that character uppercase
    }
    
    // NOTE: if container is empty, begin() and end() are BOTH "off the end" iterators.

    // process characters in  s  until we run out of characters or we hit a white-space (pg.156)
    for (auto it = s.begin(); it != s.end() && !isspace(*it); ++it)
        *it = toupper(*it);

    cout << s << endl;

    return 0;
}
