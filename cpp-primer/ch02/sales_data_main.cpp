#include <iostream>
#include <string>
#include "Sales_data.h"

int main()
{
    Sales_data data1, data2;

    // price per book
    double price = 0;

    // read ISBN, number of books sold, price per book
    std::cin >> data1.bookNo >> data1.units_sold >> price;
    data1.revenue = data1.units_sold * price;

    std::cin >> data2.bookNo >> data2.units_sold >> price;
    data2.revenue = data2.units_sold * price;

    if (data1.bookNo == data2.bookNo) {
        unsigned totalCnt = data1.units_sold + data2.units_sold;
        double totalRevenue = data1.revenue + data2.revenue;

        // data1 and data2 have the same bookNo
        std::cout << data1.bookNo << " " << totalCnt
                  << " " << totalRevenue << " ";

        // print average revenue per book
        if (totalCnt != 0) {
            std::cout << totalRevenue/totalCnt << std::endl;
        } else {
            std::cout << "(no sales)" << std::end;
        }
    } else {
        std::cerr << "Data must refer to the same ISBN"
                  << std::endl;
        return -1;
    }

    return 0;
}
