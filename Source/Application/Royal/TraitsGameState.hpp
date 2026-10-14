#pragma once

#include <cstdint>
#include <string_view>

namespace AGSR::Application::Royal::Sessions
{
    enum class TraitGuessState : std::uint8_t
    {
        Incorrent,
        Correct,
        Higher,
        Lower
    };

    template <class _Type>
    struct TraitGuess
    {
        _Type Guess{};
        TraitGuessState State{};
    };

    struct TraitsGameState
    {
        std::string_view Name{};
        TraitGuess<std::uint8_t> ElixirCost{};
        TraitGuess<std::string_view> Targets{};
        TraitGuess<std::string_view> Rarity{};
        TraitGuess<std::string_view> Range{};
        TraitGuess<std::string_view> Speed{};
    };
};
