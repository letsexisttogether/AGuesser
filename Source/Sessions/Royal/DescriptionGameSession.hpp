#pragma once

#include "Business/Modes/Description/Game.hpp"
#include "Business/Royal/Providers/TraitsGameProvider.hpp"

namespace AGSR::Sessions::Royal
{
    class DescriptionGameSession
    {
    public:
        using Game = Business::Modes::Description::Game;
        using Result = Business::Modes::Description::Result;
        using Provider = Business::Royal::Providers::TraitsGameProvider;

    public:
        DescriptionGameSession() = default;
        DescriptionGameSession(const DescriptionGameSession&) = delete;

        auto Start() -> void;

        auto ProcessGuess(const std::string& name) -> std::optional<Result>;

        auto IsOver() const noexcept -> bool;

        auto operator = (const DescriptionGameSession&)
            -> DescriptionGameSession& = delete;
        
    private:
        Game m_Game{};
        Game::Target m_LastGuess{};
        Provider m_Provider{};
        bool m_IsOver{};
    };
};
