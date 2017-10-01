#!/bin/bash

#The name of the job is test_job
#SBATCH -J quidditch1_tiny17

#The job requires 1 compute node
#SBATCH -N 1

#The job requires 1 task per node
#SBATCH --ntasks-per-node=1

#The maximum walltime of the job is a 1 days
#SBATCH -t 24:00:00

#SBATCH --mem=150G

#SBATCH --partition=gpu
#SBATCH --gres=gpu:tesla:1

#The module with all the NMT / deep learning packages
module load python-2.7.13

echo "Preprocess on GPU machine for more RAM!!!"
python ../OpenNMT-py/preprocess.py -train_src bpe.cleaned-tc-tok-train.et -train_tgt bpe.cleaned-tc-tok-train.en -valid_src bpe.cleaned-tc-tok-dev.et -valid_tgt bpe.cleaned-tc-tok-dev.en -save_data rdy -src_vocab_size 30000 -tgt_vocab_size 30000 -seed 143
echo "Job done"
