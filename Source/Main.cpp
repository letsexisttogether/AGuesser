#include "Application/Application.hpp"

auto main() -> std::int32_t
{
    auto& app = AGSR::Application::App::GetApplication();

    return app.Execute();
}
