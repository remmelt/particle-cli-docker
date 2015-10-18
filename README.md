# particle-cli-docker
Docker Container for Particle CLI
I built it mostly for my own use, but feel free to use it! 

* [![](https://badge.imagelayers.io/alexwitherspoon/particle-cli-docker.svg)](https://imagelayers.io/?images=alexwitherspoon/particle-cli-docker 'Get your own badge on imagelayers.io')
* Github repo: [alexwitherspoon/particle-cli-docker](https://github.com/alexwitherspoon/particle-cli-docker)
* Dockerhub repo: [alexwitherspoon/particle-cli-docker](https://registry.hub.docker.com/u/alexwitherspoon/particle-cli-docker/)

### Bundled Apps
* Debian 8
* Node.js
* Particle CLI


# How to use this image

## Use for your own Dockerfile in your own project.

Include the following at the top of your project.

    FROM alexwitherspoon:particle-cli-docker

## Run this image on a docker host

    docker pull alexwitherspoon/particle-cli-docker
    docker run -d -p 222:22 alexwitherspoon/particle-cli-docker

## How to Connect to it!

Then if developing you may connect either using SSH (default U: root P: particle), or Docker Attach.

    docker attach <name-of-proccess>
    
OR

SSH in with user: 'root', and password: 'wookie', on port 222(or whatever you specify.)
   
    ssh -p 222 -l root (container-ip)
   

## Things got out of hand, how do I kill it?

Show all running docker instances

    docker ps -a

When you've found the bear's container id, run this:

    docker kill <container-id>
    docker rm <container-id>
    docker rmi <container-id>
