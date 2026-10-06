select top cell
edit
# --- tail: M1 source (inner column) ---
box -2.73um 6.785um -2.35um 7.25um
paint metal1
box -2.60um 4.50um -2.35um 7.25um
paint metal1
# --- tail: M2 source (mirror) ---
box 1.83um 6.785um 2.21um 7.25um
paint metal1
box 1.83um 4.50um 2.08um 7.25um
paint metal1
# --- tail bar ---
box -2.60um 4.50um 2.08um 4.80um
paint metal1
# --- tail: M0 drain (right column) ---
box -0.155um 0.785um 0.30um 2.785um
paint metal1
box 0.05um 2.785um 0.30um 4.80um
paint metal1
# --- GND: M0 source (left column) to rail ---
box -0.85um 0.785um -0.365um 2.785um
paint metal1
box -0.85um -1.25um -0.60um 2.785um
paint metal1
box -5.0um -1.5um 4.5um -1.0um
paint metal1
# --- GND: tie M0 guard ring (body) to source with li ---
box -1.15um 1.5um -0.395um 2.0um
paint locali
# --- check ---
box -6um -2um 5um 8um
drc check
drc why
writeall force
