#pragma once

#include <cstdint>

#include "System/Log/Logger.hpp"

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
        auto Execute() -> std::int32_t;

        auto GetLogger() -> System::Logger&;
        
    private:
        Application() noexcept;

        Application(const Application&) = delete;
        auto operator = (const Application&) -> Application& = delete;

    private:
        System::Logger m_Logger{};
    };
};
