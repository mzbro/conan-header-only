########## MACROS ###########################################################################
#############################################################################################

# Requires CMake > 3.15
if(${CMAKE_VERSION} VERSION_LESS "3.15")
    message(FATAL_ERROR "The 'CMakeDeps' generator only works with CMake >= 3.15")
endif()

if(example_FIND_QUIETLY)
    set(example_MESSAGE_MODE VERBOSE)
else()
    set(example_MESSAGE_MODE STATUS)
endif()

include(${CMAKE_CURRENT_LIST_DIR}/cmakedeps_macros.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/exampleTargets.cmake)
include(CMakeFindDependencyMacro)

check_build_type_defined()

foreach(_DEPENDENCY ${example_FIND_DEPENDENCY_NAMES} )
    # Check that we have not already called a find_package with the transitive dependency
    if(NOT ${_DEPENDENCY}_FOUND)
        find_dependency(${_DEPENDENCY} REQUIRED ${${_DEPENDENCY}_FIND_MODE})
    endif()
endforeach()

set(example_VERSION_STRING "1.0.0")
set(example_INCLUDE_DIRS ${example_INCLUDE_DIRS_RELEASE} )
set(example_INCLUDE_DIR ${example_INCLUDE_DIRS_RELEASE} )
set(example_LIBRARIES ${example_LIBRARIES_RELEASE} )
set(example_DEFINITIONS ${example_DEFINITIONS_RELEASE} )


# Only the last installed configuration BUILD_MODULES are included to avoid the collision
foreach(_BUILD_MODULE ${example_BUILD_MODULES_PATHS_RELEASE} )
    message(${example_MESSAGE_MODE} "Conan: Including build module from '${_BUILD_MODULE}'")
    include(${_BUILD_MODULE})
endforeach()


