# NGSPICE 
### Current distribution version 36.0 
precompiled for **64-bit 18.04 Ubuntu & Ubuntu-based Linux** and **CentOS 7.9 (Core)**. It's also tested on a light-weight Ubuntu-variant LXLE distro. If you are interested in compiling from the source, instructions in [Compiling and Installing Ngspice](ADMIN.md) should help.

- http://ngspice.sourceforge.net
- [NGSpice] is a open source spice simulator for electric and electronic circuits. 
- [NGSpice Reference Manual][NGSpiceMan]: Complete reference manual in HTML format.


## Table of Content
- [Downloading & Setting Up Ngspice](#downloading-&-setting-up-ngspice)
- [QuickStart Guide](#Quick-Start-Guide)
- [Technology](#Technology)

## Downloading & Setting Up Ngspice

- Change directory ```cd``` to install directory <INSTALL_DIR> e.g. ```/home/user/cad```
- To download from the ```git``` repository:
  - ```git clone https://github.com/silicon-vlsi-org/eda-ngspice```
- Change directory to the installed ngspice directory eg. ```cd eda-ngspice```
- Checkout the desired version: eg. ```git checkout v42.0```
  - To make sure you are on the right version type ```git branch``` and your output should have a line like this :
  - ```* (HEAD detached at v42.0)```
  - **NOTE** The revision history is maintained in [VERSIONS.md](VERSIONS.md)

- Add the following environment variables in your `~/.bashrc` 
```bash
export  SPICE_LIB_DIR=<INSTALL_DIR>/eda-ngspice/glnxa64/share/ngspice
export  SPICE_EXEC_DIR=<INSTALL_DIR>/eda-ngspice/glnxa64/bin
export  PATH=$PATH:$SPICE_EXEC_DIR
```
Use the apporpriate locations for CentOS-7

There is a initialization script in `$SPICE_LIB_DIR/scripts/spinit`. You can overwrite any of the initilization by adding commands to a local `~/.spiceinit` .

The Spice model files are located in the ```https://github.com/silicon-vlsi-org/eda-technology``` repository.

## Quick Start Guide

- To quickly get started, there are few simple spice examples in ```<INSTALL_DIR>/eda-ngspice/examples/getStarted```
- There is suggested order in README based on difficulty that you can follow.
- You can copy the examples to a local directory and start `ngspice` in that directory.
- Source/run the spice netlist in the spice command prompt: `spice-1> source l1-res-div.sp`
- You can continue running spice commands in the spice command prompt ie. `ngspice-x >`
- To quit simply type `quit()`
- You can also run ngspice is in batch mode: `ngspice -b -r filename.raw -o filename.log input.sp`

## Technology
All technology files maintained in the https://github.com/silicon-vlsi-org/eda-technology



* * *

[OpenRAM]:              https://openram.soe.ucsc.edu/
[OpenRAMgit]:           https://github.com/VLSIDA/OpenRAM 
[OpenRAMpaper]:         https://ieeexplore.ieee.org/document/7827670/
[SCMOS]:                https://www.mosis.com/files/scmos/scmos.pdf
[NGSpice]:              http://ngspice.sourceforge.net
[NGSpiceMan]:           http://ngspice.sourceforge.net/docs/ngspice-html-manual/manual.xhtml
[Magic]:                http://opencircuitdesign.com/magic/
[Netgen]:               http://opencircuitdesign.com/netgen/

