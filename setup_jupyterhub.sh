#!/bin/bash

source /cvmfs/cms.cern.ch/cmsset_default.sh
CMSOS=`/cvmfs/cms.cern.ch/bin/cmsos`

if [ ! -d fnal-lpc-scientific-python-hats ]; then
    if [[ "$CMSOS" == slc7* ]]; then
        # We're running under CentOS7
        export SCRAM_ARCH=slc7_amd64_gcc530 
    else
        # Probably CentOS6
        export SCRAM_ARCH=slc6_amd64_gcc530
    fi
    scram p -n fnal-lpc-scientific-python-hats CMSSW_9_2_8
fi
[ -d fnal-lpc-scientific-python-hats/kernel ] || \
    mkdir -p fnal-lpc-scientific-python-hats/kernel
    
cat << EOF > fnal-lpc-scientific-python-hats/kernel/kernel.json
{
 "display_name": "Python 2 - FNAL HATS",
 "language": "python",
 "argv": [
  "$(pwd)/wrap_cmssw.sh",
  "$(pwd)/fnal-lpc-scientific-python-hats",
  "python2",
  "-m",
  "ipykernel_launcher",
  "-f",
  "{connection_file}"
 ]
}
EOF
jupyter kernelspec install --user fnal-lpc-scientific-python-hats/kernel/
