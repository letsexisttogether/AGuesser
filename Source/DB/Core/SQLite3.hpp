#pragma once 

#include <sqlite3.h>

/**
* @brief Some learn with real namespace
*/
namespace SQLite3
{
    class SQLite3DB
    {
    public:
        SQLite3DB(const char* const path);
        SQLite3DB(const SQLite3DB&) = delete;
        ~SQLite3DB();

        auto operator = (const SQLite3DB&) = delete;

        operator sqlite3* () noexcept;

    private:
        sqlite3* m_DB{};
    };

    auto RawExec(sqlite3* db) -> void;

    auto BindExec(sqlite3* db) -> void;
};
