#include <iostream>
#include "../include/Sales_item.h"

using std::cerr;
using std::cin;
using std::cout;
using std::endl;

int main()
{
    Sales_item total;

    // TODO: is this too confusing or is it clear enough?
    if (!(cin >> total)) {
      cerr << "No data entered." << endl;
      return -1;
    }

    // read `Sales_item`s until ISBN does not match. then, print the total
    Sales_item trans;
    while (cin >> trans) {
        if (trans.isbn() == total.isbn()) {
            total += trans;
        } else {
            cout << total << endl;
            total = trans;
        }
    }

    // print final sum once cin reaches an error state
    cout << total << endl;
    return 0;
}
