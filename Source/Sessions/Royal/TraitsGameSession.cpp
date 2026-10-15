#include "TraitsGameSession.hpp"

#include "Application/Application.hpp"
#include "UI/TraitsGame/TraitsGameView.hpp"

namespace AGSR::Sessions::Royal
{
    TraitsGameSession::TraitsGameSession(DatabaseConnection& connection)
        : m_DatabaseConnection{ connection }
    {}

    auto TraitsGameSession::Start() -> void
    {
        const auto ID = m_Provider.GetRandomHeroID();

        m_Game.SetTarget(ID);
        m_Target = std::move(*m_Provider.GetCardTrait(ID));

        Application::GetApplication().GetLogger()
            .Log("Random hero: ", m_Target.Name, static_cast<std::uint16_t>
            (m_Target.ElixirCost), m_Target.Targets, m_Target.Range.Name,
            m_Target.Range.Name, m_Target.Speed.Name);
    }

    auto TraitsGameSession::ProcessGuess(const std::string& name) -> void
    {
        const auto result = m_Provider.GetCardTrait(name);

        if (!result)
        {
            return;
        }

        const auto& cardTrait = result.value();

        const auto isGuessCorrect = m_Game.IsGuessCorrect(cardTrait.ID);
        m_IsOver = isGuessCorrect;

        auto CompareTrait = [] (const auto& targetTrait,
            const auto& guessedTrait)
        {
            auto CompareRanks = [] (const auto left, const auto right)
            {
                if (left < right)
                {
                    return TraitGuessState::Lower;
                }
                else if (left > right)
                {
                    return TraitGuessState::Higher;
                }

                return TraitGuessState::Correct;
            };

            if constexpr (requires { targetTrait.Rank && guessedTrait.Rank; })
            {
                return CompareRanks(targetTrait.Rank, guessedTrait.Rank);
            }
            else if (requires { targetTrait < guessedTrait; })
            {
                return CompareRanks(targetTrait, guessedTrait);
            }
            else
            {
                return ((targetTrait == guessedTrait) ?
                    (TraitGuessState::Correct) 
                    : (TraitGuessState::Incorrent));
            }
        };

        const auto state = TraitsGameState
        {
            .Name = cardTrait.Name,
            .ElixirCost = 
            { 
                cardTrait.ElixirCost,
                CompareTrait(m_Target.ElixirCost, cardTrait.ElixirCost)
            },
            .Targets =
            {
                cardTrait.Targets,
                CompareTrait(m_Target.Targets, cardTrait.Targets)
            }, 
            .Rarity = 
            { 
                cardTrait.Rarity.Name,
                CompareTrait(m_Target.Rarity, cardTrait.Rarity)
            },
            .Range = 
            { 
                cardTrait.Range.Name,
                CompareTrait(m_Target.Range, cardTrait.Range)
            },
            .Speed =
            {
                cardTrait.Speed.Name,
                CompareTrait(m_Target.Speed, cardTrait.Speed)
            },
            .ReleaseYear =
            {
                cardTrait.ReleaseYear, 
                CompareTrait(m_Target.ReleaseYear, cardTrait.ReleaseYear)
            },
            .IsVictory = isGuessCorrect
        };

        UI::Views::Royal::TraitsGameView::Display(state);
    }

    auto TraitsGameSession::IsOver() const noexcept -> bool
    {
        return m_IsOver;
    }
};
