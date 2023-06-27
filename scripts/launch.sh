#!/bin/sh
docker run --rm -it --name ros2-xarm ghcr.io/iomz/ros2-xarm:humble ros2 launch xarm_api lite6_driver.launch.py robot_ip:=${ROBOT_IP}
