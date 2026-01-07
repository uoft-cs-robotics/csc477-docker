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
 7. if csc477 present - skip to step 11, otherwise continue to step 8
 8. git clone https://github.com/uoft-cs-robotics/csc477-docker
 9. cd csc477-docker/
 10. docker build -t "csc477" . 
 11. docker run -P -d --name csc477 -v $(pwd)/csc477_winter24:/home/ubuntu/csc477_ws/src:rw csc477
 12. docker ps # make a note of the port that the container's 5900 gets exposed to (see explanation below), denote it by `XXXX`. ex. PORTS 0.0.0.0:32768->5900/tcp, `XXXX` is 32768.
 13. docker exec csc477 cat /home/ubuntu/key.txt # make note of this password, you'll need it to connect to VNC
 14. in a new terminal window on host: ssh -L 5900:localhost:`XXXX` -C `UTORID`@mcsdocker.utm.utoronto.ca
 15. Connect to localhost:5900 using the VNC client of your choice and the password found on step 9

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
 4. docker run -P -d --name csc477 -v $(pwd)/csc477_winter24:/home/ubuntu/csc477_ws/src:rw csc477
 5. docker ps # make a note of the port that the container's 5900 gets exposed to (see explanation below), denote it by `XXXX`. ex. PORTS 0.0.0.0:32769->5900/tcp, `XXXX` is 32769.
 6. docker exec csc477 cat /home/ubuntu/key.txt # make note of this password, you'll need it to connect to VNC
 7. Connect to localhost:`XXXX` using the VNC client of your choice and the password found on step 6

 
# How to find what port VNC is exposed through on docker

<img width="1192" height="146" alt="port-instruction" src="https://github.com/user-attachments/assets/81112374-21cb-4765-8cc7-20477059c4f9" />



