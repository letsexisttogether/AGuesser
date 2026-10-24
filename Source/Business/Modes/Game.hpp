#pragma once

#include <type_traits>
#include <algorithm>

namespace AGSR::Business::Modes
{
    template <class _Implementation,
        class _Target, class _GuessResult>
        requires (std::is_default_constructible_v<_Target>)
    class Game
    {
    public:
        using Target = _Target;

    public:
        Game() = default;
        Game(const Game&) = delete;

        auto Start(Target&& target) -> void;

        auto Guess(const Target& target) const -> _GuessResult; 

        auto operator = (const Game&) -> Game& = delete;

    protected:
        auto IsGuessCorrect(const Target& target) const noexcept -> bool;

    protected:
        _Target m_Target{};
    };

    #define AGSRBusinessModesGameMethod                                     \
    template <class _Implementation, class _Target, class _GuessResult>     \
        requires (std::is_default_constructible_v<_Target>)                 \
    auto Game<_Implementation, _Target, _GuessResult>::                     \

    AGSRBusinessModesGameMethod Start(Target&& target) -> void
    {
        m_Target = std::move(target);
    }

    AGSRBusinessModesGameMethod Guess(const Target& target)
        const -> _GuessResult
    {
        const auto& implementation = static_cast
            <const _Implementation&>(*this);

        return implementation.Guess(target);
    }

    AGSRBusinessModesGameMethod IsGuessCorrect(const Target& target)
        const noexcept -> bool
    {
        return m_Target.ID == target.ID;
    }

    #undef AGSRBusinessModesGameMethod
};
