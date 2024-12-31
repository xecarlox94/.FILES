

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


This exemplifies how to use the installed environment to setup a development enviroment for docker containers.


## Building docker container


Navigate to the folder that holds the Dockerfile and run:

```bash

docker_build.sh

```

That is it!


## Running docker containers


Please make sure you are in the same folder that you built the previous docker container.


### Define the interactive execution environment


Create a "run.sh" executable file that defines what program to run interactively and what additional docker running arguments you require.


An example of a "run.sh" shell script is the following:

```bash

docker_run.sh \
    bash \
    "\
        -v $PWD/src:$HOME/src \
    "
```

This shell script instantiates a docker container that runs bash interactively and it mounts a folder from the host to the container.


Feel free to modify the executing command and to add additional arguments to docker container execution.


### Run it!


After this setup you just need to run the following command:

```bash

./run.sh

```


That's it!


Done.
