# spagobimeta-docker
This is the Dockerfile used to build the SpagoBIMeta docker image on dockerhub. You can use it to build an image locally
if you do not trust the dokcerhub image.

You can use the SpagoBIMeta docker image on Dokcer Hub by running

> docker run -v /tmp/.X11-unix:/tmp/.X11-unix -v /path/to/local-fs-workspace:/SpagoBIMeta_5.2.0_linux64/workspace -e DISPLAY=$DISPLAY  --rm  -d jumpingbean/spagobimeta:5.2
