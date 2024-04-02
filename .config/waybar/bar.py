from sys import argv
import psutil

maxi = argv[1]
val = 0
if len(argv) > 1:
    module = argv[2]
    if module == "cpu":
        val = psutil.cpu_percent(interval=1)
    if module == "mem":
        mem_info = psutil.virtual_memory()
        val = mem_info.percent
    if module == "drive":
        val = psutil.disk_usage("/")
        val = val.percent
    if module == "volume":
        import alsaaudio

        m = alsaaudio.Mixer()
        vol = m.getvolume()
        vol = round((vol[0] + vol[1]) / 2)
        val = vol

if len(argv) > 6:
    back = argv[5]
    sec = argv[6]
    pri = argv[7]
else:
    back = "1a1b26"
    sec = "292e42"
    pri = "c0caf5"

origval = val
val = round((val / 100) * int(maxi))
text = f'<span color="#{back}">__</span>{" ".join(list(str(origval)))} %'
bar = f'<span color="#{pri}">{"▪"*round(val-1)}</span><span color="#{sec}">{"▪"*round(int(maxi)-val)}</span>'
print(
    f'<span color="#{back}">__</span>{bar if argv[4] == "yes" else ""}{text if argv[3] == "yes" else ""}'
)
print(str(origval) + "%")
