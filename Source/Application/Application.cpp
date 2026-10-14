#include "Application.hpp"

#include <iostream>
#include <cstdlib>
#include <exception>

#include <sqlpp23/sqlite3/sqlite3.h>

namespace
{
    auto GetConnection() -> sqlpp::sqlite3::connection;
};

namespace AGSR 
{
    auto Application::GetApplication() -> Application&
    {
        static auto app = Application{};

        return app;
    }

    auto Application::Execute() -> std::int32_t
    {
        try
        {
            auto db = GetConnection();
            
            while (true)
            {
                std::cout << "Enter name: ";

                auto name = std::string{};
                std::cin >> name;

                std::cout << '\n';
            }
        }
        catch (const std::exception& exp)
        {
            std::cerr << "[AGSR::Critical error] "
                << exp.what() << std::endl;

            return EXIT_FAILURE;
        }

        return EXIT_SUCCESS;
    }

};

namespace
{
    auto GetConnection() -> sqlpp::sqlite3::connection
    {
        auto config = sqlpp::sqlite3::connection_config{};
        config.path_to_database = "Data/AGuesserData.db";
        config.flags = SQLITE_OPEN_READWRITE | SQLITE_OPEN_CREATE;

        return sqlpp::sqlite3::connection{ config };
    }
};
