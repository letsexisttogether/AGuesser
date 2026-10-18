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

        /**
        * @brief Starts the general part of the game 
        * @details It's defined here for now, not forever
        */
        auto Start(_Target&& target)
        {
            m_Target = std::move(target);
        }

        auto operator = (const Game&) -> Game& = delete;

    protected:
        _Target m_Target{};
    };
};
