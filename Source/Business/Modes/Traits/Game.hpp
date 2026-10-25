#pragma once

#include "Application/Application.hpp"
#include "Business/Modes/Game.hpp"
#include "Business/Royal/Domain/Entities/CardTrait.hpp"
#include "Result.hpp"

namespace AGSR::Business::Modes::Traits
{
    class Game : public Modes::Game<Game, Royal::Domain::CardTrait, Result>    
    {
    public:
        using Base = Modes::Game<Game, Royal::Domain::CardTrait, Result>;
        using Target = typename Base::Target;

    public:
        Game() = default;
        Game(const Game&) = delete;

        auto Start(Target&& target) -> void;

        auto Guess(const Target& target) const -> Result;

        auto operator = (const Game&) -> Game& = delete;

    private:
        auto CompareTrait (const auto& targetTrait,
            const auto& guessedTrait) const noexcept -> CompResult;
    };


    inline auto Game::Start(Target&& target) -> void
    {
        Application::GetApplication().GetLogger()
            .Log("Random hero: ", target.Name, static_cast<std::uint16_t>
            (target.ElixirCost), target.CardType, target.Rarity.Name,
            target.Targets, target.Range.Name, target.Range.Name,
            target.Speed.Name, target.ReleaseYear);

        Base::Start(std::move(target));
    }

    inline auto Game::Guess(const Target& target) const -> Result
    {
        const auto isGuessCorrect = IsGuessCorrect(target);

        return Result
        {
            .Name = target.Name,
            .ElixirCost = 
            { 
                target.ElixirCost,
                CompareTrait(m_Target.ElixirCost, target.ElixirCost)
            },
            .Rarity = 
            { 
                target.Rarity.Name,
                CompareTrait(m_Target.Rarity, target.Rarity)
            },
            .CardType = 
            { 
                target.CardType,
                CompareTrait(m_Target.CardType, target.CardType)
            },
            .Targets =
            {
                target.Targets,
                CompareTrait(m_Target.Targets, target.Targets)
            }, 
            .Range = 
            { 
                target.Range.Name,
                CompareTrait(m_Target.Range, target.Range)
            },
            .Speed =
            {
                target.Speed.Name,
                CompareTrait(m_Target.Speed, target.Speed)
            },
            .ReleaseYear =
            {
                target.ReleaseYear, 
                CompareTrait(m_Target.ReleaseYear, target.ReleaseYear)
            },
            .IsGuessCorrect= isGuessCorrect
        };
    }

    auto Game::CompareTrait (const auto& targetTrait,
        const auto& guessedTrait) const noexcept -> CompResult
    {
        auto CompareRanks = [] (const auto left, const auto right)
        {
            if (left < right)
            {
                return CompResult::Lower;
            }
            else if (left > right)
            {
                return CompResult::Higher;
            }

            return CompResult::Correct;
        };

        if constexpr (requires { targetTrait.Rank && guessedTrait.Rank; })
        {
            return CompareRanks(targetTrait.Rank, guessedTrait.Rank);
        }
        else if (std::is_same_v<std::remove_cvref_t<decltype
                (targetTrait)>, std::string>)
        {
            return ((targetTrait == guessedTrait) ?
                (CompResult::Correct) 
                : (CompResult::Incorrent));
        }
        else if (requires { targetTrait < guessedTrait; })
        {
            return CompareRanks(targetTrait, guessedTrait);
        }

        return CompResult::Incorrent;
    }
};
