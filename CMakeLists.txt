cmake_minimum_required(VERSION 3.2)
project(ImGUI)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_SOURCE_DIR}/CMake)
set(CMAKE_DEBUG_POSTFIX "d")

find_package(SDL2 REQUIRED)
find_package(GLEW REQUIRED)
find_package(OpenGL REQUIRED)

file(GLOB_RECURSE SOURCE_CPP RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} src/*.cpp  )
file(GLOB_RECURSE SOURCE_HEADER RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} src/*.h  )

include_directories(${SDL2_INCLUDE_DIR})
include_directories(${GLEW_INCLUDE_DIR})

add_library(${PROJECT_NAME} SHARED ${SOURCE_CPP} ${SOURCE_HEADER})

target_link_libraries(${PROJECT_NAME} ${SDL2_LIBRARY})
target_link_libraries(${PROJECT_NAME} ${GLEW_LIBRARY})
target_link_libraries(${PROJECT_NAME} ${OPENGL_LIBRARIES})

install(TARGETS ${PROJECT_NAME} DESTINATION lib)
install(FILES ${SOURCE_HEADER} DESTINATION include)
