#include "Provider.hpp"

#include <optional>

#include <sqlpp23/core/clause/select.h>

#include "Application/Application.hpp"

using namespace sqlpp::alias;

namespace AGSR::Business::Royal::Providers
{
    auto TraitsProvider::GetCardInfo(const std::int32_t ID)
        -> TraitsProvider::CardInfoResult
    {
        return GetCardInfoCommon<true>(ID);
    }

    auto TraitsProvider::GetCardInfo(const std::string& name)
        -> CardInfoResult
    {
        return GetCardInfoCommon<false>(name);
    }


    template <bool _ShouldGetByID>
    auto TraitsProvider::GetCardInfoCommon(const std::conditional_t
        <_ShouldGetByID, const std::int32_t, const std::string&> param)
        -> CardInfoResult
    {
        const auto query = select
            (
                m_Cards.ID, m_Cards.Name.as(::x), m_CardTraits.ElixirCost,
                m_CardTraits.Targets, m_CardTraits.CardType,
                m_Rarities.Name.as(::y), m_Rarities.Rank.as(::z),
                m_RangeTypes.Name.as(::a), m_RangeTypes.Rank.as(::b),
                m_Speeds.Name.as(::c), m_Speeds.Rank.as(::d),
                m_CardTraits.ReleaseYear
            )
            .from(m_Cards
            .join(m_CardTraits).on(m_Cards.ID == m_CardTraits.CardID)
            .join(m_Rarities).on(m_CardTraits.RarityID == m_Rarities.ID)
            .join(m_RangeTypes).on(m_CardTraits.RangeTypeID == m_RangeTypes.ID)
            .join(m_Speeds).on(m_CardTraits.SpeedID == m_Speeds.ID))
            .limit(1);

        auto ExecuteQuery = [&] (auto&& query) -> CardInfoResult
        {
            const auto queryResults = (*Application::GetApplication()
                .GetDatabase())(query);

            if (queryResults.empty())
            {
                return std::nullopt;
            }

            const auto& queryRow = queryResults.front();

            return std::optional{ Domain::CardTrait
            {
                .ID = static_cast<std::uint32_t>(queryRow.ID),
                .Name = std::string{ queryRow.x },
                .ElixirCost = static_cast<std::uint16_t>(queryRow.ElixirCost),
                .Rarity = 
                {
                    .Name = std::string{ queryRow.y },
                    .Rank = static_cast<std::uint8_t>(queryRow.z)
                },
                .CardType = std::string{ queryRow.CardType }, 
                .Targets = std::string{ queryRow.Targets },
                .Range = 
                {
                    .Name = std::string{ queryRow.a },
                    .Rank = static_cast<std::uint8_t>(queryRow.b)
                },
                .Speed = 
                {
                    .Name = std::string{ queryRow.c },
                    .Rank = static_cast<std::uint8_t>(queryRow.d)
                },
                .ReleaseYear = static_cast<std::uint16_t>
                    (queryRow.ReleaseYear)
            }};
        };

        if constexpr (_ShouldGetByID)
        {
            return ExecuteQuery(query.where(m_Cards.ID == param));
        }
        else
        {
            return ExecuteQuery(query.where(m_Cards.Name == param));
        }
    }
};
