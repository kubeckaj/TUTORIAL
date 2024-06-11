#!/bin/bash -norc
#SBATCH -p qtest
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 1
#SBATCH -t 10:00
#SBATCH -e output
#SBATCH -o output
#SBATCH --open-mode=append

echo Hi

