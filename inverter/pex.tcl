load inverter
extract all
ext2spice cthresh 0
ext2spice subcircuit top on
ext2spice -o inverter_pex.spice
quit -noprompt
