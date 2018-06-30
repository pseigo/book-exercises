/*
 * The testbed is a place for me to play with examples and try new things.
 *
 * Consider this as an unofficial extension to the notes in the readme for a
 * resource of interesting ideas to keep in mind.
*/

#include <iostream>
#include <string>
#include <vector>

using namespace std;

vector<int>::const_iterator binary_search(const vector<int> &vec, int query)
{
    // beg and end denote the range being searched
    auto beg = vec.cbegin(), end = vec.cend();
    auto mid = vec.cbegin() + (end - beg) / 2;

    // while there are still elements to look at and we haven't yet found `query`
    while (mid != end && *mid != query) {
        // shift start/end points
        if (query < *mid) {
            end = mid;
        } else {
            beg = mid + 1;
        }

        // calculate mid-point for the new region
        mid = beg + (end - beg) / 2;
    }
}

int main()
{
    // # CAPITALIZING A STRING
    string s("some string");

    if (s.begin() != s.end()) { // make sure `s` is not empty
        auto it = s.begin();    // `it` denotes the first character in `s`
        *it = toupper(*it);     // make that character uppercase
    }

    cout << s << endl;


    // # ITERATING THROUGH A VECTOR
    // notice: the fifth element is blank
    vector<string> text{"Hey, ", "this ", "is ", "some ", "", "text."};

    // print each line in `text` up to the first blank link
    for (auto it = text.cbegin(); it != text.cend() && !it->empty(); ++it) {
        cout << *it << endl;
    }

    // # BINARY SEARCH WITH ITERATORS
    const int query = 13;
    const vector<int> numbers{-3, 1, 2, 2, 4, 9, 12, 13, 15, 16, 19, 142};

    auto result = binary_search(numbers, query);
    cout << "Query was " << query
         << ", found " + *result << '.'
         << endl;
}
