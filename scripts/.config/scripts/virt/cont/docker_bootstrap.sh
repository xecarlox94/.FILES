
echo "please insert the project name: "

read PROJECT_FOLDER

mkdir_cd $PROJECT_FOLDER

echo "please insert the base docker image name: "

read DOCKER_IMAGE_NAME

touch Dockerfile run.sh

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
    \"" > run.sh


docker_build.sh

run.sh
