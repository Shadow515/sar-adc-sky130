#!/bin/bash
# 64-point coherent sine test: 7 cycles, 0.9 V +/- 0.85 V, one full conversion per sample
export SPICE_USERINIT_DIR=/foss/pdks/sky130A/libs.tech/ngspice
N=64; M=7
one() {
  k=$1
  v=$(awk -v k=$k -v N=$N -v M=$M 'BEGIN{printf "%.6f", 0.9 + 0.85*sin(2*3.14159265358979*M*k/N)}')
  sed -e "s/VINVAL/$v/" -e "s/tran 0.1n 2.1u/tran 0.1n 1.1u/" adc_tb_matched.spice > enob_$k.spice
  c=$(ngspice -b enob_$k.spice 2>&1 | grep -E "^code1 " | awk '{printf "%d", $3}')
  rm -f enob_$k.spice
  echo "$k $v $c"
}
export -f one; export N M
rm -f enob_codes.txt
seq 0 $((N-1)) | xargs -P4 -I{} bash -c 'one {}' >> enob_codes.txt
echo "DONE $(date)"
