### 1. Docker
Docker is a tool to create, deploy, and run applications by using containers. It allows a developer to package up an application with all of the parts it needs, such as libraries and other dependencies thus allowing him/her to Build once Run Anywhere.

You have to write a Dockerfile with Ubuntu 16.04 as a base image. The image should have following packages present:

telnet
curl
ffmpeg
Finally, when running a container from the docker image, it should launch with bash.

Deliverables:
A Dockerfile.
A README file with instructions on how to build and run the image.

### 2.Solution

Steps to Build the Docker Image
#### 1.Create a file named Dockerfile.

- [Dockerfile](https://github.com/sumanthgitty/DevOps-Support-Engineer/blob/main/Docker/Dockerfile)

```bash
# Use Ubuntu 16.04 as the base image
FROM ubuntu:16.04

# Update the package list and install necessary packages
RUN apt-get update && \
    apt-get install -y telnet curl ffmpeg

# Set the default command to bash
CMD ["bash"]
```

#### 2.(Optional) Pull the base image to ensure it’s available locally:

```bash
docker pull ubuntu:16.04
```

This step ensures you are using the latest version of the Ubuntu 16.04 image available and can help you troubleshoot any network issues separately from the build process.

#### 3.Build the Docker image using the docker build command:

```bash
docker build -t myubuntu-image .
```

This command will build the Docker image and tag it as my-ubuntu-image.

#### 4.Steps to Run a Container from the Docker Image
Run a container using the docker run command:

```bash
docker run -it \
--name container-name \
myubuntu-image
```
This command will start a new container from the my-ubuntu-image image.