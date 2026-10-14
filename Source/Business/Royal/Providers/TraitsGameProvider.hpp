#pragma once

#include <optional>
#include <type_traits>

#include <sqlpp23/sqlite3/database/connection.h>

#include "Business/Royal/Domain/Tables/Tables.hpp"
#include "Business/Royal/Domain/Entities/CardTrait.hpp"

namespace AGSR::Business::Royal::Providers
{
    class TraitsGameProviders
    {
    public:
        using DatabaseConnection = sqlpp::sqlite3::connection;
        using CardTraitResult = std::optional<Domain::CardTrait>;

    public:
        TraitsGameProviders(DatabaseConnection& connection) noexcept;
        TraitsGameProviders(const TraitsGameProviders&) = delete;

        auto GetRandomHero() -> Domain::CardTrait;

        auto GetCardTrait(const std::int32_t ID) -> CardTraitResult;
        auto GetcardTrait(const std::string& name) -> CardTraitResult;

        auto operator = (const TraitsGameProviders&)
            -> TraitsGameProviders& = delete;

    private:
        template <bool _ShouldGetByID>
        auto GetCardTraitShared(std::conditional_t<_ShouldGetByID,
            const std::int32_t, const std::string&> param) -> CardTraitResult;

    private:
        DatabaseConnection& m_DatabaseConnection;

        Domain::CardTraits m_CardTraits{};
        Domain::Cards m_Cards{};
        Domain::RangeTypes m_RangeTypes{};
        Domain::Rarities m_Rarities{};
        Domain::Speeds m_Speeds{};
    };
};
