#include <memory>
#include <algorithm>

#include "plansys2_executor/ActionExecutorClient.hpp"

#include "rclcpp/rclcpp.hpp"
#include "rclcpp_action/rclcpp_action.hpp"

using namespace std::chrono_literals;

class MoveGripper : public plansys2::ActionExecutorClient
{
public:
  MoveGripper()
  : plansys2::ActionExecutorClient("move-gripper", 1s)
  {
    progress_ = 0.0;
  }
