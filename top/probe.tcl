addpath /foss/designs/cdac
addpath /foss/designs/comparator
addpath /foss/designs/top
gds read /foss/designs/sar_logic/final/sar_logic.gds
load adc_top
select top cell
proc probe {tag x y} {
  box ${x}um ${y}um [expr {$x+0.02}]um [expr {$y+0.02}]um
  set r [catch {getnode} n]
  puts [format "%-26s (%7.2f, %7.2f): %s" $tag $x $y $n]
}
puts "--- p7 ---"
probe "SAR pin / source wire" 24.83 -69.5
probe "source pad (track)"     24.83 -50.5
probe "channel horizontal"     70.0  -50.5
probe "up to bar (vertical)"   119.79 -30.0
probe "p7 bar"                 130.0 -14.25
puts "--- n7 ---"
probe "SAR pin / source wire" 82.09 -69.5
probe "source pad (track)"     82.09 -51.5
probe "channel horizontal"     100.0 -51.5
probe "up to bar (vertical)"   119.79 -40.0
probe "n7 bar"                 130.0 -27.95
puts "--- nd ---"
probe "SAR pin / source wire" 115.21 -69.5
probe "channel horizontal"     200.0 -67.5
probe "up to bar (vertical)"   293.19 -40.0
probe "nd bar"                 293.19 -27.95
quit -noprompt
