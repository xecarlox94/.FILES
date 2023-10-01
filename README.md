

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


This installation steo requires the GNU Stow program. In order to install it on a debian/ubuntu based linux distribution, run:

```bash

$HOME/.config/.FILES/scripts/.config/scripts/conf/install.sh

```

# Docker environment


This exemplifies how to use the installed environment to setup a development enviroment for docker containers.


## Building docker container


go to the folder that holds the Dockerfile and run:

```bash

docker\_build.sh

```


## Running docker containers


Please make sure you are in the same folder as . Folder just requires the Dockerfile and a "run.sh" executable file. An example of a "run.sh" shell script is the following:

```bash

docker_run.sh \
    bash \
    "\
        -v $PWD/src:$HOME/src \
    "
```

After this setup you just need to run the following command:

```bash

./run.sh

```
