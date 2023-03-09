# Docker

Docker is an open-source software project automating the deployment of applications inside software containers.
It works with images and container, the main difference between this two is:

- An image is piece of memory with the os and applicaiton data inside
- A container instead is a running image

To visualize a resume of the system run:

```sh
docker system df  # use -v to get further informations 
```

## System images
An image becomes a container when you execute it. Check the images that are present in your system after the build
docker images, the command to build an image is:

```sh
docker build <DirectoryWhereTheDockerfileIsLocated>
```

First create a docker file, which is a file named ```Dockerfile``` with a content similar to the followng
script snippet (depending on your needs) on which a docker image will be built;

```sh
# Start from the official Ubuntu official image in DockeHub (last LTS version)
FROM ubuntu:latest

# Setting the environment variable
ENV DEBIAN_FRONTEND=noninteractive

# Install software from apt
RUN apt-get -y update && \
  apt-get install -y \
  curl \
  libssl-dev \
  pkg-config \
  build-essential


# Install rust toolchain
RUN curl https://sh.rustup.rs -sSf | bash -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"
RUN rustup target add wasm32-unknown-unknown
RUN cargo install wasm-bindgen-cli
RUN cargo install trunk

# Execute the script to serve the site
RUN mkdir -p /var/www/html/Application
COPY . /var/www/html/Application/
WORKDIR /var/www/html/Application

CMD ["/bin/bash", "/var/www/html/Application/start.sh"]
```
To build the image from the ```Dockerfile``` use:

```sh
docker build -t <nameOfTheImage> <DockerfileDirectory>
```

To visualise how many images you have in your system run:

```sh
docker images
```

## Running the container
Running the container means that the docker file will be read and executed, the execution
can be modified by the flags that follows the utility such as:

```sh
docker run -ti -–rm <imageID>
```
Here's some more info on the flags:

  - ti       →  make you access to the terminal
  - rm       →  remove the container once you exit
  - d        →  (deamon) run the container in detached mode (in the background)
  - p 80:80  →  port exposition, the local OS can connect to the docker image via port 80

To see if the container is running check:

```sh
docker ps
```
Then to start and/or stop the container run the following self explatory commands:

```sh
docker start <imageID>
docker stop <imageID>
```

### Mount a file system directory inside a docker container
Do not store your simulation data in the container. Instead let’s give our 
container access to just a little bit of our local filesystem. From your project
directory in a Windows environment, run:

```sh
docker run -ti --rm -v ${PWD}:/data -w /data <imageID>
```
By adding the -v option we’re asking Docker to mount our current working directory
($PWD) as /data in the container. We’ve also added the -w switch to tell Docker
that we’d like to be in /data when the container starts.

## Creating an image from a container 
You can convert a container into an image by using the command

```sh
docker commit 
```
## Delete container
The following command will delete the container:

```sh
docker ps			  	   # To visualise them
docker rmi <imageID>
```

Or you can delete all of them piping two commands:
```sh 
docker rm -vf $(docker ps -aq)
```


## Delete images
To delete the images that does not run a container above them run;

```
docker images  				# To visualise them
docker image rm <imageID>
```
Or you can delete all of them piping two commands:

```sh
docker rmi -f $(docker images -aq)
```

## Reclaim space from machine
Docker saves container chaces on ```var/lib/docker```, this can clog the machine disk if 
there is not enough storage available. A quick solution is to run the following command 
to clean the system cache:

```sh
docker system prune -a -f
```

<!--  Script to show the footer   -->
<html>
<script
    src="https://code.jquery.com/jquery-3.3.1.js"
    integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
    crossorigin="anonymous">
</script>
<script>
$(function(){
  $("#footer").load("../../footers/footer.html");
});
</script>
<body>
<div id="footer"></div>
</body>
</html>
