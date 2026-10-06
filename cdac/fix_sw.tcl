load swunit
select top cell
edit
box 1.7um 4.2um 2.9um 7.46um
paint nwell
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
