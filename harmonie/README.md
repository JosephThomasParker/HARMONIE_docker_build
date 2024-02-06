# HARMONIE Docker and build files

This repo contains the files to set up a Docker environment and build HARMONIE

## Instructions

### Prepartion

Put the Harmonie tarball inside this repo. These instructions have been tested with `harmonie-43h22_bf.tar.gz`.

### Docker

Make the docker container:

```
cd docker
docker build -f Dockerfile.ubuntu_20.04 -t harmonie_ubuntu_20.04 .
```

and run with

```
docker run --rm -it -v ~/path/to/this/repo:/root/work/harmonie harmonie_ubuntu_20.04
```

where `path/to/this/repo` is the path to this repo, so that build files can be used inside the container.

### Prepare the directory

In the container, prepare the HARMONIE folder and move in the install scripts:

```
cd /root/work/harmonie
tar xvf harmonie-43h22_bf.tar.gz
cp scripts/* harmonie-43h22_bf/.
```

### ECCODES

Download and install the ECCODES dependency:

```
cd harmonie-43h22_bf
./get_eccodes.sh
```

This installs ECCODES in `harmonie-43h22_bf/eccodes`.

### HARMONIE

Install HARMONIE with

```
cd /root/work/harmonie/harmonie-43h22_bf
source set_env_variables.sh
./build.sh
```
