# ADMIN
This documentation is NOT for users, only if you are interested to compile, install and mange releases as done in this repo.

## Compiling and Installing Ngspice in Ubuntu 18.04

**SETTING UP LINUX FOR COMPILE**

- Prepare for building ngspice (See the INSTALL file in the ngspice source tree). First time this was compiled on LXLE on Virtual Box. Now I do it on the Ubuntu AWS Lightsail instance.
- ```sudo apt install build-essential linux-headers-‘uname -r‘```
- ```sudo apt install bison flex libx11-dev libxaw7-dev libtool libreadline-dev libncurces-dev```
- ```sudo apt install automake autoconf texinfo``` (```INSTALL``` says only for git repo )
 
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
 
## Compiling and Installing Ngspice in CentOS 7

The source code was compiled on a CentOS 7 VM in Digital Ocean.

**PREREQUISTES**

- Install all necessary Libs in Chap 32.1 of ngspice manual:
  - `bison, flex`, `libX11/libX11-devel`, `libXaw/libXaw-devel`, `libXmu/libXmu-devel`, `libXext/libXext-devel`, `libXft/libXft-devel`, `fontconfig/fontconfig-devel`,  `libXrender/libXrender-devel`, `freetype/freetype-devel`, `readline/readline-devel`
  - Additionally, in order to run the compile script you need `autoconf, automake, libtools`
  - Load the `Development Tools` from the default CentOS repo: `#yum group install 'Development Tools'`
- Installing **Latest GCC Compiler**. The stock compiler in CentOS 7 repo is `gcc-4.8` which is too outdated to compile ngspice. Will get errors in compilation. Followed this [thread](https://linuxize.com/post/how-to-install-gcc-compiler-on-centos-7/) to install the latest version and enable it. 
  - `# yum install centos-release-scl` : Install the __Software Community Library__ which contains the recent `gcc` versions. At the time of last compilation, __Developer Toolset 11__ is available. 
  - `# yum install devtoolset-11`
  - `$ scl enable devtoolset-11 bash` : Need to enable it before compiling the srouce code.

**DOWNLOADING TARBALL AND COMPILING**

- `wget https://sourceforge.net/projects/ngspice/files/ng-spice-rework/36/ngspice-36.tar.gz` : Download the current revision. **NOTE** 36 will be replaced by whatever is the current revision.
- `tar -xzvf ngspice-36.tar.gz` 
- `cd ngspice-36`
- `mkdir release`
- Copy `compile_linux.sh` to `compile_ng36.sh` and edited the following:
  - `../configure --with-x --with-readline=yes --disable-debug --prefix=/home/centos/ngspice-bin CFLAGS="-m64 -O2" LDFLAGS="-m64 -s"`
  - **--enable=xspice NOTE** If you enable `xspice` and `adms`, it creates a shared lib in the install directory but it is hardcoded internally. So when the binary is installed in another location, you get a __permission denied__ error.
- `scl enable devtoolset-11 bash`
- `./compile_ng34.sh`
- On successful compilation, the new compiled binaries/libs/should be in the target directory eg. `/home/centos/ngspice-bin`

## Creating a New Release

Check out this [doc](https://docs.github.com/en/github/administering-a-repository/releasing-projects-on-github/managing-releases-in-a-repository) in docs.github.com on how to create and manage releases.
  
- Check out the difference between the previous and current version: eg.
```bash
  diff -qr ~/eda-bins/ngspice-34/glnxa64  <GIT-INSTALL_DIR>/eda-ngspice/glnxa64
```
- Copy only the differences to the git repo, `add`, `commit` and `push` to the `github`.
  - **IMPORTANT** Make sure you backup the previous binaries in case you need it.
- Navigate to the main repo page eg. github.com/silicon-vlsi-org/eda-ngspice
- To the right of the list of files, click **Create a new release** under the **Release** section.
- Tag the release version eg. ```v34.0```
  - The major release ```v34``` reflects the version of ngspice.
  - The minor release ```vxx.0``` reflects any changes done locally eg. examples, docs, etc.
- Do not add any binaries and do not select pre-release.
- Publish the release. 
- Now users can checkout this version eg. ```git checkout v34.0```
  

## Tasks
- [ ] Add a getting started tutorial with some real life examples.
