set -ex
# SET THE FOLLOWING VARIABLES
# docker hub username
USERNAME=ottobonilla95
# image name
IMAGE=nodejsjenkins
docker build -t $USERNAME/$IMAGE:latest .