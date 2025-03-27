# use a starting image to build your image
# our application is a simple hello world in javascript so we are going to use node
# we know that the node image already running on some linux distribution we can specify (alpine)
FROM node:alpine
# copy all the files in the current directory (.) in a directory called app/ in the destination file system
COPY . /app
# set the new directory as the working directory
WORKDIR /app
# run the application
CMD node main.js



