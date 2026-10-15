#include "TraitsGameView.hpp"

#include <iostream>

namespace
{
    template <class _Type>
    using TraitGuess = AGSR::Sessions::Royal::TraitGuess<_Type>;

    template <class _Type>
    auto DisplayGuessedTrait(const TraitGuess<_Type>& guess,
        const char* const separator) -> void;
};

namespace AGSR::UI::Views::Royal
{
    auto TraitsGameView::Display(const State& state) -> void
    {
        constexpr auto separator = " | ";

        std::cout << state.Name << separator;
        DisplayGuessedTrait(state.ElixirCost, separator);
        DisplayGuessedTrait(state.Targets, separator);
        DisplayGuessedTrait(state.Rarity, separator);
        DisplayGuessedTrait(state.Range, separator);
        DisplayGuessedTrait(state.Speed, "\n");

        if (state.IsVictory)
        {
            std::cout << "VICTORY" << '\n';
        }
    }
};

namespace
{
    template <class _Type>
    auto DisplayGuessedTrait(const TraitGuess<_Type>& guess,
        const char* const separator) -> void
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

        std::cout << guess.Guess << '(' << compareSymbol << ')'
            << separator;
    }
};
