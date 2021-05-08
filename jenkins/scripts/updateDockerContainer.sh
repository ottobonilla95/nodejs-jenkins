# image name
IMAGE_NAME="ottobonilla95/nodejsjenkins"

# stop container
echo "Stoping container.."
docker stop $(docker ps -q --filter ancestor=$IMAGE_NAME )

# # delete container
echo "Deleting container..."
docker rm $(docker ps -q --filter ancestor=$IMAGE_NAME )

# # delete image
echo "Deleting image..."
docker rmi $(docker images  --filter reference=$IMAGE_NAME  --format "{{.ID}}" )

# # get lastest image
echo "Getting the last version..."
docker pull $IMAGE_NAME

# # run image
echo "Running image..."
docker run -p 3005:3005 -d $IMAGE_NAME

echo "Docker tasks completed :)"
