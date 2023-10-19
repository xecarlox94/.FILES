
echo "please insert the project name: "
read PROJECT_FOLDER

echo "please insert the base docker image name: "
read DOCKER_IMAGE_NAME


X11=false
while true;
do
    read -p "Do you wish to run this container with X11 Desktop session? (y/n)" yn
    case $yn in
        [Yy]* ) X11=true; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no."
    esac
done

NVIDIA=false
while true;
do
    read -p "Do you wish to run this container with Nvidia runtime? (y/n)" yn
    case $yn in
        [Yy]* ) NVIDIA=true; break;;
        [Nn]* ) break;;
    esac
done


ADD_OPTS=""

if $X11;
then
    ADD_OPTS="-x "
fi


if $NVIDIA;
then
    ADD_OPTS="$ADD_OPTS -n"
fi


mkdir_cd $PROJECT_FOLDER


echo -e "\
FROM $DOCKER_IMAGE_NAME \n\
WORKDIR /src \
    " > Dockerfile
mkdir src


echo "sudo to create run.sh executable file"
touch_x run.sh


echo -e "\
docker_run.sh \\
    \"\\
        bash \\
    \"\\
    \"\\
        -v \${PWD}/src:/src \\
    \"\\
    $ADD_OPTS" > run.sh


docker_build.sh

run.sh
