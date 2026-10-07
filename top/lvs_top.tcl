set layout [readnet spice adc_top_layout.spice]
set ref [readnet spice /foss/pdks/sky130A/libs.ref/sky130_fd_sc_hd/spice/sky130_fd_sc_hd.spice]
readnet spice cdac_full.spice $ref
readnet spice afe.spice $ref
readnet spice /foss/designs/comparator/comp.spice $ref
readnet verilog /foss/designs/sar_logic/final/sar_logic.pnl.v $ref
readnet verilog adc_top_ref.v $ref
lvs "$layout adc_top" "$ref adc_top" /foss/pdks/sky130A/libs.tech/netgen/sky130A_setup.tcl lvs_top.txt
quit
