# each command in this file is a layer
# we start from a base image which of course has its layer and we take them all into ours
# then we add custom layers with the following commands
# commands: FROM WORKDIR COPY ADD RUN ENV EXPOSE USER CMD ENTRYPOINT
# when a layer changes docker has to rebuild all the underlying layers starting from the change so
# the order of the command is really important to be able to have fast builds (as well as the size of the image)
# in the FROM command always specify a specific version to avoid using the latest tag which always changes and use alpine linux to make builds faster
FROM node:18.20.8-alpine3.21
# create group and user to run the application as well as any commands in the container
#RUN addgroup mosh && adduser -S -G mosh mosh
#USER mosh
# it is a good idea to set the workdir ind the container (in this case all files we are going to copy in the container are going to end up in /app directory)
WORKDIR /app
# let's first copy the package.json and package-lock.json to run npm install first
# and only later copy the other application files
# this is a good optimization because if we were to copy all the files first everytime we would run npm install
# slowing the build for no reason (we are not taking advantage of docker layer caching)
# can check the layers of the image with docker history command
COPY package*.json .
# ADD is similar to copy and also works with urls and zip files
# we need to keep the building context small
# for example in a node application don't copy the node_modules directory
# exclude it using .dockerignore (just like .gitignore) and then install the dependencies later with RUN
RUN npm install
# copy everything from the current directory of the Dockerfile to the working directory in the container
# COPY [".", "."] was an alternative syntax which might be useful if the words have spaces
COPY . .
# we might want to set some environment variables
ENV API_URL=http://api.myapp.com/
# and we definitely need to expose ports
EXPOSE 3000
# set the launch command in cmd
CMD ["npm", "start"]
