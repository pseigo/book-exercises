#include <iostream>
#include <vector>

using namespace std;

double average(vector<double> vec)
{
    double sum = 0;
    for (auto d : vec)
        sum += d;

    return sum / vec.size();
}

int main()
{
    vector<double> numbers;
    for (int i = 0; i != 10; ++i) {
        numbers.push_back(i);
    }

    cout << "average: " << average(numbers);
    return 0;
}
