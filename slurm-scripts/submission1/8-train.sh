#!/usr/bin/bash

# The location of this file is in data/ folder where raw-all folder is.

#SBATCH -J quidditch1_tiny18

#SBATCH -N 1
#SBATCH --ntasks-per-node=1
#The maximum walltime of the job is a 8 days
#SBATCH -t 192:00:00

#SBATCH --mem=150G

#Leave this here if you need a GPU for your job
#SBATCH --partition=gpu

#SBATCH --gres=gpu:tesla:1

#The module with all the NMT / deep learning packages
module load python-2.7.13

# Change -gpuid to appropriate one
echo "Start training"

python ../OpenNMT-py/train.py -data rdy -save_model ../model/demo-model –gpuid 6

echo "Job finished"
