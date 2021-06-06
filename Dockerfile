FROM ubuntu:20.04
LABEL maintainer="Ryo Kabutan"

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y tzdata
# timezone setting
ENV TZ=Asia/Tokyo 

RUN apt-get purge cmake -y
RUN apt-get install build-essential wget libssl-dev -y
RUN wget https://cmake.org/files/v3.19/cmake-3.19.2.tar.gz
RUN tar xvf cmake-3.19.2.tar.gz
RUN cd cmake-3.19.2\
    && ./bootstrap\
    && make\
    && make install
RUN apt-get install -y qtbase5-dev qtdeclarative5-dev libqt5serialport5-dev

