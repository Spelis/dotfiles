import argparse
from PIL import Image, ImageDraw, ImageFont
from os import popen, environ
from json import loads


def hex_to_rgb(value):
    value = value.lstrip("#")
    lv = len(value)
    return list(int(value[i : i + lv // 3], 16) for i in range(0, lv, lv // 3))


parser = argparse.ArgumentParser("custom workspace for waybar")
parser.add_argument("workspace")
parser.add_argument(
    "-c",
    help="Set the file with the colors. (.json file)",
    default=f"{environ["HOME"]}/.cache/wal/colors.json",
)
args = parser.parse_args()

with open(args.c, "r") as f:
    f = loads(f.read())
    bg = hex_to_rgb(f["colors"]["color0"])
    fg = hex_to_rgb(f["colors"]["color15"])
    cl1 = hex_to_rgb(f["colors"]["color2"])
    bgsel = hex_to_rgb(f["colors"]["color1"])

output = str(popen("hyprctl clients").read()).split("\n")[:-2]
sel = str(popen("hyprctl activewindow").read()).split("\n")[:-3]
try:
    sel[1] = "selected: yessir"
except:
    pass
output.extend(sel)
lines = (len(output) - 1) // 21
t = []
f = []
for i in range(lines):
    j = i * 22
    old = output[j + 1 : 21 + j]
    new = {}
    for ii in old:
        ii = ii.replace("\t", "")
        ii = ii.split(": ", 1)
        new[ii[0]] = ii[1]
    if new["floating"] == "0":
        t.append(new)
    else:
        f.append(new)

workspace = str(popen("hyprctl activeworkspace").read()).split("\n")[0].split(" ")[2]
if workspace == args.workspace:
    col = tuple(bgsel)
else:
    col = tuple(bg)

im = Image.new("RGBA", (192, 108), col)
draw = ImageDraw.Draw(im)

for win in t:
    if win["workspace"][0] == args.workspace:
        at = win["at"].split(",")
        at[0], at[1] = int(at[0]) // 10, int(at[1]) // 10
        size = win["size"].split(",")
        size[0], size[1] = at[0] + (int(size[0]) // 10), at[1] + (int(size[1]) // 10)

        color = tuple(fg) if not "selected" in win.keys() else tuple(cl1)
        draw.rectangle([*at, *size], fill=color, outline=(0, 0, 0), width=3)

for win in f:
    if win["workspace"][0] == args.workspace:
        at = win["at"].split(",")
        at[0], at[1] = int(at[0]) // 10, int(at[1]) // 10
        size = win["size"].split(",")
        size[0], size[1] = at[0] + (int(size[0]) // 10), at[1] + (int(size[1]) // 10)

        color = tuple(fg) if not "selected" in win.keys() else tuple(cl1)
        draw.rounded_rectangle([*at, *size], fill=color, outline=(0, 0, 0), width=3)

im.save(f'{environ["HOME"]}/.config/waybar/ws{args.workspace}.png')
print(
    f'{environ["HOME"]}/.config/waybar/ws{args.workspace}.png'
)  # waybar gets the path to the image :)
