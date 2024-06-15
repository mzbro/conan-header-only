########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

set(example_COMPONENT_NAMES "")
if(DEFINED example_FIND_DEPENDENCY_NAMES)
  list(APPEND example_FIND_DEPENDENCY_NAMES sum)
  list(REMOVE_DUPLICATES example_FIND_DEPENDENCY_NAMES)
else()
  set(example_FIND_DEPENDENCY_NAMES sum)
endif()
set(sum_FIND_MODE "NO_MODULE")

########### VARIABLES #######################################################################
#############################################################################################
set(example_PACKAGE_FOLDER_RELEASE "/home/mzbroszczyk/.conan2/p/b/examp157e1c2b8f164/p")
set(example_BUILD_MODULES_PATHS_RELEASE )


set(example_INCLUDE_DIRS_RELEASE "${example_PACKAGE_FOLDER_RELEASE}/include")
set(example_RES_DIRS_RELEASE )
set(example_DEFINITIONS_RELEASE )
set(example_SHARED_LINK_FLAGS_RELEASE )
set(example_EXE_LINK_FLAGS_RELEASE )
set(example_OBJECTS_RELEASE )
set(example_COMPILE_DEFINITIONS_RELEASE )
set(example_COMPILE_OPTIONS_C_RELEASE )
set(example_COMPILE_OPTIONS_CXX_RELEASE )
set(example_LIB_DIRS_RELEASE "${example_PACKAGE_FOLDER_RELEASE}/lib")
set(example_BIN_DIRS_RELEASE )
set(example_LIBRARY_TYPE_RELEASE STATIC)
set(example_IS_HOST_WINDOWS_RELEASE 0)
set(example_LIBS_RELEASE example)
set(example_SYSTEM_LIBS_RELEASE )
set(example_FRAMEWORK_DIRS_RELEASE )
set(example_FRAMEWORKS_RELEASE )
set(example_BUILD_DIRS_RELEASE )
set(example_NO_SONAME_MODE_RELEASE FALSE)


# COMPOUND VARIABLES
set(example_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${example_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${example_COMPILE_OPTIONS_C_RELEASE}>")
set(example_LINKER_FLAGS_RELEASE
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${example_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${example_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${example_EXE_LINK_FLAGS_RELEASE}>")


set(example_COMPONENTS_RELEASE )