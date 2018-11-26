cmake_minimum_required(VERSION 3.0)		# which version to choose?

set(LIBRARY_NAME "reminder")
set(EXECUTABLE_NAME "main")

set(SRC_EXECUTABLE main.cpp)
set(SRC_LIBRARY reminder.cpp)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -Werror")

add_library(${LIBRARY_NAME} SHARED ${SRC_LIBRARY})
add_executable(${EXECUTABLE_NAME} ${SRC_EXECUTABLE})

target_link_libraries(${EXECUTABLE_NAME} ${LIBRARY_NAME})