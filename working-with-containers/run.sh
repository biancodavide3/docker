# build the image first
docker build -t react-app ../building-images/app
# run the container in detached mode (-d) with a name (--name) and mapping port 3000 on the host to port 3000 on the container (-p)
docker run -d --name react-app-container -p 3000:3000 react-app
# see the logs
docker logs react-app-container
# stop the container
docker stop react-app-container
# start the container
docker start react-app-container
# execute a command
docker exec react-app-container ls
# execute a shell in the container
docker exec -it react-app-container sh
# remove the container
docker rm react-app-container
# create a named volume for persistent storage
docker volume create app-data
# run the container with the volume making sure the user has permissions for the volume directory
docker run -d -p 3000:3000 -v app-data:/app/data --name c1 react-app
# copy files between the host and the container
docker cp c1:/app/data/file .
docker cp secret c1:/app/data
# map a directory on the host to the container for development (build a new image for production)
# when we make a change to the code in the host this change reflects also on the source code in the container
# for example in a react app like this we just need to refresh the page to see the change like it was local development
docker run -d -p 3000:3000 --name c1 -v /home/david/IdeaProjects/docker/building-images/app:/app react-app