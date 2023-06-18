#!/bin/sh
docker run --rm -it ros2-xarm ros2 service call /ufactory/motion_enable xarm_msgs/srv/SetInt16ById "{id: 8, data: 1}"
docker run --rm -it ros2-xarm ros2 service call /ufactory/motion_enable xarm_msgs/srv/SetInt16ById "{id: 8, data: 1}"
docker run --rm -it ros2-xarm ros2 service call /ufactory/set_mode xarm_msgs/srv/SetInt16 "{data: 0}"
docker run --rm -it ros2-xarm ros2 service call /ufactory/set_state xarm_msgs/srv/SetInt16 "{data: 0}"
docker run --rm -it ros2-xarm ros2 service call /ufactory/set_position xarm_msgs/srv/MoveCartesian "{pose: [250, 0, 250, 3.14, 0, 0], speed: 50, acc: 500, mvtime: 0}"
docker run --rm -it ros2-xarm ros2 service call /ufactory/set_servo_angle xarm_msgs/srv/MoveJoint "{angles: [-0.58, 0, 0, 0, 0, 0], speed: 0.35, acc: 10, mvtime: 0}"
