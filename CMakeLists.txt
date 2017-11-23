cmake_minimum_required(VERSION 3.2)
project(ImGUI)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_SOURCE_DIR}/CMake)
set(CMAKE_DEBUG_POSTFIX "d")

option(BUILD_GLFW_BACKEND "Build the library with the GLFW backend" ON)
option(BUILD_SDL_BACKEND "Build the library with the SDL backend" ON)

if(BUILD_SDL_BACKEND)
    find_package(SDL2 REQUIRED)
    include_directories(${SDL2_INCLUDE_DIR})
endif(BUILD_SDL_BACKEND)

if(BUILD_GLFW_BACKEND)
    find_package(GLFW REQUIRED)
    include_directories(${GLFW_INCLUDE_DIR})
endif(BUILD_GLFW_BACKEND)

find_package(GLEW REQUIRED)
find_package(OpenGL REQUIRED)

file(GLOB_RECURSE SOURCE_CPP RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} src/*.cpp  )
file(GLOB_RECURSE SOURCE_HEADER RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} src/*.h  )


include_directories(${GLEW_INCLUDE_DIR})

add_library(${PROJECT_NAME} SHARED ${SOURCE_CPP} ${SOURCE_HEADER})

if(BUILD_SDL_BACKEND)
    target_link_libraries(${PROJECT_NAME} ${SDL2_LIBRARY})
endif(BUILD_SDL_BACKEND)

if(BUILD_GLFW_BACKEND)
    target_link_libraries(${PROJECT_NAME} ${GLFW_LIBRARY})
endif(BUILD_GLFW_BACKEND)

target_link_libraries(${PROJECT_NAME} ${GLEW_LIBRARY})
target_link_libraries(${PROJECT_NAME} ${OPENGL_LIBRARIES})

install(TARGETS ${PROJECT_NAME} DESTINATION lib)
install(FILES ${SOURCE_HEADER} DESTINATION include)
