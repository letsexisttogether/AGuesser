include(FetchContent)

set(PackageName ADBC_LIB)

FetchContent_Declare(
    ${PackageName}
    GIT_REPOSITORY https://github.com/letsexisttogether/ADBC.git
)

FetchContent_MakeAvailable(${PackageName})
