gds read /foss/designs/sar_logic/final/sar_logic.gds
load sar_logic
foreach {nm x} {p7 4.83 n7 42.09 nd 75.21 s_west 0.30} {
  if {$nm == "s_west"} { box 0um 57.3um 0.7um 57.6um } else { box [expr {$x-0.2}]um 79.3um [expr {$x+0.2}]um 80.2um }
  select area
  puts "== $nm pin area in SAR: [what -list]"
  set b [box values]; puts "   box: $b"
}
quit -noprompt
