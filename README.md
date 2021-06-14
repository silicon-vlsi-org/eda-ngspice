# NGSPICE VERSION 34 64-bit
- http://ngspice.sourceforge.net
- [NGSpice] is a open source spice simulator for electric and electronic circuits. 
- [NGSpice Reference Manual][NGSpiceMan]: Complete reference manual in HTML format.

This repo contains pre-compiled binaries/libraries/etc of **Ngspice Version 34** for **64-bit 18.04 Ubuntu Linux**. It's also tested on a light-weight Ubuntu-variant LXLE distro. If you are interested in compiling from the source, instructions in Section-[Compiling and Installing Ngspice](#compiling-and-installing-ngspice) should help.

## Table of Content
- [Downloading & Setting Up Ngspice](#downloading-&-setting-up-ngspice)
- [QuickStart Guide](#Quick-Start-Guide)
- [Technology](#Technology)
- [Compiling and Installing Ngspice](#compiling-and-installing-ngspice)
- [Tasks](#Tasks)

## Downloading & Setting Up Ngspice

- Change directory ```cd``` to install directory <INSTALLDIR> e.g. ```/home/user/cad```
- To download from the ```git``` repository:
- ```git clone https://github.com/silicon-vlsi-org/eda-ngspice```
- Checkout the desired version: ```git checkout v34.0```

Add the following environment variables in your `~/.bashrc`

```bash
export  SPICE_LIB_DIR=<INSTALLDIR>/eda-ngspice/glnxa64/share/ngspice
export  SPICE_EXEC_DIR=<INSTALLDIR>/eda-ngspice/glnxa64/bin
export  PATH=$PATH:$SPICE_EXEC_DIR
```
There is a initialization script in `$SPICE_LIB_DIR/scripts/spinit`. You can overwrite any of the initilization by adding commands to a local `~/.spiceinit` .

The Spice model files are located in the ```https://github.com/silicon-vlsi-org/eda-technology``` repository.

## Quick Start Guide

- There are few simple spice examples in ```<INSTALLDIR>/eda-ngspice/examples/getStarted```
- You can copy the examples to a local directory and start ```ngspice`` in that directory.
- Source/run the spice netlist in the spice command prompt: ```spice-1> source l1-res-div.sp```
- You can continue running spice commands in the spice command prompt ie. ```ngspice-x >```
- To quit simply type ```quit()```
- You can also run ngspice is in batch mode:
```bash
ngspice -b -r filename.raw -o filename.log input.sp
```

## Technology
All technology files maintained in the https://github.com/silicon-vlsi-org/eda-technology

## Compiling and Installing Ngspice

**SETTING UP LINUX FOR COMPILE**

- Prepare for building ngspice (See the INSTALL file in the ngspice source tree). First time this was compiled on LXLE on Virtual Box. Now I do it on the Ubuntu AWS Lightsail instance.
- ```sudo apt install build-essential linux-headers-‘uname -r‘```
- ```sudo apt install bison flex libx11-dev libxaw7-dev libtool libreadline-dev libncurces-dev```
- ```sudo apt install automake autoconf texinfo``` (```INSTALL``` says only for git repo )
- 
**USING SOURCE FROM GIT REPO**

- Compiled on Linux AWS Lightsail **5.4.0-1049-aws** #51~**18.04.1-Ubuntu**
- cd ```/home/ubuntu/sit-git-repos/eda-src```
- ```git clone git://git.code.sf.net/p/ngspice/ngspice```
- ```git checkout ngspice-34``` (Check with ```git branch``` command)
- ```git fetch```
- ```cd ngspice```
- ```mkdir release```
- Copied ```compile_linux.sh``` to ```compile_ng34.sh``` and edited the following:
  - ```../configure --with-x --with-readline=yes --disable-debug --prefix=/home/ubuntu/eda-bins/ngspice-34 CFLAGS="-m64 -O2" LDFLAGS="-m64 -s"```
- Ran the script ```./compile_ng34.sh```
- Copied ngspice from ```/home/ubuntu/eda-bins/ngspice-34``` to git repo and pushed it to the cloud.
- Once it is verified

## Tasks
- [ ] Add more ngspice examples


* * *

[OpenRAM]:              https://openram.soe.ucsc.edu/
[OpenRAMgit]:           https://github.com/VLSIDA/OpenRAM 
[OpenRAMpaper]:         https://ieeexplore.ieee.org/document/7827670/
[SCMOS]:                https://www.mosis.com/files/scmos/scmos.pdf
[NGSpice]:              http://ngspice.sourceforge.net
[NGSpiceMan]:           http://ngspice.sourceforge.net/docs/ngspice-html-manual/manual.xhtml
[Magic]:                http://opencircuitdesign.com/magic/
[Netgen]:               http://opencircuitdesign.com/netgen/

