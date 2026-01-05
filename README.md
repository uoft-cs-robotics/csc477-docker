# Usage on mcsdocker server

## Requirements
 - Linux based local machine
 - VNC Viewer of your choice installed on local machine

 1. ssh UTORID@mcsdocker.utm.utoronto.ca
 2. docker images
 3. if csc477 present - skip to step 7, otherwise continue to step 4
 4. git clone --recurse-submodules https://mcsgitlab.utm.utoronto.ca/zetkoger/csc477-docker.git
 5. cd csc477-docker/
 6. docker build -t "csc477" .
 7. docker run -P -d --name csc477 -v $(pwd)/csc477_winter24:/home/ubuntu/csc477_ws/src:rw csc477
 8. docker ps # make a note of the port that the container's 5900 gets exposed to (see explanation below), denote it by XXXX
 9. docker exec csc477 cat /home/ubuntu/key.txt # make note of this password, you'll need it to connect to VNC
 10. in a new terminal window on host: ssh -L 5900:localhost:XXXX -C UTORID@mcsdocker.utm.utoronto.ca
 11. Connect to localhost:5900 using the VNC client of your choice and the password found on step 9

# Usage on local computer

## Requirements
 - Docker installed on local machine
 - VNC Viewer of your choice installed on local machine

## Steps

 1. git clone --recurse-submodules https://mcsgitlab.utm.utoronto.ca/zetkoger/csc477-docker.git
 2. cd csc477-docker/
 3. docker build -t "csc477" .
 4. docker run -P -d --name csc477 -v $(pwd)/csc477_winter24:/home/ubuntu/csc477_ws/src:rw csc477
 5. docker ps # make a note of the port that the container's 5900 gets exposed to (see explanation below), denote it by XXXX
 6. docker exec csc477 cat /home/ubuntu/key.txt # make note of this password, you'll need it to connect to VNC
 7. Connect to localhost:XXXX using the VNC client of your choice and the password found on step 6

 
# How to find what port VNC is exposed through on docker

#TODO: add screenshots