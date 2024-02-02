#!/bin/bash

# Set environment variables
export HARMONIE_HOME="/root/work/harmonie/harmonie-43h22_bf/"
export ECCODES_HOME="/root/work/harmonie/harmonie-43h22_bf/eccodes/"
export HARMONIE_SRC=${HARMONIE_HOME}"/src"
export HARMONIE_MAKEUP=${HARMONIE_HOME}"/util/makeup"
export HARMONIE_CONFIG="linux.gfortran.mpi.ubuntu"
export HARMONIE_MAKECMD="make"
export GRIB_API_LIB="-L${ECCODES_HOME}lib -leccodes_f90 -leccodes"
export GRIB_API_INCLUDE=-I${ECCODES_HOME}"include"
export ECCODES_LIB="-L${ECCODES_HOME}lib -leccodes_f90 -leccodes"
export ECCODES_INCLUDE=-I${ECCODES_HOME}"include"
export NETCDF_LIB="-L/usr/lib/aarch64-linux-gnu/ -lnetcdf -lnetcdff"
export NETCDF_INCLUDE="-I/usr/include"
export HDF5_LIB="-L/usr/lib/aarch64-linux-gnu/ -lhdf5_serial_fortran -lhdf5_serial"
export HDF5_INCLUDE="-I/usr/include/hdf5/serial/"

echo "Environment variables set successfully!"

