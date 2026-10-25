#pragma once

#include <optional>
#include <type_traits>

#include "Business/Royal/Providers/Provider.hpp"
#include "Business/Royal/Domain/Tables/CardDescriptions.hpp"
#include "Business/Royal/Domain/Entities/CardDescription.hpp"

namespace AGSR::Business::Royal::Providers
{
    class DescriptionProvider : public Provider
    {
    public:
        using CardInfoResult = std::optional<Domain::CardDescription>;

    public:
        DescriptionProvider() = default;
        DescriptionProvider(const DescriptionProvider&) = delete;

        auto GetCardInfo(const std::int32_t ID) -> CardInfoResult;
        auto GetCardInfo(const std::string& ID) -> CardInfoResult;

        auto operator = (const DescriptionProvider&)
            -> DescriptionProvider& = delete;

    private:
        template <bool _ShouldGetByID>
        auto GetCardInfoCommon(std::conditional_t<_ShouldGetByID,
            const std::int32_t, const std::string&> param) -> CardInfoResult;

    private:
        Domain::CardDescriptions m_CardDescriptions{};
    };
};
