#!/bin/bash
set -e

# setup ros2-xarm environment
source /build/xarm_ros2/install/setup.bash
exec "$@"
