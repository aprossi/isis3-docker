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

# get isis3 ubuntu 12.04
RUN rsync -azv --delete --partial \
isisdist.astrogeology.usgs.gov::x86-64_linux_UBUNTU/isis /home/isis3user/


# get isis3 base data (still too much)
# RUN mkdir /home/isis3user/isis3data
# RUN rsync -azv --delete --partial \
# isisdist.astrogeology.usgs.gov::isis3data/data/base /home/isis3user/isis3data/

# RUN touch /home/isis3user/bubbi.txts
# ENV export ISISROOT=/home/isis3user/isis
# ENV export PATH=/home/isis3user/isis/bin:$PATH
# ENV . $ISISROOT/scripts/isis3Startup.sh

echo 'export ISISROOT=/home/isis3user/isis' >>/home/isis3user/.bash_profile
echo 'export PATH=/home/isis3user/isis/bin:$PATH' >>/home/isis3user/.bash_profile
echo '. $ISISROOT/scripts/isis3Startup.sh' >>/home/isis3user/.bash_profile
echo 'export ISIS3DATA=/home/isis3user/isis3data' >>/home/isis3user/.bash_profile
