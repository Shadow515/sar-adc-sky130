#!/bin/bash
export SPICE_USERINIT_DIR=/foss/pdks/sky130A/libs.tech/ngspice
one() {
  k=$1
  v=$(awk -v k=$k 'BEGIN{printf "%.6f", (k+0.5)*1.8/256}')
  sed -e "s/VINVAL/$v/" -e "s/tran 0.1n 2.1u/tran 0.1n 1.1u/" adc_tb_matched.spice > run_$k.spice
  c=$(ngspice -b run_$k.spice 2>&1 | grep -E "^code1 " | awk '{printf "%d", $3}')
  rm -f run_$k.spice
  echo "$k $v $c $((c-k))"
}
export -f one
echo "expected  vin(V)    code  error(LSB)"
seq 8 16 248 | xargs -P4 -I{} bash -c 'one {}' | sort -n | awk '{printf "%-9s %-9s %-5s %+d\n", $1, $2, $3, $4; s+=$4; n++} END {printf "\nAverage error: %+.2f LSB over %d points\n", s/n, n}'
