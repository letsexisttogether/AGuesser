#include "TraitsGameView.hpp"

#include <iomanip>
#include <iostream>
#include <sstream>

namespace
{
    constexpr auto NameWidth = 18;
    constexpr auto CostWidth = 10;
    constexpr auto RarityWidth = 16;
    constexpr auto TypeWidth = 12;
    constexpr auto TargetsWidth = 18;
    constexpr auto RangeWidth = 12;
    constexpr auto SpeedWidth = 12;
    constexpr auto YearWidth = 10;

    template <class _Type>
    using TraitGuess = AGSR::Sessions::Royal::TraitGuess<_Type>;

    template <class _Type>
    auto DisplayGuessedTrait(const TraitGuess<_Type>& guess,
        std::size_t width, bool last = false) -> void
    {
        using GuessState = AGSR::Sessions::Royal::TraitGuessState;

        auto compareSymbol = ' ';

        switch (guess.State)
        {
            case GuessState::Incorrent:
                compareSymbol = '-';
                break;

            case GuessState::Correct:
                compareSymbol = '+';
                break;

            case GuessState::Higher:
                compareSymbol = 'H';
                break;

            case GuessState::Lower:
                compareSymbol = 'L';
                break;
        }

        auto value = std::ostringstream{};
        value << guess.Guess << '(' << compareSymbol << ')';

        std::cout
            << std::left
            << std::setw(static_cast<int>(width))
            << value.str();

        if (!last)
        {
            std::cout << "| ";
        }
    }
}

namespace AGSR::UI::Views::Royal
{
    auto TraitsGameView::Display(const State& state) -> void
    {
        std::cout
            << std::left
            << std::setw(NameWidth)    << "NAME"         << "| "
            << std::setw(CostWidth)    << "COST"         << "| "
            << std::setw(RarityWidth)  << "RARITY"       << "| "
            << std::setw(TypeWidth)    << "TYPE"         << "| "
            << std::setw(TargetsWidth) << "TARGETS"      << "| "
            << std::setw(RangeWidth)   << "RANGE"        << "| "
            << std::setw(SpeedWidth)   << "SPEED"        << "| "
            << std::setw(YearWidth)    << "RELEASE YEAR"
            << '\n';

        std::cout
            << std::left
            << std::setw(NameWidth)
            << state.Name
            << "| ";

        DisplayGuessedTrait(
            state.ElixirCost,
            CostWidth);

        DisplayGuessedTrait(
            state.Rarity,
            RarityWidth);

        DisplayGuessedTrait(
            state.CardType,
            TypeWidth);

        DisplayGuessedTrait(
            state.Targets,
            TargetsWidth);

        DisplayGuessedTrait(
            state.Range,
            RangeWidth);

        DisplayGuessedTrait(
            state.Speed,
            SpeedWidth);

        DisplayGuessedTrait(
            state.ReleaseYear,
            YearWidth,
            true);

        std::cout << "\n\n";

        if (state.IsVictory)
        {
            std::cout << "VICTORY\n";
        }
    }
}
