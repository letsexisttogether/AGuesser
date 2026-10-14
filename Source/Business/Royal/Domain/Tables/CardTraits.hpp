#pragma once

#pragma once

#include <sqlpp23/sqlpp23.h>

namespace AGSR::Royal::Tables
{
    struct CardTraits_
    {
        struct ID
        {
            SQLPP_CREATE_NAME_TAG_FOR_SQL_AND_CPP(ID, ID);
            using data_type = sqlpp::integral;
        };

        struct CardID 
        {
            SQLPP_CREATE_NAME_TAG_FOR_SQL_AND_CPP(CardID, CardID);
            using data_type = sqlpp::integral;
        };

        struct ElixirCost 
        {
            SQLPP_CREATE_NAME_TAG_FOR_SQL_AND_CPP(ElixirCost, ElixirCost);
            using data_type = sqlpp::integral;
        };

        struct RarityID 
        {
            SQLPP_CREATE_NAME_TAG_FOR_SQL_AND_CPP(RarityID, RarityID);
            using data_type = sqlpp::integral;
        };

        struct Targets 
        {
            SQLPP_CREATE_NAME_TAG_FOR_SQL_AND_CPP(Targets, Targets);
            using data_type = sqlpp::text;
        };

        struct RangeTypeID 
        {
            SQLPP_CREATE_NAME_TAG_FOR_SQL_AND_CPP(RangeTypeID, RangeTypeID);
            using data_type = sqlpp::integral;
        };

        struct SpeedID 
        {
            SQLPP_CREATE_NAME_TAG_FOR_SQL_AND_CPP(SpeedID, SpeedID);
            using data_type = sqlpp::integral;
        };

        struct ReleaseYear 
        {
            SQLPP_CREATE_NAME_TAG_FOR_SQL_AND_CPP(ReleaseYear, ReleaseYear);
            using data_type = sqlpp::integral;
        };

        SQLPP_CREATE_NAME_TAG_FOR_SQL_AND_CPP(CardTraits, CardTraits);

        template <class _Table>
        using _table_columns = sqlpp::table_columns
            <_Table, ID, CardID, ElixirCost, RarityID, Targets,
            RangeTypeID, SpeedID, ReleaseYear>;
        using _required_insert_columns = sqlpp::detail::type_set<>;
  };

  using CardTraits = ::sqlpp::table_t<CardTraits_>;
}
