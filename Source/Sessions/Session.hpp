#pragma once 

#include <string>
#include <optional>
#include <stdexcept>

namespace AGSR::Sessions
{
    template <class _Game, class _Result, class _Provider>
    class Session
    {
    public:
        Session() = default;
        Session(const Session&) = delete;

        auto Start() -> void;

        auto ProcessGuess(const std::string& name)
            -> std::optional<_Result>;

        auto IsOver() const noexcept -> bool;

        auto operator = (const Session&) -> Session& = delete;

    private:
        _Game m_Game{};
        _Game::Target m_LastGuess{};
        _Provider m_Provider{};
        bool m_IsOver{};
    };

    #define AGSRSessionsSessionMethod                               \
        template <class _Game, class _Result, class _Provider>      \
    auto Session<_Game, _Result, _Provider>::

    AGSRSessionsSessionMethod Start() -> void
    {
        const auto ID = m_Provider.GetRandomHeroID();
        auto result = m_Provider.GetCardInfo(ID);

        if (!result)
        {
            throw std::runtime_error{ "Can't start session" };
        }

        m_Game.Start(std::move(*result));
    }

    AGSRSessionsSessionMethod ProcessGuess(const std::string& name)
        -> std::optional<_Result>
    {
        auto result = m_Provider.GetCardInfo(name);

        if (!result)
        {
            return std::nullopt;
        }

        m_LastGuess = std::move(*result);

        const auto guessResult = std::optional{ m_Game.Guess(m_LastGuess) };
        m_IsOver = guessResult->IsGuessCorrect;

        return guessResult;
    }

    AGSRSessionsSessionMethod IsOver() const noexcept -> bool
    {
        return m_IsOver;
    }
};
