# generated from ament/cmake/core/templates/nameConfig.cmake.in

# prevent multiple inclusion
if(_blockworld_gripper_CONFIG_INCLUDED)
  # ensure to keep the found flag the same
  if(NOT DEFINED blockworld_gripper_FOUND)
    # explicitly set it to FALSE, otherwise CMake will set it to TRUE
    set(blockworld_gripper_FOUND FALSE)
  elseif(NOT blockworld_gripper_FOUND)
    # use separate condition to avoid uninitialized variable warning
    set(blockworld_gripper_FOUND FALSE)
  endif()
  return()
endif()
set(_blockworld_gripper_CONFIG_INCLUDED TRUE)

# output package information
if(NOT blockworld_gripper_FIND_QUIETLY)
  message(STATUS "Found blockworld_gripper: 0.0.1 (${blockworld_gripper_DIR})")
endif()

# warn when using a deprecated package
if(NOT "" STREQUAL "")
  set(_msg "Package 'blockworld_gripper' is deprecated")
  # append custom deprecation text if available
  if(NOT "" STREQUAL "TRUE")
    set(_msg "${_msg} ()")
  endif()
  # optionally quiet the deprecation message
  if(NOT ${blockworld_gripper_DEPRECATED_QUIET})
    message(DEPRECATION "${_msg}")
  endif()
endif()

# flag package as ament-based to distinguish it after being find_package()-ed
set(blockworld_gripper_FOUND_AMENT_PACKAGE TRUE)

# include all config extra files
set(_extras "ament_cmake_export_dependencies-extras.cmake")
foreach(_extra ${_extras})
  include("${blockworld_gripper_DIR}/${_extra}")
endforeach()
