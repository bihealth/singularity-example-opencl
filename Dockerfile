FROM ubuntu:20.04

RUN \
    apt-get update && \
    apt-get install -y wget gnupg software-properties-common

RUN \
    export DEBIAN_FRONTEND=noninteractive && \
    wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin && \
    mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600 && \
    apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/7fa2af80.pub && \
    add-apt-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/ /" && \
    apt-get update && \
    apt upgrade -y && \
    apt-get install -y cuda clinfo cmake cmake-extras cmake-curses-gui && \
    apt-get clean
