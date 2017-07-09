#include <iostream>
#include <vector>
#include <string>

int main()
{
    std::vector<std::string> v = {"// a small c++ program", 
        "#include <iostream>", 
        "", 
        "int main()", 
        "{", 
        "\tstd::cout << \"Hello, world!\" << std::endl;", 
        "\treturn 0;", 
        "}"};
    
    for (auto s : v) {
        std::cout << s << std::endl;
    }

    return 0;
}
