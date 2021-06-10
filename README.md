# NGSPICE VERSION 34 64-bit
- http://ngspice.sourceforge.net
- [NGSpice] is a open source spice simulator for electric and electronic circuits. 
- [NGSpice Reference Manual][NGSpiceMan]: Complete reference manual in HTML format.

## Table of Content
- [Environment Variables](#Environment-Variables)
- [QuickStart Guide](#Quick-Start-Guide)
  - [Using the Python Library](#Using-the-Python-Library)
- [Compile Instructions](compile-instructions)

## Environment Variables

Add the following environment variables in your `~/.bashrc`

```bash
export  SPICE_LIB_DIR=<INSTALLDIR>/glnxa64/share/ngspice
export  SPICE_EXEC_DIR=<INSTALLDIR>/glnxa64/bin
export  PATH=$PATH:$SPICE_EXEC_DIR
```
There is a initialization script in `$SPICE_LIB_DIR/scripts/spinit`. You can overwrite any of the initilization by adding commands to a local `~/.spiceinit` .

The Spice model files are located at [FIXME]

## Quick Start Guide
You can open a text editor create a *netlist* of the intended circuit for example of a voltage divider as shown below (say filename `divider.sp`):
```spice
First line in ngspice is always the title line
* This is a comment line
Vbat    vin     0       DC 5
R1      vin     vout    1k
R2      vout    0       1k

.control
tran 0.1u 1u
.endc

.end
```
Then start `ngspice` and source the netlist at the ngspice command prompt:
```bash
ngspice 1 -> source divider.sp
```
It should output the node voltages at the initial transient voltages. you can plot any of the nodes eg.:
```bash
ngspice 2 -> plot v(vout)
```

**IMPORANT NOTE** While editing inside ngspice, if you make an error, you may lose the netlist file. This maybe a bug in ngspice.

The preferred method of running ngspice is in batch mode:
```bash
ngspice -b -r filename.raw -o filename.log input.sp
```
And to quit, simply type `quit`.

### Using the Python Library
[FIXME: Add relevant information]

## Compile Instructions

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


* * *

[OpenRAM]:              https://openram.soe.ucsc.edu/
[OpenRAMgit]:           https://github.com/VLSIDA/OpenRAM 
[OpenRAMpaper]:         https://ieeexplore.ieee.org/document/7827670/
[SCMOS]:                https://www.mosis.com/files/scmos/scmos.pdf
[NGSpice]:              http://ngspice.sourceforge.net
[NGSpiceMan]:           http://ngspice.sourceforge.net/docs/ngspice-html-manual/manual.xhtml
[Magic]:                http://opencircuitdesign.com/magic/
[Netgen]:               http://opencircuitdesign.com/netgen/

