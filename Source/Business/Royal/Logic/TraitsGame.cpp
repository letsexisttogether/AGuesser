#include "TraitsGame.hpp"

#include "Business/Royal/Model/Cards.hpp"
#include "Business/Royal/Model/RangeTypes.hpp"
#include "Business/Royal/Model/Rarities.hpp"
#include "Business/Royal/Model/Speeds.hpp"
#include "Business/Royal/Model/CardTraits.hpp"
#include <cstdlib>
#include <stdexcept>

using sqlpp::select;
using namespace sqlpp::alias;

namespace AGSR
{
    auto DataRow::Nullify() noexcept -> void
    {
        ID = 0;
    }

    auto DataRow::IsEmpty() const noexcept -> bool
    {
        return !ID;
    }

    TraitsGame::TraitsGame(sqlpp::sqlite3::connection& db)
        : m_DB{ db }
    {
        const auto cardID = Randomize(LoadRowsCount());

        m_CurrentRow = LoadRow(cardID);
    }

    auto TraitsGame::CheckCorrectGuess(const std::string& name) -> bool
    {
        auto result = LoadRowBy<false>(name);

        if (!result)
        {
            m_LastGuessedRow.Nullify();
            return false;
        }

        m_LastGuessedRow = std::move(*result);

        return m_CurrentRow.Name == m_LastGuessedRow.Name;
    }

    auto TraitsGame::GetCurrentRow() const noexcept
        -> const DataRow&
    {
        return m_CurrentRow;
    }

    auto TraitsGame::GetLastGuessedRow() const noexcept
        -> const DataRow&
    {
        return m_LastGuessedRow;
    }

    auto TraitsGame::LoadRow(const std::int32_t ID) -> DataRow
    {
        auto result = LoadRowBy<true>(ID);

        if (result)
        {
            throw std::runtime_error{ "[AGSR] No card to load" };
        }

        return std::move(*result);
    }

    template <bool _ShouldLoadByID>
    auto TraitsGame::LoadRowBy(std::conditional_t<_ShouldLoadByID,
        const std::int32_t, const std::string&> param)
        -> std::expected<DataRow, bool>
    {

        auto cards = Model::Cards{};
        auto rarities = Model::Rarities{};
        auto rangeTypes = Model::RangeTypes{};
        auto speeds = Model::Speeds{};
        auto cardTraits = Model::CardTraits{};

        auto query = select
            (
                cards.ID, cards.Name.as(::x),
                cardTraits.ElixirCost, cardTraits.Targets,
                rarities.Name.as(::y), rarities.Rank.as(::z),
                rangeTypes.Name.as(::a), rangeTypes.Rank.as(::b),
                speeds.Name.as(::c), speeds.Rank.as(::d)
            )
            .from(cards
            .join(cardTraits).on(cards.ID == cardTraits.CardID)
            .join(rarities).on(cardTraits.RarityID == rarities.ID)
            .join(rangeTypes).on(cardTraits.RangeTypeID == rangeTypes.ID)
            .join(speeds).on(cardTraits.SpeedID == speeds.ID))
            .limit(1);

        auto ExecuteQuery = [&] (auto&& query) -> std::expected<DataRow, bool>
        {
            auto queryResults = m_DB(query);

            if (queryResults.empty())
            {
                return std::unexpected{ false };
            }

            auto queryRow = queryResults.begin();

            return DataRow
            {
                .ID = static_cast<decltype(DataRow::ID)>(queryRow->ID),
                .Name = std::string{ queryRow->x },
                .ElixirCost = static_cast<std::uint8_t>(queryRow->ElixirCost),
                .Targets = std::string{ queryRow->Targets },
                .Rarity = 
                {
                    .Name = std::string{ queryRow->y },
                    .Rank = static_cast<std::uint8_t>(queryRow->z)
                },
                .Range = 
                {
                    .Name = std::string{ queryRow->a },
                    .Rank = static_cast<std::uint8_t>(queryRow->b)
                },
                .Speed = 
                {
                    .Name = std::string{ queryRow->c },
                    .Rank = static_cast<std::uint8_t>(queryRow->d)
                }
            };
        };

        if constexpr (_ShouldLoadByID)
        {
            return ExecuteQuery(query.where(cards.ID == param));
        }
        else
        {
            return ExecuteQuery(query.where(cards.Name == param));
        }
    }
    template auto TraitsGame::LoadRowBy<true>(const std::int32_t)
        -> std::expected<DataRow, bool>;
    template auto TraitsGame::LoadRowBy<false>(const std::string&)
        -> std::expected<DataRow, bool>;

    auto TraitsGame::LoadRowsCount() -> std::size_t
    {
        return 23;
    }

    auto TraitsGame::Randomize(const std::size_t max) 
        const noexcept -> std::size_t
    {
        return 5;
    }
};
