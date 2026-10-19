#include "Application.hpp"

#include <iostream>
#include <cstdlib>
#include <exception>

#include <sqlpp23/sqlite3/sqlite3.h>

#include "Sessions/Royal/TraitsGameSession.hpp"
#include "UI/TraitsGame/TraitsGameView.hpp"

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

            auto session = Sessions::Royal::TraitsGameSession{ db };
            session.Start();
            
            while (!session.IsOver())
            {
                const auto guessResult = session.ProcessGuess(UI::Views::
                    Royal::TraitsGameView::GetInput("Enter name: "));

                if (guessResult)
                {
                    UI::Views::Royal::TraitsGameView::
                        Display(*guessResult);
                }
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

    auto Application::GetLogger() -> System::Logger&
    {
        return m_Logger;
    }

    Application::Application() noexcept
    {
        try
        {
            m_Logger.Init("Log/Logger.txt");
            m_Logger.Log("Init successfull");
        }
        catch (std::exception& exp)
        {
            std::cerr << "[AGSR::Init] Failed" << std::endl;
        }
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
