set(APP_NAME AGSR)

add_executable(${APP_NAME}
    Main.cpp)

target_include_directories(${APP_NAME}
    PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})

target_link_libraries(${APP_NAME}
    PRIVATE
        ASYS::String
        sqlpp23::sqlite3
)

add_subdirectory(Application)
add_subdirectory(Business)
add_subdirectory(Sessions)
add_subdirectory(UI)
