# Minecraft Forge Server in a Docker Container
## 1 Basic useage
The default minecraft version is 1.18.2. If you need a later version, you'll have to change the environment variables. By setting EULA=true means you accept EULA in eula.txt.
### 1.1 Build docker image
```sh
git clone https://github.com/GitEventhandler/MCServerContainer.git
cd MCServerContainer
# if you want forge server (recommend, tested)
cd forge
# if you want fabric server
cd fabric
# if you want vanilla server
cd vanilla
```
### 1.2 Setup container
```sh
docker build -t mc_server -f .\Dockerfile .
# replace [your port] and [your path] to your own config
docker run -itd -p [your port]:25565 --restart always -v [your path]:/server -e EULA=true --name forge_server mc_server
```
## 2 Custom minecraft version
If you want a custom version, please change following environment variables.
### 2.1 Forge
```Dockerfile
ENV MINECRAFT_VERSION {your minecraft version here}
ENV FORGE_VERSION {your forge version here}
```
### 2.2 Fabric
```Dockerfile
ENV MINECRAFT_VERSION {your minecraft version here}
ENV FABRIC_VERSION {your fabric version here}
ENV FABRIC_INSTALLER_VERSION {your fabric installer version here}
```
### 2.3 Vanilla
```Dockerfile
ENV SERVER_DOWNLOAD_URL {server.jar url}
```

## 3 Example
This example shows how to start a 1.18.2 forge server as a docker container.
```sh
git clone https://github.com/GitEventhandler/MCServerContainer.git
cd MCServerContainer/forge
docker build -t mc_server:1.18.2 -f .\Dockerfile .
docker run -itd -p 25565:25565 --restart always -v /home/docker/mc_server:/server -e EULA=true --name forge_server mc_server:1.18.2
```