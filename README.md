# isis3-docker

This is an attempt to make a working (for teaching/training purposes) installation of [USGS ISIS3](https://isis.astrogeology.usgs.gov) on docker, with a stripped-down set of data (full size of binaries, libraries and, mostly, data exceeds 300 GB!).

The image is based on Ubuntu 12 but different distributions should be easy to achieve, as long as suppoted on [USGS ISIS3](https://isis.astrogeology.usgs.gov/documents/InstallGuide/index.html).

# build

with the [Dockerfile](Dockerfile) available on current working directory:

```
docker build -t isis3ubuntu12:latest .
```

# X11 forwarding

in order. On host (anywhere, e.g. on docker shell):

## MacOSX

Xquartz should be running with both ticks enabled on the security tab.  

```
xhost +
```

# Run

```
docker run --rm -i -t -u isis3user \
-v ~/files-for-docker:/home/isis3user/shared-folder \
-e DISPLAY=XXX.XXX.XXX.XXX:0 \
isis3ubuntu12:latest
```

where ```XXX.XXX.XXX.XXX``` is the IP of the **host**

e.g. on a mac laptop en0 = ethernet en1 = wi-fi (I guess):


e.g. in bash (in the host docker shell):

```
IPHOST="$(ifconfig en1 | grep "inet " | cut -d ' ' -f 2)"
```


```
docker run --rm -i -t -u isis3user \
-v ~/files-for-docker:/home/isis3user/shared-folder \
-e DISPLAY=$IPHOST:0 \
isis3ubuntu12:latest /bin/bash
```

