#pragma once

#include "sqlpp23/sqlite3/database/connection.h"

namespace AGSR::System
{
    /**
    * @brief Responsible for storing DB connection info
    * @details Right now mostly hardcoded
    */
    class DatabaseConnector
    {
    public:
        using Connection = sqlpp::sqlite3::connection;
        using Config = sqlpp::sqlite3::connection_config;

    public:
        DatabaseConnector() = default;
        DatabaseConnector(const DatabaseConnector&) = delete;

        auto Init(const Config& config) -> void;

        auto operator = (const DatabaseConnector&)
            -> DatabaseConnector& = delete;

        auto operator * () noexcept -> Connection&;

    private:
        Connection m_Connection{};
    };
};
