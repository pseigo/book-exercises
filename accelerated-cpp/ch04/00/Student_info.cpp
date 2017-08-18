// source file for Student_info-related functions
#include "Student_info.h"

using std::istream;
using std::vector;

bool compare(const Student_info& s1, const Student_info& s2)
{
    return s1.name < s2.name;
}

istream& read(istream& is, Student_info& s)
{
    // read and store the student's name, midterm, and final exam grades
    is >> s.name >> s.midterm >> s.final;

    // read and store all the student's homework grades
    read_hw(is, s.homework);
    return is;
}

// read homework grades from an input stream into a vector<double>
istream& read_hw(istream& in, vector<double>& hw)
{
    if (in) {
        // clear previous contents
        hw.clear();

        // read homework grades
        double x;
        while (in >> x) // fails when EOF or invalid hw grade
            hw.push_back(x);

        // clear the stream so that input will work for the next student,
        //   we don't care about the failure state so disregard it.
        // for istream objects, clear resets any error indications so input can continue
        in.clear();
    }

    return in;
}
