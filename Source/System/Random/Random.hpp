#pragma once

#include <type_traits>
#include <vector>
#include <random>

namespace AGSR::System
{
    template <class _Type>
    auto GetRandomElement(const std::vector<_Type>& elements,
        const std::uint32_t key) noexcept -> _Type 
        requires (std::is_default_constructible_v<_Type>)
    {
        if (elements.empty())
        {
            return {};
        }

        auto generator = std::mt19937{ key }; 

        auto distribution = std::uniform_int_distribution<std::size_t>
        {
            0, elements.size() - 1
        };

        const auto index = distribution(generator);

        return elements[index];
    }
};
