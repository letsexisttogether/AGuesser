#pragma once

#include <cstdint>
#include <string_view>

namespace AGSR::Business::Modes::Traits
{
    enum class CompResult : std::uint8_t
    {
        Incorrent,
        Correct,
        Higher,
        Lower
    };

    template <class _Type>
    struct Guess
    {
        _Type Guess{};
        CompResult State{};
    };

    struct Result
    {
        std::string_view Name{};
        Guess<std::uint16_t> ElixirCost{};
        Guess<std::string_view> Rarity{};
        Guess<std::string_view> CardType{};
        Guess<std::string_view> Targets{};
        Guess<std::string_view> Range{};
        Guess<std::string_view> Speed{};
        Guess<std::uint16_t> ReleaseYear{};
        bool IsGuessCorrect{};
    };
};
