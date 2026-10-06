select top cell
edit
# metal1 patches: full via width, +0.04 um above and below
box -2.51um 22.48um -2.25um 22.82um
paint metal1
box -2.51um 24.23um -2.25um 24.57um
paint metal1
box 1.73um 23.48um 1.99um 23.82um
paint metal1
box 1.73um 24.23um 1.99um 24.57um
paint metal1
box -6.51um 24.20um -6.25um 24.57um
paint metal1
box 5.73um 24.20um 5.99um 24.57um
paint metal1
# check
box -8um 19um 8um 28.5um
drc check
drc why
writeall force
