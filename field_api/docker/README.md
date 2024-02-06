# FIELD_API docker image

Docker image containing a the repo version of field_api
(https://github.com/ecmwf-ifs/field_api) built on Ubuntu 22.04 using
gfortran-12.

## Build

```
docker build -f Dockerfile -t field_api_ubuntu_22.04 .
```

## Run

```
docker run --rm -it field_api_ubuntu_22.04
```
