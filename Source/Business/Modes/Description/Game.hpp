#pragma once

#include "Business/Modes/Game.hpp"
#include "Business/Royal/Domain/Entities/CardDescription.hpp"
#include "Result.hpp"

namespace AGSR::Business::Modes::Description
{
    class Game : public Modes::Game<Game, Royal::Domain::
        CardDescription, Result>    
    {
    public:
        using Base = Modes::Game<Game, Royal::Domain::
            CardDescription, Result>;
        using Target = typename Base::Target;

    public:
        Game() = default;
        Game(const Game&) = delete;

        auto Start(Target&& target);

        auto Guess(const Target& target) const -> Result;

        auto operator = (const Game&) -> Game& = delete;

    private:
        std::string m_Description{};
    };


    inline auto Game::Start(Target&& target)
    {
        m_Description = target.Description;

        Base::Start(std::move(target));
    }

    inline auto Game::Guess(const Target& target) const -> Result
    {
        const auto isGuessCorrect = IsGuessCorrect(target);

        return Result
        {
            .Description = m_Description,
            .IsGuessCorrect = isGuessCorrect
        };
    }
};
