#pragma once

#include "Sessions/Royal/TraitsGameState.hpp"

namespace AGSR::UI::Views::Royal
{
    class TraitsGameView final
    {
    public:
        using State = Sessions::Royal::TraitsGameState;

    public:
        static auto Display(const State& state) -> void; 
    };
};
