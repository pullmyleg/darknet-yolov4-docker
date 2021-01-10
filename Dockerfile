# Base image 
ARG build_image="ubuntu:18.04"
ARG app_image="ubuntu:18.04"

# Build image
FROM ${build_image} AS build
RUN apt-get update
RUN apt-get install -y build-essential git
RUN apt install -y curl

# Hang tight, like 30min as we setup openCV. 
RUN echo Get a beer, or coffee... Installing OPENCV is slow...
ENV DEBIAN_FRONTEND=noninteractive
RUN ln -fs /usr/share/zoneinfo/Pacific/Auckland /etc/localtime
RUN apt install -y --no-install-recommends libopencv-dev python3-opencv

# Get, configure & Build Darknet
WORKDIR /home/
RUN git clone https://github.com/AlexeyAB/darknet.git
WORKDIR /home/darknet
RUN sed -i -e "s!OPENMP=0!OPENMP=1!g" Makefile && \
    sed -i -e "s!AVX=0!AVX=1!g" Makefile && \
    sed -i -e "s!LIBSO=0!LIBSO=1!g" Makefile && \
    sed -i -e "s!GPU=0!GPU=0!g" Makefile && \
    sed -i -e "s!CUDNN=0!CUDNN=0}!g" Makefile && \
    sed -i -e "s!CUDNN_HALF=0!CUDNN_HALF=0!g" Makefile && \
    sed -i -e "s!OPENCV=0!OPENCV=1!g" Makefile && \
    make
RUN curl -L -O https://github.com/AlexeyAB/darknet/releases/download/darknet_yolo_v4_pre/yolov4-tiny.weights
RUN curl -L -O https://srv-store5.gofile.io/download/1HEZ75/horse.mp4


WORKDIR /home/darknet