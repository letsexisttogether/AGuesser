#pragma once

#include <cstdint>
#include <string>

namespace AGSR::Business::Royal::Domain
{
    struct CardDescription
    {
        std::uint32_t ID{};
        std::string Name{};
        std::string Description{};
    };
};
