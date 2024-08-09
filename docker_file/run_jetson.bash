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
    --volume="/usr/bin/tegrastats:/usr/bin/tegrastats" \
    --volume="/usr/local/cuda-11.4/targets/aarch64-linux:/usr/local/cuda-11.4/targets/aarch64-linux" \
    --volume="/usr/lib/aarch64-linux-gnu/tegra:/usr/lib/aarch64-linux-gnu/tegra" \
    --volume="/lib/modules:/lib/modules" \
    --volume="${HOME}/dddmr:/root/dddmr_navigation" \
    --volume="${HOME}/dddmr_bags:/root/dddmr_bags" \
    --name="dddmr_ros2_lt4_r36" \
    dddmr_gtsam:l4t_r36.2
