#pragma once

#include <optional>
#include <type_traits>

#include "Business/Royal/Providers/Provider.hpp"
#include "Business/Royal/Domain/Tables/CardTraits.hpp"
#include "Business/Royal/Domain/Tables/RangeTypes.hpp"
#include "Business/Royal/Domain/Tables/Rarities.hpp"
#include "Business/Royal/Domain/Tables/Speeds.hpp"
#include "Business/Royal/Domain/Entities/CardTrait.hpp"

namespace AGSR::Business::Royal::Providers
{
    class TraitsProvider : public Provider {
    public:
        using CardInfoResult = std::optional<Domain::CardTrait>;

    public:
        TraitsProvider() = default;
        TraitsProvider(const TraitsProvider&) = delete;

        auto GetCardInfo(const std::int32_t ID) -> CardInfoResult;
        auto GetCardInfo(const std::string& ID) -> CardInfoResult;

        auto operator = (const TraitsProvider&)
            -> TraitsProvider& = delete;

    private:
        template <bool _ShouldGetByID>
        auto GetCardInfoCommon(std::conditional_t<_ShouldGetByID,
            const std::int32_t, const std::string&> param) -> CardInfoResult;

    private:
        Domain::CardTraits m_CardTraits{};
        Domain::Cards m_Cards{};
        Domain::RangeTypes m_RangeTypes{};
        Domain::Rarities m_Rarities{};
        Domain::Speeds m_Speeds{};
    };
};
