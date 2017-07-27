#include <iostream>
#include <string>

using std::cin; using std::cout; using std::cerr; using std::endl;
using std::string;

void printError();

void printMenu();
string getInputShape();
bool getInputShapeFill();
int getInputInteger(string);

void printShape(string, char, int, int, bool);
void printRectangle(char, int, int, bool);
void printTriangle(char, int, bool);

int main()
{
    printMenu();

    // parameters for shape
    int width, height;
    string shape = getInputShape();

    // triangles don't have width
    if (shape != "triangle")
        width = getInputInteger("width");

    // rectangles and triangles are asked for height
    if (shape == "rectangle" || shape == "triangle")
        height = getInputInteger("height");
    else if (shape == "square")
        height = width;

    bool solidFill = getInputShapeFill();

    cout << '\n';
    printShape(shape, '*', width, height, solidFill);

    return 0;
}

void printError(string e)
{
    cerr << "Error: " << e << endl;
    return;
}

void printMenu()
{
    cout << "Type the name of a shape to print. \n"
        << "\t- Square \n"
        << "\t- Rectangle \n"
        << "\t- Triangle \n";
}

string getInputShape()
{
    string input;
    while (true) {
        cout << "Please choose a shape: ";
        getline(cin, input);

        // convert string to lowercase
        for (auto &c : input)
            c = tolower(c);

        if (input != "square" && input != "rectangle" && input != "triangle") {
            printError(input + " is not a valid shape.");
            cout << '\n';
        } else {
            return input;
        }
    }
}

bool getInputShapeFill()
{
    string input;
    while (true) {
        cout << "Should the shape be filled? (Y/N): ";
        getline(cin, input);

        // convert input to lowercase first character
        if (!input.empty())
            input = tolower(input[0]);

        if (input != "y" && input != "n" || input.empty()) {
            printError(input + " is not a valid choice. Please type 'yes' or 'no'.");
            cout << '\n';
        } else {
            break;
        }
    }

    if (input[0] == 'y')
        return true;
    else
        return false;
}

int getInputInteger(string integerName)
{
    int integer;
    while (true) {
        cout << "Please enter " << integerName << ": ";
        cin >> integer;

        cin.clear();
        cin.ignore(INT_MAX, '\n');

        if (!cin.good() || integer <= 0) {
            printError(integerName + " must be a positive integer.");
            cout << '\n';
        } else {
            return integer;
        }
    }
}

// Prints a shape.
void printShape(string shape, char symbol, int width, int height, bool solidFill)
{
    try
    {
        if (shape == "square")
            printRectangle(symbol, width, height, solidFill);
        else if (shape == "rectangle")
            printRectangle(symbol, width, height, solidFill);
        else if (shape == "triangle")
            printTriangle(symbol, height, solidFill);
        else {
            throw "The shape type " + shape + " does not exist.";
        }
    } catch (string e) {
        printError(e);
    }

    return;
}

void printRectangle(char symbol, int width, int height, bool solidFill)
{
    // border at top and bottom of rectangle
    string horizontalBorder(width, symbol);

    // used to fill inside of the rectangle
    string horizontalFillSolid;
    string horizontalFillSpace;

    // width of 1 causes a runtime error
    if (width > 1) {
        horizontalFillSolid = string(width - 2, symbol); // TODO is this syntax acceptable?
        horizontalFillSpace = string(width - 2, ' ');
    }

    for (int row = 0; row != height; ++row) {

        // invariant: we have written  col  columns so far
        int col = 0;
        while (col != width) {

            if (row == 0 || row == height - 1) {
                // top or bottom rows; horizontalBorder
                cout << horizontalBorder;
                col += horizontalBorder.size();
            } else if (col == 0 || col == width - 1) {
                // first or last character of middle rows; single border
                cout << symbol;
                col++;
            } else {
                // non-border character; whitespace or solid fill
                if (solidFill)
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

// TODO rewrite this function to make it readable pls
void printTriangle(char symbol, int height, bool solidFill)
{
    // print triangle
    for (int row = 0; row != height; ++row) {
        // number of symbols and spaces were determined empirically
        int symbols = row * 2 + 1;
        int spaces = height - (row + 1);

        // there are  row + 1  characters in any given row
        int characters = symbols + spaces;

        // solid fill for bottom row
        string bottomRow(characters, symbol);

        for (int col = 0; col < characters; ++col) {
            // are we printing the last row?
            if (row == height - 1) {
                cout << bottomRow;
                break; // finished the row, no more characters to print
            }

            // are we printing any other part of the triangle?
            if (col < spaces) {
                // left-most spaces [col, spaces)
                cout << ' ';
            } else if (col == spaces) {
                // left-most symbol
                cout << symbol;
            } else if (col > spaces && col < characters - 1) {
                // shape fill in between beginning and end symbols
                if (solidFill)
                    cout << symbol;
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

/*
void printTriangle(char symbol, int height, bool solidFill)
{
    // print triangle
    for (int row = 0; row != height; ++row) {
        // number of symbols and spaces were determined empirically
        int symbols = row * 2 + 1;
        int spaces = height - (row + 1);

        // there are  row + 1  characters in any given row
        int characters = symbols + spaces;

        for (int col = 0; col != characters; ++col) {
            // are we printing a space?
            if (col < spaces) // [col, spaces)
                cout << ' ';
            else
                cout << symbol;
        }

        cout << '\n';
    }

    return;
}
*/
