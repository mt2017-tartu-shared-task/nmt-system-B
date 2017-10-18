import sys

fin = sys.argv[1]
gout = sys.argv[2]

with open(fin, "r") as f:
        with open(gout, "w") as g:
                for line in f:
                    if len(line) != 0:
                        g.write(line[0].upper() + line[1:])
