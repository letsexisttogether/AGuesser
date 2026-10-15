#pragma once

#include "Sessions/Royal/TraitsGameState.hpp"

namespace AGSR::UI::Royal::Views
{
    class TraitsGameView final
    {
    public:
        using State = Sessions::Royal::TraitsGameState;

    public:
        static auto Display(const State& state) -> void; 
    };
};
