/*
 *  EXERCISE 2.4
 * The framing program writes the mostly blank lines
 * that separate the borders from the greeting one
 * character at a time. Change the program so that it
 * writes all the spaces needed in a single output
 * expression.
 *
 * I'm not happy with this solution and might rewrite
 * it someday. The five nested blocks make me die
 * a little inside.
*/

#include <iostream>
#include <string>

// say what standard-library names we use
using std::cin;         using std::endl;
using std::cout;        using std::string;

int main()
{
    // ask for the person's name
    cout << "Please enter your first name: ";

    // read the name
    string name;
    cin >> name;

    // build the message that we intend to write
    const string greeting = "Hello, " + name + "!";

    // the number of blanks surrounding the greeting
    const int pad = 1;

    // the number of rows and columns to write
    const int rows = 3 + (pad * 2);
    const string::size_type cols = greeting.size() + 2 + (pad * 2);

    // padding to the left and right of greeting
    const string padGreeting(pad, ' ');

    // padding above and below the greeting
    const string padFullRow(cols - 2, ' ');

    // write a blank link to separate output from input
    cout << endl;

    // write  rows  rows of output
    // invariant: we have written  r  rows so far
    for (int r = 0; r != rows; ++r) {

        string::size_type c = 0;

        // invariant: we have written  c  characters so far in the current row
        while (c != cols) {

            //cout << "R: " << r << "\tc: " << c << endl;

            // is it time to write the greeting?
            if (r == pad + 1 && c == pad + 1) {
                cout << greeting;
                c+= greeting.size();
            } else {
                string spaces(cols - 2, ' ');

                // are we on the border?
                if (r == 0 || r == rows - 1 ||
                    c == 0 || c == cols - 1) {
                    cout << "*";
                    ++c;
                } else {

                    // are we on the greeting line?
                    if (r == pad + 1) {
                        // write padding between border and greeting
                        cout << padGreeting;
                        c += padGreeting.size();
                    } else {
                        // write completely blank row; above and below greeting
                        cout << padFullRow;
                        c += padFullRow.size();
                    }
                }
            }

        } // end of column loop

        cout << endl;
    } // end of row loop

    return 0;
}
