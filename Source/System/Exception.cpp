#include "Exception.hpp"

namespace ASYS
{
    Exception::Exception(const Errors& errors)
        : m_Errors{ errors } {} 

    Exception::Exception(Errors&& errors)
        : m_Errors{ std::move(errors) } {}

    Exception::Exception(const Error& error)
    {
        m_Errors.push_back(error);
    }

    Exception::Exception(Error&& error)
    {
        m_Errors.push_back(std::move(error));
    }
};
