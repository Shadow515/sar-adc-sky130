select top cell
edit
# ===== stubs up from reset-switch top gate pads (M9, M7, M8, M10) =====
box -10.955um 27.035um -10.665um 28.75um
paint metal1
box -6.955um 27.035um -6.665um 28.75um
paint metal1
box 6.145um 27.035um 6.435um 28.75um
paint metal1
box 10.145um 27.035um 10.435um 28.75um
paint metal1
# vias on top of each stub
box -10.94um 28.42um -10.68um 28.68um
paint via1
box -6.94um 28.42um -6.68um 28.68um
paint via1
box 6.16um 28.42um 6.42um 28.68um
paint via1
box 10.16um 28.42um 10.42um 28.68um
paint via1
# ===== clk bus along the top (metal2) =====
box -10.98um 28.4um 12.3um 28.7um
paint metal2
# ===== clk down the right edge (metal2) =====
box 12.0um 0.25um 12.3um 28.7um
paint metal2
# ===== clk across the bottom to M0 gate (metal2) =====
box -0.43um 0.25um 12.3um 0.55um
paint metal2
# make M0 bottom gate pad taller so the via fits
box -0.405um 0.20um -0.115um 0.625um
paint metal1
box -0.39um 0.27um -0.13um 0.53um
paint via1
# ===== check =====
box -12um -2um 13um 30um
drc check
drc why
writeall force
