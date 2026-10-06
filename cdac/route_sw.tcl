load swunit
select top cell
edit
proc m {lay x1 y1 x2 y2} { box ${x1}um ${y1}um ${x2}um ${y2}um; paint $lay }
# --- vin: MS1 + MS2 left columns, down to vin rail ---
m metal1 0.25 0.785 0.685 1.285
m metal1 0.25 5.33 0.685 6.33
m metal1 0.25 -2.2 0.50 6.33
m metal1 0.23 -2.15 0.52 -1.75
m via1 0.245 -2.08 0.505 -1.82
# --- b: all 4 drains, exits at top ---
m metal1 0.895 0.785 1.35 1.285
m metal1 0.895 5.33 1.35 6.33
m metal1 1.10 0.785 1.35 10.0
m metal1 3.23 0.785 3.685 1.285
m metal1 3.23 5.33 3.685 6.33
m metal1 3.23 0.785 3.48 6.33
m metal1 1.10 3.0 3.48 3.3
# --- GND: MN source down to GND rail ---
m metal1 3.895 0.785 4.35 1.285
m metal1 4.10 -2.8 4.35 1.285
m metal1 4.085 -2.75 4.365 -2.35
m via1 4.095 -2.68 4.355 -2.42
# --- vref: MP source up to vref rail ---
m metal1 3.895 5.33 4.35 6.33
m metal1 4.10 5.33 4.35 8.95
m metal1 4.085 8.55 4.365 8.95
m via1 4.095 8.62 4.355 8.88
# --- gates: s (MS1), n (MN) down; sb (MS2), p (MP) up ---
m metal1 0.645 -1.55 0.935 0.625
m via1 0.66 -1.48 0.92 -1.22
m metal1 3.645 -3.0 3.935 0.625
m metal1 0.645 6.535 0.935 8.35
m via1 0.66 8.02 0.92 8.28
m metal1 3.645 6.535 3.935 10.0
# --- unused gate pads made bigger (min area) ---
m metal1 0.645 1.445 0.935 1.775
m metal1 3.645 1.445 3.935 1.775
m metal1 0.645 4.795 0.935 5.125
m metal1 3.645 4.795 3.935 5.125
# --- VDD: PMOS ring -> mcon -> metal1 -> VDD rail ---
m mcon 0.05 7.075 0.22 7.245
m metal1 0.02 7.015 0.25 9.55
m metal1 -0.005 9.15 0.275 9.55
m via1 0.005 9.22 0.265 9.48
# --- body ties (li) ---
m locali 3.925 0.935 4.665 1.135
m locali 1.665 -0.085 2.915 0.085
m locali 1.665 7.075 2.915 7.245
# --- metal2 rails (edge to edge, 5 um cell) ---
m metal2 -0.4 -1.5 4.6 -1.2
m metal2 -0.4 -2.1 4.6 -1.8
m metal2 -0.4 -2.7 4.6 -2.4
m metal2 -0.4 8.0 4.6 8.3
m metal2 -0.4 8.6 4.6 8.9
m metal2 -0.4 9.2 4.6 9.5
# --- labels + ports ---
proc lp {name lay x y n} { box ${x}um ${y}um [expr {$x+0.1}]um [expr {$y+0.1}]um; label $name c $lay; port make $n }
lp b    metal1 1.15  9.8  1
lp vin  metal2 2.0  -2.0  2
lp vref metal2 2.0   8.7  3
lp p    metal1 3.7   9.8  4
lp n    metal1 3.7  -2.95 5
lp s    metal2 2.0  -1.4  6
lp sb   metal2 2.0   8.1  7
lp VDD  metal2 2.0   9.3  8
lp GND  metal2 2.0  -2.6  9
# --- check, save, extract ---
select clear
box -1um -3.5um 5.5um 10.5um
drc check
drc catchup
drc why
writeall force
extract all
ext2spice lvs
ext2spice -o swunit_layout.spice
quit -noprompt
