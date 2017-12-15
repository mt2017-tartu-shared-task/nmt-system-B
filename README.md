# __QuidditchChampions__ (Team B) In-class Machine Translation Shared Task 2017 Submission
This repository is a result of our participation in the shared task.<br>
We went through the process of building, analyzing, and improving the neural machine translation system.

Poster: [link]() // fill later

The shared task was for Estonian-English language pair. 
It included working with ~19.000.000 sentence pairs.

Shared task main page: [link](https://github.com/mt2017-tartu-shared-task) <br>
Shared task on course page: [link](https://courses.cs.ut.ee/2017/MT/fall/Main/SharedTask)

Sections below summarize key milestones we went through.  

##  Baseline system
- Our baseline system was __Concrete one-sentence summary of the baseline system.__
- As a result, we got __21.95__ BLEU points on the shared dev set.



More details: [report1](https://github.com/mt2017-tartu-shared-task/nmt-system-B/blob/master/reports/milestone1.md)

## Baseline system manual evaluation
- We manually analyzed __60__ baseline translations. 
- Or main observation was that __many words in sentences was not translated, especially in case of long sentences or after dot.__ // _put here only the problem(s) you actually put the most effort to_
- Take a look at our the motivating example produced by baseline system:
  1. Human: "__In this part of our website , you can find information on how the Parliament
organises its work , through a system of specialised committees . the work of the
European Parliament is important because in many policy areas , decisions on
new European laws are made jointly by Parliament and the Council of Ministers ,
which represents Member States .__"
  2. Baseline: "__This part of our website will find information on how Parliament will organise its
work through the various committees .__"

- The baseline model often didn't include whole parts of a sentence. Some examples:

  1. Human: "__In the European Parliament , all Community languages are equally important : all parliamentary documents are published in all the official languages of the European Union ( EU ) and every MEP has the right to speak in the official language of his / her choice .__"

  2. Baseline: "__All Community languages are equally important in the European Parliament : all Parliament's documents will be published in all the official languages of the European Union ( EU ) and each member of the European Parliament .__"

More details: [report2](https://github.com/mt2017-tartu-shared-task/nmt-system-B/blob/master/reports/milestone2.pdf)

## Final system
- In order to address translation issues found after our manual evaluation we used Amazons sockeye library to train a system using context gates and instead of attention we used coverage, our bpe vocabulary size was 30k. __descrie_the_modification_you_actually_included_in_your_final_system__. 
- The trained system gave us __22.82__ BLEU points on the shared dev set that means __BIG__ over the baseline. 

More details: [report3](https://github.com/mt2017-tartu-shared-task/nmt-system-B/blob/master/reports/milestone3.pdf) and [report4](https://github.com/mt2017-tartu-shared-task/nmt-system-B/blob/master/reports/milestone4.pdf)

## Final system manual evaluation
- Generally speaking, the majority of sentences are fluent and meaning preserving. Especially long sentences are translated much better than with the baseline model. 
- Lets now look at how does our Motivating example looks like with our final system:
Final system: "Our website on this part will find information on how to organise its work by the various committees of the committees , and the work of the European Parliament is important because decisions on new European laws are jointly conducted by Parliament and the Council of Ministers , which represent the Member States in a number of policy areas ." 
- As a result you can see that this translation is a great improvement over the translation of the baseline model. In the baseline translation only the first part of the input was included. Even though this is a very long sentence, the translation is fluent and adequate. There is only a minor flaw ("commitees of the commitees"), which can be expected from such a long sentence.

Do not forget to check our poster: [__POSTER_LINK__]

## What we also tried or wanted to try
We also tried replacing all dots except last with special symbols and various beam sizes.<br>
The dot replacement gave __22.29__ BLEU points on shared dev set and actually helped with translations. Below is a translation with this approach on same example as seen previously.
 - Dot-model: This section of our website will find information on how Parliament operates
its work through a system of various committees , and the work of the
European Parliament is therefore important because decisions on new
European laws are jointly made by the Parliament and the Council of
Ministers .<br>

Lastly, we wanted to try hyperparameter tuning, however the model did not converge. There were too many hyperparameter to tune to really find out which value suits what parameter is good. Furthermore we wanted to try POS-tags and ensembling multiple models.<br>


## Final words
- __1st_sentence: your_results_on_the_test_set_and_interpretation_(fill_later)__
- __We had issues with models training rather long - especially for OpenNMT, Sockeye was much faster. Queue times were sometimes really long, especially at the ending part of semester.__
- __We learnt that in order to train great model, it needs much analysing, trying, evaluating.__


## Team members:
1. https://github.com/markus93
2. https://github.com/crypotex
3. https://github.com/imackerracher

Project board: [link](https://github.com/mt2017-tartu-shared-task/nmt-system-B/projects/1)
