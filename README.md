# spagobimeta-docker
This is the Dockerfile used to build the [SpagoBIMeta docker image on Docker Hub](https://hub.docker.com/r/jumpingbean/spagobimeta/). You can use it to build an image locally
if you do not trust the dokcerhub image. 

You will need to download the [SpagoBIMeta 5.2 IDE](http://forge.ow2.org/project/download.php?group_id=204&file_id=21075), this link is to the 64bit version, unarchive it into the Docker build directory before running "docker build ."

You can use the SpagoBIMeta docker image on Dokcer Hub by running the command below. It is a rather large image, being 1.32GB in size. Any hints on how to make this smaller will be appreciated. The first time the command is run it will pull down the image. Thereafter the image will be available locally.

> docker run -v /tmp/.X11-unix:/tmp/.X11-unix -v /path/to/local-fs-workspace:/SpagoBIMeta_5.2.0_linux64/workspace -e DISPLAY=$DISPLAY  --rm  -d --name SpagoBIMeta jumpingbean/spagobimeta:5.2

The above command does the following:
* **docker run** will pull down and run the image from Docker Hub. This may take a while depending on the line speed,
* **-v /tmp/.X11-unix:/tmp/.X11-unix** will map the X server unix socket into the container so that the gui displays on your host X server,
* **-v /path/to/local-fs-workspaceL/SpagoBIMeta_5.2.0_linux_64/workspace** maps the first directory on the host into the container so you can save you projects on the host and not in the container itself. If you do not use a mapped volume your projects will exist in the container only. This will make performing backups and version control difficult, not to mention containers are ephemeral and you may loose your data otherwise. Of course you could pull it down again from your SpagoBI server :),
* **-e DISPLAY=$DISPLAY** just makes the host environment variable into the container,
* **--rm** - this will remove the container after it has been run, another reason to make sure you map your workspace into a folder on the hosts!. You can leave this out and just keep the container around and stop and start it when needed. The container is named **SpagoBIMeta** so you can use "docker start SpagoBIMeta" if you want to use the same container again after exisitng the IDE,
* **-d** Means run the process in detached mode so log messages are not shown on stdout. To see log messages, which can be important for debugging problems with your model use **"docker log SpagoBIMeta"**,
* **--name SpagoBIMeta** - is the name of the container. You can use this in docker commands to refer to the running container
*  **jumpingbean/spagobimeta:5.2** is the image to pull and launch.
