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
    --volume="/tmp:/tmp" \
    --volume="/dev:/dev" \
    --volume="${HOME}/dddmr:/root/dddmr_navigation" \
    --volume="${HOME}/dddmr_bags:/root/dddmr_bags" \
    --name="dddmr_ros2_lt4_r36" \
    dddmr_gtsam:l4t_r36
