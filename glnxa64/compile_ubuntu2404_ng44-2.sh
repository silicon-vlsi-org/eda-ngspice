#!/bin/bash
# ngspice build script for Linux, release or debug version, 64 bit
# compile_linux.sh <d>

# Procedure:
# Install gcc, bison, flex, libtool, autoconf, automake, 
# libx11 and libx11-dev (headers), libXaw and libXaw-dev, libreadline and dev
# xmu, xet, xt, libxft, libxrender, libfreetype, libfontconfig
# for details please see the ngspice manual, chapt. 32.1.
# Declare 'compile_linux.sh' executable and start compiling with
# './compile_linux.sh' or './compile_linux.sh d' from the ngspice directory.
#  CentOS users may need to add -std=c99 to the CFLAGS in the ../configure
#  statement.
# Options:
# --enable-cider will enable the CIDER process simulator to construct devices
# in a semiconductor.
# XSPICE, KLU, OSDI, and OpenMP may be deselected if not required.

# It might be necessary to uncomment and run ./autogen.sh .

SECONDS=0

if test "$1" = "d"; then
   if [ ! -d "debug" ]; then
      mkdir debug
      if [ $? -ne 0 ]; then  echo "mkdir debug failed"; exit 1 ; fi
   fi   
else
   if [ ! -d "release" ]; then
      mkdir release
      if [ $? -ne 0 ]; then  echo "mkdir release failed"; exit 1 ; fi
   fi
fi

# If compiling sources from git, you may need to uncomment the following two lines:
./autogen.sh
if [ $? -ne 0 ]; then  echo "./autogen.sh failed"; exit 1 ; fi

echo
if test "$1" = "d"; then
   cd debug
   if [ $? -ne 0 ]; then  echo "cd debug failed"; exit 1 ; fi
  echo "configuring for 64 bit debug"
  echo
  #../configure --with-x --enable-cider --prefix="/usr/local" --libdir="/usr/local/lib" CFLAGS="-g -m64 -O0 -Wall -Wno-unused-but-set-variable" LDFLAGS="-m64 -g"
else
   cd release
   if [ $? -ne 0 ]; then  echo "cd release failed"; exit 1 ; fi
  echo "configuring for 64 bit release"
  echo
  ../configure --with-x --enable-relpath --enable-cider --enable-xspice --disable-debug --with-readline=yes --enable-openmp --enable-osdi --prefix="/home/usrvnc/eda-bins/ngspice-44-2" CFLAGS="-m64 -O2" LDFLAGS="-m64 -s" 
fi
if [ $? -ne 0 ]; then  echo "../configure failed"; exit 1 ; fi

echo
# make clean is required for properly making the code models
echo "cleaning (see make_clean.log)"
make clean 2>&1 -j8 | tee make_clean.log
exitcode=${PIPESTATUS[0]}
if [ $exitcode -ne 0 ]; then  echo "make clean failed"; exit 1 ; fi
echo "compiling (see make.log)"
make 2>&1 -j8 | tee make.log
exitcode=${PIPESTATUS[0]}
if [ $exitcode -ne 0 ]; then  echo "make failed"; exit 1 ; fi
# Install to /usr/local
echo "installing (see make_install.log)"
make install 2>&1 | tee make_install.log 
exitcode=${PIPESTATUS[0]}
if [ $exitcode -ne 0 ]; then  echo "make install failed"; exit 1 ; fi

ELAPSED="Elapsed compile time: $(($SECONDS / 3600))hrs $((($SECONDS / 60) % 60))min $(($SECONDS % 60))sec"
echo
echo $ELAPSED
echo "success"
exit 0
