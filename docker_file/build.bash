#!/bin/bash

#-----select image
echo -n "Select image type (x64/l4t): " 
read image_type

if [[ $image_type == "x64" ]]; then 
    echo -n "Do you want to build image using cuda? (Y/N): " 
    read is_cuda
    if [ "$is_cuda" != "${is_cuda#[Yy]}" ] ;then 
        echo "----> Creating x64 image with cuda, the x64 image will be created first"
        docker build -t dddmr_gtsam:x64 -f Dockerfile_gtsam .
        echo "----> Starting second layer with CUDA"
        docker build -t dddmr_gtsam:pytorch2.5.1-cuda12.6-cudnn9-tensorrt10.7 -f Dockerfile_gtsam_cuda .
    else
        echo "----> Creating x64 image without cuda"
        docker build -t dddmr_gtsam:x64 -f Dockerfile_gtsam .
    fi
else
    echo "----> Creating l4t image"
    docker build -t dddmr_gtsam:l4t_r36 -f Dockerfile_gtsam_l4t_r36 .
fi

