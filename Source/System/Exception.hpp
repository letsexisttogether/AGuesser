#pragma once

#include <cstdint>
#include <exception>
#include <vector>

namespace ASYS
{
    enum class ErrorType : std::uint32_t
    {
        NoEror,
        User
    };

    struct Error
    {
        using ErrorCode = std::uint32_t;

        ErrorType Type{};
        ErrorCode Code{};
    };

    class Exception : public std::exception
    {
    public:
        using Errors = std::vector<Error>;

    public:
        Exception(const Errors& errors);
        Exception(Errors&& errors);

        Exception(const Error& error);
        Exception(Error&& error);

        // Thanks stl api
        constexpr inline const char* what() const noexcept override
        {
            return "[ASYS::Exception]";
        }
    
    private:
        Errors m_Errors{};
    };
};
