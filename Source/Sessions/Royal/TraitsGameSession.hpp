#pragma once 

#include "Business/Modes/Traits/Game.hpp"
#include "Business/Royal/Providers/TraitsGameProvider.hpp"

namespace AGSR::Sessions::Royal
{
    class TraitsGameSession
    {
    public:
        using DatabaseConnection = sqlpp::sqlite3::connection;

    public:
        TraitsGameSession(DatabaseConnection& connection);

        auto Start() -> void;

        auto ProcessGuess(const std::string& name) 
            -> std::optional<Business::Modes::Traits::Result>;

        auto IsOver() const noexcept -> bool;
        
    private:
        Business::Modes::Traits::Game m_Game{};
        Business::Modes::Traits::Game::Target m_LastGuess{};
        Business::Royal::Providers::TraitsGameProvider m_Provider;
        bool m_IsOver{};
    };
};
