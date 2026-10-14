#pragma once

#pragma once

#include <sqlpp23/sqlpp23.h>

namespace AGSR::Business::Royal::Domain
{
    struct RangeTypes_
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

        struct Rank
        {
            SQLPP_CREATE_NAME_TAG_FOR_SQL_AND_CPP(Rank, Rank);
            using data_type = sqlpp::integral;
        };

        SQLPP_CREATE_NAME_TAG_FOR_SQL_AND_CPP(RangeTypes, RangeTypes);

        template <class _Table>
        using _table_columns = sqlpp::table_columns
            <_Table, ID, Name, Rank>;
        using _required_insert_columns = sqlpp::detail::type_set<>;
  };

  using RangeTypes = ::sqlpp::table_t<RangeTypes_>;
}
