#include <vector>
#include <string>

using std::vector<int>;
using std::vector<string>;

int main()
{
    vector<int> v1;                 // 0 elements
    vector<int> v2(10);             // 10 elements with value 0
    vector<int> v3(10, 42);         // 10 elements with value 42
    vector<int> v4{10};             // 1 element with value 10
    vector<int> v5{10, 42};         // 2 elements with values 10, 42
    vector<string> v6{10};          // cannot list initialize: 10 elements with value ""
    vector<string> v7{10, "hi"};    // cannot list initialize: 10 elements with value "hi"
}
