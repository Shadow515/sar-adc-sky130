#!/bin/bash
N=${1:-30}
rm -f dnl_results.txt
for i in $(seq 1 $N); do
  d=mc_run; mkdir -p $d
  cp cdac_mc_tb.spice cdac_units.spice $d/
  printf "set ngbehavior=hsa\nset ng_nomodcheck\nset rndseed=$i\n" > $d/.spiceinit
  vals=$(cd $d && SPICE_USERINIT_DIR=$PWD ngspice -b cdac_mc_tb.spice 2>&1 | grep -E "^v[0-8] " | awk '{print $3}' | tr '\n' ' ')
  echo $vals | awk -v run=$i '{
    for(k=0;k<8;k++) w[k]=$(k+2)-$(k+1);
    lsb=($9-$1)/255; worst=0; sum=0;
    for(k=1;k<8;k++){ sum+=w[k-1]; dnl=(w[k]-sum)/lsb-1; if(dnl<0)a=-dnl; else a=dnl; if(a>worst){worst=a; wk=k} }
    printf "run %d: worst DNL = %.3f LSB (at bit %d transition)\n", run, worst, wk;
    print worst >> "dnl_results.txt"
  }'
done
awk '{s+=$1; if($1>m)m=$1; n++} END {printf "\nRuns: %d   Average worst DNL: %.3f LSB   Max worst DNL: %.3f LSB\n", n, s/n, m}' dnl_results.txt
