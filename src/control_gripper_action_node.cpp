//
// Created by fabian on 29.10.21.
//

#include <memory>
#include <algorithm>

#include "plansys2_executor/ActionExecutorClient.hpp"

#include "rclcpp/rclcpp.hpp"
#include "rclcpp_action/rclcpp_action.hpp"
#include "open_manipulator_msgs/srv/set_joint_position.hpp"

using namespace std::chrono_literals;

class GripperControlAction : public plansys2::ActionExecutorClient
{
public:
    GripperControlAction(std::string name, bool isOpener)
            : plansys2::ActionExecutorClient(name, 500ms)
    {
        nodeName = name;
        toolTargetValue = isOpener ? OPENING_VALUE : CLOSING_VALUE;
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
            //create and send request for first call
            isStarted = true;
            auto request = std::make_shared<open_manipulator_msgs::srv::SetJointPosition::Request>();
            request->path_time = 0.5;
            request->joint_position.joint_name.push_back("gripper");
            request->joint_position.position.push_back(toolTargetValue);
            auto result = toolClient->async_send_request(request);
            send_feedback(isStarted,  + "running");
            std::cout << nodeName <<" ... [started]" << std::endl;
        } else {
            //finish the execution on 2nd call
            finish(true, 1.0, "grab completed");

            isStarted = false;
            std::cout << nodeName <<" ... [finished]" << std::endl;
        }
    }

    std::string nodeName;
    float toolTargetValue;
    const float OPENING_VALUE = 0.01;
    const float CLOSING_VALUE = -0.01;
    bool isStarted;
    rclcpp::Client<open_manipulator_msgs::srv::SetJointPosition>::SharedPtr toolClient;
};

int main(int argc, char ** argv)
{
    rclcpp::init(argc, argv);
    rclcpp::executors::MultiThreadedExecutor exe(rclcpp::executor::ExecutorArgs(), 8);

    auto grabNode = std::make_shared<GripperControlAction>("grab", false);
    auto unstackNode = std::make_shared<GripperControlAction>("unstack", false);
    auto placeNode = std::make_shared<GripperControlAction>("place", true);
    auto stackNode = std::make_shared<GripperControlAction>("stack", true);

    grabNode->set_parameter(rclcpp::Parameter("action_name", "grab"));
    grabNode->trigger_transition(lifecycle_msgs::msg::Transition::TRANSITION_CONFIGURE);

    unstackNode->set_parameter(rclcpp::Parameter("action_name", "unstack"));
    unstackNode->trigger_transition(lifecycle_msgs::msg::Transition::TRANSITION_CONFIGURE);

    placeNode->set_parameter(rclcpp::Parameter("action_name", "place"));
    placeNode->trigger_transition(lifecycle_msgs::msg::Transition::TRANSITION_CONFIGURE);

    stackNode->set_parameter(rclcpp::Parameter("action_name", "stack"));
    stackNode->trigger_transition(lifecycle_msgs::msg::Transition::TRANSITION_CONFIGURE);

    exe.add_node(grabNode->get_node_base_interface());
    exe.add_node(unstackNode->get_node_base_interface());
    exe.add_node(placeNode->get_node_base_interface());
    exe.add_node(stackNode->get_node_base_interface());

    exe.spin();

    rclcpp::shutdown();

    return 0;
}
