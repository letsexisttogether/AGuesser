#include "DescriptionGameSession.hpp"

#include "Application/Application.hpp"

namespace AGSR::Sessions::Royal
{
    auto DescriptionGameSession::Start() -> void
    {
        const auto ID = m_Provider.GetRandomHeroID();
        auto result = m_Provider.GetCardDescription(ID);

        if (!result)
        {
            throw std::runtime_error{ "Can't start session" };
        }

        auto& cardDescription = *result;

        Application::GetApplication().GetLogger()
            .Log("Random description: ", cardDescription.Name,
                cardDescription.Description);

        m_Game.Start(std::move(cardDescription));
    }

    auto DescriptionGameSession::ProcessGuess(const std::string& name)
        -> std::optional<Result>
    {
        auto result = m_Provider.GetCardDescription(name);

        if (!result)
        {
            return std::nullopt;
        }

        m_LastGuess = std::move(*result);

        const auto guessResult = std::optional{ m_Game.Guess(m_LastGuess) };
        m_IsOver = guessResult->IsGuessCorrect;

        return guessResult;
    }
    auto DescriptionGameSession::IsOver() const noexcept -> bool
    {
        return m_IsOver;
    }
};
