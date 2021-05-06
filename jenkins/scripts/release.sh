set -ex
# SET THE FOLLOWING VARIABLES
# docker hub username
USERNAME=ottobonilla95
# image name
IMAGE=nodejsjenkins

# bump version
docker run --rm -v "$PWD":/app treeder/bump patch
version=`cat ../../VERSION`
echo "version: $version"
# run build
./build.sh

docker tag $USERNAME/$IMAGE:latest $USERNAME/$IMAGE:$version
# push it
docker push $USERNAME/$IMAGE:latest
docker push $USERNAME/$IMAGE:$version