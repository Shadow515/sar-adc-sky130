load afe
select top cell
edit
proc m {lay x1 y1 x2 y2} { box ${x1}um ${y1}um ${x2}um ${y2}um; paint $lay }
proc lp {name lay x y n} { box ${x}um ${y}um [expr {$x+0.1}]um [expr {$y+0.1}]um; paint $lay; label $name c $lay; port make $n }
# top: MT1/MT2 left columns
m metal1 0.23 0.785 0.685 4.785
m metal1 0.23 9.83 0.685 17.83
m metal1 0.23 0.785 0.48 17.83
# vcm: MT1/MT2 right + MT3/MT4 left columns + link
m metal1 0.895 0.785 1.35 4.785
m metal1 0.895 9.83 1.35 17.83
m metal1 1.10 0.785 1.35 17.83
m metal1 6.23 0.785 6.685 4.785
m metal1 6.23 9.83 6.685 17.83
m metal1 6.23 0.785 6.48 17.83
m metal1 1.10 7.0 6.48 7.3
# refn: MT3/MT4 right columns -> stack up to dummy cap top plate (metal4)
m metal1 6.895 0.785 7.35 4.785
m metal1 6.895 9.83 7.35 17.83
m metal1 7.10 0.785 7.35 17.83
m metal1 7.10 13.5 14.8 13.8
m metal1 14.25 13.25 14.8 14.05
m via1 14.395 13.52 14.655 13.78
m metal2 14.25 13.25 14.8 14.05
m via2 14.365 13.49 14.685 13.81
m metal3 14.25 13.25 14.8 14.05
m via3 14.365 13.49 14.685 13.81
m metal4 14.25 13.25 17.0 14.05
# st: NMOS gates (bottom)
m metal1 0.645 -1.0 0.935 0.625
m metal1 6.645 -1.0 6.935 0.625
m metal1 0.645 -1.0 6.935 -0.7
# stb: PMOS gates (top)
m metal1 0.645 18.035 0.935 19.3
m metal1 6.645 18.035 6.935 19.3
m metal1 0.645 19.0 6.935 19.3
# unused gate pads: bigger (min area)
m metal1 0.645 4.945 0.935 5.30
m metal1 6.645 4.945 6.935 5.30
m metal1 0.645 9.27 0.935 9.625
m metal1 6.645 9.27 6.935 9.625
# GND: NMOS rings (li) -> mcon -> metal1 -> bottom bar -> stack to dummy cap bottom plate (metal3)
m locali 1.665 -0.085 5.915 0.085
m mcon 0.05 -0.085 0.22 0.085
m metal1 0.02 -0.145 0.25 0.145
m metal1 0.02 -2.0 0.25 0.145
m metal1 0.02 -2.0 17.05 -1.7
m metal1 16.5 -2.0 17.05 -0.3
m via1 16.645 -0.70 16.905 -0.44
m metal2 16.5 -0.8 17.05 -0.2
m via2 16.615 -0.66 16.935 -0.34
m metal3 16.5 -0.8 17.05 0.1
# VDD: PMOS rings (li) -> mcon -> metal1 up
m locali 1.665 18.575 5.915 18.745
m mcon 0.05 18.575 0.22 18.745
m metal1 0.02 18.515 0.25 18.805
m metal1 0.02 18.515 0.25 20.5
# ports
lp top  metal1 0.28  12.0 1
lp refn metal1 7.15  12.0 2
lp vcm  metal1 3.0   7.1  3
lp st   metal1 3.0  -0.9  4
lp stb  metal1 3.0  19.1  5
lp VDD  metal1 0.08 20.3  6
lp GND  metal1 5.0  -1.9  7
select clear
box -1um -3um 49um 31um
drc check
drc catchup
drc why
writeall force
extract all
ext2spice lvs
ext2spice -o afe_layout.spice
quit -noprompt
