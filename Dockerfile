FROM ros:humble
LABEL org.opencontainers.image.source = "https://github.com/iomz/docker-ros2-xarm"
LABEL maintainer="iomz@sazanka.io"

ARG TARGETARCH

ENV ROS_DISTRO=humble

SHELL ["/bin/bash", "-c"]

# install requirements
# https://docs.ros.org/en/humble/Installation/Ubuntu-Install-Debians.html#setup-sources
RUN apt-get update \
  && apt-get install -y software-properties-common \
  && add-apt-repository universe \
  && apt-get update

# install moveit2
# install gazebo
# install gazebo_ros_pkgs
RUN case ${TARGETPLATFORM} in \
      "linux/amd64") apt-get install -y "ros-${ROS_DISTRO}-moveit" \
                && curl -sSL http://get.gazebosim.org | sh \
                && apt-get install -y "ros-${ROS_DISTRO}-gazebo-ros-pkgs" ;; \
    esac

# install dependencies for xarm_ros2
WORKDIR /build
RUN git clone https://github.com/xArm-Developer/xarm_ros2.git --recursive -b ${ROS_DISTRO}
WORKDIR /build/xarm_ros2
RUN rosdep update
RUN case ${TARGETPLATFORM} in \
      "linux/amd64")  rosdep install --from-paths . --ignore-src --rosdistro ${ROS_DISTRO} -y ;; \
      "linux/arm64")  rosdep install --from-paths xarm_api xarm_description xarm_msgs xarm_sdk --ignore-src --rosdistro ${ROS_DISTRO} -y ;; \
    esac

# this is missing for linux/arm64
RUN apt-get install -y ros-${ROS_DISTRO}-control-msgs \
  && rm -rf /var/lib/apt/lists/*

# build with colcon
RUN source "/opt/ros/$ROS_DISTRO/setup.bash"
RUN case ${TARGETPLATFORM} in \
      "linux/amd64")  colcon build ;; \
      "linux/arm64")  colcon build --packages-select  xarm_api xarm_description xarm_msgs xarm_sdk ;; \
    esac

WORKDIR /app
COPY entrypoint.sh entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["ros2", "-h"]
