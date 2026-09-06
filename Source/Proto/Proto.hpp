#pragma once

#include "DB/Model/Model.hpp"

/*
    1. Choose mode
    2. Read the possbile heroes
    3. Choose a hero
    4. Read the hero data by mode

    Write simple, rewrite with abstraction

    1. Fully develop one mode keeping the possibility
    of adding others later
*/

namespace PIVT
{
    inline auto Random(const std::uint64_t key,
        const std::uint64_t value) noexcept -> decltype(key)
    {
        return value - 1;
    }
};


inline auto GetMode() -> AMDL::Mode
{
    return { 1, "Talents", "Guess the hero by his traits, villains included" };
}
