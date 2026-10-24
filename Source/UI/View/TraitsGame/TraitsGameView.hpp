#pragma once

#include "Business/Modes/Traits/Result.hpp"

namespace AGSR::UI::Views::Royal
{
    class TraitsGameView final
    {
    public:
        using State = Business::Modes::Traits::Result;

    public:
        static auto GetInput(const std::string& message) -> std::string;
        static auto Display(const State& state) -> void; 
    };
};
