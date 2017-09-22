#!/usr/bin/bash

# The location of this file is in data/ folder where raw-all folder is.

#SBATCH -J quidditch1_tiny15

#SBATCH -N 1
#SBATCH --ntasks-per-node=1
#SBATCH -t 24:00:00
#SBATCH --mem=16G

# Tokenize
../OpenNMT-py/tools/clean-corpus-n.perl tc-tok-train en et cleaned-tc-tok-train 1 100

echo "Job finished"
