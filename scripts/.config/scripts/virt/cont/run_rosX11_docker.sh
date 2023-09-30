#!/bin/sh

echo "image $1"
echo "command $2"


#sudo rocker --nvidia --x11 osrf/ros:melodic-desktop-full gazebo



sudo /usr/bin/rocker \
    --nvidia --x11 \
    $1 \
    $2
