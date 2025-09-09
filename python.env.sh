# ========================================================
# Copyright (c) 2024 Yuxuan Zhang, robotics@z-yx.cc
# This source code is licensed under the MIT license.
# You may find the full license in project root directory.
# ========================================================

source ".env/bin/activate"
PATHS=$(python3 -c "
import sysconfig;
paths = sysconfig.get_paths();
print(paths['data'], paths['purelib'], sep=':', end='')
")
export PYTHONPATH="$PATHS:$PYTHONPATH"
alias PYTHONPATH="echo $PYTHONPATH | tr ':' '\n'"
