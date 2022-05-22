# Overview
This project was created to set up a development environment for ML4T that was compatible with remote-containers in vscode. 

If you do not need to make a custom build, you can find the latest image at: https://hub.docker.com/repository/docker/girardkyle/ml4t-vscode. 

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
docker run -e DISPLAY=192.168.1.101:0 --mount type=bind,source="$(pwd)",target=/workspace/code_root -it --port 8888:8888 girardkyle/ml4t-vscode:latest
```

# Jupyter
## Start Jupyter manually from within container
```
jupyter notebook --ip=0.0.0.0 --port=8888 --no-browser > /dev/null 2>&1 &
```

## Killing Jupyter
```
ps aux | grep jupyter
kill -9 pid
```




<!-- TODO add notes about setting up X11 on MAC  -->


# Reference links
General
- https://docs.docker.com/storage/bind-mounts/

X11 
- http://wiki.ros.org/docker/Tutorials/GUI
- https://www.youtube.com/watch?v=cNDR6Z24KLM (Note: running the command `xhost +` is unsafe. See first X11 link.)
  
Docker image inheritance  
- https://github.com/microsoft/vscode-dev-containers/blob/v0.234.0/containers/python-3-anaconda/.devcontainer/base.Dockerfile
- https://github.com/microsoft/vscode-dev-containers/tree/v0.234.0/containers/python-3-anaconda
- https://github.com/ContinuumIO/docker-images/blob/master/anaconda3/debian/Dockerfile
