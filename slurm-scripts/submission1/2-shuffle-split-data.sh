#!/usr/bin/bash

# The location of this file is in data/ folder where raw-all folder is.

#SBATCH -J quidditch1_tiny12

#SBATCH -N 1
#SBATCH --ntasks-per-node=1
#SBATCH -t 00:10:00

# tab-join and shuffle et and en corpora
paste raw-all.{et,en} | shuf > mixed-data.both

# split corpus
sed -n 1,50000p mixed-data.both | cut -f 1 > test.et
sed -n 1,50000p mixed-data.both | cut -f 2 > test.en
sed -n 50001,75000p mixed-data.both | cut -f 1 > dev.et
sed -n 50001,75000p mixed-data.both | cut -f 2 > dev.en
sed -n 75001,19051439p mixed-data.both | cut -f 1 > train.et
sed -n 75001,19051439p mixed-data.both | cut -f 2 > train.en

echo "Job finished"
