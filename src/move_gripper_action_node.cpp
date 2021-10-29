#include <memory>
#include <algorithm>
#include <queue>

#include "plansys2_executor/ActionExecutorClient.hpp"

#include "rclcpp/rclcpp.hpp"
#include "rclcpp_action/rclcpp_action.hpp"

#include "open_manipulator_msgs/msg/open_manipulator_state.hpp"
#include "open_manipulator_msgs/msg/kinematics_pose.hpp"
#include "open_manipulator_msgs/srv/set_kinematics_pose.hpp"

using namespace std::chrono_literals;
using std::placeholders::_1;

class MoveGripperAction : public plansys2::ActionExecutorClient {
public:
    MoveGripperAction()
            : plansys2::ActionExecutorClient("move_gripper", 100ms) {
        isStarted = false;
        isCurrentMovementFinished = false;
        manipulator_state_subscription_ = this->create_subscription<open_manipulator_msgs::msg::OpenManipulatorState>(
                "states", 10, std::bind(&MoveGripperAction::manipulator_state_callback, this, _1));
        kinematics_pose_subscription_ = this->create_subscription<open_manipulator_msgs::msg::KinematicsPose>(
                "kinematics_pose", 10, std::bind(&MoveGripperAction::kinematics_pose_callback, this, _1));
        kinematicsPoseClient = this->create_client<open_manipulator_msgs::srv::SetKinematicsPose>(
                "goal_task_space_path_position_only");
        while (!kinematicsPoseClient->wait_for_service(1s)) {
            if (!rclcpp::ok()) {
                RCLCPP_ERROR(rclcpp::get_logger("rclcpp"), "Interrupted while waiting for the service. Exiting.");
                break;
            }
            RCLCPP_INFO(rclcpp::get_logger("rclcpp"), "KinematicsPose service not available, waiting again...");
        }
    }

private:
    void manipulator_state_callback(const open_manipulator_msgs::msg::OpenManipulatorState::SharedPtr msg) {
        //std::cout << msg->open_manipulator_moving_state << std::endl;
        last_moving_state = current_moving_state;
        current_moving_state = msg->open_manipulator_moving_state;
        if(last_moving_state == STATE_MOVING && current_moving_state == STATE_STOPPED){
            isCurrentMovementFinished = true;
            queueTasksDone++;
        }
    }
    void kinematics_pose_callback(const open_manipulator_msgs::msg::KinematicsPose::SharedPtr msg) {
        //std::cout << &msg << std::endl;
        kinematicsPose = msg;
    }

    void do_work() {

        if (!isStarted) {
            isStarted = true;
            isCurrentMovementFinished = true; //we want to immediately start the next movement
            auto args = get_arguments();
            int level = -1;

            std::map<std::string, int>::const_iterator iterLevel = levelMap.find(args[2]);
            if (iterLevel != levelMap.end()) {
                std::cout << iterLevel->first << "->" << iterLevel->second << " ";
                level = iterLevel->second;
            }
            int stack = -1;
            std::map<std::string, int>::const_iterator iterStack = stackMap.find(args[2]);
            if (iterStack != levelMap.end()) {
                std::cout << iterStack->first << "->" << iterStack->second;
                stack = iterStack->second;
            }

            create_movement(stack, level);
            queueLength = requestQueue.size();
            queueTasksDone = 0;
            send_feedback(float(queueTasksDone) / queueLength, "Move started");
        }
        if(isCurrentMovementFinished){
            if (!requestQueue.empty()) {
                auto nextRequest = requestQueue.front();
                requestQueue.pop();
                isCurrentMovementFinished = false;
                auto result = kinematicsPoseClient->async_send_request(nextRequest);
                send_feedback(float(queueTasksDone) / queueLength, "Move started");
            }
            else if(isStarted){
                //we did start and no more movement enqueued
                finish(true, 1.0, "Move completed");

                isStarted = false;
                std::cout << std::endl;
            }
        }


        std::cout << "\r\e[K"  << std::flush;
        std::cout << "Moving ... [" << float(queueTasksDone) / queueLength << "]  " << std::flush;
    }

    void create_movement(int stack, int level){
        //clear the queue by swapping with an empty one
        std::queue<std::shared_ptr<open_manipulator_msgs::srv::SetKinematicsPose::Request>> emptyQueue;
        std::swap(requestQueue, emptyQueue);
        if(stack == -1 || level == -1 || kinematicsPose == nullptr){
            std::cout << "Error detected when creating movement stack: " << stack << " level: " << level << " Pose null: " << (kinematicsPose == nullptr);
            return;
        }
        //a position above the current that is clear from collisions
        auto currentPosition = kinematicsPose->pose.position;
        std::cout << "Current (" << currentPosition.x << ", " << currentPosition.y << ", " << currentPosition.z << ")" << std::flush;
        std::cout << "Target (" << STACK_POS << ", " << stackPosMap[stack] << ", " << heightMap[level] << ")" << std::flush;
        if(roundTo2DecimalPlaces(currentPosition.x) != STACK_POS || roundTo2DecimalPlaces(currentPosition.y) != stackPosMap[stack]){
            auto currentClearRequest = create_request(currentPosition.x, currentPosition.y, CLEAR_HEIGHT);

            //a position above the target position that is clear from collisions
            auto targetClearRequest = create_request(STACK_POS,stackPosMap[stack], CLEAR_HEIGHT);
            requestQueue.push(currentClearRequest);
            requestQueue.push(targetClearRequest);
        }

        //the position we want to end up at
        auto targetPointRequest = create_request(STACK_POS, stackPosMap[stack], heightMap[level]);
        requestQueue.push(targetPointRequest);
    }

    std::shared_ptr<open_manipulator_msgs::srv::SetKinematicsPose::Request> create_request(float x, float y, float z) {
        auto request = std::make_shared<open_manipulator_msgs::srv::SetKinematicsPose::Request>();
        request->end_effector_name = "gripper";
        request->kinematics_pose.pose.position.x = x;
        request->kinematics_pose.pose.position.y = y;
        request->kinematics_pose.pose.position.z = z;
        request->path_time = 2.5;

        return request;
    }

    float roundTo2DecimalPlaces(float input){
        return roundf(input * 100) / 100;
    }

    rclcpp::Subscription<open_manipulator_msgs::msg::OpenManipulatorState>::SharedPtr manipulator_state_subscription_;
    rclcpp::Subscription<open_manipulator_msgs::msg::KinematicsPose>::SharedPtr kinematics_pose_subscription_;
    rclcpp::Client<open_manipulator_msgs::srv::SetKinematicsPose>::SharedPtr kinematicsPoseClient;
    std::shared_ptr<open_manipulator_msgs::msg::KinematicsPose> kinematicsPose;
    std::queue<std::shared_ptr<open_manipulator_msgs::srv::SetKinematicsPose::Request>> requestQueue;
    bool isStarted;
    bool isCurrentMovementFinished;
    int queueLength;
    int queueTasksDone;
    //int level = -1;
    std::string current_moving_state;
    std::string last_moving_state;
    const std::string STATE_MOVING = "IS_MOVING";
    const std::string STATE_STOPPED = "STOPPED";
    const float STACK_POS = 0.25;
    const float CLEAR_HEIGHT = 0.25;
    std::map<std::string, int> levelMap = {
            {"s1l1", 1},
            {"s2l1", 1},
            {"s3l1", 1},
            {"s1l2", 2},
            {"s2l2", 2},
            {"s3l2", 2},
            {"s1l3", 3},
            {"s2l3", 3},
            {"s3l3", 3},
    };
    std::map<std::string, int> stackMap = {
            {"s1l1", 1},
            {"s1l3", 1},
            {"s1l2", 1},
            {"s2l1", 2},
            {"s2l3", 2},
            {"s2l2", 2},
            {"s3l2", 3},
            {"s3l1", 3},
            {"s3l3", 3},
    };
    std::map<int, float> heightMap = {
            {1, 0.04},
            {2, 0.085},
            {3, 0.13},
    };
    std::map<int, float> stackPosMap = {
            {1, -0.1},
            {2, 0.0},
            {3, 0.1},
    };

};

int main(int argc, char **argv) {
    rclcpp::init(argc, argv);
    auto node = std::make_shared<MoveGripperAction>();

    node->set_parameter(rclcpp::Parameter("action_name", "move-gripper"));
    node->trigger_transition(lifecycle_msgs::msg::Transition::TRANSITION_CONFIGURE);

    rclcpp::spin(node->get_node_base_interface());

    rclcpp::shutdown();

    return 0;
}
