#include <iostream>
#include <string>

#include "../include/Menu.h"
#include "../include/Shape.h"

using std::cin; using std::cout; using std::cerr; using std::endl;
using std::string;

int main()
{
    // initalize and print the main menu
    Menu menu;
    menu.print();

    // ask user for a shape
    string shape = menu.getInputShape();

    // get parameters for chosen shape and print the shape
    try
    {
        if (shape == "square" || shape == "rectangle") {
            Rectangle rect;

            int width = menu.getInputInteger("width");
            rect.setWidth(width);

            // only ask for height if the shape is NOT a square
            if (shape == "square")
                rect.setHeight(width);
            else
                rect.setHeight(menu.getInputInteger("height"));

            rect.setSolidFill(menu.getInputShapeFill());

            cout << '\n';
            rect.print();
        } else if (shape == "triangle") {
            Triangle tri;

            tri.setHeight(menu.getInputInteger("height"));
            tri.setSolidFill(menu.getInputShapeFill());

            cout << '\n';
            tri.print();
        } else {
            throw "The shape type " + shape + " does not exist.";
            return -1;
        }
    } catch (string e) {
        menu.printError(e);
    }

    return 0;
}
