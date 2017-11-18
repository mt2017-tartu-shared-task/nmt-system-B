#!/usr/bin/bash

# The location of this file is in data/ folder where raw-all folder is.

#SBATCH -J quidditch1_tiny31

#SBATCH -N 1
#SBATCH --ntasks-per-node=1
#SBATCH -t 01:00:00
#SBATCH --mem=4G

# tab-join and shuffle et and en corpora
echo "Started job"

# Important there cannot be whitespace around equals sign (=)
f=hyps_cleaned.en
g=depre_hyps_cleaned.en

module load python-3.6.0

echo "Start"
# De-dot (if needed)
python ../slurm-scripts/submission3/de_dot.py $f tmp
# De-bpe
python ../slurm-scripts/submission2/de_bpe.py tmp tmp2
# De-tokenize
perl ../slurm-scripts/submission2/detokenizer.perl < tmp2 > tmp
# De-tc
python ../slurm-scripts/submission2/de_truecase_simple.py tmp $g

echo "Job finished"

