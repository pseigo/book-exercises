// Write a program to count how many times each distinct word appears in its input.

#include <algorithm>
#include <iostream>
#include <vector>

using std::cout;    using std::cin;     using std::endl;
using std::string;  using std::vector;  using std::sort;

void printOccurrences(string word, unsigned count)
{
    cout << "'" << word << "' occurred "
        << count;

    // grammar
    if (count == 1)
        cout << " time." << endl;
    else
        cout << " times." << endl;
    return;
}

int main()
{
    // get input, end with newline character
    cout << "Please enter a string of words, followed by a newline." << endl;

    string input;
    getline(cin, input); // ends at newline

    // store each word into a vector
    vector<string> words;
    string word;
    for (string::iterator it = input.begin(); it != input.end(); ++it) {

        // don't include spaces or punctuation, just alpha characters
        if (isalpha(*it)) {
            word += tolower(*it);
        }

        // end of the word, push to vector and clear for next word
        if (!isalpha(*it) || it == input.end() - 1) {

            // we don't want to submit empty strings
            if (!word.empty())
                words.push_back(word);
            word.clear();
        }
    }

    /* takes input until eof or other cin.bad() error
    string input;

    vector<string> words;
    while (cin >> input) {
        string word;
        for (auto &c : input) {
            if (isalpha(c))
                word += tolower(c);
        }

        if (!word.empty())
            words.push_back(word);
    }
    */

    // sort  words  in non-decreasing order
    sort(words.begin(), words.end());

    unsigned count = 1;
    for (vector<string>::iterator it = words.begin(); it != words.end(); ++it) {
        // if on the last word, do not check for the next word
        if (it + 1 == words.end()) {
            printOccurrences(*it, count);
            break;
        }

        auto nextWord = it + 1; // nextWord  is an iterator type
        if (*nextWord == *it) {
            ++count;
        } else {
            printOccurrences(*it, count);
            count = 1;
        }
    }

    return 0;
}
