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
        Game() = default;
        Game(const Game&) = delete;

        auto Start(_Target&& target);

        auto Guess(const _Target& target) const -> _GuessResult; 

        auto operator = (const Game&) -> Game& = delete;

    protected:
        _Target m_Target{};
    };

    #define AGSRBusinessModesGameMethod                                     \
    template <class _Implementation, class _Target, class _GuessResult>     \
        requires (std::is_default_constructible_v<_Target>)                 \
    auto Game<_Implementation, _Target, _GuessResult>::                     \

    AGSRBusinessModesGameMethod Start(_Target&& target)
    {
        m_Target = std::move(target);
    }

    AGSRBusinessModesGameMethod Guess(const _Target& target)
        const -> _GuessResult
    {
        const auto& implementation = static_cast
            <const _Implementation&>(*this);

        return implementation.Guess(target);
    }

    #undef AGSRBusinessModesGameMethod
};
