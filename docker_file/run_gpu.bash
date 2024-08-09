#!/bin/bash

xhost +local:docker

docker run -it \
    --privileged \
    --network=host \
    --runtime=nvidia\
    --env="NVIDIA_VISIBLE_DEVICES=all"\
    --env="NVIDIA_DRIVER_CAPABILITIES=all"\
    --env="DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --volume="${HOME}/dddmr:/root/dddmr_navigation" \
    --volume="${HOME}/dddmr_bags:/root/dddmr_bags" \
    --name="dddmr_ros2_gpu_dev2" \
    dddmr_gtsam:x64
