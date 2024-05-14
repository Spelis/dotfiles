

from os import popen

cmd = popen('hyprctl devices').read()
s_index = cmd.index('Keyboards:')+len('Keyboards:')
e_index = cmd.index('Tablets')
cmd = cmd[s_index:e_index]
cmd = cmd.split('\n')
lines = (len(cmd) - 2) // 5

a=[]
for i in range(lines):
    j = i * 5
    old = cmd[j + 3 : 6 + j]
    new = {}
    for ii in old:
        ii = ii.replace("\t", "")
        ii = ii.split(": ", 1)
        if ii[0] == 'active keymap':
          new[ii[0]] = ii[1]
        a.append(new)
        
print(a[0]['active keymap'])