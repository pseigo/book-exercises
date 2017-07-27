#include "../include/Menu.h"

void Menu::printError(string e)
{
    cerr << "Error: " << e << endl;
    return;
}

// main menu explaining shapes to user
void Menu::print()
{
    cout << "Type the name of a shape to print. \n"
        << "\t- Square \n"
        << "\t- Rectangle \n"
        << "\t- Triangle \n";
}

// user chooses which shape to generate
string Menu::getInputShape()
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

// user chooses if the shape should be filled
bool Menu::getInputShapeFill()
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

// user chooses a positive whole number
int Menu::getInputInteger(string integerName)
{
    int integer;
    while (true) {
        cout << "Please enter " << integerName << ": ";
        cin >> integer;

        cin.clear();
        cin.ignore(INT_MAX, '\n');

        if (!cin.good() || integer <= 0) {
            printError(integerName + " must be a positive whole number.");
            cout << '\n';
        } else {
            return integer;
        }
    }
}
