# VERSIONS
Use these version numbers when checking out a release/version

## v44.2.1
- same v44.2 but compiled with `--enable-relpath`
- This enables relative path for XPice models and spiinit
  - To fix error for XPice models not found when the install driectory was changed to what was used to for `--prefix`
  - Now getting error spiinit file not found. Need to fix it.
    
## v44.2
- ngspice 44.4 for Ubuntu 24.04
- Cider, Xspice and openMP is enabled in this compile.
- Used for xschem with SKY130 integration
- updated:
  - eda-ngspice/bin/ngspice
  - eda-ngspice/share/ngspice/scripts/spinit 
  - eda-ngspice/lib (XSPICE code models)
  - eda-ngspice/share/ngspice/scripts/ciderinit 
  - eda-ngspice/share/ngspice/scripts/devaxis 
  - eda-ngspice/share/ngspice/scripts/devload 
  - eda-ngspice/share/ngspice/scripts/ghnggen 
  - eda-ngspice/share/ngspice/scripts/src 
  - eda-ngspice/share/ngspice/scripts/vlnggen 

## v42.0
- ngspice 42 for Ubuntu 22.04
- ngspice 42 for CentOS 7 
- updated: ../bin/ngspice ../scripts/spinit compile_ng42.sh

## v36.0
- ngspice 36 for Ubuntu 18.04 
- added ngspice 36 binaries for CentOS 7
- Typo fix in ```examples/getStarted/test-subckt.sp```
- updated few relevant examples

## v34.0
- ngspice 34
- added examples from the ngspice source
- added examples/getStarted with some basic netlist for quick start.
- doc still has manual of ngspice-32
