load swunit
select top cell
edit
proc place {name dev w l x y} {
  box ${x}um ${y}um ${x}um ${y}um
  magic::gencell sky130::sky130_fd_pr__${dev}_01v8 $name w $w l $l
}
place MS1 nfet 0.5 0.15 0   0
place MN  nfet 0.5 0.15 3.0 0
place MS2 pfet 1   0.15 0   4.5
place MP  pfet 1   0.15 3.0 4.5
foreach n {MS1 MN MS2 MP} { select cell $n; findbox; puts "$n [box values]" }
select clear
writeall force
quit -noprompt
