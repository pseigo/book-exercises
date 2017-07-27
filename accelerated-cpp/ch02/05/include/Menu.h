#ifndef MENU_H
#define MENU_H

#include <iostream>
#include <string>

using std::cin; using std::cout; using std::cerr; using std::endl;
using std::string;

class Menu
{
public:
    void printError(string e);

    void print();
    string getInputShape();
    bool getInputShapeFill();
    int getInputInteger(string);

};

#endif // MENU_H
