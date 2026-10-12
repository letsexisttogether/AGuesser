#include "Application.hpp"

#include <iostream>
#include <cstdlib>
#include <exception>

#include <sqlpp23/sqlite3/sqlite3.h>

#include "Business/Royal/Logic/TraitsGame.hpp"

namespace
{
    auto GetConnection() -> sqlpp::sqlite3::connection;

    auto PrintRow(const AGSR::DataRow& row) -> void;
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
            
            auto traitsGame = AGSR::TraitsGame{ db };

            PrintRow(traitsGame.GetCurrentRow());
            
            while (true)
            {
                std::cout << "Enter name: ";

                auto name = std::string{};
                std::cin >> name;

                std::cout << '\n';

                const auto isGuessSuccessfull = traitsGame
                    .CheckCorrectGuess(name);

                if (const auto& lastGuessedRow = traitsGame
                    .GetLastGuessedRow(); !lastGuessedRow.IsEmpty())
                {
                    PrintRow(lastGuessedRow);
                }

                if (isGuessSuccessfull)
                {
                    std::cout << "VICTORY " << std::endl;
                    break;
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

    auto PrintRow(const AGSR::DataRow& row) -> void
    {
        std::cout << row.Name << ' ' << row.ElixirCost << ' '
            << row.Rarity.Name << ' ' << row.Targets << ' '
            << row.Range.Name << ' ' << row.Speed.Name << '\n';
    }
};
