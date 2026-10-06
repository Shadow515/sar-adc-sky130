select top cell
edit
# ===== PMOS sources up to VDD rail (left side) =====
box -3.35um 25.83um -2.915um 27.83um
paint metal1
box -3.35um 25.83um -3.10um 29.5um
paint metal1
box -7.35um 25.83um -6.915um 26.83um
paint metal1
box -7.35um 25.83um -7.10um 29.5um
paint metal1
box -11.35um 25.83um -10.915um 26.83um
paint metal1
box -11.35um 25.83um -11.10um 29.5um
paint metal1
# ===== right side (mirror) =====
box 2.395um 25.83um 2.83um 27.83um
paint metal1
box 2.58um 25.83um 2.83um 29.5um
paint metal1
box 6.395um 25.83um 6.83um 26.83um
paint metal1
box 6.58um 25.83um 6.83um 29.5um
paint metal1
box 10.395um 25.83um 10.83um 26.83um
paint metal1
box 10.58um 25.83um 10.83um 29.5um
paint metal1
# ===== VDD rail =====
box -11.5um 29.25um 11.0um 29.75um
paint metal1
# ===== PMOS guard rings (bodies) to their sources, li =====
box -3.70um 26.5um -2.945um 27.0um
paint locali
box -7.70um 26.15um -6.945um 26.65um
paint locali
box -11.70um 26.15um -10.945um 26.65um
paint locali
box 2.425um 26.5um 3.18um 27.0um
paint locali
box 6.425um 26.15um 7.18um 26.65um
paint locali
box 10.425um 26.15um 11.18um 26.65um
paint locali
# ===== check =====
box -12um 25um 12um 30um
drc check
drc why
writeall force
