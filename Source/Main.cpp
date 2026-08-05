#include <iostream>
#include <cstdint>

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

    };
};

auto main() -> std::int32_t
{
    std::cout << "Hello, AGuesser" << std::endl;

    /*
        1. Choose mode
        2. Read the possbile heroes
        3. Choose a hero
        4. Read the hero data by mode
    */

    /*

    */

    return EXIT_SUCCESS;
}
