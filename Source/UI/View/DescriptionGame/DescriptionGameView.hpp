#pragma once

#include "Business/Modes/Description/Result.hpp"

namespace AGSR::UI::Views::Royal
{
    class DescriptionGameView final
    {
    public:
        using State = Business::Modes::Description::Result;

    public:
        static auto GetInput(const std::string& message) -> std::string;
        static auto Display(const State& state) -> void; 
    };
};
