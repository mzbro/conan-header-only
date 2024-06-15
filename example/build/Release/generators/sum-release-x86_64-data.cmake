########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

set(sum_COMPONENT_NAMES "")
if(DEFINED sum_FIND_DEPENDENCY_NAMES)
  list(APPEND sum_FIND_DEPENDENCY_NAMES )
  list(REMOVE_DUPLICATES sum_FIND_DEPENDENCY_NAMES)
else()
  set(sum_FIND_DEPENDENCY_NAMES )
endif()

########### VARIABLES #######################################################################
#############################################################################################
set(sum_PACKAGE_FOLDER_RELEASE "/home/mzbroszczyk/.conan2/p/b/sum2246d1531ea4a/p")
set(sum_BUILD_MODULES_PATHS_RELEASE )


set(sum_INCLUDE_DIRS_RELEASE "${sum_PACKAGE_FOLDER_RELEASE}/include")
set(sum_RES_DIRS_RELEASE )
set(sum_DEFINITIONS_RELEASE )
set(sum_SHARED_LINK_FLAGS_RELEASE )
set(sum_EXE_LINK_FLAGS_RELEASE )
set(sum_OBJECTS_RELEASE )
set(sum_COMPILE_DEFINITIONS_RELEASE )
set(sum_COMPILE_OPTIONS_C_RELEASE )
set(sum_COMPILE_OPTIONS_CXX_RELEASE )
set(sum_LIB_DIRS_RELEASE )
set(sum_BIN_DIRS_RELEASE )
set(sum_LIBRARY_TYPE_RELEASE UNKNOWN)
set(sum_IS_HOST_WINDOWS_RELEASE 0)
set(sum_LIBS_RELEASE )
set(sum_SYSTEM_LIBS_RELEASE )
set(sum_FRAMEWORK_DIRS_RELEASE )
set(sum_FRAMEWORKS_RELEASE )
set(sum_BUILD_DIRS_RELEASE )
set(sum_NO_SONAME_MODE_RELEASE FALSE)


# COMPOUND VARIABLES
set(sum_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${sum_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${sum_COMPILE_OPTIONS_C_RELEASE}>")
set(sum_LINKER_FLAGS_RELEASE
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${sum_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${sum_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${sum_EXE_LINK_FLAGS_RELEASE}>")


set(sum_COMPONENTS_RELEASE )