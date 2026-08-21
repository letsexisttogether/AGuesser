#pragma once 

/***

  Later it's gonna be linked from the lib

***/

#include <algorithm>
#include <array>

namespace ASYS
{
    template <std::size_t _Size>
        requires (_Size > 0)
    struct StringLiteral
    {
        consteval StringLiteral() noexcept = default;

        consteval StringLiteral(const char (&data)[_Size]) noexcept
        {
            std::copy_n(data, _Size, Data.begin());
        }

        constexpr auto GetSize() const noexcept -> std::size_t
        {
            return _Size;
        }

        constexpr auto GetLength() const noexcept -> std::size_t
        {
            return _Size - 1;
        }

        constexpr auto operator [] (const std::size_t index)
            const noexcept -> char
        {
            return Data[index];
        }

        template <std::size_t _OtherSize>
        constexpr auto operator + (StringLiteral<_OtherSize> literal)
            const noexcept -> StringLiteral<_Size + _OtherSize - 1>
        {
            auto result = StringLiteral<_Size + _OtherSize - 1>{};

            constexpr auto firstStringLimit = _Size - 1;
            
            for (auto i = 0uz; i < firstStringLimit; ++i)
            {
                result.Data[i] = Data[i];
            }
            for (auto i = 0uz; i < _OtherSize; ++i)
            {
                result.Data[i + firstStringLimit] = literal[i];
            }

            return result;
        }

        std::array<char, _Size> Data{};
    };

    template <std::size_t _Size>
    using SL = StringLiteral<_Size>;
};
