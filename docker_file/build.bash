#!/bin/bash

#-----select image
echo -n "Select image type (x64/l4t): " 
read image_type

if [ "$image_type" != "${image_type#[x64]}" ] ;then 
    echo "----> Creating x64 image"
    docker build -t dddmr_gtsam:x64 -f Dockerfile_gtsam .
else
    echo "----> Creating l4t image"
    docker build -t dddmr_gtsam:l4t_r36.3 -f Dockerfile_gtsam_l4t_r36 .
fi

