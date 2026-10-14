#pragma once

#include <cstdint>

namespace AGSR::Application
{
    class App
    {
    public:
        /**
        * @brief Returns globally shared Application instance
        * @details Initializes the instance at first call
        */
        static auto GetApplication() -> App&;

    public:
        auto Execute() -> std::int32_t;

    private:
        App() = default;

        App(const App&) = delete;
        auto operator = (const App&) -> App& = delete;
    };
};
