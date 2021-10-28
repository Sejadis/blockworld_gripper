# Install script for directory: /home/fabian/colcon_ws/src/blockworld_gripper

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/blockworld_gripper" TYPE DIRECTORY FILES
    "/home/fabian/colcon_ws/src/blockworld_gripper/launch"
    "/home/fabian/colcon_ws/src/blockworld_gripper/pddl"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/blockworld_gripper/move_gripper_action_node" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/blockworld_gripper/move_gripper_action_node")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/blockworld_gripper/move_gripper_action_node"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/blockworld_gripper" TYPE EXECUTABLE FILES "/home/fabian/colcon_ws/src/blockworld_gripper/cmake-build-debug/move_gripper_action_node")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/blockworld_gripper/move_gripper_action_node" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/blockworld_gripper/move_gripper_action_node")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/blockworld_gripper/move_gripper_action_node"
         OLD_RPATH "/opt/ros/foxy/lib:/home/fabian/colcon_ws/install/plansys2_msgs/lib:/home/fabian/colcon_ws/install/open_manipulator_msgs/lib:/home/fabian/colcon_ws/install/plansys2_executor/lib:/home/fabian/colcon_ws/install/plansys2_planner/lib:/home/fabian/colcon_ws/install/plansys2_problem_expert/lib:/home/fabian/colcon_ws/install/plansys2_domain_expert/lib:/home/fabian/colcon_ws/install/plansys2_popf_plan_solver/lib:/opt/ros/foxy/lib/x86_64-linux-gnu:/home/fabian/colcon_ws/install/plansys2_pddl_parser/lib:/home/fabian/colcon_ws/install/plansys2_core/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/blockworld_gripper/move_gripper_action_node")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/blockworld_gripper/place_action_node" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/blockworld_gripper/place_action_node")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/blockworld_gripper/place_action_node"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/blockworld_gripper" TYPE EXECUTABLE FILES "/home/fabian/colcon_ws/src/blockworld_gripper/cmake-build-debug/place_action_node")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/blockworld_gripper/place_action_node" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/blockworld_gripper/place_action_node")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/blockworld_gripper/place_action_node"
         OLD_RPATH "/opt/ros/foxy/lib:/home/fabian/colcon_ws/install/plansys2_msgs/lib:/home/fabian/colcon_ws/install/open_manipulator_msgs/lib:/home/fabian/colcon_ws/install/plansys2_executor/lib:/home/fabian/colcon_ws/install/plansys2_planner/lib:/home/fabian/colcon_ws/install/plansys2_problem_expert/lib:/home/fabian/colcon_ws/install/plansys2_domain_expert/lib:/home/fabian/colcon_ws/install/plansys2_popf_plan_solver/lib:/opt/ros/foxy/lib/x86_64-linux-gnu:/home/fabian/colcon_ws/install/plansys2_pddl_parser/lib:/home/fabian/colcon_ws/install/plansys2_core/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/blockworld_gripper/place_action_node")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/blockworld_gripper/grab_action_node" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/blockworld_gripper/grab_action_node")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/blockworld_gripper/grab_action_node"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/blockworld_gripper" TYPE EXECUTABLE FILES "/home/fabian/colcon_ws/src/blockworld_gripper/cmake-build-debug/grab_action_node")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/blockworld_gripper/grab_action_node" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/blockworld_gripper/grab_action_node")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/blockworld_gripper/grab_action_node"
         OLD_RPATH "/opt/ros/foxy/lib:/home/fabian/colcon_ws/install/plansys2_msgs/lib:/home/fabian/colcon_ws/install/open_manipulator_msgs/lib:/home/fabian/colcon_ws/install/plansys2_executor/lib:/home/fabian/colcon_ws/install/plansys2_planner/lib:/home/fabian/colcon_ws/install/plansys2_problem_expert/lib:/home/fabian/colcon_ws/install/plansys2_domain_expert/lib:/home/fabian/colcon_ws/install/plansys2_popf_plan_solver/lib:/opt/ros/foxy/lib/x86_64-linux-gnu:/home/fabian/colcon_ws/install/plansys2_pddl_parser/lib:/home/fabian/colcon_ws/install/plansys2_core/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/blockworld_gripper/grab_action_node")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/blockworld_gripper/stack_action_node" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/blockworld_gripper/stack_action_node")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/blockworld_gripper/stack_action_node"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/blockworld_gripper" TYPE EXECUTABLE FILES "/home/fabian/colcon_ws/src/blockworld_gripper/cmake-build-debug/stack_action_node")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/blockworld_gripper/stack_action_node" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/blockworld_gripper/stack_action_node")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/blockworld_gripper/stack_action_node"
         OLD_RPATH "/opt/ros/foxy/lib:/home/fabian/colcon_ws/install/plansys2_msgs/lib:/home/fabian/colcon_ws/install/open_manipulator_msgs/lib:/home/fabian/colcon_ws/install/plansys2_executor/lib:/home/fabian/colcon_ws/install/plansys2_planner/lib:/home/fabian/colcon_ws/install/plansys2_problem_expert/lib:/home/fabian/colcon_ws/install/plansys2_domain_expert/lib:/home/fabian/colcon_ws/install/plansys2_popf_plan_solver/lib:/opt/ros/foxy/lib/x86_64-linux-gnu:/home/fabian/colcon_ws/install/plansys2_pddl_parser/lib:/home/fabian/colcon_ws/install/plansys2_core/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/blockworld_gripper/stack_action_node")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/blockworld_gripper/unstack_action_node" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/blockworld_gripper/unstack_action_node")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/blockworld_gripper/unstack_action_node"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/blockworld_gripper" TYPE EXECUTABLE FILES "/home/fabian/colcon_ws/src/blockworld_gripper/cmake-build-debug/unstack_action_node")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/blockworld_gripper/unstack_action_node" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/blockworld_gripper/unstack_action_node")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/blockworld_gripper/unstack_action_node"
         OLD_RPATH "/opt/ros/foxy/lib:/home/fabian/colcon_ws/install/plansys2_msgs/lib:/home/fabian/colcon_ws/install/open_manipulator_msgs/lib:/home/fabian/colcon_ws/install/plansys2_executor/lib:/home/fabian/colcon_ws/install/plansys2_planner/lib:/home/fabian/colcon_ws/install/plansys2_problem_expert/lib:/home/fabian/colcon_ws/install/plansys2_domain_expert/lib:/home/fabian/colcon_ws/install/plansys2_popf_plan_solver/lib:/opt/ros/foxy/lib/x86_64-linux-gnu:/home/fabian/colcon_ws/install/plansys2_pddl_parser/lib:/home/fabian/colcon_ws/install/plansys2_core/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/blockworld_gripper/unstack_action_node")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ament_index/resource_index/package_run_dependencies" TYPE FILE FILES "/home/fabian/colcon_ws/src/blockworld_gripper/cmake-build-debug/ament_cmake_index/share/ament_index/resource_index/package_run_dependencies/blockworld_gripper")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ament_index/resource_index/parent_prefix_path" TYPE FILE FILES "/home/fabian/colcon_ws/src/blockworld_gripper/cmake-build-debug/ament_cmake_index/share/ament_index/resource_index/parent_prefix_path/blockworld_gripper")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/blockworld_gripper/environment" TYPE FILE FILES "/opt/ros/foxy/share/ament_cmake_core/cmake/environment_hooks/environment/ament_prefix_path.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/blockworld_gripper/environment" TYPE FILE FILES "/home/fabian/colcon_ws/src/blockworld_gripper/cmake-build-debug/ament_cmake_environment_hooks/ament_prefix_path.dsv")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/blockworld_gripper/environment" TYPE FILE FILES "/opt/ros/foxy/share/ament_cmake_core/cmake/environment_hooks/environment/path.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/blockworld_gripper/environment" TYPE FILE FILES "/home/fabian/colcon_ws/src/blockworld_gripper/cmake-build-debug/ament_cmake_environment_hooks/path.dsv")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/blockworld_gripper" TYPE FILE FILES "/home/fabian/colcon_ws/src/blockworld_gripper/cmake-build-debug/ament_cmake_environment_hooks/local_setup.bash")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/blockworld_gripper" TYPE FILE FILES "/home/fabian/colcon_ws/src/blockworld_gripper/cmake-build-debug/ament_cmake_environment_hooks/local_setup.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/blockworld_gripper" TYPE FILE FILES "/home/fabian/colcon_ws/src/blockworld_gripper/cmake-build-debug/ament_cmake_environment_hooks/local_setup.zsh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/blockworld_gripper" TYPE FILE FILES "/home/fabian/colcon_ws/src/blockworld_gripper/cmake-build-debug/ament_cmake_environment_hooks/local_setup.dsv")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/blockworld_gripper" TYPE FILE FILES "/home/fabian/colcon_ws/src/blockworld_gripper/cmake-build-debug/ament_cmake_environment_hooks/package.dsv")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ament_index/resource_index/packages" TYPE FILE FILES "/home/fabian/colcon_ws/src/blockworld_gripper/cmake-build-debug/ament_cmake_index/share/ament_index/resource_index/packages/blockworld_gripper")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/blockworld_gripper/cmake" TYPE FILE FILES "/home/fabian/colcon_ws/src/blockworld_gripper/cmake-build-debug/ament_cmake_export_dependencies/ament_cmake_export_dependencies-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/blockworld_gripper/cmake" TYPE FILE FILES
    "/home/fabian/colcon_ws/src/blockworld_gripper/cmake-build-debug/ament_cmake_core/blockworld_gripperConfig.cmake"
    "/home/fabian/colcon_ws/src/blockworld_gripper/cmake-build-debug/ament_cmake_core/blockworld_gripperConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/blockworld_gripper" TYPE FILE FILES "/home/fabian/colcon_ws/src/blockworld_gripper/package.xml")
endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/fabian/colcon_ws/src/blockworld_gripper/cmake-build-debug/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
