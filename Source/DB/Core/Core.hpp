#pragma once

#include <cstdint>
#include <functional>
#include <sqlite3.h>
#include <filesystem>
#include <variant>

#include <ASYS/String/StringLiteral.hpp>

namespace ADB
{
    /*
     Требование: строки, которые известны на этапе компиляции,
     должны быть построенны заранее, то есть я должен уметь делать

     SELECT Name, Email, TimePlayed
     FROM Users
     WHERE UserID = 25

     Users.Select<Name, Email, TimePlayed>().Where<Cond(UserID = :ID)>(ID);
     User.Update<Name, TimePlayed>().Where<Cond

     User.Insert<Name, Time>
     Users.Delete().Where<Cond(UserName LIKE '%:name')>(name);

     User.Select<Name, Email>().Where<age > 50>(50)Execute();
        SELECT Name, Email
        FROM User
    */

    struct Field
    {
        static constexpr auto NameLength = 60uz;
        using FieldName = ASYS::StringLiteral<NameLength>;

        FieldName Name{};
        std::int32_t Value{};
    };

    template<class _Type>
    concept FieldType = std::same_as<std::remove_cvref_t<_Type>, Field>;

    template <ASYS::StringLiteral<60> _Name>
    class Table
    {
    public:
        template<FieldType _First, FieldType... _Rest>
        consteval auto Select(_First&& first, _Rest&&... rest)
        {
            constexpr auto prefix = ASYS::SL{ "SELECT " };
            constexpr auto separator = ASYS::SL{ ", " };
            constexpr auto postfix = ASYS::SL{ " FROM " } + _Name;

            return prefix + first.Name + (... 
                + (separator + rest.Name)) + postfix;
        }
    };

    class TableMetadata
    {
    public:
        consteval TableMetadata()
        {
        }

    private:
        // Some data here
    };

    class DBTable
    {
    public:
        constexpr operator TableMetadata ()
        {
            return m_Metadata;
        }
    private:
        static constexpr TableMetadata m_Metadata{};
    };

    class Users
    {
    public:
        Users() = default;

    public:
       Field ID{};
       Field Name{};
       Field Email{};

    private:
        constexpr auto DoesFieldExist(const Field::FieldName& name)
            const noexcept -> bool
        {
            return std::ranges::find_if(m_Fields,
                [&name] (const auto& fieldName)
                {
                    return name == fieldName;
                }) != std::ranges::end(m_Fields);
        }

    private:
        static constexpr std::array<Field::FieldName, 3> m_Fields
        {
            ASYS::SL{ "ID" }, ASYS::SL{ "Name" }, ASYS::SL{ "Email" }
        };
    };

    /*
    class Database
    {
    public:
        Database(const Database&) = delete;

        virtual ~Database() = default;

        virtual auto Open() -> bool;
        virtual auto Close() -> bool;

        virtual auto Insert() -> bool;
        virtual auto Update() -> bool;
        virtual auto Delete() -> bool;

        auto operator = (const Database&) -> Database = delete;
    };

    class SQLite3 : public Database
    {
    public:
        SQLite3(const SQLite3&) = delete;
        SQLite3(const std::filesystem::path path);

        ~SQLite3();

        auto Insert() -> bool override;
        auto Update() -> bool override;
        auto Delete() -> bool override;

        auto operator = (const SQLite3&) -> SQLite3& = delete;

    private:
        sqlite3* m_DB{};
    };
    */
};
