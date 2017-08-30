#!/bin/bash
source /cvmfs/cms.cern.ch/cmsset_default.sh
cd ${_CONDOR_SCRATCH_DIR}
export SCRAM_ARCH=slc6_amd64_gcc530
# make a brand new empty CMSSW working area
eval `scramv1 project CMSSW CMSSW_9_2_8`
cd CMSSW_9_2_8/src
eval `scramv1 runtime -sh`
echo "CMSSW: "$CMSSW_BASE
cd ${_CONDOR_SCRATCH_DIR}
python runHatsTrees.py -i QCD_HT700to1000_0_${1} -o QCD_HT700to1000_0_${1} -l -t 'ntuplizer/tree'
# examples here: http://uscms.org/uscms_at_work/physics/computing/setup/condor_worker_node.shtml