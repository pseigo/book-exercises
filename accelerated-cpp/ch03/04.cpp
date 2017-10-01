// Write a program to report the length of the longest and shortest  string  in its input.

#include <algorithm>
#include <iostream>
#include <string>
#include <vector>

using std::min;     using std::max;
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
    string_sz low = words[0].size(), high = low;

    for (auto s : words) {
        string_sz size = s.size();
        
        low = min(low, size);
        high = max(high, size);
    }

    cout << "Longest string: " << high << endl;
    cout << "Shortest string: " << low << endl;

    return 0;
}
