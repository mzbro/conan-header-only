# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(sum_FRAMEWORKS_FOUND_RELEASE "") # Will be filled later
conan_find_apple_frameworks(sum_FRAMEWORKS_FOUND_RELEASE "${sum_FRAMEWORKS_RELEASE}" "${sum_FRAMEWORK_DIRS_RELEASE}")

set(sum_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET sum_DEPS_TARGET)
    add_library(sum_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET sum_DEPS_TARGET
             APPEND PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Release>:${sum_FRAMEWORKS_FOUND_RELEASE}>
             $<$<CONFIG:Release>:${sum_SYSTEM_LIBS_RELEASE}>
             $<$<CONFIG:Release>:>)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### sum_DEPS_TARGET to all of them
conan_package_library_targets("${sum_LIBS_RELEASE}"    # libraries
                              "${sum_LIB_DIRS_RELEASE}" # package_libdir
                              "${sum_BIN_DIRS_RELEASE}" # package_bindir
                              "${sum_LIBRARY_TYPE_RELEASE}"
                              "${sum_IS_HOST_WINDOWS_RELEASE}"
                              sum_DEPS_TARGET
                              sum_LIBRARIES_TARGETS  # out_libraries_targets
                              "_RELEASE"
                              "sum"    # package_name
                              "${sum_NO_SONAME_MODE_RELEASE}")  # soname

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${sum_BUILD_DIRS_RELEASE} ${CMAKE_MODULE_PATH})

########## GLOBAL TARGET PROPERTIES Release ########################################
    set_property(TARGET sum::sum
                 APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                 $<$<CONFIG:Release>:${sum_OBJECTS_RELEASE}>
                 $<$<CONFIG:Release>:${sum_LIBRARIES_TARGETS}>
                 )

    if("${sum_LIBS_RELEASE}" STREQUAL "")
        # If the package is not declaring any "cpp_info.libs" the package deps, system libs,
        # frameworks etc are not linked to the imported targets and we need to do it to the
        # global target
        set_property(TARGET sum::sum
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     sum_DEPS_TARGET)
    endif()

    set_property(TARGET sum::sum
                 APPEND PROPERTY INTERFACE_LINK_OPTIONS
                 $<$<CONFIG:Release>:${sum_LINKER_FLAGS_RELEASE}>)
    set_property(TARGET sum::sum
                 APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                 $<$<CONFIG:Release>:${sum_INCLUDE_DIRS_RELEASE}>)
    # Necessary to find LINK shared libraries in Linux
    set_property(TARGET sum::sum
                 APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                 $<$<CONFIG:Release>:${sum_LIB_DIRS_RELEASE}>)
    set_property(TARGET sum::sum
                 APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                 $<$<CONFIG:Release>:${sum_COMPILE_DEFINITIONS_RELEASE}>)
    set_property(TARGET sum::sum
                 APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                 $<$<CONFIG:Release>:${sum_COMPILE_OPTIONS_RELEASE}>)

########## For the modules (FindXXX)
set(sum_LIBRARIES_RELEASE sum::sum)
