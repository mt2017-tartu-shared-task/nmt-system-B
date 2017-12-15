#!/bin/bash

#The location of this file is in data/ folder where raw-all folder is.

#SBATCH -J quidditch_trans

#The job requires 1 compute node
#SBATCH -N 1

#The job requires 1 task per node
#SBATCH --ntasks-per-node=1

#The maximum walltime of the job is a 1 days
#SBATCH -t 72:00:00

#SBATCH --mem=12G

#The module with all the NMT / deep learning packages
export PATH=/gpfs/hpchome/b02166/anaconda3/bin:$PATH

echo "Started translation"

# Translate bla bla for cycle over rows ...
# See parameters at: https://github.com/awslabs/sockeye/blob/master/sockeye/arguments.py
cat /gpfs/hpchome/b02166/mt/nmt-system-B/data/rnn-cov/bpe.cleaned-tc-tok-test.et  | python -m sockeye.translate --models /gpfs/hpchome/b02166/mt/nmt-system-B/data/rnn-cov/rnn-cov.model \ 
                         --use-cpu > translated.output.en

echo "Job done"
