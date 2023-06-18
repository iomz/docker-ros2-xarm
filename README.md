# docker-ros2-xarm

[![Docker](https://github.com/iomz/docker-ros2-xarm/actions/workflows/docker.yml/badge.svg)](https://github.com/iomz/docker-ros2-xarm/actions/workflows/docker.yml)
[![Docker Image Size](https://ghcr-badge.egpl.dev/iomz/docker-ros2-xarm/size?label=Image%20Size)](https://github.com/iomz/docker-ros2-xarm/pkgs/container/ros2-xarm)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A multi-arch minimal docker image for ros2+xarm.

The image contains [xArm-Developer/xarm_ros2](https://github.com/xarm-developer/xarm_ros2/tree/humble) for [Humble Hawksbill](https://docs.ros.org/en/humble/Releases/Release-Humble-Hawksbill.html).

- linux/amd64: includes Moveit2, Gazebo, gazebo_ros_pkgs, and all the xarm_ros2 packages
- linux/arm64: only with xarm\_[api,description,msgs,sdk] packages

## Usage

```bash
docker pull ghcr.io/iomz/ros2-xarm
docker run --rm -it ros2-xarm
usage: ros2 [-h] [--use-python-default-buffering] Call `ros2 <command> -h` for more detailed usage. ...

ros2 is an extensible command-line tool for ROS 2.

options:
  -h, --help            show this help message and exit
  --use-python-default-buffering
                        Do not force line buffering in stdout and instead use the python default buffering, which might be affected by PYTHONUNBUFFERED/-u and depends
                        on whatever stdout is interactive or not

Commands:
  action     Various action related sub-commands
  bag        Various rosbag related sub-commands
  component  Various component related sub-commands
  daemon     Various daemon related sub-commands
  doctor     Check ROS setup and other potential issues
  interface  Show information about ROS interfaces
  launch     Run a launch file
  lifecycle  Various lifecycle related sub-commands
  multicast  Various multicast related sub-commands
  node       Various node related sub-commands
  param      Various param related sub-commands
  pkg        Various package related sub-commands
  run        Run a package specific executable
  security   Various security related sub-commands
  service    Various service related sub-commands
  topic      Various topic related sub-commands
  wtf        Use `wtf` as alias to `doctor`

  Call `ros2 <command> -h` for more detailed usage.
```

## (Example) Launch for Lite6 runnning at 10.0.0.6

```bash
docker run --rm -it ros2-xarm launch xarm_api lite6_driver.launch.py robot_ip:=10.0.0.6
```

## Build

```bash
docker buildx build --platform linux/amd64,linux/arm64 -t ros2-xarm .
```
