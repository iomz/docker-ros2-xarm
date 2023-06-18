#!/bin/sh
docker run --rm -it ros2-xarm ros2 launch xarm_api lite6_driver.launch.py robot_ip:=${ROBOT_IP}
