#!/bin/bash
export OMP_NUM_THREADS=$SLURM_JOB_CPUS_PER_NODE

if [ "$module_orca_loaded" != "loaded" ]
then
  source /comm/groupstacks/gaussian/bin/modules.sh --silent; module load orca/5.0.3 2>/dev/null
  module_orca_loaded="loaded"
fi
export LD_LIBRARY_PATH=/comm/groupstacks/chemistry/apps/orca/5.0.3/:/comm/swstack/core/python/3.9.4/lib

#CREATING WORKING DIRECTORY
if [ ! -d /scratch/12157355//TMP ]; then mkdir -p /scratch/12157355//TMP; fi
ADD=""
test=0
while [ $test -eq 0 ]
do
  CALC_NAME=/scratch/12157355//TMP/ORCA${SLURM_JOBID}_4sa4am-44_10_162${ADD}
  if [ -d $CALC_NAME ]; then ADD="_${RANDOM}"
  else test=1;fi
done

#dirs
mkdir $CALC_NAME

if [ -e 4sa4am-44_10_162.xyz ]; then cp 4sa4am-44_10_162.xyz $CALC_NAME/; fi
cp 4sa4am-44_10_162.inp $CALC_NAME/
cd $CALC_NAME

/comm/groupstacks/chemistry/apps/orca/5.0.3//orca 4sa4am-44_10_162.inp &> /home/kubeckaj/PROJECT_NN/MORTEN_SA_AM_CORRECT/TEST_HAIDE/RECALC/SP/calc-LM/4sa4am-44_10_162.out 

#COPYING RESULTS BACK
#if [ -e /home/kubeckaj/PROJECT_NN/MORTEN_SA_AM_CORRECT/TEST_HAIDE/RECALC/SP/calc-LM/4sa4am-44_10_162.out ]
#then
#  mv /home/kubeckaj/PROJECT_NN/MORTEN_SA_AM_CORRECT/TEST_HAIDE/RECALC/SP/calc-LM/4sa4am-44_10_162.out /home/kubeckaj/PROJECT_NN/MORTEN_SA_AM_CORRECT/TEST_HAIDE/RECALC/SP/calc-LM/4sa4am-44_10_162O.out
#fi
#cp 4sa4am-44_10_162.out /home/kubeckaj/PROJECT_NN/MORTEN_SA_AM_CORRECT/TEST_HAIDE/RECALC/SP/calc-LM/
cp trajectory.xyz /home/kubeckaj/PROJECT_NN/MORTEN_SA_AM_CORRECT/TEST_HAIDE/RECALC/SP/calc-LM/4sa4am-44_10_162_traj.xyz 2>/dev/null #only for MD
cp 4sa4am-44_10_162.xyz /home/kubeckaj/PROJECT_NN/MORTEN_SA_AM_CORRECT/TEST_HAIDE/RECALC/SP/calc-LM/4sa4am-44_10_162.xyz 2>/dev/null
cp *.err /home/kubeckaj/PROJECT_NN/MORTEN_SA_AM_CORRECT/TEST_HAIDE/RECALC/SP/calc-LM/ 2>/dev/null
cd /home/kubeckaj/PROJECT_NN/MORTEN_SA_AM_CORRECT/TEST_HAIDE/RECALC/SP/calc-LM

#CLEANING
rm -rf $CALC_NAME
