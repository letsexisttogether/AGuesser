#include <iostream>
#include <cstdint>

#include <sqlite3.h>
#include <stdexcept>

namespace DB
{
    struct Entity
    {
        std::uint32_t ID{};
    };
};

namespace Model
{
    struct Mode : public DB::Entity
    {
        std::string Name{};
        std::string Description{};
    };
};

/*
    1. Choose mode
    2. Read the possbile heroes
    3. Choose a hero
    4. Read the hero data by mode
*/

auto main() -> std::int32_t
{
    try
    {

        std::cout << "Hello, AGuesser" << std::endl;

        sqlite3* db{};

        if (sqlite3_open("Data/AGuesserData.db", &db))
        {
            throw std::runtime_error{ "[AGuesser] Can't open database" };
        }
    }
    catch (const std::exception& exp)
    {

    }
    /*

    */

    return EXIT_SUCCESS;
}
