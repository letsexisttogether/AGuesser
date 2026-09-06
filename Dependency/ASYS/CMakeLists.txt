include(FetchContent)

set(PackageName ASYS)

FetchContent_Declare(
    ${PackageName}
    GIT_REPOSITORY https://github.com/letsexisttogether/ASYS.git
)

FetchContent_MakeAvailable(${PackageName})
