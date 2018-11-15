# Docker

### What are Containers?
Containers are an abstraction at the app layer that packages code and dependencies together. Multiple containers can run on the same machine and share the OS kernel with other containers, each running as isolated processes in user space. Containers take up less space than VMs (container images are typically tens of MBs in size), can handle more applications and require fewer VMs and Operating systems.

### Container Lifecycle:
When we create container with `docker run`, image goes in running state. From *running* state we can *start* it, *stop* it and again *start* it. And eventually we can remove the image by `docker rmi`

![img text](https://github.com/milindchavan12/docker/blob/master/assets/containerlifecycle.png)

### Docker Commands:
- `docker run <image>`  : To start new container with at least image to work with.
- `docker pull <image>` : To pull the docker image from Docker hub or ACR locally.

