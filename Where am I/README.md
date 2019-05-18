
# Where Am I

For this project, I had to design a mobile robot housed inside a Gazebo world that implemented the AMCL localization package in ROS to localize my mobile robot

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

Launch AMCL:

```console
    user:~/filepath$ roslaunch my_robot amcl.launch
```

___

## Output

![output](https://github.com/matthewashley1/Udacity---Robotics-Software-Engineer-Nanodegree/blob/master/Go%20Chase%20It/img/GCI%20img1.gif)
