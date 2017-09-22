#!/usr/bin/bash

#SBATCH -J quidditch1_tiny

#SBATCH -N 1
#SBATCH --ntasks-per-node=1
#SBATCH -t 00:10:00

cat raw-all/*.en > raw-all.en
cat raw-all/*.et > raw-all.et
