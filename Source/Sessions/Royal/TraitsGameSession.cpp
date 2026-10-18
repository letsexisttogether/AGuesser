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
        auto result = m_Provider.GetCardTrait(ID);

        if (!result)
        {
            throw std::runtime_error{ "Can't start session" };
        }

        auto& cardTrait = *result;

        Application::GetApplication().GetLogger()
            .Log("Random hero: ", cardTrait.Name, static_cast<std::uint16_t>
            (cardTrait.ElixirCost), cardTrait.CardType, cardTrait.Rarity.Name,
            cardTrait.Targets, cardTrait.Range.Name, cardTrait.Range.Name,
            cardTrait.Speed.Name, cardTrait.ReleaseYear);

        m_Game.Start(std::move(cardTrait));

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
        m_IsOver = guessResult.IsVictory;

        UI::Views::Royal::TraitsGameView::Display(guessResult);
    }

    auto TraitsGameSession::IsOver() const noexcept -> bool
    {
        return m_IsOver;
    }
};
