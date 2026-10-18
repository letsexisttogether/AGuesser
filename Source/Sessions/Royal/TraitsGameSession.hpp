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

        auto ProcessGuess(const std::string& name) -> void;

        auto IsOver() const noexcept -> bool;
        
    private:
        DatabaseConnection& m_DatabaseConnection;
        Business::Modes::Traits::Game m_Game{};
        Business::Royal::Providers::TraitsGameProvider m_Provider
        {
            m_DatabaseConnection
        };
        bool m_IsOver{};
    };
};
