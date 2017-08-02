#include <iostream>
#include <string>
#include <vector>

using std::cout;    using std::cin;     using std::endl;
using std::string;  using std::vector;

int main()
{
    const vector<int>::size_type assignmentCount = 3;

    vector<string> studentNames = {"Bob", "Syed", "Sal"};
    vector<int> studentGrades = {45, 46, 47,
                                48, 49, 50,
                                51, 52, 53};

    vector<int>::size_type i = 0;
    for (auto s : studentNames) {
        cout << "Grades for student: " << s << endl;

        int maxIndex = i + assignmentCount;
        for (i; i != maxIndex; ++i) {
            cout << studentGrades[i] << endl;
        }
    }
}
