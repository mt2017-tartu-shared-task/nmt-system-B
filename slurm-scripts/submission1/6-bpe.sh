#!/usr/bin/bash

# The location of this file is in data/ folder where raw-all folder is.

#SBATCH -J quidditch1_tiny16

#SBATCH -N 1
#SBATCH --ntasks-per-node=1
#SBATCH -t 24:00:00
#SBATCH --mem=16G


# First learn BPE (dictionary size 100k):
cat cleaned-tc-tok-train.et cleaned-tc-tok-train.en | ../OpenNMTpy/tools/subword-nmt/learn_bpe.py -s 100000 > eten.bpe

echo "BPE learned"
# Apply BPE

for lang in et en
 do
# apply to train
  ../OpenNMTpy/tools/subword-nmt/apply_bpe.py -c eten.bpe < cleaned-tc-tok-train.$lang > bpe.cleaned-tc-tok-train.$lang
# apply to dev
  ../OpenNMTpy/tools/subword-nmt/apply_bpe.py -c eten.bpe < tc-tok-dev.$lang > bpe.tc-tok-dev.$lang
# apply to test
  ../subword-nmt/apply_bpe.py -c eten.bpe < tc-tok-test.$lang > bpe.tc-tok-test.$lang
 done

echo "Job finished"
