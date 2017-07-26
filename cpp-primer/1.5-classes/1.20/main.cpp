
#include <iostream>
#include "include/Sales_item.h"

using namespace std;

int main()
{
  // read ISBN, number of copies sold, and sales price
  // write ISBN, number of copies sold, total revenue, and average price

  for (Sales_item book; cin >> book; cout << book << endl);
  return 0;

  /*
   * declares object 'book' with type 'Sales_item'
   * as long as the condition is met, the loop will run. this condition is that there must be input into book
   * at the end of the loop, it will write the value of book
  */
}
