FROM ubuntu:12.04
MAINTAINER apr

RUN apt-get update -y
RUN apt-get install -y rsync
RUN apt-get install -y x11-common \
x11-xkb-utils \
libblas3gf \
libfreetype6 \
libx11-dev \
libxrender1 \
libfontconfig1 \
libquadmath0 \
libjpeg-dev \
libjpeg62

# create user and home
RUN useradd --create-home --home-dir /home/isis3user --shell /bin/bash isis3user

RUN rsync -azv --delete --partial \
isisdist.astrogeology.usgs.gov::x86-64_linux_UBUNTU/isis /home/isis3user/

# RUN touch /home/isis3user/bubbi.txts

ENV export ISISROOT=/home/isis3user/isis
ENV export PATH=/home/isis3user/isis/bin:$PATH
ENV . $ISISROOT/scripts/isis3Startup.sh

