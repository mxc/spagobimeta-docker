FROM ubuntu:14.04
RUN apt-get update && apt-get install openjdk-7-jdk libxext-dev libxrender-dev libxtst-dev -y
RUN useradd -m spago
ADD ./SpagoBIMeta_5.2.0_linux64 /SpagoBIMeta_5.2.0_linux64
RUN chown -R spago /SpagoBIMeta_5.2.0_linux64
USER spago
WORKDIR /SpagoBIMeta_5.2.0_linux64
ENTRYPOINT /SpagoBIMeta_5.2.0_linux64/SpagoBI
