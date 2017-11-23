# Find the GLFW library
#
#  The following variables can be provided:
#     GLFW_ROOT
#
#  This module defines the following variables:
#     GLFW_FOUND
#     GLFW_INCLUDE_DIR
#     GLFW_LIBRARY
#

include(FindPackageHandleStandardArgs)

find_path(GLFW_INCLUDE_DIR
        NAMES GLFW/glfw3.h
        PATHS
        ${GLFW_ROOT}/include
        /usr/include
        /usr/local/include
)

find_library(GLFW_LIBRARY
        NAMES glfw libglfw
        PATHS
        ${GLFW_ROOT}/lib
        /usr/lib
        /usr/lib64
        /usr/local/lib
        /usr/local/lib64
)

find_package_handle_standard_args(GLFW DEFAULT_MSG
        GLFW_LIBRARY GLFW_INCLUDE_DIR)

mark_as_advanced(GLFW_INCLUDE_DIR GLFW_LIBRARY)
