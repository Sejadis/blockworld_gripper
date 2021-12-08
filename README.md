# Package for Blockworld with Gripper using OpenMANIPULATOR-X

## Description

This allows to run planning tasks in a blockworld using a gripper and PlanSys2.
A domain and example problem files are provided. Problems can be created either with the PlanSys2 Terminal manually or using the provided launch file to load a provided problem.

## How to run
Start the OpenMANIPULATOR-X controller

In terminal 1:

```
ros2 launch open_manipulator_x_controller  open_manipulator_x_controller.launch.py
```
OPTIONALLY start the teleop

In terminal 2:
```
ros2 run open_manipulator_x_teleop open_manipulator_x_teleop_keyboard
```

Start the planning system

In terminal 3:

EITHER:
```
ros2 launch blockworld_gripper blockworld_gripper_launch_3_stacks.py
```
OR
```
ros2 launch blockworld_gripper blockworld_gripper_launch_5_stacks.py
```

Start the plansys terminal

In terminal 4:
EITHER:
```
ros2 run plansys2_terminal plansys2_terminal
```
then copy and paste the content of one of the problems in "/terminal_problems/"

OR
