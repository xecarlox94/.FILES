

# Getting Started



First step is to clone the repo to the appropriate location. Please run the following commands:

```bash
cd $HOME/.config

git clone https://github.com/xecarlox94/.FILES.git
```

Now you have the configuration in your system but it is not yet installed.



## Minimal install


The following command installs the all the environment's scripts and functions.

```bash

$HOME/.config/.FILES/scripts/.config/scripts/conf/minimal_install.sh

```
## Full environment install


This installation requires the GNU Stow program. In order to install it on a debian/ubuntu based linux distribution, run:

```bash

sudo apt install stow

```

To install the full environment, run:

```bash

$HOME/.config/.FILES/scripts/.config/scripts/conf/install.sh

```

# Docker environment


This exemplifies how to use the installed environment to setup a development environment for docker containers.


## Bootstrapping Docker Container Project


Navigate to a folder where you want to create a new project. The next command will generate a project folder, a Dockerfile and a "src" folder that is mounted automatically to "/src" location in your docker container.

```bash

docker_bootstrap.sh

```


Select:
- Name of your project;
- If you are running Debian/Ubuntu to generate "noninteractive" mode in the dockerfile;
- add Docker Nvidia Runtime support;
- add X11 Desktop application support;


That is it!


## Running docker containers


Please make sure you are in the same folder that you built the previous docker container.


### Define the interactive execution environment


Create a "run.sh" executable file that defines what program to run interactively and what additional docker running arguments you require.


An example of a "run.sh" shell script is the following:

```bash

clear &&\
    docker_build.sh &&\
    docker_run.sh \
        bash \
        "\
            -v $PWD/src:$HOME/src \
            --rm \
            --privileged \
            --name $PROJECT_FOLDER \
        "
        -x -n
```

> [!TIP]
> You can (should) add more docker container options inside the second string argument of "docker_run.sh" command.


> [!TIP]
> You can add and remove Nvidia and X11 support by just adding/removing the "x" and "n" flags "docker_run.sh" command.


This shell script instantiates a docker container that runs bash interactively and it mounts a folder from the host to the container.


Feel free to modify the executing command and to add additional arguments to docker container execution.


### Run it!


After this setup you just need to run the following command:

```bash

./run.sh

```


That's it!


Done.
