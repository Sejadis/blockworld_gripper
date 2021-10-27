cmake_minimum_required(VERSION 3.5)
project(blockworld_gripper)


find_package(ament_cmake REQUIRED)
find_package(rclcpp REQUIRED)
find_package(rclcpp_action REQUIRED)
find_package(plansys2_msgs REQUIRED)
find_package(plansys2_executor REQUIRED)

set(CMAKE_CXX_STANDARD 17)

set(dependencies
    rclcpp
    rclcpp_action
    plansys2_msgs
    plansys2_executor
)

add_executable(move_gripper_action_node src/move_gripper_action_node.cpp)
ament_target_dependencies(move_gripper_action_node ${dependencies})

add_executable(place_action_node src/place_action_node.cpp)
ament_target_dependencies(place_action_node ${dependencies})

add_executable(grab_action_node src/grab_action_node.cpp)
ament_target_dependencies(grab_action_node ${dependencies})

add_executable(stack_action_node src/stack_action_node.cpp)
ament_target_dependencies(stack_action_node ${dependencies})

add_executable(unstack_action_node src/unstack_action_node.cpp)
ament_target_dependencies(unstack_action_node ${dependencies})

install(DIRECTORY launch pddl DESTINATION share/${PROJECT_NAME})

install(TARGETS
  move_gripper_action_node
  place_action_node
  grab_action_node
  stack_action_node
  unstack_action_node
  ARCHIVE DESTINATION lib
  LIBRARY DESTINATION lib
  RUNTIME DESTINATION lib/${PROJECT_NAME}
)

if(BUILD_TESTING)
  find_package(ament_lint_auto REQUIRED)
  ament_lint_auto_find_test_dependencies()

  find_package(ament_cmake_gtest REQUIRED)
endif()

ament_export_dependencies(${dependencies})

ament_package()
