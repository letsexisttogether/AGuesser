add_executable(${PROJECT_NAME}
    Main.cpp)

add_subdirectory(System)
add_subdirectory(DB)

target_include_directories(${PROJECT_NAME}
    PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})

target_link_libraries(${PROJECT_NAME}
    PRIVATE 
        ASYS::String
        ADBC
)
