
# Map My World

For this project, I had to design a mobile robot housed inside a Gazebo world that implemented the RTAB-map package in ROS to utilize a SLAM approach to localize my mobile robot and map the robot's world

___

## Launch

You first need to source ROS for the project:

```console
    user:~/filepath$ source devel/setup.bash
```

![source ROS](https://github.com/matthewashley1/Udacity---Robotics-Software-Engineer-Nanodegree/blob/master/Map%20My%20World/img/MMW%20img1.png)

Launch project:

```console
    user:~/filepath$ roslaunch my_robot world.launch
```

![launch project](https://github.com/matthewashley1/Udacity---Robotics-Software-Engineer-Nanodegree/blob/master/Map%20My%20World/img/MMW%20img2.png)

Run Teleop to drive robot:

```console
    user:~/filepath$ rosrun teleop_twist_keyboard teleop_twist_keyboard.py
```

![run Teleop](https://github.com/matthewashley1/Udacity---Robotics-Software-Engineer-Nanodegree/blob/master/Map%20My%20World/img/MMW%20img4.png)

Launch RTAB-map to do mapping:

```console
    user:~/filepath$ roslaunch my_robot mapping.launch
```

![launch RTAB-map](https://github.com/matthewashley1/Udacity---Robotics-Software-Engineer-Nanodegree/blob/master/Map%20My%20World/img/MMW%20img3.png)

___

## Output

![output](https://github.com/matthewashley1/Udacity---Robotics-Software-Engineer-Nanodegree/blob/master/Map%20My%20World/img/MMW%20img5.png)
