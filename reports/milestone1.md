# Milestone 1: Hand in the baseline system and translation  [Report]
TEAMNAME team: QuidditchChampions
 * https://github.com/markus93
 * https://github.com/crypotex
 * https://github.com/imackerracher
 

## Our project board:
![Alt text](./project_board_ms1.png?raw=true)


## This milestone tasks description:
### Corpus Preparation
All our slurm scripts are in https://github.com/mt2017-tartu-shared-task/nmt-system-B/tree/master/slurm-scripts/submission1
Starting from raw data, we applied following preprocessing steps:
* corpora concatenating ([1-process-raw-data-script.sh](../slurm-scripts/submission1/1-process-raw-data-script.sh)): we got one big parallel text corpus of 19051439 
* data shuffling ([2-shuffle-split-data.sh](../slurm-scripts/submission1/2-shuffle-split-data.sh)): to feed sentences to NMT system later in the random order  
* data splitting ([2-shuffle-split-data.sh](../slurm-scripts/submission1/2-shuffle-split-data.sh)): ~19Mio. training examples, 50k test examples, and 25k development examples
* tokenization ([3-tokenize-data.sh](../slurm-scripts/submission1/3-tokenize-data.sh)): split all sentences into their tokens
* true casing ([4-true-case.sh](../slurm-scripts/submission1/4-true-case.sh)): to benefit translation
* remove strange and empty sentences ([5-filter-empy-strange-data.sh](../slurm-scripts/submission1/5-filter-empy-strange-data.sh)): removed 144706 sentences
* BPE ([6-bpe.sh](../slurm-scripts/submission1/6-bpe.sh)): we used joint vocabulary of size 30000
* Preprocessing ([7-preprocess.sh](../slurm-scripts/submission1/7-preprocess.sh)): our preprocessing script had memory problems even with vocabulary size of 30000, so we ran it on GPU machine with 150GB RAM.

We used [Moses](http://www.statmt.org/moses/) scripts to do basic preprocessing, and [BPE](https://github.com/rsennrich/subword-nmt) for the subword segmentation. 

### Model Training
We used 1 Tesla P100 GPU Machine provided by [HPC center of the University of Tartu](https://www.hpc.ut.ee/en_US/web/guest/home) to train our model with vocablary of size 30000. The model we trained is the default [OpenNMT-py](https://github.com/OpenNMT/OpenNMT-py) model, which consists of a 2-layer LSTM with 500 hidden units on both the encoder/decoder.

We had trained our best model for ~7 days, 13 epochs. Development set perplexity was 4.07. We waited to the end to stop the training process. You can find the script we used to run training here ([8-train.sh](../slurm-scripts/submission1/8-train.sh)
).

### Translating and Evaluating Results
Following scripts were used to translate and evaluate the results: ([9-translate.sh](../slurm-scripts/submission1/9-translate.sh)) and ([10-evaluate.sh](../slurm-scripts/submission1/10-evaluate.sh)).

We performed an inference and got unpostprocessed English hyps file ([hyps.en](../hyps/hyps.en)). 

We used this file, processed reference file, and BLEU metric to evaluate the translation performance of our model, and got 32.70 points.

_________________________________________________________________________________________________________________
For the next milestone, we will focus on some more advanced evaluation and error analysis technics.    
