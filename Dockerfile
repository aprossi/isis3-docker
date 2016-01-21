FROM centos:latest
ENV export PATH=$PATH
MAINTAINER apr

RUN yum update -y
RUN yum install -y rsync

# get isis binaries

# get minimalistic subset of data

