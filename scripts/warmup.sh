#!/bin/sh
docker exec -it ros2-xarm bash -c 'source /build/xarm_ros2/install/setup.bash; ros2 service call /ufactory/motion_enable xarm_msgs/srv/SetInt16ById "{id: 8, data: 1}"'
docker exec -it ros2-xarm bash -c 'source /build/xarm_ros2/install/setup.bash; ros2 service call /ufactory/motion_enable xarm_msgs/srv/SetInt16ById "{id: 8, data: 1}"'
docker exec -it ros2-xarm bash -c 'source /build/xarm_ros2/install/setup.bash; ros2 service call /ufactory/set_mode xarm_msgs/srv/SetInt16 "{data: 0}"'
docker exec -it ros2-xarm bash -c 'source /build/xarm_ros2/install/setup.bash; ros2 service call /ufactory/set_state xarm_msgs/srv/SetInt16 "{data: 0}"'
docker exec -it ros2-xarm bash -c 'source /build/xarm_ros2/install/setup.bash; ros2 service call /ufactory/set_position xarm_msgs/srv/MoveCartesian "{pose: [250, 0, 250, 3.14, 0, 0], speed: 50, acc: 500, mvtime: 0}"'
docker exec -it ros2-xarm bash -c 'source /build/xarm_ros2/install/setup.bash; ros2 service call /ufactory/set_servo_angle xarm_msgs/srv/MoveJoint "{angles: [-0.58, 0, 0, 0, 0, 0], speed: 0.35, acc: 10, mvtime: 0}"'
