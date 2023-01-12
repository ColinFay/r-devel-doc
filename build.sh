#!/bin/bash

# R recommends setting this to avoid issues with programs like sed:
export LANG=Cbuild

export R_ARCH=""

# Get version in major.minor format:
VERSION=$(sed 's/\([0-9]*.[0-9]*\).[0-9]*.*/\1/' ../VERSION)

# Use version-dev as default folder target:
TARGET=${1:-$VERSION-dev}

# Download recommended packages
../tools/rsync-recommended

CC=gcc ../configure --enable-R-shlib --with-blas --with-lapack --disable-java &&
    make all &&
    make install

cd tests/

make check
