#include "Application.hpp"

#include <iostream>
#include <cstdlib>
#include <exception>

#include <sqlpp23/sqlite3/sqlite3.h>

#include "Sessions/Royal/TraitsGameSession.hpp"
#include "Sessions/Royal/DescriptionGameSession.hpp"
#include "UI/View/TraitsGame/TraitsGameView.hpp"
#include "UI/View/DescriptionGame/DescriptionGameView.hpp"

namespace AGSR
{
    auto Application::GetApplication() -> Application&
    {
        static auto app = Application{};

        return app;
    }

    auto Application::GetLogger() -> System::Logger&
    {
        return m_Logger;
    }

    auto Application::GetDatabase() -> System::DatabaseConnector&
    {
        return m_DBConnector;
    }

    Application::Application() noexcept
    {
        try
        {
            m_Logger.Init("Log/Logger.txt");
            m_Logger.Log("Init successfull");

            m_DBConnector.Init(System::DatabaseConnector::Config
            { 
                "Data/AGuesserData.db", SQLITE_OPEN_READWRITE
            });

            m_IsInit = true;
        }
        catch (std::exception& exp)
        {
            std::cerr << "[AGSR::Init] Failed" << std::endl;
        }
    }

    auto Application::Execute() -> std::int32_t
    {
        if (!m_IsInit)
        {
            return EXIT_FAILURE;
        }

        try
        {
            auto session = Sessions::Royal::DescriptionGameSession{};
            session.Start();
            
            while (!session.IsOver())
            {
                const auto guessResult = session.ProcessGuess(UI::Views::
                    Royal::DescriptionGameView::GetInput("Enter name: "));

                if (guessResult)
                {
                    UI::Views::Royal::DescriptionGameView::
                        Display(*guessResult);
                }
            }
        }
        catch (const std::exception& exp)
        {
            m_Logger.Log("[AGSR::Critical error] ", exp.what());

            return EXIT_FAILURE;
        }

        return EXIT_SUCCESS;
    }
};
