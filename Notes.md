# Part-1
## Install an image from docker hub
```bash
docker run -it --name container_name <image_name>
```
## See Docker running containers
Only running container will we show here
```bash
docker container ls
```
## See all containers
```bash
docker container ls -a
```
## To start a stopped container
```bash
docker start <container_name>
```
## To stop a running container
```bash
docker stop <container_name>
```
## To remove a container
```bash
docker rm <container_name>
```
## To run a command inside the container
```bash
docker start <container_name>
``` 
```bash
docker exec <container_name> ls
```
- But the terminal will return to the OS terminal in above command. To keep the terminal inside the container, use the following command

```bash 
docker exec -it <container_name> <command>

For example
docker exec -it container_id bash
```

## To see docker images in our local machine 
```bash
docker images or docker image ls
```

## Port Mapping
Expose the container’s port
```bash
docker run -it -p My_Port_Number : Container’s_Port_Number Image_Name
```

## Environment Variables
We can pass environment variable in our docker container use for passing extra data
```bash
docker run -it -p My_Port_Number : Container’s_Port_Number -e key=value -e key=value Image_Name

For example
docker run -it -e PORT=4000 -p 4000:4000 first-node-image
```
## Build an image
```bash
docker build -tag image_name docker_file_path

For example
docker build -t first-node-image .
```

## Push to the docker hub
```bash
docker push <image_name>

For example
docker push harish6969/first-node-image
```

## Docker Compose
By using docker compose we can setup/create/distroy multiple containers at the same time 
```bash
docker compose up 
docker compose up -d # To run in the background
docker compose down # To stop the containers
```

# Part-2

## Docker Networking
[Network Drivers](https://docs.docker.com/network/drivers/)

- By default, docker creates a bridge network for the containers. We can create our own network as well.
- So we can say that it stablish a bridge between host machine and docker container.
- By using these drivers our container can interact with the internet.
- NetDrivers: bridge, host, overlay, macvlan, IPvlan, none
```bash
docker run -it image_name

# For explecitly specify the network driver
docker run -it --network=netdriver_name image_name
# For example
docker run -it --network=host busybox

docker network inspect driver_name
# For example
docker network inspect bridge

# To see all the networks in the docker (mostly three are there: bridge, host, none)
docker network ls
```
### bridge vs host:
- We have to expose the port if netdriver is bridge but if netdriver is host then we don't have to expose the port because our host machine and docker container are on the same network.But by default, the netdriver is bridge.So we have to expose the port.

## How to make custom network using docker
By creating a custom network we can connect multiple containers to the same network and they can interact with each other.

1. create custom network
```bash
docker network create -d bridge mynetwork
```
2. To check all the networks
```bash
docker network ls
```
3. Connect the container to the network
```bash
docker run -it --network=mynetwork --name tony_stark ubuntu
```
4. Create another container and connect to the same network
```bash
docker run -it --network=mynetwork --name dr_strange busybox

/ # ping tony_stark
```

## Volume Mounting
When container re destroy then all the data/memory inside the container will be lost. So to persist the data we use volume mounting.

```bash
docker run -it -v host_machine_address:container_folder_address image_name

# For example
$ docker run -it -v /home/hari/Desktop/test-folder:/home/abc ubuntu
```

## Efficient Caching in Layers
## Docker Multi-Stage Builds

