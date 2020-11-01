#!/bin/bash
set -ex

export CFLAGS="${CFLAGS} -O3 -fPIC -I${PREFIX}/include"
export CXXFLAGS="${CXXFLAGS} -O3 -fPIC -I${PREFIX}/include"
export CPPFLAGS="${CPPFLAGS} -O3 -fPIC -I${PREFIX}/include"
export LDFLAGS="${LDFLAGS} -Wl,-rpath,${PREFIX}/lib -L${PREFIX}/lib"

# Configure
./configure --prefix=$PREFIX

# Build
make -j$CPU_COUNT

# Install
make install
