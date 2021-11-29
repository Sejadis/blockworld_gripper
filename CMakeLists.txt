cmake_minimum_required(VERSION 3.5)
project(blockworld_gripper)


find_package(ament_cmake REQUIRED)
find_package(rclcpp REQUIRED)
find_package(rclcpp_action REQUIRED)
find_package(plansys2_msgs REQUIRED)
find_package(plansys2_executor REQUIRED)
find_package(open_manipulator_msgs REQUIRED)

set(CMAKE_CXX_STANDARD 17)

set(dependencies
    rclcpp
    rclcpp_action
    plansys2_msgs
    plansys2_executor
    open_manipulator_msgs
)

add_executable(control_gripper_action_node src/control_gripper_action_node.cpp)
ament_target_dependencies(control_gripper_action_node ${dependencies})

add_executable(move_gripper_action_node src/move_gripper_action_node.cpp)
ament_target_dependencies(move_gripper_action_node ${dependencies})

install(DIRECTORY launch pddl DESTINATION share/${PROJECT_NAME})

install(TARGETS
        move_gripper_action_node
        control_gripper_action_node
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
