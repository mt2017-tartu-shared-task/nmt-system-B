#!/bin/bash

#The location of this file is in data/ folder where raw-all folder is.

#SBATCH -J quidditch1_tiny20

#The job requires 1 compute node
#SBATCH -N 1

#The job requires 1 task per node
#SBATCH --ntasks-per-node=1

#The maximum walltime of the job is a 1 days
#SBATCH -t 1:00:00

#SBATCH --mem=16G

echo "Started evaluation"
perl ../multi-bleu.perl bpe.tc-tok-test.en < hyps.en
echo "Job done"
