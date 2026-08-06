cmake_minimum_required(VERSION 3.14)
project(sqlite_dependency LANGUAGES C)

add_library(sqlite3 STATIC sqlite3.c)

target_include_directories(sqlite3 
    PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}
)

target_compile_definitions(sqlite3 PRIVATE SQLITE_ENABLE_COLUMN_METADATA)
target_link_libraries(sqlite3 PRIVATE ${CMAKE_DL_LIBS} m)

add_library(SQLite::SQLite3 ALIAS sqlite3)
