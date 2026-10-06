# 8-bit SAR ADC in SkyWater 130nm (open-source flow)

Full ASIC design flow for an 8-bit SAR ADC using xschem, ngspice, Magic, netgen and OpenLane on the sky130 PDK.

## Progress
- [x] CMOS inverter: schematic, simulation, layout, DRC clean, LVS clean
- [x] Comparator: design, corners, Monte Carlo offset, layout, DRC and LVS clean
- [ ] Capacitor DAC
- [ ] SAR logic (Verilog)
- [ ] Top-level integration

## Inverter results (tt corner, 1.8 V)
| Load | tpHL | tpLH | tpd |
|---|---|---|---|
| none | 20.0 ps | 24.7 ps | 22.4 ps |
| 10 fF | 51.8 ps | 62.7 ps | 57.3 ps |
| 50 fF | 136.6 ps | 180.8 ps | 158.7 ps |

## Inverter post-layout (extracted with Magic, tt, 1.8 V)
| Load | Schematic tpd | Post-layout tpd |
|---|---|---|
| none | 22.4 ps | 26.8 ps |
| 10 fF | 57.3 ps | 55.9 ps |
| 50 fF | 158.7 ps | 144.3 ps |

## Comparator (StrongARM latch, tt, 1.8 V)
| Spec | Result |
|---|---|
| Resolution | 1 mV, all 15 corners (-40 to 125 C) |
| Offset sigma (30-run Monte Carlo) | 2.9 mV (11.8 mV before resizing input pair) |
| Delay | 0.25 - 0.53 ns |
| Power @ 100 MHz | 15.5 uW |
| Layout | Symmetric, DRC clean, LVS clean |
