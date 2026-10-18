#include "Game.hpp"

namespace AGSR::Business::Modes::Traits
{
    auto Game::Guess(const Target& target) const -> Result
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
};
