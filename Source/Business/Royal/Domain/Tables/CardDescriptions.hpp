#pragma once

#include <sqlpp23/sqlpp23.h>

namespace AGSR::Business::Royal::Domain
{
    struct CardDescriptions_
    {
        struct CardID
        {
            SQLPP_CREATE_NAME_TAG_FOR_SQL_AND_CPP(CardID, CardID);
            using data_type = sqlpp::integral;
        };

        struct Description
        {
            SQLPP_CREATE_NAME_TAG_FOR_SQL_AND_CPP(Description, Description);
            using data_type = sqlpp::text;
        };

        SQLPP_CREATE_NAME_TAG_FOR_SQL_AND_CPP(CardDescriptions, CardDescriptions);

        template <class _Table>
        using _table_columns = sqlpp::table_columns
            <_Table, CardID, Description>;
        using _required_insert_columns = sqlpp::detail::type_set<>;
  };

  using CardDescriptions = ::sqlpp::table_t<CardDescriptions_>;
};
