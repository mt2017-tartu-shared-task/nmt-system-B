#!/usr/bin/bash

# The location of this file is in data/ folder where raw-all folder is.

#SBATCH -J quidditch1_tiny

#SBATCH -N 1
#SBATCH --ntasks-per-node=1
#SBATCH -t 00:10:00

cat raw-all/*.en > raw-all.en
cat raw-all/*.et > raw-all.et
