#pragma once 

#include <filesystem>
#include <fstream>

namespace AGSR::System
{
    class Logger
    {
    public:
        using FilePath = std::filesystem::path;

    public:
        Logger() = default;
        Logger(const Logger&) = delete;

        auto Init(FilePath&& path) -> void;
        
        auto Log(const std::string& message) -> void;
        auto Log(const char* const message) -> void;

        template <class ... _Messages>
        auto Log(const _Messages& ... messages); 

        auto operator = (const Logger&) -> Logger& = delete;

    private:
        FilePath m_FilePath{};
        std::ofstream m_FileStream{};
    };

    template <class ... _Messages>
    auto Logger::Log(const _Messages& ... messages)
    {
        ((m_FileStream << messages << ' '), ...);
        m_FileStream << std::endl;
    }
};
