#pragma once

#include <optional>
#include <type_traits>

#include <sqlpp23/sqlite3/database/connection.h>

#include "Business/Royal/Domain/Tables/Tables.hpp"
#include "Business/Royal/Domain/Entities/CardTrait.hpp"

namespace AGSR::Business::Royal::Providers
{
    class TraitsGameProvider
    {
    public:
        using DatabaseConnection = sqlpp::sqlite3::connection;
        using CardTraitResult = std::optional<Domain::CardTrait>;

    public:
        TraitsGameProvider() = default;
        TraitsGameProvider(const TraitsGameProvider&) = delete;

        auto GetRandomHeroID() -> std::uint32_t;

        auto GetCardTrait(const std::int32_t ID) -> CardTraitResult;
        auto GetCardTrait(const std::string& name) -> CardTraitResult;

        auto operator = (const TraitsGameProvider&)
            -> TraitsGameProvider& = delete;

    private:
        template <bool _ShouldGetByID>
        auto GetCardTraitShared(std::conditional_t<_ShouldGetByID,
            const std::int32_t, const std::string&> param) -> CardTraitResult;

    private:
        Domain::CardTraits m_CardTraits{};
        Domain::Cards m_Cards{};
        Domain::RangeTypes m_RangeTypes{};
        Domain::Rarities m_Rarities{};
        Domain::Speeds m_Speeds{};
    };
};
