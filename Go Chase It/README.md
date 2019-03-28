
# Go Chase It

For this project, I had to design a mobile robot housed inside a Gazebo world that will chase a white ball. Robot is programmed with ROS using C++ nodes

___

## Nodes

- drive_bot
- process_image

___

## drive_bot

drive_bot.cpp is a server node that provides the ball_chaser/command_robot service and continuously publishes to the robot /cmd_vel topic

```Cpp
    #include "ros/ros.h"
#include "geometry_msgs/Twist.h"
#include "ball_chaser/DriveToTarget.h"

// ROS::Publisher motor commands;
ros::Publisher motor_command_publisher;

// This callback function executes whenever a drive service is requested
bool handle_drive_request(ball_chaser::DriveToTarget::Request& req,
    ball_chaser::DriveToTarget::Response& res)
{

    // Create a motor_command object of type geometry_msgs::Twist
    geometry_msgs::Twist motor_command;

    // Set wheel velocities, to requested values
    motor_command.linear.x = req.linear_x;
    motor_command.angular.z = req.angular_z;

    // Publish angles to drive the robot
    motor_command_publisher.publish(motor_command);

    res.msg_feedback = "Linear X set to: " + std::to_string(req.linear_x) + " Angular Z set to: " + std::to_string(req.angular_z);
    //ROS_INFO_STREAM(res.msg_feedback);

    return true;
}

int main(int argc, char** argv)
{
    // Initialize a ROS node
    ros::init(argc, argv, "drive_bot");

    // Create a ROS NodeHandle object
    ros::NodeHandle n;

    // Publishes a message of type geometry_msgs::Twist on the robot actuation topic with a queue size of 10
    motor_command_publisher = n.advertise<geometry_msgs::Twist>("/cmd_vel", 10);

    // Defines a drive /ball_chaser/command_robot service with a handle_drive_request callback function
    ros::ServiceServer service = n.advertiseService("/ball_chaser/command_robot", handle_drive_request);

    ros::spin();

    return 0;
}
```

## process_image

process_image.cpp is a client node that subscribes to the robot's camera image and analyzes the images to determine the position of a white ball. Once the ball's position is acquired, the client node will request a service from the drive_bot server node to drive the robot toward the ball.

```Cpp
    #include "ros/ros.h"
#include "ball_chaser/DriveToTarget.h"
#include <sensor_msgs/Image.h>

// Define a global client that can request services
ros::ServiceClient client;

// This function calls the command_robot service to drive the robot in the specified direction
void drive_robot(float lin_x, float ang_z)
{
    ball_chaser::DriveToTarget srv;
    srv.request.linear_x = lin_x;
    srv.request.angular_z = ang_z;

    if (!client.call(srv)) {
        ROS_ERROR("Failed to call service command_robot");
    }
}

// This callback function continuously executes and reads the image data
void process_image_callback(const sensor_msgs::Image img)
{

    int pixel_position = 0;
    bool white_pixel_found = false;
    std::string direction = "";

    // Loop through each RGB group of pixels in the image to check if any are white
    for (int i = 0; i < img.height * img.step; i+=3) {
        if (img.data[i] == 255) {
            if (img.data[i+1] == 255) {
                if (img.data[i+2] == 255) {
                    pixel_position = i+2;
                    white_pixel_found = true;
                    break;
                }
            }
        }
    }

    if (white_pixel_found == true) {

        //Ball is Left
        if (pixel_position % 2400 < 800) {
            direction = "Left";
            drive_robot(0.0, 0.5);
        }

        //Ball is Forward
        if (pixel_position % 2400 >= 800 && pixel_position % 2400 <= 1600) {
        direction = "Forward";
            drive_robot(0.2, 0.0);
        }

        //Ball is Right
        if (pixel_position % 2400 > 1600) {
            direction = "Right";
            drive_robot(0.0, -0.5);
        }

        ROS_INFO_STREAM("Ball Position is " + direction);

    } else {
        drive_robot(0.0, 0.0);
    }
}

int main(int argc, char** argv)
{
    // Initialize the process_image node and create a handle to it
    ros::init(argc, argv, "process_image");
    ros::NodeHandle n;

    // Define a client service capable of requesting services from command_robot
    client = n.serviceClient<ball_chaser::DriveToTarget>("/ball_chaser/command_robot");

    // Subscribe to /camera/rgb/image_raw topic to read the image data inside the process_image_callback function
    ros::Subscriber sub1 = n.subscribe("/camera/rgb/image_raw", 10, process_image_callback);

    // Handle ROS communication events
    ros::spin();

    return 0;
}
```

___

## Launch

You first need to source ROS for the project:

```console
    user:~/filepath$ source devel/setup.bash
```

![source ROS](https://github.com/matthewashley1/Udacity---Robotics-Software-Engineer-Nanodegree/blob/master/Go%20Chase%20It/img/GCI%20img2.png)

Build the project:

```console
    user:~/filepath$ catkin_make
```

![make project](https://github.com/matthewashley1/Udacity---Robotics-Software-Engineer-Nanodegree/blob/master/Go%20Chase%20It/img/GCI%20img3.png)

Launch project:

```console
    user:~/filepath$ roslaunch my_robot world.launch
```

![launch project](https://github.com/matthewashley1/Udacity---Robotics-Software-Engineer-Nanodegree/blob/master/Go%20Chase%20It/img/GCI%20img4.png)

___

## Output

![output](https://github.com/matthewashley1/Udacity---Robotics-Software-Engineer-Nanodegree/blob/master/Go%20Chase%20It/img/GCI%20img1.gif)