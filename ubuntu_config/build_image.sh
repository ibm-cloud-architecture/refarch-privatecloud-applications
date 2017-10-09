IMAGE_PATH=patrocinio/ubuntu

docker build -t $IMAGE_PATH .
docker push $IMAGE_PATH
