#include <iostream>
#include <string>
#include <vector>

using namespace std;

void print_info(const vector<int> &vec)
{
    cout << "Size: " << vec.size() << '\n'
         << "Contents: ";

    for (auto i : vec) {
        cout << i << ' ';
    }

    cout << '\n' << endl;
}

void print_info(const vector<string> &vec)
{
    cout << "Size: " << vec.size() << '\n'
         << "Contents: ";

    for (auto s : vec) {
        cout << s << ' ';
    }

    cout << '\n' << endl;
}

int main()
{
    // Vectors from exercise 3.13 and predictions:
    vector<int> v1;                 // 0 elements
    vector<int> v2(10);             // 10 elements with value 0
    vector<int> v3(10, 42);         // 10 elements with value 42
    vector<int> v4{10};             // 1 element with value 10
    vector<int> v5{10, 42};         // 2 elements with values 10, 42
    vector<string> v6{10};          // cannot list initialize: 10 elements with value ""
    vector<string> v7{10, "hi"};    // cannot list initialize: 10 elements with value "hi"

    // Exercise 3.16:
    print_info(v1);
    print_info(v2);
    print_info(v3);
    print_info(v4);
    print_info(v5);
    print_info(v6);
    print_info(v7);

    // Conclusion: predictions were correct.
}
