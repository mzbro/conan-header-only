cmake_minimum_required(VERSION 3.15)
project(example CXX)

find_package(sum CONFIG REQUIRED)



add_library(example src/example.cpp)
target_include_directories(example PUBLIC include)

target_link_libraries(example PRIVATE sum::sum)


set_target_properties(example PROPERTIES PUBLIC_HEADER "include/example.h")
install(TARGETS example)
