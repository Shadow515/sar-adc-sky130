import glob, os, re
run = sorted(glob.glob("runs/*/"), key=os.path.getmtime)[-1]
d = open(run + "final/def/sar_logic.def").read()
scale = int(re.search(r"UNITS DISTANCE MICRONS (\d+)", d).group(1))
pins = re.search(r"PINS \d+ ;(.*?)END PINS", d, re.S).group(1)
print("Run:", run)
print(f"{'pin':10s} {'layer':6s} {'x(um)':>8s} {'y(um)':>8s}  side")
for blk in pins.split(" ;"):
    nm = re.search(r"-\s+(\S+)", blk); ly = re.search(r"LAYER\s+(\S+)", blk); pl = re.search(r"PLACED\s+\(\s*(-?\d+)\s+(-?\d+)\s*\)\s+(\S+)", blk)
    if nm and ly and pl and not nm.group(1).startswith(("VPWR","VGND")):
        print(f"{nm.group(1):10s} {ly.group(1):6s} {int(pl.group(1))/scale:8.2f} {int(pl.group(2))/scale:8.2f}  {pl.group(3)}")
