set -ex

# image name
IMAGE_NAME="ottobonilla95/nodejsjenkins"

# stop container
echo "Stoping container..."

CONTAINER_ID=$(docker ps -q --filter ancestor=$IMAGE_NAME )

if [ $CONTAINER_ID ]
then
    docker stop CONTAINER_ID
fi

# delete container
echo "Deleting container...."

CONTAINER_ID=$(docker ps --all -q --filter ancestor=$IMAGE_NAME )  

if [ $CONTAINER_ID ]
then
    docker rm CONTAINER_ID
fi

# delete image
echo "Deleting image...."
IMAGE_ID=$(docker images  --filter reference=$IMAGE_NAME  --format "{{.ID}}" )

if [ $IMAGE_ID ]
then
    docker rmi IMAGE_ID
fi

# get lastest image
echo "Getting the last version...."
docker pull $IMAGE_NAME

# run image
echo "Running image...."
docker run -p 3005:3000 -d $IMAGE_NAME

# End
echo "Docker tasks completed :)"
