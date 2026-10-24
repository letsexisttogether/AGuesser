#include "Connector.hpp"

namespace AGSR::System
{
    auto DatabaseConnector::Init(const Config& config) -> void
    {
        m_Connection = Connection{ config };
    }

    auto DatabaseConnector::operator * () noexcept -> Connection&
    {
        return m_Connection;
    }
};
