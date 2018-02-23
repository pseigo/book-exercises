#include <iostream>
#include "../include/Sales_item.h"

using std::cerr;
using std::cin;
using std::cout;
using std::endl;

void print_isbn_count(Sales_item item, int count)
{
    cout << count << " transactions recorded for ISBN " << item.isbn() << endl;
}

/*
 * Recorded transactions with common ISBNs must be grouped together; ie. must
 * be inputted together. Any difference in ISBN will reset the counter and
 * write an incorrect value.
*/
int main()
{
    Sales_item last, trans;
    if (!(cin >> last)) {
      cerr << "No data entered." << endl;
      return -1;
    }

    int count = 1; // `last` has already been read
    while (cin >> trans) {
        if (trans.isbn() == last.isbn()) {
            ++count;
        } else {
            print_isbn_count(trans, count);
            count = 1;
        }
    }

    print_isbn_count(trans, count);
    return 0;
}
