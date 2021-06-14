# ADMIN
This documentation is NOT for users, only if you are interested to compile, install and mange releases as done in this repo.

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
- On successful compilation, the new compiled binaries/libs/should be in the target directory eg. ```/home/ubuntu/eda-bins/ngspice-34```
  
**CREATING A NEW RELEASE**
Check out this [doc](https://docs.github.com/en/github/administering-a-repository/releasing-projects-on-github/managing-releases-in-a-repository) in docs.github.com on how to create and manage releases.
  
- Check out the difference between the previous and current version: eg.
```bash
  diff -qr ~/eda-bins/ngspice-34/glnxa64  <GIT-INSTALL_DIR>/eda-ngspice/glnxa64
```
- Copy only the differences to the git repo, `add`, `commit` and `push` to the `github`.
- Navigate to the main repo page eg. github.com/silicon-vlsi-org/eda-ngspice
- To the right of the list of files, click **Create a new release** under the **Release** section.
- 
  

## Tasks
- [ ] Add more ngspice examples
