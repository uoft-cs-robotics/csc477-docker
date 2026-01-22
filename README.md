# Usage on mcsdocker server

## Requirements
 - Linux based local machine
 - VNC Viewer of your choice installed on local machine

 1. ssh `UTORID`@mcsdocker.utm.utoronto.ca (If you are accessing from home, utorvpn needs to be on: https://security.utoronto.ca/services/vpn/)
 2. If this is the first time, setup docker permissions starting with step 3, if not, skip to step 6
 3. dockerd-rootless-setuptool.sh install
 4. echo -e "export PATH=/usr/bin:\$PATH\nexport DOCKER_HOST=unix:///run/user/$(id -u)/docker.sock" >> ~/.bashrc # This appends two export commands in ~/.bashrc
 5. source ~/.bashrc
 6. docker images
 7. docker ps -a <br>
         if csc477 present on both, run `docker rm -f csc477-$USER` and skip to step 11  <br>
         if csc477 is only present as an image, skip to step 11, <br>
         otherwise continue to step 8 <br>
 8. git clone https://github.com/uoft-cs-robotics/csc477-docker
 9. cd csc477-docker/
 10. docker build -t "csc477" . 
 11. docker run -p `XXXX`:5900 -d --name csc477-$USER -v $(pwd)/csc477_winter26:/home/ubuntu/csc477_ws/src:rw csc477 # where XXXX is a number you pick from 1024-6099; NOTE: RUN THIS FROM csc477-docker/ DIRECTORY!
 12. docker exec csc477-$USER cat /home/ubuntu/key.txt # make note of this password, you'll need it to connect to VNC
 13. in a new terminal window on host: ssh -L 5900:localhost:`XXXX` -C `UTORID`@mcsdocker.utm.utoronto.ca
 14. Connect to localhost:5900 using the VNC client of your choice and the password found on step 12

## Use VScode to Edit the Code

1. Open vs code on local computer
2. Click on the `><` button on the bottom left
3. On the top, select `Connect to Host` 
4. type `UTORID`@mcsdocker.utm.utoronto.ca
5. File -> Open Folder -> csc477-docker

# Usage on local computer

## Requirements
 - Docker installed on local machine
 - VNC Viewer of your choice installed on local machine

## Steps

 1. git clone https://github.com/uoft-cs-robotics/csc477-docker
 2. cd csc477-docker/
 3. docker build -t "csc477" .
 4. docker run -p `XXXX`:5900 -d --name csc477-$USER -v $(pwd)/csc477_winter26:/home/ubuntu/csc477_ws/src:rw csc477 # where XXXX is a number you pick from 1024-6099
 5. docker ps # make a note of the port that the container's 5900 gets exposed to (see explanation below), denote it by `XXXX`. ex. PORTS 0.0.0.0:32769->5900/tcp, `XXXX` is 32769.
 6. docker exec csc477-$USER cat /home/ubuntu/key.txt # make note of this password, you'll need it to connect to VNC
 7. Connect to localhost:`XXXX` using the VNC client of your choice and the password found on step 6

# Running the container on mcsdocker after it's been built
 1. ssh `UTORID`@mcsdocker.utm.utoronto.ca (If you are accessing from home, utorvpn needs to be on: https://security.utoronto.ca/services/vpn/)
 2. cd csc477-docker/
 3. docker rm -f csc477-$USER
 4. docker run -p `XXXX`:5900 -d --name csc477-$USER -v $(pwd)/csc477_winter26:/home/ubuntu/csc477_ws/src:rw csc477 # where XXXX is a number you pick from 1024-6099
 5. docker exec csc477-$USER cat /home/ubuntu/key.txt # make note of this password, you'll need it to connect to VNC
 6. in a new terminal window on host: ssh -L 5900:localhost:`XXXX` -C `UTORID`@mcsdocker.utm.utoronto.ca
 7. Connect to localhost:5900 using the VNC client of your choice and the password found on step 5

# How to find what port VNC is exposed through on docker

<img width="1192" height="146" alt="port-instruction" src="https://github.com/user-attachments/assets/81112374-21cb-4765-8cc7-20477059c4f9" />

# Frequently asked questions

### Q: After I use docker run, I get the following error: `docker: Error response from daemon: failed to set up container networking: driver failed programming external connectivity on endpoint csc477-UTORID (8d9c1504f7cf29e11e9f834186931c6d56c247f8f5268a3c066a45c5a34ebb49): error while calling RootlessKit PortManager.AddPort(): listen tcp4 0.0.0.0:32769: bind: address already in use`

A: Run `docker rm -f csc477-$USER`and try again.

### Q: After using catkin_make for the first time in the workspace, I get the following error: `CMake Error at /opt/ros/noetic/share/catkin/cmake/test/tests.cmake:190 (add_dependencies):`
  
A: Run catkin_make again. (You have to do it twice sometimes)

### Q: What is the password for ubuntu? (for running sudo commands)

A: ubuntu

### Q: How to restart the container if it stopped?

A: docker start csc477-$USER
