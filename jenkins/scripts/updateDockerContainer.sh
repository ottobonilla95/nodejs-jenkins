# image name
IMAGE_NAME="ottobonilla95/nodejsjenkins"

# stop container
echo "stoping container"
docker stop $(docker ps -q --filter ancestor=$IMAGE_NAME )

# # delete container
# docker rm $(docker ps -q --filter ancestor=$IMAGE_NAME )

# # delete image
# docker rmi $(docker images  --filter reference=$IMAGE_NAME  --format "{{.ID}}" )

# # get lastest image
# docker pull $IMAGE_NAME

# # run image
# docker run -p 3005:3005 $IMAGE_NAME