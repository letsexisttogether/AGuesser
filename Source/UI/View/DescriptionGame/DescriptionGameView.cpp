#include "DescriptionGameView.hpp"

#include <iostream>

namespace AGSR::UI::Views::Royal
{
    auto DescriptionGameView::GetInput(const std::string& message)
        -> std::string
    {
        std::cout << message;

        auto buffer = std::string{};

        std::getline(std::cin, buffer);
        std::cout << '\n';

        return buffer;
    }

    auto DescriptionGameView::Display(const State& state) -> void
    {
        std::cout << state.Description << "\n\n";

        if (state.IsGuessCorrect)
        {
            std::cout << "VICTORY\n";
        }
    }
}
