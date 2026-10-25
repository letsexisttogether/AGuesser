#include "Provider.hpp"

#include "System/Random/Random.hpp"
#include "Application/Application.hpp"

namespace AGSR::Business::Royal::Providers
{
    auto Provider::GetRandomHeroID() -> std::int32_t
    {
        const auto query = select(m_Cards.ID)
            .from(m_Cards);

        auto queryResult = (*Application::GetApplication()
            .GetDatabase())(query);

        if (queryResult.empty())
        {
            throw std::runtime_error{ "[AGSR::Error] No IDs in DB" };
        }

        auto IDs = std::vector<std::uint32_t>{};

        for (const auto& row : queryResult)
        {
            IDs.push_back(static_cast<std::uint32_t>(row.ID));
        }

        return System::GetRandomElement(IDs);
    }
};
