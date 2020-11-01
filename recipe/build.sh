#!/bin/bash
set -ex

export CFLAGS="${CFLAGS} -O3 -fPIC -I${BUILD_PREFIX}/include"
export CXXFLAGS="${CXXFLAGS} -O3 -fPIC -I${BUILD_PREFIX}/include"
export LDFLAGS="${LDFLAGS} -Wl,-rpath,${BUILD_PREFIX}/lib -L${BUILD_PREFIX}/lib"
export CPPFLAGS="${CXXFLAGS}"

# Configure
./configure --prefix=$PREFIX

# Build
make -j$CPU_COUNT

# Install
make install
