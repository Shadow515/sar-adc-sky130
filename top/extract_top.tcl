addpath /foss/designs/cdac
addpath /foss/designs/comparator
addpath /foss/designs/top
gds read /foss/designs/sar_logic/final/sar_logic.gds
load adc_top
select top cell
extract do local
extract all
ext2spice lvs
ext2spice -o adc_top_layout.spice
quit -noprompt
