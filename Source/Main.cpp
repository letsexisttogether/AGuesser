#include <iostream>
#include <cstdint>

#include <sqlite3.h>
#include <stdexcept>

#include "System/Exception.hpp"

#include <ASYS/String/StringLiteral.hpp>

#include "DB/Core/Core.hpp"

auto main() -> std::int32_t
{
    try
    {
        std::cout << ASYS::SL{ "Hello, AGuesser" } << std::endl;

        sqlite3* db{};

        if (sqlite3_open("Data/AGuesserData.db", &db))
        {
            throw std::runtime_error{ "[AGuesser] Can't open database" };
        }

        constexpr auto a = ASYS::SL<60>{ ASYS::SL{ "Hello" } };
        constexpr auto b = ASYS::SL{ "Hello" };

        auto table = ADB::Table<ASYS::SL{ "Users" }>{};
        constexpr auto nameField = ADB::Field{ ASYS::SL{ "Name" }, 5 };
        constexpr auto emailField = ADB::Field{ ASYS::SL{ "Email" }, 3 };

        constexpr auto query = table.Select(nameField, emailField);

        std::cout << query << std::endl;

        static_assert(a == b, "Not equal");
        static_assert(b == a, "Not equal");

        throw ASYS::Exception{ ASYS::Error{ ASYS::ErrorType::NoEror, 1 } };
    }
    catch (const ASYS::Exception& exp)
    {
        std::cerr << exp.what() << std::endl;
    }
    catch (const std::exception& exp)
    {

    }
    /*

    */

    return EXIT_SUCCESS;
}
