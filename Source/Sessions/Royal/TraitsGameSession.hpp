#pragma once 

#include "Business/Modes/Game.hpp"
#include "Business/Royal/Providers/TraitsGameProvider.hpp"
#include "TraitsGameState.hpp"

namespace AGSR::Sessions::Royal
{
    class TraitsGameSession
    {
    public:
        using DatabaseConnection = sqlpp::sqlite3::connection;
        using State = TraitsGameState;

    public:
        TraitsGameSession(DatabaseConnection& connection);

        auto ProcessGuess(const std::string& name) -> void;

        auto IsOver() const noexcept -> bool;
        
    private:
        DatabaseConnection& m_DatabaseConnection;
        Business::Modes::Game<std::uint32_t> m_Game{};
        Business::Royal::Providers::TraitsGameProvider m_Provider
        {
            m_DatabaseConnection
        };
        Business::Royal::Domain::CardTrait m_Target{};
        bool m_IsOver{};
    };
};
