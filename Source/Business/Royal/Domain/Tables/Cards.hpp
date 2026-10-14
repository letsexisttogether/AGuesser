#pragma once

#pragma once

#include <sqlpp23/sqlpp23.h>

namespace AGSR::Business::Royal::Domain
{
    struct Cards_
    {
        struct ID
        {
            SQLPP_CREATE_NAME_TAG_FOR_SQL_AND_CPP(ID, ID);
            using data_type = sqlpp::integral;
        };

        struct Name
        {
            SQLPP_CREATE_NAME_TAG_FOR_SQL_AND_CPP(Name, Name);
            using data_type = sqlpp::text;
        };

        SQLPP_CREATE_NAME_TAG_FOR_SQL_AND_CPP(Cards, Cards);

        template <class _Table>
        using _table_columns = sqlpp::table_columns
            <_Table, ID, Name>;
        using _required_insert_columns = sqlpp::detail::type_set<>;
  };

  using Cards = ::sqlpp::table_t<Cards_>;
}
