#include "../include/Shape.h"

void Shape::setSolidFill(bool solidFill)
{
    _solidFill = solidFill;
}

void Shape::setSymbol(char symbol)
{
    _symbol = symbol;
}

// ############ Rectangle ############
Rectangle::Rectangle()
{
    reset();
    return;
}

Rectangle::Rectangle(char symbol, bool solidFill, int width, int height)
{
    _symbol = symbol;   _solidFill = solidFill;
    _width = width;     _height = height;
    return;
}

void Rectangle::reset()
{
    _symbol = '*';
    _solidFill = false;
    _width = 10;
    _height = 3;
    return;
}

void Rectangle::setWidth(int width)
{
    _width = width;
}

void Rectangle::setHeight(int height)
{
    _height = height;
}

void Rectangle::print()
{
    // border at top and bottom of rectangle
    string horizontalBorder(_width, _symbol);

    // used to fill inside of the rectangle
    string horizontalFillSolid;
    string horizontalFillSpace;

    // width of 1 has no inside fill
    if (_width > 1) {
        horizontalFillSolid = string(_width - 2, _symbol); // TODO is this syntax acceptable?
        horizontalFillSpace = string(_width - 2, ' ');
    }

    for (int row = 0; row != _height; ++row) {

        // invariant: we have written  col  columns so far
        int col = 0;
        while (col != _width) {

            if (row == 0 || row == _height - 1) {
                // top or bottom rows; horizontalBorder
                cout << horizontalBorder;
                col += horizontalBorder.size();
            } else if (col == 0 || col == _width - 1) {
                // first or last character of middle rows; single border
                cout << _symbol;
                col++;
            } else {
                // non-border character; whitespace or solid fill
                if (_solidFill)
                    cout << horizontalFillSolid;
                else
                    cout << horizontalFillSpace;

                // TODO make this more generic? size is common to both space and solid
                col += horizontalFillSpace.size();
            }
        }

        // end of row
        cout << '\n';
    }

    return;
}

// ############ Triangle ############
Triangle::Triangle()
{
    reset();
    return;
}

Triangle::Triangle(char symbol, bool solidFill, int height)
{
    _symbol = symbol;   _solidFill = solidFill;
    _height = height;
    return;
}

void Triangle::reset()
{
    _symbol = '*';
    _solidFill = false;
    _height = 10;
    return;
}

void Triangle::setHeight(int height)
{
    _height = height;
}

// TODO rewrite this function to make it readable pls
void Triangle::print()
{
    // print triangle
    for (int row = 0; row != _height; ++row) {
        // number of symbols and spaces were determined empirically
        int symbols = row * 2 + 1;
        int spaces = _height - (row + 1);

        // there are  row + 1  characters in any given row
        int characters = symbols + spaces;

        // solid fill for bottom row
        string bottomRow(characters, _symbol);

        for (int col = 0; col < characters; ++col) {
            // are we printing the last row?
            if (row == _height - 1) {
                cout << bottomRow;
                break; // finished the row, no more characters to print
            }

            // are we printing any other part of the triangle?
            if (col < spaces) {
                // left-most spaces [col, spaces)
                cout << ' ';
            } else if (col == spaces) {
                // left-most symbol
                cout << _symbol;
            } else if (col > spaces && col < characters - 1) {
                // shape fill in between beginning and end symbols
                if (_solidFill)
                    cout << _symbol;
                else
                    cout << ' ';
            } else {
                cout << '*'; // right-most symbol, end of row
            }
        } // end of column loop for current row

        cout << '\n';
    }

    return;
}
