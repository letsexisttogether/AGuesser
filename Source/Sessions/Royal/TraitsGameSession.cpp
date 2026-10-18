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
        auto cardTrait = m_Provider.GetCardTrait(ID);

        if (!cardTrait)
        {
            throw std::runtime_error{ "Can't start session" };
        }

        m_Game.Start(std::move(*cardTrait));

        /*
        Application::GetApplication().GetLogger()
            .Log("Random hero: ", m_Target.Name, static_cast<std::uint16_t>
            (m_Target.ElixirCost), m_Target.CardType, m_Target.Rarity.Name,
            m_Target.Targets, m_Target.Range.Name, m_Target.Range.Name,
            m_Target.Speed.Name, m_Target.ReleaseYear);
        */
    }

    auto TraitsGameSession::ProcessGuess(const std::string& name) -> void
    {
        const auto result = m_Provider.GetCardTrait(name);

        if (!result)
        {
            return;
        }

        const auto& cardTrait = *result;

        const auto guessResult = m_Game.Guess(cardTrait);

        // UI::Views::Royal::TraitsGameView::Display(state);
    }

    auto TraitsGameSession::IsOver() const noexcept -> bool
    {
        return m_IsOver;
    }
};
