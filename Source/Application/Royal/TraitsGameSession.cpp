#include "TraitsGameSession.hpp"

#include "UI/TraitsGame/TraitsGameView.hpp"

namespace AGSR::Application::Royal::Sessions
{
    TraitsGameSession::TraitsGameSession(DatabaseConnection& connection)
        : m_DatabaseConnection{ connection }
    {
        const auto ID = m_Provider.GetRandomHeroID();

        m_Game.SetTarget(ID);
        m_Target = std::move(*m_Provider.GetCardTrait(ID));
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

        const auto state = TraitsGameState
        {
            .Name = cardTrait.Name,
            .ElixirCost = { cardTrait.ElixirCost },
            .Targets = { cardTrait.Targets }, 
            .Rarity = { cardTrait.Rarity.Name },
            .Range = { cardTrait.Range.Name },
            .Speed = { cardTrait.Speed.Name }
        };

        UI::Royal::Views::TraitsGameView::Display(state);
    }

    auto TraitsGameSession::IsOver() const noexcept -> bool
    {
        return m_IsOver;
    }
};
