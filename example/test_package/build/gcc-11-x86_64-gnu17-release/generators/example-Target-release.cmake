# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(example_FRAMEWORKS_FOUND_RELEASE "") # Will be filled later
conan_find_apple_frameworks(example_FRAMEWORKS_FOUND_RELEASE "${example_FRAMEWORKS_RELEASE}" "${example_FRAMEWORK_DIRS_RELEASE}")

set(example_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET example_DEPS_TARGET)
    add_library(example_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET example_DEPS_TARGET
             APPEND PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Release>:${example_FRAMEWORKS_FOUND_RELEASE}>
             $<$<CONFIG:Release>:${example_SYSTEM_LIBS_RELEASE}>
             $<$<CONFIG:Release>:sum::sum>)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### example_DEPS_TARGET to all of them
conan_package_library_targets("${example_LIBS_RELEASE}"    # libraries
                              "${example_LIB_DIRS_RELEASE}" # package_libdir
                              "${example_BIN_DIRS_RELEASE}" # package_bindir
                              "${example_LIBRARY_TYPE_RELEASE}"
                              "${example_IS_HOST_WINDOWS_RELEASE}"
                              example_DEPS_TARGET
                              example_LIBRARIES_TARGETS  # out_libraries_targets
                              "_RELEASE"
                              "example"    # package_name
                              "${example_NO_SONAME_MODE_RELEASE}")  # soname

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${example_BUILD_DIRS_RELEASE} ${CMAKE_MODULE_PATH})

########## GLOBAL TARGET PROPERTIES Release ########################################
    set_property(TARGET example::example
                 APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                 $<$<CONFIG:Release>:${example_OBJECTS_RELEASE}>
                 $<$<CONFIG:Release>:${example_LIBRARIES_TARGETS}>
                 )

    if("${example_LIBS_RELEASE}" STREQUAL "")
        # If the package is not declaring any "cpp_info.libs" the package deps, system libs,
        # frameworks etc are not linked to the imported targets and we need to do it to the
        # global target
        set_property(TARGET example::example
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     example_DEPS_TARGET)
    endif()

    set_property(TARGET example::example
                 APPEND PROPERTY INTERFACE_LINK_OPTIONS
                 $<$<CONFIG:Release>:${example_LINKER_FLAGS_RELEASE}>)
    set_property(TARGET example::example
                 APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                 $<$<CONFIG:Release>:${example_INCLUDE_DIRS_RELEASE}>)
    # Necessary to find LINK shared libraries in Linux
    set_property(TARGET example::example
                 APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                 $<$<CONFIG:Release>:${example_LIB_DIRS_RELEASE}>)
    set_property(TARGET example::example
                 APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                 $<$<CONFIG:Release>:${example_COMPILE_DEFINITIONS_RELEASE}>)
    set_property(TARGET example::example
                 APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                 $<$<CONFIG:Release>:${example_COMPILE_OPTIONS_RELEASE}>)

########## For the modules (FindXXX)
set(example_LIBRARIES_RELEASE example::example)
