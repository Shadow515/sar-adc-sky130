#!/bin/bash
export SPICE_USERINIT_DIR=/foss/pdks/sky130A/libs.tech/ngspice
printf "%-4s %-12s %-12s\n" bit ideal_mV sim_mV
for i in 0 1 2 3 4 5 6 7; do
  cmd=""
  for j in 0 1 2 3 4 5 6 7; do
    if [ $i -eq $j ]; then v=1.8; else v=0; fi
    cmd="$cmd s/S$j)/$v)/;"
  done
  sed "$cmd" cdac_tb.spice > run.spice
  sim=$(ngspice -b run.spice 2>&1 | grep -i "^dv_mv" | awk '{print $3}')
  ideal=$(awk -v i=$i 'BEGIN{printf "%.3f", 1800*(2^i)/256}')
  printf "%-4s %-12s %-12s\n" $i $ideal $sim
done
