# build a couple of images with specific version tags and see whether the build is fast
docker build -t react-app:1 ./app
docker build -t react-app:2 ./app