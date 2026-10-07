#!/bin/bash
export SPICE_USERINIT_DIR=/foss/pdks/sky130A/libs.tech/ngspice
for tb in adc_tb adc_tb_matched; do
  echo "=== $tb ==="
  for v in 0.505 1.2345; do
    sed "s/VINVAL/$v/" $tb.spice > run.spice
    exp=$(awk -v v=$v 'BEGIN{printf "%d", v*256/1.8}')
    res=$(ngspice -b run.spice 2>&1 | grep -E "^code[12] " | awk '{printf "%d ", $3}')
    echo "  vin = $v V   expected = $exp   codes: $res"
  done
done
