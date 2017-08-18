#include <algorithm>    // max
#include <cmath>        // pow
#include <iostream>     // cout, endl
#include <iomanip>      // setw
#include <string>       // string::size_type, to_string
#include <vector>       // vector

using namespace std;

string::size_type lengthOf(int i)
{
    return to_string(i).size();
}

int main()
{
    vector<int> squares;
    // [minVal, maxVal)
    int minVal = -10,
        maxVal = 30 + 1;

    typedef string::size_type str_sz;
    str_sz valWidth = 0;
    str_sz squareWidth = 0;

    // populate  squares  with squares of each value up to  maxVal
    for (int i = minVal; i != maxVal; ++i) {
        int square = pow(i, 2);

        valWidth = max(valWidth, lengthOf(i));
        squareWidth = max(squareWidth, lengthOf(square));

        squares.push_back(square);
    }

    string padding(2, ' ');

    // print table headers
    cout << setw(valWidth) << "val" << padding
         << setw(squareWidth) << "square" << endl;

    typedef vector<int>::size_type vec_sz;
    vec_sz size = squares.size();

    for (int i = minVal; i != maxVal; ++i) {
        cout << setw(valWidth) << i << padding
             << setw(squareWidth) << squares[i - minVal] // index must start at 0
             << endl;
    }

    return 0;
}
