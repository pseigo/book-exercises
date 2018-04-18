int main()
{
    int i1 = 1, i2 = 2, *p1 = &i1;

    // change the value of a pointer
    p1 = &i2;

    // change the value to which the pointer points
    *p1 = 42;
    return 0;
}
