#include <memory>
#include <algorithm>

#include "plansys2_executor/ActionExecutorClient.hpp"

#include "rclcpp/rclcpp.hpp"
#include "rclcpp_action/rclcpp_action.hpp"
#include "open_manipulator_msgs/srv/set_joint_position.hpp"

using namespace std::chrono_literals;

class StackAction : public plansys2::ActionExecutorClient
{
public:
  StackAction()
  : plansys2::ActionExecutorClient("stack", 500ms)
  {
      isStarted = false;
      toolClient = this->create_client<open_manipulator_msgs::srv::SetJointPosition>("goal_tool_control");
      while (!toolClient->wait_for_service(1s)) {
          if (!rclcpp::ok()) {
              RCLCPP_ERROR(rclcpp::get_logger("rclcpp"), "Interrupted while waiting for the service. Exiting.");
          }
          RCLCPP_INFO(rclcpp::get_logger("rclcpp"), "service not available, waiting again...");
      }
  }
private:
  void do_work()
  {
      if (!isStarted) {
          isStarted = true;
          auto request = std::make_shared<open_manipulator_msgs::srv::SetJointPosition::Request>();
          request->path_time = 0.5;
          request->joint_position.joint_name.push_back("gripper");
          request->joint_position.position.push_back(0.01);
          auto result = toolClient->async_send_request(request);
          send_feedback(0.5, "grab running");
      } else {
          finish(true, 1.0, "grab completed");

          isStarted = false;
          std::cout << std::endl;
      }

    std::cout << "\r\e[K" << std::flush;
    std::cout << "Stacking ... [" << isStarted << "]  " <<
      std::flush;
  }

    bool isStarted;
    rclcpp::Client<open_manipulator_msgs::srv::SetJointPosition>::SharedPtr toolClient;
};

int main(int argc, char ** argv)
{
  rclcpp::init(argc, argv);
  auto node = std::make_shared<StackAction>();

  node->set_parameter(rclcpp::Parameter("action_name", "stack"));
  node->trigger_transition(lifecycle_msgs::msg::Transition::TRANSITION_CONFIGURE);

  rclcpp::spin(node->get_node_base_interface());

  rclcpp::shutdown();

  return 0;
}
