#pragma once

#include <cstdint>
#include <string_view>

#include "Game2.hpp"
#include "Business/Royal/Domain/Entities/CardTrait.hpp"

namespace AGSR::Business::Modes::Trait
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
        bool IsVictory{};
    };

    class Game : public Modes::Game<Game, Royal::Domain::CardTrait, Result>    
    {
    public:
        using Base = Modes::Game<Game,Royal::Domain::CardTrait, Result>;
        using Target = Royal::Domain::CardTrait;

    public:
        Game() = default;

        auto Guess(const Target& target) -> Result
        {
            const auto isGuessCorrect = m_Target.ID == target.ID;

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
                .IsVictory = isGuessCorrect
            };
        }

    private:
        auto CompareTrait (const auto& targetTrait,
            const auto& guessedTrait) -> AGSR::Business::Modes::Trait::CompResult
        {
            using CompResult = AGSR::Business::Modes::Trait::CompResult;

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
};
