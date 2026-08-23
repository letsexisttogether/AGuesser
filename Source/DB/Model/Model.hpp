#pragma once

#include <string>

#include "DB/Core/Core.hpp"

namespace AMDL 
{
    struct Mode : public ADB::Entity
    {
        std::string Name{};
        std::string Description{};
    };
};
