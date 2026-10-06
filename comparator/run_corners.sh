#!/bin/bash
export SPICE_USERINIT_DIR=/foss/pdks/sky130A/libs.tech/ngspice
printf "%-7s %-6s %-10s %-10s %-12s %-12s\n" corner temp outp1 outp2 delay1 delay2
for c in tt ss ff sf fs; do
  for t in -40 27 125; do
    sed "s/CORNER/$c/; s/TEMP/$t/" comp_corner.spice > run.spice
    vals=$(ngspice -b run.spice 2>&1 | grep -E "^(outp1|outp2|delay1|delay2) " | awk '{print $3}' | tr '\n' ' ')
    printf "%-7s %-6s " $c $t
    for v in $vals; do printf "%-11s " $v; done
    echo
  done
done
