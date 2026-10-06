#!/bin/bash
N=${1:-30}
rm -f mc_results.txt
for i in $(seq 1 $N); do
  d=mc_run; mkdir -p $d
  cp comp_mc.spice comp.spice $d/
  printf "set ngbehavior=hsa\nset ng_nomodcheck\nset rndseed=$i\n" > $d/.spiceinit
  v=$(cd $d && SPICE_USERINIT_DIR=$PWD ngspice -b comp_mc.spice 2>&1 | grep -i "^off_mv" | awk '{print $3}')
  echo "run $i: offset = $v mV"
  echo $v >> mc_results.txt
done
awk '{s+=$1; ss+=$1*$1; n++} END {m=s/n; printf "\nRuns: %d   Mean offset: %.2f mV   Sigma: %.2f mV\n", n, m, sqrt(ss/n-m*m)}' mc_results.txt
