# 8-bit SAR ADC in SkyWater 130nm (open-source flow)

Full ASIC design flow for an 8-bit SAR ADC using xschem, ngspice, Magic, netgen and OpenLane on the sky130 PDK.

## Progress
- [x] CMOS inverter: schematic, simulation, layout, DRC clean, LVS clean
- [ ] Comparator
- [ ] Capacitor DAC
- [ ] SAR logic (Verilog)
- [ ] Top-level integration

## Inverter results (tt corner, 1.8 V)
| Load | tpHL | tpLH | tpd |
|---|---|---|---|
| none | 20.0 ps | 24.7 ps | 22.4 ps |
| 10 fF | 51.8 ps | 62.7 ps | 57.3 ps |
| 50 fF | 136.6 ps | 180.8 ps | 158.7 ps |
