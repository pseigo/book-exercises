#include <stdexcept>
#include <vector>

#include "grade.h"
#include "median.h"
#include "Student_info.h"

using std::domain_error;
using std::vector;

// compute a student's overall grade from midterm, final exam, and homework grade
double grade(double midterm, double final, double homework)
{
    return 0.2 * midterm + 0.4 * final + 0.4 * homework;
}

// compute a student's overall grade from midterm, final exam grades,
// and vector of homework grades.
double grade(double midterm, double final, const vector<double>& hw)
{
    if (hw.size() == 0)
        throw domain_error("student has no homework records");
    return grade(midterm, final, median(hw));
}

double grade(const Student_info& s)
{
    return grade(s.midterm, s.final, s.homework);
}

// homework is not a factor in calculating grade
double grade(double midterm, double final)
{
    return (1/3) * midterm + (2/3) * final;
}
