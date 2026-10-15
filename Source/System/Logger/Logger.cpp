#include "Logger.hpp"

#include <ios>
#include <stdexcept>

namespace AGSR::System
{
    auto Logger::Init(FilePath&& path) -> void
    {
        m_FilePath = std::move(path);

        if (m_FilePath.has_parent_path())
        {
            std::filesystem::create_directory(m_FilePath.parent_path());
        }

        m_FileStream.open(m_FilePath, std::ios::out | std::ios::app);

        if (!m_FileStream.is_open())
        {
            throw std::runtime_error{ "[AGSR::Error" };
        }
    }

    auto Logger::Log(const std::string& message) -> void
    {
        Log(message.c_str());
    }

    auto Logger::Log(const char* const message) -> void
    {
        m_FileStream << message << std::endl;
    }
};
