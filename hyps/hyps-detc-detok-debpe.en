# If you want to run this on the rocket
# First load python3 - "module load python-3.6.0"
# Then that python3 has also nltk.
# Tried this script on my own machine.
import sys
from nltk import sent_tokenize

fin = sys.argv[1]
gout = sys.argv[2]

with open(fin, "r") as f:
        with open(gout, "w") as g:
                for line in f:
                        sents = sent_tokenize(line.strip())
                        out = []
                        for sent in sents:
                                out.append(sent.capitalize())
                        if len(out)>1:
                                print(out)
                        g.write(" ".join(out) + "\n")
