#!/bin/bash

xhost +local:docker

docker run -it \
    --privileged \
    --network=host \
    --gpus=all \
    --env="NVIDIA_VISIBLE_DEVICES=all"\
    --env="NVIDIA_DRIVER_CAPABILITIES=all"\
    --env="DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --volume="/tmp:/tmp" \
    --volume="/dev:/dev" \
    --volume="${HOME}/dddmr:/root/dddmr_navigation" \
    --volume="${HOME}/dddmr_bags:/root/dddmr_bags" \
    --name="dddmr_ros2_pytorch_tensorrt" \
    dddmr_gtsam:pytorch2.5.1-cuda12.4-cudnn9-tensorrt10.7
