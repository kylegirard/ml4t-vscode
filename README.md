# Overview
This project was created to setup a development environment for ML4T.

Notes: 
- This project will not build on Apple Silicon as is. Many of the *package versions* referenced in the environment.yml do not support Apple Silicon. If you are not using this project for ML4T feel free to try updating the package versions in environment.yml—you should get a successful build on Apple Silicon. 

# Creating a new build
Docker command:
```docker build -t imagename:tagname dir``` <br>

dir is the directory of your Dockerfile


**Example**
```
docker build -t girardkyle/ml4t-vscode:latest ./   
```

# Running a container
The following command will run a container with two key features enabled:
- X11 display forwarding-–this enables the output of GUI items from Docker to the host; you can now use matplotlib plots your heart's content from within a Docker container.
- Directory binding—-this will allow you to open your current directory as a directory from within the docker container; you can change files locally and run them in Docker instantly. 

```
docker run -e DISPLAY=192.168.1.101:0 --mount type=bind,source="$(pwd)",target=/workspace/code_root -it girardkyle/ml4t-vscode:latest
```

<!-- TODO add notes about setting up X11 on MAC  -->


# Reference links
- https://code.visualstudio.com/docs/remote/devcontainerjson-reference#_variables-in-devcontainerjson
- https://docs.docker.com/storage/bind-mounts/

