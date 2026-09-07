#include <iostream>
#include <cstdint>

#include <stdexcept>

#include <ASYS/String/StringLiteral.hpp>

#include "DB/Core/SQLite3.hpp"

auto main() -> std::int32_t
{
    std::cout << ASYS::SL{ "Hello, AGuesser" } << std::endl;

    try
    {
        SQLite3::SQLite3DB sqlite3DB{ "Data/AGuesserData.db" };

        SQLite3::BindExec(sqlite3DB);
    }
    catch (std::exception& exp)
    {
        std::cerr << exp.what() << std::endl;
    }

    return EXIT_SUCCESS;
}
