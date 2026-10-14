#pragma once

#include "Application/Royal/TraitsGameState.hpp"

namespace AGSR::UI::Royal::Views
{
    class TraitsGameView final
    {
    public:
        using State = Application::Royal::Sessions::TraitsGameState;

    public:
        static auto Display(const State& state) -> void; 
    };
};
