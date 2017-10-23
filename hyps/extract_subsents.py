
fin = "hyps_dev_acc.en.att_debug"
ids = {8, 40, 73, 123, 125, 156, 256, 265, 320, 369, 420, 490, 496, 502, 527, 733, 881, 925, 985, 996,
       1,2,14,53,104,106,109,199,200,201,378,379,567,568,777,778,779,823,825,900,909}

fout = "hyps_dev_subset_acc.en.att_debug"
out = []

cur_sent_id = 0
with open(fin, "r") as f:

    for line in f:
        if line.startswith("0 ||| "):
            cur_sent_id += 1
        if cur_sent_id in ids:
            out.append(line)

with open(fout, "w") as g:
    for line in out:
        g.write(line)