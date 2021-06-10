# NGSPICE VERSION 34 64-bit
- http://ngspice.sourceforge.net

## Compile Instructions
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
