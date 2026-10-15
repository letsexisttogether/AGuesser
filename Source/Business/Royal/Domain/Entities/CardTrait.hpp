#pragma once

#include <cstdint>
#include <string>

namespace AGSR::Business::Royal::Domain
{
    struct CardRarity
    {
        std::string Name{};
        std::uint8_t Rank{};
    };

    struct CardRange
    {
        std::string Name{};
        std::uint8_t Rank{};
    };

    struct CardSpeed
    {
        std::string Name{};
        std::uint8_t Rank{};
    };

    /**
    * @brief
    */
    struct CardTrait
    {
        std::uint32_t ID{};
        std::string Name{};
        std::uint16_t ElixirCost{};
        std::string Targets{};
        CardRarity Rarity{};
        CardRange Range{};
        CardSpeed Speed{};
        std::uint16_t ReleaseYear{};
    };
};
