load afe
select top cell
edit
proc place {name dev w l x y} {
  box ${x}um ${y}um ${x}um ${y}um
  magic::gencell sky130::sky130_fd_pr__${dev}_01v8 $name w $w l $l
}
place MT1 nfet 4 0.15 0 0
place MT3 nfet 4 0.15 6 0
place MT2 pfet 8 0.15 0 9
place MT4 pfet 8 0.15 6 9
box 16um 0um 16um 0um
magic::gencell sky130::sky130_fd_pr__cap_mim_m3_1 CD w 32 l 32
foreach n {MT1 MT3 MT2 MT4 CD} { select cell $n; findbox; puts "$n [box values]" }
select clear
writeall force
quit -noprompt
