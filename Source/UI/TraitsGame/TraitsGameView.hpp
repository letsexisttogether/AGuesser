#pragma once

#include "Business/Modes/TraitsGame.hpp"

namespace AGSR::UI::Views::Royal
{
    class TraitsGameView final
    {
    public:
        using State = Business::Modes::Trait::Result;

    public:
        static auto Display(const State& state) -> void; 
    };
};
