# Raspberry Pi driver cross-compilation in a Docker container

The Dockerfile captures the instructions from this link:

* http://lostindetails.com/blog/post/Compiling-a-kernel-module-for-the-raspberry-pi-2

# Setup

````
git clone https://github.com/ChadMcQuillen/docker-raspberry-pi-driver-cross-compiler.git
cd docker-raspberry-pi-driver-cross-compiler
docker build -t <repo> .
docker run -i -t <repo>
````
