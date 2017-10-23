
fin = "../../hyps/hyps_dev_acc.en.att_debug"
ids = {8, 40, 73, 123, 125, 156, 256, 265, 320, 369, 420, 490, 496, 502, 527, 733, 881, 925, 985, 996,
       1,2,3,14,53,104,106,109,199,200,201,378,379,567,568,777,778,779,823,825,900,909,
       5, 117, 171, 184, 201, 292, 333, 452, 465, 501, 525, 529, 547, 657, 722, 763, 810, 900, 932, 967}
       
print(len(ids))

fout = "../../hyps/hyps_dev_subset_acc.en.att_debug"
out = []

cur_sent_id = 0
with open(fin, "r", encoding="utf-8") as f:

    for line in f:
        if line.startswith("0 ||| "):
            cur_sent_id += 1
        if cur_sent_id in ids:
            out.append(line)

with open(fout, "w", encoding="utf-8") as g:
    for line in out:
        g.write(line)