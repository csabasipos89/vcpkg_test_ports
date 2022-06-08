SET(VCPKG_POLICY_EMPTY_PACKAGE enabled)


function(testing_nesting)
    z_vcpkg_setup_pkgconfig_path(BASE_DIRS ${CMAKE_CURRENT_LIST_DIR})
endfunction()


function(testing_nesting_nesting)
    testing_nesting()
endfunction(testing_nesting_nesting)


set(ENV{PKG_CONFIG_PATH} "/alma/korte")

# backup PKG_CONFIG and PKG_CONFIG_PAPTH variables
set(PKG_CONFIG_PATH $ENV{PKG_CONFIG_PATH})

z_vcpkg_setup_pkgconfig_path(BASE_DIRS ${CMAKE_CURRENT_LIST_DIR})
set(PKG_CONFIG_PATH_1 $ENV{PKG_CONFIG_PATH})
message(STATUS "PKG_CONFIG_PATH_1=${PKG_CONFIG_PATH_1}")

z_vcpkg_setup_pkgconfig_path(BASE_DIRS ${CMAKE_CURRENT_LIST_DIR})
set(PKG_CONFIG_PATH_2 $ENV{PKG_CONFIG_PATH})
message(STATUS "PKG_CONFIG_PATH_2=${PKG_CONFIG_PATH_2}")

z_vcpkg_setup_pkgconfig_path(BASE_DIRS ${CMAKE_CURRENT_LIST_DIR})
set(PKG_CONFIG_PATH_3 $ENV{PKG_CONFIG_PATH})
message(STATUS "PKG_CONFIG_PATH_3=${PKG_CONFIG_PATH_3}")

z_vcpkg_setup_pkgconfig_path(BASE_DIRS ${CMAKE_CURRENT_LIST_DIR})
set(PKG_CONFIG_PATH_4 $ENV{PKG_CONFIG_PATH})
message(STATUS "PKG_CONFIG_PATH_4=${PKG_CONFIG_PATH_4}")

if (NOT "${PKG_CONFIG_PATH_4}" STREQUAL "$ENV{PKG_CONFIG_PATH}")
    message(FATAL_ERROR "Failed to restore PKG_CONFIG_PATH variable: ${PKG_CONFIG_PATH_4} != $ENV{PKG_CONFIG_PATH}")
endif()

# restore and check variables
z_vcpkg_restore_pkgconfig_path()
message(STATUS "PKG_CONFIG_PATH_3=${PKG_CONFIG_PATH_3}")
if (NOT "${PKG_CONFIG_PATH_3}" STREQUAL "$ENV{PKG_CONFIG_PATH}")
    message(FATAL_ERROR "Failed to restore PKG_CONFIG_PATH variable: ${PKG_CONFIG_PATH_3} != $ENV{PKG_CONFIG_PATH}")
endif()

z_vcpkg_restore_pkgconfig_path()
message(STATUS "PKG_CONFIG_PATH_2=${PKG_CONFIG_PATH_2}")
if (NOT "${PKG_CONFIG_PATH_2}" STREQUAL "$ENV{PKG_CONFIG_PATH}")
    message(FATAL_ERROR "Failed to restore PKG_CONFIG_PATH variable: ${PKG_CONFIG_PATH_2} != $ENV{PKG_CONFIG_PATH}")
endif()

z_vcpkg_restore_pkgconfig_path()
message(STATUS "PKG_CONFIG_PATH_1=${PKG_CONFIG_PATH_1}")
if (NOT "${PKG_CONFIG_PATH_1}" STREQUAL "$ENV{PKG_CONFIG_PATH}")
    message(FATAL_ERROR "Failed to restore PKG_CONFIG_PATH variable: ${PKG_CONFIG_PATH_1} != $ENV{PKG_CONFIG_PATH}")
endif()

z_vcpkg_restore_pkgconfig_path()
message(STATUS "PKG_CONFIG_PATH=$ENV{PKG_CONFIG_PATH}")
if (NOT "${PKG_CONFIG_PATH}" STREQUAL "$ENV{PKG_CONFIG_PATH}")
    message(FATAL_ERROR "Failed to restore PKG_CONFIG_PATH variable: ${PKG_CONFIG_PATH} != $ENV{PKG_CONFIG_PATH}")
endif()

# uncomment it to fail with unmached vcpkg_restore_env_variables call
# z_vcpkg_restore_pkgconfig_path()


testing_nesting()
set(PKG_CONFIG_PATH_1 $ENV{PKG_CONFIG_PATH})
message(STATUS "PKG_CONFIG_PATH_1=${PKG_CONFIG_PATH_1}")

testing_nesting_nesting()
set(PKG_CONFIG_PATH_2 $ENV{PKG_CONFIG_PATH})
message(STATUS "PKG_CONFIG_PATH_2=${PKG_CONFIG_PATH_2}")

z_vcpkg_restore_pkgconfig_path()
message(STATUS "PKG_CONFIG_PATH_1=${PKG_CONFIG_PATH_1}")
if (NOT "${PKG_CONFIG_PATH_1}" STREQUAL "$ENV{PKG_CONFIG_PATH}")
    message(FATAL_ERROR "Failed to restore PKG_CONFIG_PATH variable: ${PKG_CONFIG_PATH_1} != $ENV{PKG_CONFIG_PATH}")
endif()

z_vcpkg_restore_pkgconfig_path()
message(STATUS "PKG_CONFIG_PATH=$ENV{PKG_CONFIG_PATH}")
if (NOT "${PKG_CONFIG_PATH}" STREQUAL "$ENV{PKG_CONFIG_PATH}")
    message(FATAL_ERROR "Failed to restore PKG_CONFIG_PATH variable: ${PKG_CONFIG_PATH} != $ENV{PKG_CONFIG_PATH}")
endif()


# z_vcpkg_restore_pkgconfig_path()