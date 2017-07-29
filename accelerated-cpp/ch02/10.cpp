/* Explain each of the uses of std:: in the following program  */

int main()
{
    int k = 0;

    while (k != n) {
        using std::cout;
        cout << "*";
        ++k;
    }

    std::cout << std::endl;
    return 0;
}

/*
 * On line 8: using std::cout;
 *  Using declaration states that we're using
 *  cout from the namespace std. This is only
 *  true within the scope of the declaration,
 *  meaning it will no longer have any effect
 *  after the while loop's block ends.
 *
 * On line 13: std::cout << std::endl;
 *  We must use the scope operator to tell the
 *  compiler we are using cout and endl from
 *  the std namespace. The using declaration
 *  from line 8 has fallen out of scope,
 *  therefore, we must manually tell this to
 *  the compiler.
 */
