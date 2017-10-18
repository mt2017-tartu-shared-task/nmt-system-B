import sys
import re

fin = sys.argv[1]
gout = sys.argv[2]

with open(fin, "r") as f:
        with open(gout, "w") as g:
                for line in f:
                        line = line.strip()
                        line = re.sub(r"@@ ", "", line)
                        g.write(line + "\n")
