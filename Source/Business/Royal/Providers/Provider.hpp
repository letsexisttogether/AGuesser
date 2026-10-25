#pragma once 

#include "Business/Royal/Domain/Tables/Cards.hpp"

namespace AGSR::Business::Royal::Providers
{
    class Provider
    {
    public:
        Provider() = default;
        Provider(const Provider&) = delete;

        auto GetRandomHeroID() -> std::int32_t;

        auto operator = (const Provider&) -> Provider& = delete;

    protected:
        Domain::Cards m_Cards{};
    };
};
