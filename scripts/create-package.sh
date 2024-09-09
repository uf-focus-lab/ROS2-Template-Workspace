#!/bin/bash
# ============================================================
# This is a simple script to prompt some simple questions
# and create a ROS2 package using `ros2 pkg create`.
# It saves me from remembering the magic spell.
# ============================================================
# Author: Yuxuan Zhang
# Email : robotics@z-yx.cc
# License: MIT
# ============================================================
ARGS=("ros2" "pkg" "create")
LICENSE="MIT"
PACKAGE_NAME=""
cd src
echo "Workspace source directory: $(pwd)"

# Check for colcon
if ! command -v colcon &> /dev/null; then
    echo "colcon is required to create a package."
    echo "Please install colcon using the following command:"
    echo "pip3 install colcon-common-extensions"
    exit 1
fi

# Ask for build type
read -p "Build system [ament_cmake]: " BUILD_TYPE
BUILD_TYPE=${BUILD_TYPE:-ament_cmake}
ARGS+=("--build-type" "$BUILD_TYPE")

# Ask for license type
read -p "License type [MIT]: " LICENSE
LICENSE=${LICENSE:-MIT}
ARGS+=("--license" "$LICENSE")

# Ask for package name
while [ "$PACKAGE_NAME" = "" ]; do
    if read -p "Package name: " PACKAGE_NAME; then
        if [ -e "$PACKAGE_NAME" ]; then
            echo "Package $PACKAGE_NAME already exists!"
            PACKAGE_NAME=""
        fi
    else # User pressed CTRL-D
        echo; echo "Aborted ..."
        exit 1
    fi
done

# Ask for node names
while true; do
    if read -p "Node name (enter=skip): " NODE_NAME; then
        if [ "$NODE_NAME" = "" ]; then
            break
        else
            ARGS+=("--node-name" "$NODE_NAME")
        fi
    else # User pressed CTRL-D
        echo; break
    fi
done

ARGS+=("$PACKAGE_NAME")

echo ${ARGS[*]}; ${ARGS[*]}
