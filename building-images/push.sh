# push image to docker hub
docker login
docker image tag d0a react-app:2 username/react-app:2
docker push username/react-app:2
# where username is the docker hub username to push to