#include <iostream>
#include <string>
#include <vector>

using namespace std;

int main()
{
    vector<string> words;

    // read words
    string word;
    while (cin >> word) {
        words.push_back(word);
    }

    // transform each word to uppercase
    for (auto &word : words) {
        for (auto &c : word) {
            c = toupper(c);
        }
    }

    // print the transformed elements, eight words to a line
    const unsigned words_per_line = 8;
    for (int i = 0; i != words.size(); ++i) {
        cout << words[i] << ' ';

        if ((i+1) % words_per_line == 0) {
            cout << endl;
        }
    }
}
