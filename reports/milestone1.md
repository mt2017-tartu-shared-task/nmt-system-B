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
* corpora concatenating (1-process-raw-data-script.sh): we got one big parallel text corpus of 19051439 
* data shuffling (2-shuffle-split-data.sh): to feed sentences to NMT system later in the random order  
* data splitting (2-shuffle-split-data.sh): ~19Mio. training examples, 50k test examples, and 25k development examples
* tokenization (3-tokenize-data.sh): split all sentences into their tokens
* true casing (4-true-case.sh): to benefit translation
* remove strange and empty sentences (5-filter-empy-strange-data.sh): removed 144706 sentences
* BPE (6-bpe.sh): we used joint vocabulary of size 37963466

We used [Moses](http://www.statmt.org/moses/) scripts to do basic preprocessing, and [BPE](https://github.com/rsennrich/subword-nmt) for the subword segmentation. 

### Model Training
We used 1 Tesla P100 GPU Machine provided by [HPC center of the University of Tartu](https://www.hpc.ut.ee/en_US/web/guest/home) to train our model with vocablary of size __N__. The model we trained is the default [OpenNMT-py](https://github.com/OpenNMT/OpenNMT-py) model, which consists of a 2-layer LSTM with 500 hidden units on both the encoder/decoder.

We had trained our best model for ~__N__ days, __M__ epochs. Development set perplexity was __X__. We __performed early stopping / waited to the end__ to stop the training process. You can find the script we used to run training here (__link__ to SLURM script).

### Translating and Evaluating Results
We performed an inference and got unpostprocessed English hyps file. 

We used this file, processed reference file, and BLEU metric to evaluate the translation performance of our model, and got __X__ points.

_________________________________________________________________________________________________________________
For the next milestone, we will focus on some more advanced evaluation and error analysis technics.    
