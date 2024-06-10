# TUTORIAL

Hi, 
welcome to workshop on the JK framework - from zero to hero.

Download JKCS (follow the installation on jkcs.readthedocs.io)
Rune setup, use this:
  sh setup.sh puhti -r -qml -nn 
(I will help you with remaining setup during the workshop)

Download XTB and know where it is located
(e.g. scroll down on: https\://github.com/grimme-lab/xtb/releases/tag/v6.7.0)

(not mandatory: download ABCluster, ORCA, CREST)
(not mandatory: link all programs in ~/.JKCSusersetup.txt)

- get well-familiar with basic usage of common shell commands:
  find, nl/cat/head/tail/more/less, bc/awk, sed, grep, xargs, touch, rm, cd, mkdir, ls, sort, wc, du, pwd, ln, 
  echo, tar/zip, chmod/chown, man, for/if/while, seq, uniq, paste, who, time/date, cut, sort, dos2unix

- get familiar with some SLURM commands, e.g.:
  (https\://slurm.schedmd.com/quickstart.html and https\://slurm.schedmd.com/sbatch.html)
  = srun, squeue, scontrol, sacct, scancel, sinfo
  = -cpus-per-task, -nodes, -account, -time, -mem, -n, --array, --dependency
  = $SLURM_JOB_ID, $SLURM_CPUS_PER_TASK
    
