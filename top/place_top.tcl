addpath /foss/designs/cdac
addpath /foss/designs/comparator
addpath /foss/designs/top
gds read /foss/designs/sar_logic/final/sar_logic.gds
load adc_top
select top cell
edit
getcell cdac_full child 0 0 parent 0um 0um
identify CDAC
getcell afe child 0 0 parent -90um 43.3um
identify AFE
getcell comp child 0 0 parent -25um 51.3um
identify COMP
getcell sar_logic child 0 0 parent 20um -150um
identify SAR
foreach n {CDAC AFE COMP SAR} { select cell $n; findbox; set b [box values]; puts "$n bbox (um): [expr {[lindex $b 0]/200.0}] [expr {[lindex $b 1]/200.0}] [expr {[lindex $b 2]/200.0}] [expr {[lindex $b 3]/200.0}]" }
select clear
save adc_top
quit -noprompt
