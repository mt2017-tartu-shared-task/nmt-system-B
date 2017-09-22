#!/usr/bin/bash

# The location of this file is in data/ folder where raw-all folder is.

#SBATCH -J quidditch1_tiny12

#SBATCH -N 1
#SBATCH --ntasks-per-node=1
#SBATCH -t 01:00:00
#SBATCH --mem=8G

# Tokenize

for f in {test,dev,train}.{en,et}
do
	../OpenNMT-py/tools/tokenizer.perl < $f > tok-$f
	echo $f done
done

echo "Job finished"
