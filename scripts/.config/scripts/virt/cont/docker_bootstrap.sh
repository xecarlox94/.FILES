
echo "please insert the project name: "
read PROJECT_FOLDER

echo "please insert the base docker image name: "
read DOCKER_IMAGE_NAME

X11=false
while true;
do
    echo -e "Do you want X11 Desktop session support? (y/n)"
    read yn
    case $yn in
        [Yy]* ) X11=true; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no."
    esac
done

NVIDIA=false
while true;
do
    echo -e "Do you want Nvidia runtime support? (y/n)"
    read yn
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


#
# We need to add these env variables to the docker container
#
#
# ARG BUILD_ENV=prod\n\
# ENV RUN_ENV=$BUILD_ENV\n\
# RUN export BUILD_ENV=$BUILD_ENV\n\


echo -e "\
FROM $DOCKER_IMAGE_NAME \n\
\n\
\n\
WORKDIR /src \
\n\
" > Dockerfile

echo "sudo to create run.sh executable file"
touch_x run.sh


mkdir src


echo -e "clear &&\\
    docker_build.sh &&\\
    docker_run.sh \\
        \"\\
            bash \\
        \"\\
        \"\\
            -v \${PWD}/src:/src \\
            --rm \\
            --privileged \\
            --name $PROJECT_FOLDER \\
        \"\\
        $ADD_OPTS" > run.sh


./run.sh
