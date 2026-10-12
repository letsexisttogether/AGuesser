include(FetchContent)

set(BUILD_SQLITE3_CONNECTOR ON)

FetchContent_Declare(
    sqlpp23
    GIT_REPOSITORY https://github.com/rbock/sqlpp23.git
    GIT_TAG        main
)

FetchContent_MakeAvailable(sqlpp23)
