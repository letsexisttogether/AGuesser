#include "SQLite3.hpp"

#include <iostream>
#include <vector>
#include <exception>

#include <ASYS/String/StringLiteral.hpp>

using namespace std::string_literals;

namespace SQLite3
{

    SQLite3DB::SQLite3DB(const char* const path)
    {
        if (sqlite3_open(path, &m_DB) != SQLITE_OK)
        {
            throw std::runtime_error{ "[AGuesser] Can't open database" };
        }
    }

    SQLite3DB::~SQLite3DB()
    {
        sqlite3_close(m_DB);
    }

    SQLite3DB::operator sqlite3* () noexcept
    {
        return m_DB;
    }

    auto RawExec(sqlite3* db) -> void
    {
        auto RawCallback = [] (void* const unused, int argc,
            char** argv, char** columnName) -> int
        {
            for (auto i = 0uz; i < argc; ++i)
            {
                std::cout << argv[i] << '|';
            }
            std::cout << '\n';

            return 0;
        };

        char* errorMessage{};
        constexpr auto queryText = ASYS::SL
        {
            R"r(SELECT * FROM Users)r"
        };
        const auto result = sqlite3_exec(db, queryText, RawCallback,
            nullptr, &errorMessage);

        if (result != SQLITE_OK)
        {
            const auto error = "[AGuesser] Exec failed: "s + errorMessage;
            sqlite3_free(errorMessage);

            throw std::runtime_error{ error.c_str() };
        }
    }


    auto BindExec(sqlite3* db) -> void
    {
        sqlite3_stmt* statement{};

        char* errorMessage{};
        constexpr auto queryText = ASYS::SL
        {
            R"r(SELECT * FROM Users)r"
        };

        const auto prepareResult = sqlite3_prepare_v2(db, queryText,
            queryText.GetSize(), &statement, nullptr);
        if (prepareResult != SQLITE_OK)
        {
            throw std::runtime_error{ "[AGuesser] Prepare failed" };
        }

        struct UsersRow
        {
            std::int32_t ID{};
            std::string Name{};
            std::string Email{};
        };

        std::vector<UsersRow> usersRows{};

        auto stepResult = SQLITE_ROW;
        while (stepResult == SQLITE_ROW)
        {
            stepResult = sqlite3_step(statement);

            if (stepResult == SQLITE_DONE)
            {
                break;
            }

            auto user = UsersRow
            {
                sqlite3_column_int(statement, 0),
                reinterpret_cast<const char*>(sqlite3_column_text(statement, 1)),
                reinterpret_cast<const char*>(sqlite3_column_text(statement, 2))
            };

            usersRows.push_back(std::move(user));
        }

        for (const auto& [id, name, email] : usersRows)
        {
            std::cout << id << '|' << name << '|' << email << '\n';
        }

        sqlite3_finalize(statement);
    }
};
