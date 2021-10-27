# Copyright 2019 Intelligent Robotics Lab
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

import os

from ament_index_python.packages import get_package_share_directory

from launch import LaunchDescription
from launch.actions import DeclareLaunchArgument, IncludeLaunchDescription, SetEnvironmentVariable
from launch.launch_description_sources import PythonLaunchDescriptionSource
from launch.substitutions import LaunchConfiguration
from launch_ros.actions import Node


def generate_launch_description():
    # Get the launch directory
    example_dir = get_package_share_directory('blockworld_gripper')
    namespace = LaunchConfiguration('namespace')

    declare_namespace_cmd = DeclareLaunchArgument(
        'namespace',
        default_value='',
        description='Namespace')

    stdout_linebuf_envvar = SetEnvironmentVariable(
        'RCUTILS_CONSOLE_STDOUT_LINE_BUFFERED', '1')

    plansys2_cmd = IncludeLaunchDescription(
        PythonLaunchDescriptionSource(os.path.join(
            get_package_share_directory('plansys2_bringup'),
            'launch',
            'plansys2_bringup_launch_monolithic.py')),
        launch_arguments={
          'model_file': example_dir + '/pddl/test-domain.pddl',
          'namespace': namespace
          }.items())

    # Specify the actions
    move_gripper_cmd = Node(
        package='blockworld_gripper',
        executable='move_gripper_action_node',
        name='move_gripper_action_node',
        namespace=namespace,
        output='screen',
        parameters=[])

    grab_cmd = Node(
        package='blockworld_gripper',
        executable='grab_action_node',
        name='grab_action_node',
        namespace=namespace,
        output='screen',
        parameters=[])

    place_cmd = Node(
        package='blockworld_gripper',
        executable='place_action_node',
        name='place_action_node',
        namespace=namespace,
        output='screen',
        parameters=[])

    stack_cmd = Node(
        package='blockworld_gripper',
        executable='stack_action_node',
        name='stack_action_node',
        namespace=namespace,
        output='screen',
        parameters=[])

    unstack_cmd = Node(
        package='blockworld_gripper',
        executable='unstack_action_node',
        name='unstack_action_node',
        namespace=namespace,
        output='screen',
        parameters=[])
    # Create the launch description and populate
    ld = LaunchDescription()

    # Set environment variables
    ld.add_action(stdout_linebuf_envvar)
    ld.add_action(declare_namespace_cmd)

    # Declare the launch options
    ld.add_action(plansys2_cmd)

    ld.add_action(move_gripper_cmd)
    ld.add_action(grab_cmd)
    ld.add_action(place_cmd)
    ld.add_action(stack_cmd)
    ld.add_action(unstack_cmd)

    return ld
