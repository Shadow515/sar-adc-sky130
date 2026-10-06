select top cell
edit
# longer metal2 bars (>= 0.03 um past each end via)
box -2.55um 22.5um 2.46um 22.8um
paint metal2
box -2.98um 23.5um 2.03um 23.8um
paint metal2
box -6.55um 24.25um -2.21um 24.55um
paint metal2
box 1.69um 24.25um 6.03um 24.55um
paint metal2
# longer M7 / M8 drain wires at the bottom (past their vias)
box -6.50um 24.20um -6.25um 24.30um
paint metal1
box 5.73um 24.20um 5.98um 24.30um
paint metal1
# check
box -8um 19um 8um 28.5um
drc check
drc why
writeall force
