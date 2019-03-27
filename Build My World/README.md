
# Build My World

For this project, I had to create a Gazebo world environment by including multiple models.

___

## Modules

- Building Floor Plan
- Cabinet
- People
- Robot

## Script

Setup C++ script to run once Gazebo world is launched. Outputted to terminal *"Welcome to Matthew Ashley's World"*.

```C++
    #include <gazebo/gazebo.hh>

    namespace gazebo
    {
    class WorldPluginMyRobot : public WorldPlugin
    {
        public: WorldPluginMyRobot() : WorldPlugin()
                {
                printf("Welcome to Matthew Ashley's World\n");
                }

        public: void Load(physics::WorldPtr _world, sdf::ElementPtr _sdf)
                {
                }
    };
    GZ_REGISTER_WORLD_PLUGIN(WorldPluginMyRobot)
    }
```

## Launch

To launch the Gazebo world:

![launch command](https://github.com/matthewashley1/Udacity---Robotics-Software-Engineer-Nanodegree/blob/master/Build%20My%20World/img/BMW%20img1.png)

## Output

![Output](https://github.com/matthewashley1/Udacity---Robotics-Software-Engineer-Nanodegree/blob/master/Build%20My%20World/img/BMW%20img2.png)