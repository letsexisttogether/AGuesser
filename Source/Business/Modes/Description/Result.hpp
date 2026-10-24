#pragma once

#include <string_view>

namespace AGSR::Business::Modes::Description
{
    struct Result
    {
        std::string_view Description{};
        bool IsGuessCorrect{};
    };
};
