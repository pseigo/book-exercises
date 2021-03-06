#include <iostream>
#include <string>

using std::cin;         using std::endl;
using std::cout;        using std::string;

int main()
{
    cout << "Pleae enter your first name: ";

    string name;
    cin >> name;

    const string greeting = "Hello " + name + "!";

    const int padVert = 1;
    const int padHori = 20;

    // the number of rows and columns to write
    const int rows = 3 + (padVert * 2);
    const string::size_type cols = greeting.size() + 2 + (padHori * 2);

    // write a blank link to separate output from input
    cout << endl;

    // write  rows  rows of output
    // invariant: we have written  r  rows so far
    for (int r = 0; r != rows; ++r) {

        string::size_type c = 0;

        // invariant: we have written  c  characters so far in the current row
        while (c != cols) {

            // is it time to write the greeting?
            if (r == padVert + 1 && c == padHori + 1) {
                cout << greeting;
                c+= greeting.size();
            } else {

                // are we on the border?
                if (r == 0 || r == rows - 1 ||
                    c == 0 || c == cols - 1)
                    cout << "*";
                else
                    cout << " ";
                ++c;
            }
        }

        cout << endl;
    }

    return 0;
}
