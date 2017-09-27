#!/usr/bin/bash

# The location of this file is in data/ folder where raw-all folder is.

#SBATCH -J quidditch1_tiny17

#SBATCH -N 1
#SBATCH --ntasks-per-node=1
#SBATCH -t 24:00:00
#SBATCH --mem=16G

#The module with all the NMT / deep learning packages
module load python-2.7.13

python ../OpenNMT-py/preprocess.py –config preprocess.cfg

echo "Job finished"
