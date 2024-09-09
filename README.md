# ROS2 Template Workspace

Author: Yuxuan Zhang | [`robotics@z-yx.cc`](mailto:robotics@z-yx.cc)

This template provides some helpful shortcuts to simplify ROS2 development.

The build script also takes care of generating and aggregating compile database
into one `compile_commands.json`. Users of `clangd` might find it useful.

### Create your first package

```bash
make create
```

A simple interactive prompt walk you through package creation.

### Build all packages

```bash
make build
```

### Selectively build one or more packages

```bash
make package/cat package/dog # etc...
```

These targets can be auto-completed!

Try press `Tab` key when typing.

> Package names are extracted from `package.xml` files.

### Launch tasks listed under `launch`

```bash
make launch/example.xml
```

These targets can be auto-completed!

Try press `Tab` key when typing.

### Enter ROS2 shell (bash) environment

```bash
make bash
# OR
make shell
# OR
make sh
```

### Notice

Make commands prefer project local environment.
>
When it cannot find the local setup.bash (i.e. project hasn't been built yet),
it will fallback to global ROS2 environment under `/opt/ros`

If you have multiple ROS2 versions installed,
You need to manually specify one (e.g. `ROS_DISTRO=rolling make shell`).
Otherwise the Make script will automatically select one
based on alphabetic order.
