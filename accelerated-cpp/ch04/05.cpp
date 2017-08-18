#include <algorithm>
#include <iostream>
#include <vector>

using namespace std;

istream& read(istream& in, vector<string>& vec)
{
    if (in) {
        vec.clear();

        string word;
        while (in >> word)
            vec.push_back(word);

        // clear EOF error state
        in.clear();
    }

    return in;
}

void printOccurrences(string word, unsigned count)
{
    cout << "'" << word << "' occurred " << count;

    // grammar
    if (count == 1)
        cout << " time." << endl;
    else
        cout << " times." << endl;
    return;
}

vector<string>::size_type getSize(const vector<string>& vec)
{
    return vec.size();
}

int main()

{
    vector<string> words;
    read(cin, words);

    for (auto s : words)
        cout << s << ' ';
    cout << endl;

    cout << "number of words: " << getSize(words) << endl;

    // ### Recycled solution from exercise 3-3 ###
    // sort  words  in non-decreasing order
    sort(words.begin(), words.end());

    unsigned count = 1;
    for (decltype(words.size()) i = 0; i != words.size(); ++i) {
        // if on the last word, do not check for the next word
        if (i + 1 == words.size()) {
            printOccurrences(words[i], count);
            break;
        }

        if (words[i + 1] == words[i]) {
            ++count;
        } else {
            printOccurrences(words[i], count);
            count = 1; // reset
        }
    }

    return 0;
}
