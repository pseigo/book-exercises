#include <algorithm>    // max
#include <cmath>        // pow
#include <ios>          // streamsize
#include <iostream>     // cout, endl
#include <iomanip>      // setw, precision, setprecision
#include <string>       // string::size_type, to_string
#include <vector>       // vector

using namespace std;

int lengthOf(double i)
{
    int length = 1;

    // negative symbol
    if (i < 0)
        length++;

    // decimal
    if (i - (int)i != 0)
        ++length;

    // integer width
    int count = 0;
    while (i > 10) {
        i /= 10.0;
        ++count;
    }
    length += count;

    return length;
}

int main()
{
    vector<double> squares;
    // [minVal, maxVal)
    double step = 0.05,
           minVal = 0,
           maxVal = 1;

    int valWidth = 0,
        squareWidth = 0;

    // populate  squares  with squares of each value up to  maxVal
    for (double i = minVal; i < maxVal; i += step) {
        double square = pow(i, 2);

        valWidth = max(valWidth, lengthOf(i));
        squareWidth = max(squareWidth, lengthOf(square));

        squares.push_back(square);
    }

    int precision = 4;

    // account for significant decimals
    valWidth += precision;
    squareWidth += precision;

    string padding(2, ' ');

    // print table headers
    cout << setw(valWidth) << "val" << padding
         << setw(squareWidth) << "square" << endl;

    int count = 0;
    for (double i = minVal; i < maxVal; i += step) {
        streamsize prec = cout.precision();
        cout << setprecision(precision) << setw(valWidth)
             << i << padding << setw(squareWidth)
             << squares[count]
             << setprecision(prec) << endl;
        ++count;
    }

    return 0;
}
