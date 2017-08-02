// Write a program to report the length of the longestand shortest  string  in its input.

#include <iostream>
#include <string>
#include <vector>

using std::cout;    using std::cin;     using std::endl;
using std::string;  using std::vector;

int main()
{
    cout << "Please enter words, separated by whitespace \n"
        << "or a new line. Type  end  when you are finished."
        << endl;

    vector<string> words;
    string input;

    while (cin >> input) {
        if (input == "end")
            break;
        words.push_back(input);
    }

    if (words.empty()) {
        cout << "You must enter at least one word." << endl;
        return -1;
    }

    typedef string::size_type string_sz;
    string_sz min = words[0].size();
    string_sz max = words[0].size();

    for (auto s : words) {
        string_sz size = s.size();

        if (size < min)
            min = size;
        if (size > max)
            max = size;
    }

    cout << "Longest string: " << max << endl;
    cout << "Shortest string: " << min << endl;

    return 0;
}
