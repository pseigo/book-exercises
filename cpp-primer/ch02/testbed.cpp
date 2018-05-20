#include <iostream>
#include <vector>
#include <string>

using namespace std;

int main()
{
    // grades and "buckets" for scores
    vector<unsigned> grades = {42, 65, 95, 100, 39, 67, 95, 76, 88, 76, 83, 92, 76, 93};
    vector<unsigned> scores(11, 0);

    for (const unsigned &grade : grades) {
        // IMPORTANT! handle only valid grades
        if (grade <= 100) {
            ++scores[grade / 10];
        }
    }

    // print scores
    for (const int &i : scores) {
        cout << i << ' ';
    }

    return 0;
}
