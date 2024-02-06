FROM ubuntu:22.04
LABEL maintainer="joseph.parker@ichec.ie"
LABEL version="1.0.0"
LABEL description="Dockerfile file for running field_api: https://github.com/ecmwf-ifs/field_api"

# Disable Prompt During Packages Installation
ARG DEBIAN_FRONTEND=noninteractive

RUN apt update \ 
	&& apt install -y \
	build-essential \
	gfortran-12 \
	g++-12 \
	make \
	wget \
	git \
	vim \
	rsync \
	curl \
	python3 \
	python3-pip \
	libssl-dev

# field_api requires cmake >= 3.24 which is not provided by default in Ubuntu 22.04.
RUN wget -c https://github.com/Kitware/CMake/releases/download/v3.28.3/cmake-3.28.3.tar.gz \
&& tar xvf cmake-3.28.3.tar.gz \
&& cd cmake-3.28.3 \
&& ./bootstrap \
&& make \
&& make install

# clone ecbuild (required for fiat)
WORKDIR /root/work
RUN git clone https://github.com/ecmwf/ecbuild
ENV PATH=$PWD/ecbuild/bin:$PATH

# clone and build fiat
WORKDIR /root/work
RUN git clone https://github.com/ecmwf-ifs/fiat.git
WORKDIR /root/work/fiat
ENV ecbuild_ROOT=/root/work/ecbuild
#ENV MPI_HOME=<path-to-MPI>
#ENV fckit_ROOT=<path-to-fckit>
ENV CC=gcc-12
ENV FC=gfortran-12
ENV CXX=g++-12
RUN mkdir build
WORKDIR /root/work/fiat/build
RUN cmake ..
RUN make
RUN make install
RUN ctest

# fypp
RUN pip3 install fypp

# clone and build field_api
WORKDIR /root/work
RUN git clone https://github.com/ecmwf-ifs/field_api.git
ENV FIELD_API_DIR="/root/work/field_api"
ENV FIELD_API_BUILD_DIR=$FIELD_API_DIR/build
RUN mkdir $FIELD_API_BUILD_DIR
WORKDIR $FIELD_API_BUILD_DIR
RUN cmake .. -DENABLE_ACC=OFF
RUN make
RUN make install
RUN ctest
WORKDIR $FIELD_API_DIR
