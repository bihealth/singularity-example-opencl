cmake_minimum_required (VERSION 2.6)

if (NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
	message(STATUS "Setting build type to 'Debug' as none was specified.")
	set(CMAKE_BUILD_TYPE Debug CACHE STRING "Choose the type of build." FORCE)
	# Set the possible values of build type for cmake-gui
	set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS "Debug" "Release")
endif ()

project (OpenCL_Hello_World)

set (CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/")
 
find_package( OpenCL REQUIRED )

include_directories( ${OpenCL_INCLUDE_DIR} )
link_directories( ${OpenCL_LIBRARY} )

# Source code of application		
set (opencl_hello_src hello.c)
 
# Compiler flags
if (CMAKE_COMPILER_IS_GNUCC)
    set (CMAKE_CXX_FLAGS "-D_REETRANT -Wall -Wextra -pedantic -Wno-long-long")
	if (CMAKE_BUILD_TYPE STREQUAL "Debug")
   	    set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -ggdb -O0")
	elseif( CMAKE_BUILD_TYPE STREQUAL "Release" )
	    set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -DNDEBUG -O3 -fno-strict-aliasing")
	endif ()
    set (CMAKE_C_FLAGS "${CMAKE_CXX_FLAGS}")
endif (CMAKE_COMPILER_IS_GNUCC)
 
# Set up executable
add_executable (opencl_hello ${opencl_hello_src})
message(INFO "${OpenCL_LIBRARY}")
target_link_libraries(opencl_hello OpenCL)