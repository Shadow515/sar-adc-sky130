select top cell
edit
box 12.1um 14.0um 12.2um 14.1um
label clk c metal2
port make 1
box -5.9um 5.6um -5.8um 5.7um
label inp c metal1
port make 2
box 5.3um 5.6um 5.4um 5.7um
label inn c metal1
port make 3
box 1.80um 21.0um 1.90um 21.1um
label outp c metal1
port make 4
box -2.45um 21.0um -2.35um 21.1um
label outn c metal1
port make 5
box 0.0um 29.4um 0.1um 29.5um
label VDD c metal1
port make 6
box 0.0um -1.3um 0.1um -1.2um
label GND c metal1
port make 7
writeall force
extract all
ext2spice lvs
ext2spice -o comp_layout.spice
