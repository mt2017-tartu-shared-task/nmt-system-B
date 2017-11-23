#!/usr/bin/bash

# The location of this file is in data/ folder where raw-all folder is.

#SBATCH -J quidditch1-rnncov

#SBATCH -N 1
#SBATCH --ntasks-per-node=1
#The maximum walltime of the job is a 8 days
#SBATCH -t 192:00:00

#SBATCH --mem=48G

#Leave this here if you need a GPU for your job
#SBATCH --partition=gpu

#SBATCH --gres=gpu:tesla:1

#The module with all the NMT / deep learning packages
module load python-3.6.0

# Change -gpuid to appropriate one
echo "Start training"

python -m sockeye.train -s bpe.cleaned-tc-tok-train.et \
                        -t bpe.cleaned-tc-tok-train.en \
                        -vs bpe.cleaned-tc-tok-dev.et \
                        -vt bpe.cleaned-tc-tok-dev.en \
                        --num-embed 500 \
                        --rnn-num-hidden 500 \
                        --rnn-attention-type coverage \
                        --max-seq-len 50 \
                        --monitor-bleu 500 \
                        --rnn-context-gating \
                       -o rnn-cov.model

echo "Job finished"
