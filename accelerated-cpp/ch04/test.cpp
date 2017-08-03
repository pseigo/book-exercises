#include <iostream>
#include <vector>

using namespace std;

// returns reference to an istream object; the same object we passed in.
// we pass in  in  with type  istream&, modify it, then return a reference
// to that same object

// read homework grades from an input stream into a vector<double>
istream& read_hw(istream& in, vector<double>& hw)
{
    // leave input stream alone if we've already encountered an error or EOF
    if (in) {
        // clear previous contents
        hw.clear();

        // read homework grades
        double x;
        while (in >> x)
            hw.push_back(x);

        // clear stream so input will work for next student
        in.clear();
    }
    return in;
}

int main()
{
    vector<double> homework;


    /* ALTERNATE: (identical to our usage)
     * read_hw(cin, homework);
     * if (cin) { ... }
    */

    if (read_hw(cin, homework)) {

    }

    return 0;
}
