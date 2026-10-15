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

        const auto state = TraitsGameState
        {
            .Name = cardTrait.Name,
            .ElixirCost = { cardTrait.ElixirCost },
            .Targets = { cardTrait.Targets }, 
            .Rarity = { cardTrait.Rarity.Name },
            .Range = { cardTrait.Range.Name },
            .Speed = { cardTrait.Speed.Name },
            .IsVictory = isGuessCorrect
        };

        UI::Views::Royal::TraitsGameView::Display(state);
    }

    auto TraitsGameSession::IsOver() const noexcept -> bool
    {
        return m_IsOver;
    }
};
