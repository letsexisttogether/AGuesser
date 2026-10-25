#include "Provider.hpp"

#include "Application/Application.hpp"

namespace AGSR::Business::Royal::Providers
{
    auto DescriptionProvider::GetCardInfo(const std::int32_t ID)
        -> CardInfoResult
    {
        return GetCardInfoCommon<true>(ID);
    }

    auto DescriptionProvider::GetCardInfo(const std::string& name)
        -> CardInfoResult
    {
        return GetCardInfoCommon<false>(name);
    }

    template <bool _ShouldGetByID>
    auto DescriptionProvider::GetCardInfoCommon
        (std::conditional_t<_ShouldGetByID, const std::int32_t,
        const std::string&> param) -> CardInfoResult
    {
        const auto query = select
            (
                m_Cards.ID, m_Cards.Name,
                m_CardDescriptions.Description
            )
            .from(m_Cards
            .join(m_CardDescriptions).on(m_Cards.ID ==
                m_CardDescriptions.CardID))
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

            return std::optional{ Domain::CardDescription
            {
                .ID = static_cast<std::uint32_t>(queryRow.ID),
                .Name = std::string{ queryRow.Name },
                .Description = std::string{ queryRow.Description }
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
