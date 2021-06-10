# NGSPICE VERSION 34 64-bit

- Compiled source from git://git.code.sf.net/p/ngspice/ngspice
  - cloned in ```/home/ubuntu/sit-git-repos/eda-src```
  - ```git checkout ngspice-34``` (Check with ```git branch``` command)
  - ```git fetch```
  - created directory ```release``` in the install directory
- Compiled on Linux AWS Lightsail **5.4.0-1049-aws** #51~**18.04.1-Ubuntu** 
- Created directory release in the src directory
- Copied ```compile_linux.sh``` to compile_ng34.sh and edited the following
  - ../configure --with-x --with-readline=yes --disable-debug --prefix=/home/ubuntu/eda-bins/ngspice-34 CFLAGS="-m64 -O2" LDFLAGS="-m64 -s"
- Ran the script ```./compile_ng34.sh```
