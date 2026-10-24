#pragma once

#include <cstdint>

#include "System/Logger/Logger.hpp"

auto main() -> std::int32_t;

namespace AGSR
{
    class Application
    {
    public:
        /**
        * @brief Returns globally shared Application instance
        * @details Initializes the instance at first call
        */
        static auto GetApplication() -> Application&;

    public:
        auto GetLogger() -> System::Logger&;
        
    private:
        Application() noexcept;

        auto Execute() -> std::int32_t;

        Application(const Application&) = delete;
        auto operator = (const Application&) -> Application& = delete;

    private:
        friend auto ::main() -> std::int32_t;

    private:
        System::Logger m_Logger{};
        bool m_IsInit{};
    };
};
