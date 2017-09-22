#!/usr/bin/bash

# The location of this file is in data/ folder where raw-all folder is.

#SBATCH -J quidditch1_tiny12

#SBATCH -N 1
#SBATCH --ntasks-per-node=1
#SBATCH -t 01:00:00

# Training the true-casing models for both files
../OpenNMT-py/tools/train-truecaser.perl --model en-truecase.mdl --
corpus tok-train.en

../OpenNMT-py/tools/train-truecaser.perl --model et-truecase.mdl --
corpus tok-train.et

echo "True-casing models trained"

# Do the true-casing

for lang in en et
do
 for f in {test,dev,train}.$lang
 do
  ../OpenNMT-py/tools/truecase.perl --model $lang-truecase.mdl < tok-$f > tc-tok-$f
 done
done
echo "Job finished"
