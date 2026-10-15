#pragma once

#include <cstdint>

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

    private:
        Application() = default;

        Application(const Application&) = delete;
        auto operator = (const Application&) -> Application& = delete;
    };
};
