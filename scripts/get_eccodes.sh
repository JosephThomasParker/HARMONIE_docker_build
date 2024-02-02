#!/bin/bash

wget https://confluence.ecmwf.int/download/attachments/45757960/eccodes-2.33.0-Source.tar.gz?api=v2
tar xvf eccodes-2.33.0-Source.tar.gz\?api\=v2
mkdir eccodes
mkdir eccodes/build
cd eccodes/build && cmake  ../../eccodes-2.33.0-Source -DCMAKE_INSTALL_PREFIX=/root/work/harmonie/harmonie-43h22_bf/eccodes
cd eccodes/build && make
cd eccodes/build && ctest
cd eccodes/build && make install

