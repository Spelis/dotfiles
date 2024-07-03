from os import popen


def modder(modmask):
    modmask = int(modmask)
    if modmask == 64:
        return "Super + "
    elif modmask == 65:
        return "Super + Shift + "
    elif modmask == 1:
        return "Shift + "
    elif modmask == 0:
        return ""
    elif modmask == 69 or modmask == 72:
        return "Super + Alt + "
    elif modmask == 5:
        return "Ctrl + Shift + "
    else:
        return modmask


cmd = popen("hyprctl binds").read().split('\n')
lines = ((len(cmd)-1)//9)

a = []
for i in range(lines):
    n = {}
    for j in range(9):
        l = cmd[i*9+j]
        l = l.replace('\t', '')
        if j == 0:
            n["type"] = l
        else:
            print(l)
            try:
                l = l.split(": ", 1)
                n[l[0]] = l[1]
            except:
                pass

    print(n)

    n['modmask'] = modder(n['modmask'])

    a.append(f"{n['modmask']}{n['key']} : {n['dispatcher']}({n['arg']})")

popen(f'echo "{"\n".join(a)}" | rofi -dmenu')
