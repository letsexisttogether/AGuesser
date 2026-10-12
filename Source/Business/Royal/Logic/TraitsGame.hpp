#pragma once

#include <cstdint>
#include <string>
#include <type_traits>
#include <expected>

#include <sqlpp23/sqlite3/database/connection.h>

namespace AGSR 
{
    struct DataRow
    {
        auto Nullify() noexcept -> void;
        auto IsEmpty() const noexcept -> bool;

        struct CardRarity
        {
            std::string Name{};
            std::uint8_t Rank{};
        };

        struct CardRange
        {
            std::string Name{};
            std::uint8_t Rank{};
        };

        struct CardSpeed
        {
            std::string Name{};
            std::uint8_t Rank{};
        };

        std::int32_t ID{};
        std::string Name{};
        std::uint8_t ElixirCost{};
        std::string Targets{};
        CardRarity Rarity{};
        CardRange Range{};
        CardSpeed Speed{};
    };

    class TraitsGame
    {
    public:
        TraitsGame(sqlpp::sqlite3::connection& db);

        auto CheckCorrectGuess(const std::string& name) -> bool;

        auto GetCurrentRow() const noexcept -> const DataRow&;
        auto GetLastGuessedRow() const noexcept -> const DataRow&;

    private:
        auto LoadRow(const std::int32_t ID) -> DataRow;

        template <bool _ShouldLoadByID>
        auto LoadRowBy(std::conditional_t<_ShouldLoadByID,
            const std::int32_t, const std::string&> param)
            -> std::expected<DataRow, bool>;

        auto LoadRowsCount() -> std::size_t;

        auto Randomize(const std::size_t max) const noexcept -> std::size_t;

    private:
        sqlpp::sqlite3::connection& m_DB;
        DataRow m_CurrentRow{};
        DataRow m_LastGuessedRow{};
    };
};
