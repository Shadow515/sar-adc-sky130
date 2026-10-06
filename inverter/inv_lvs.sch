v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 1470 -1540 1510 -1540 {lab=in}
N 1470 -1540 1470 -1390 {lab=in}
N 1470 -1390 1510 -1390 {lab=in}
N 1550 -1510 1550 -1420 {lab=out}
C {sky130_fd_pr/nfet3_01v8.sym} 1530 -1390 0 0 {name=M1
W=1
L=0.15
body=GND
nf=1
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet3_01v8.sym} 1530 -1540 0 0 {name=M2
W=2
L=0.15
body=VDD
nf=1
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {ipin.sym} 1470 -1470 0 0 {name=p1 lab=in}
C {opin.sym} 1550 -1470 0 0 {name=p2 lab=out}
C {iopin.sym} 1550 -1570 3 0 {name=p3 lab=VDD}
C {iopin.sym} 1550 -1360 1 0 {name=p4 lab=GND}
