#include "TraitsGameProvider.hpp"

#include <optional>
#include <stdexcept>

#include <sqlpp23/core/clause/select.h>

#include "Business/Royal/Domain/Entities/CardTrait.hpp"

using namespace sqlpp::alias;

namespace AGSR::Business::Royal::Providers
{
    TraitsGameProvider::TraitsGameProvider(DatabaseConnection& connection)
        noexcept : m_DatabaseConnection{ connection } {};

    auto TraitsGameProvider::GetRandomHeroID() -> std::uint32_t
    {
        return 1;
    }

    auto TraitsGameProvider::GetCardTrait(const std::int32_t ID)
        -> TraitsGameProvider::CardTraitResult
    {
        return GetCardTraitShared<true>(ID);
    }

    auto TraitsGameProvider::GetCardTrait(const std::string& name)
        -> TraitsGameProvider::CardTraitResult
    {
        return GetCardTraitShared<false>(name);
    }

    template <bool _ShouldGetByID>
    auto TraitsGameProvider::GetCardTraitShared(const std::conditional_t
        <_ShouldGetByID, const std::int32_t, const std::string&> param)
        -> CardTraitResult
    {
        const auto query = select
            (
                m_Cards.ID, m_Cards.Name.as(::x),
                m_CardTraits.ElixirCost, m_CardTraits.Targets,
                m_Rarities.Name.as(::y), m_Rarities.Rank.as(::z),
                m_RangeTypes.Name.as(::a), m_RangeTypes.Rank.as(::b),
                m_Speeds.Name.as(::c), m_Speeds.Rank.as(::d)
            )
            .from(m_Cards
            .join(m_CardTraits).on(m_Cards.ID == m_CardTraits.CardID)
            .join(m_Rarities).on(m_CardTraits.RarityID == m_Rarities.ID)
            .join(m_RangeTypes).on(m_CardTraits.RangeTypeID == m_RangeTypes.ID)
            .join(m_Speeds).on(m_CardTraits.SpeedID == m_Speeds.ID))
            .limit(1);

        auto ExecuteQuery = [&] (auto&& query) -> CardTraitResult
        {
            const auto queryResults = m_DatabaseConnection(query);

            if (queryResults.empty())
            {
                return std::nullopt;
            }

            const auto& queryRow = queryResults.front();

            return std::optional{ Domain::CardTrait
            {
                .ID = static_cast<std::uint32_t>(queryRow.ID),
                .Name = std::string{ queryRow.x },
                .ElixirCost = static_cast<std::uint8_t>(queryRow.ElixirCost),
                .Targets = std::string{ queryRow.Targets },
                .Rarity = 
                {
                    .Name = std::string{ queryRow.y },
                    .Rank = static_cast<std::uint8_t>(queryRow.z)
                },
                .Range = 
                {
                    .Name = std::string{ queryRow.a },
                    .Rank = static_cast<std::uint8_t>(queryRow.b)
                },
                .Speed = 
                {
                    .Name = std::string{ queryRow.c },
                    .Rank = static_cast<std::uint8_t>(queryRow.d)
                }
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
