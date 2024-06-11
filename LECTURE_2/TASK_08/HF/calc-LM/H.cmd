#!/bin/bash

export OMP_NUM_THREADS=$SLURM_JOB_CPUS_PER_NODE
if [ "$module_g16_loaded" != "loaded" ]
then
  source /com/bin/modules.sh;source /comm/groupstacks/gaussian/bin/modules.sh --silent; module load gaussian16/Rev.B.01; 2>/dev/null
  module_g16_loaded="loaded"
fi
export GAUSS_EXEDIR=/comm/groupstacks/gaussian/gaussian/gaussian16/Rev.B.01//g16/
export g16root=/comm/groupstacks/gaussian/gaussian/gaussian16/Rev.B.01/

#CREATING WORKING DIRECTORY
if [ ! -d /scratch/12826895//TMP ]; then mkdir -p /scratch/12826895//TMP; fi
ADD=""
test=0
while [ $test -eq 0 ]
do
  CALC_NAME=/scratch/12826895//TMP/G16${SLURM_JOBID}_H${ADD}
  if [ -d $CALC_NAME ]; then ADD="_${RANDOM}"
  else test=1;fi
done

#dirs
mkdir $CALC_NAME
cp H.com $CALC_NAME/
cd $CALC_NAME

/comm/groupstacks/gaussian/gaussian/gaussian16/Rev.B.01//g16/g16 < H.com &> /home/kubeckaj/TUTORIAL/LECTURE_3/TASK_08/HF/calc-LM/H.log

#COPYING RESULTS BACK
#if [ -e /home/kubeckaj/TUTORIAL/LECTURE_3/TASK_08/HF/calc-LM/H.log ]
#then
#  mv /home/kubeckaj/TUTORIAL/LECTURE_3/TASK_08/HF/calc-LM/H.log /home/kubeckaj/TUTORIAL/LECTURE_3/TASK_08/HF/calc-LM/HO.log
#fi
#cp H.log /home/kubeckaj/TUTORIAL/LECTURE_3/TASK_08/HF/calc-LM/
JKlog2xyz /home/kubeckaj/TUTORIAL/LECTURE_3/TASK_08/HF/calc-LM/H.log
cp H.grad /home/kubeckaj/TUTORIAL/LECTURE_3/TASK_08/HF/calc-LM/ 2>/dev/null
cp H.xyz /home/kubeckaj/TUTORIAL/LECTURE_3/TASK_08/HF/calc-LM/ 2>/dev/null
cp *.err /home/kubeckaj/TUTORIAL/LECTURE_3/TASK_08/HF/calc-LM/ 2>/dev/null
cp *.out /home/kubeckaj/TUTORIAL/LECTURE_3/TASK_08/HF/calc-LM/ 2>/dev/null
cd /home/kubeckaj/TUTORIAL/LECTURE_3/TASK_08/HF/calc-LM

#CLEANING
rm -rf $CALC_NAME
