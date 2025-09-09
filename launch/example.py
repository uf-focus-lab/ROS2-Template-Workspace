# ========================================================
# Copyright (c) 2024 Yuxuan Zhang, robotics@z-yx.cc
# This source code is licensed under the MIT license.
# You may find the full license in project root directory.
# ========================================================
from launch import LaunchDescription
from launch.actions import ExecuteProcess
from launch_ros.actions import Node
from os import environ as env
from pathlib import Path
from datetime import datetime

run_id = datetime.now().strftime("%Y%m%d_%H%M%S")
HOME = Path(__file__).resolve().parent.parent
RUN_VAR = HOME / "var" / run_id

ExampleNode = Node(
    package="<your_package_name>",
    executable="<your_executable_name>",
    namespace="<your_namespace>",
    parameters=[
        {"<key>": "<value>"},
    ],
)

Recorder = ExecuteProcess(
    cmd=[
        *["ros2", "bag", "record", "-o", str(RUN_VAR)],
        # Topics to record
    ],
    cwd=str(RUN_VAR),
    output="screen",
)


def generate_launch_description():
    return LaunchDescription([ExampleNode, Recorder])
