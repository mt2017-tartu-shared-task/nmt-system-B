#!/bin/bash

#The location of this file is in data/ folder where raw-all folder is.

#SBATCH -J quidditch1_tiny18

#The job requires 1 compute node
#SBATCH -N 1

#The job requires 1 task per node
#SBATCH --ntasks-per-node=1

#The maximum walltime of the job is a 1 days
#SBATCH -t 24:00:00

#SBATCH --mem=16G

#SBATCH --partition=gpu
#SBATCH --gres=gpu:tesla:1

#The module with all the NMT / deep learning packages
module load python-2.7.13

echo "Started translation"
python OpenNMT-py/translate.py -model models/base-model_acc_69.35_ppl_4.49_e9.pt -src data/bpe.tc-tok-test.et - output data/hyps.en -gpu ind
echo "Job done"
