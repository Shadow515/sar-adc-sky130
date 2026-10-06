proc place {name dev w l x y} {
  box ${x}um ${y}um ${x}um ${y}um
  magic::gencell sky130::sky130_fd_pr__${dev}_01v8 $name w $w l $l
}
place M0  nfet 2 0.15 -1.05 0
place M1  nfet 8 1    -4.5  6
place M2  nfet 8 1     1.5  6
place M3  nfet 1 0.15 -3.6  19
place M4  nfet 1 0.15  1.5  19
place M5  pfet 2 0.15 -3.6  25
place M6  pfet 2 0.15  1.5  25
place M7  pfet 1 0.15 -7.6  25
place M8  pfet 1 0.15  5.5  25
place M9  pfet 1 0.15 -11.6 25
place M10 pfet 1 0.15  9.5  25
foreach n {M0 M1 M2 M3 M4 M5 M6 M7 M8 M9 M10} {
  select cell $n
  findbox
  puts "== $n =="
  box
}
select clear
save comp
