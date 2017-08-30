#!/bin/bash

# wrap_cmssw.sh <CMSSW path> [args]
cms_path=$1 ; shift

source /cvmfs/cms.cern.ch/cmsset_default.sh
pushd $cms_path/src
eval `scramv1 runtime -sh`
popd
exec "$@"
