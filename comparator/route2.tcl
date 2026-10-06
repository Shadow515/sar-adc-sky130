select top cell
edit
# ===== X (left side) =====
# M1 drain (outer column) up
box -4.15um 14.0um -3.79um 14.785um
paint metal1
box -4.15um 14.0um -3.90um 17.30um
paint metal1
# X bus
box -10.50um 17.0um -3.10um 17.30um
paint metal1
# M3 source (left column) down
box -3.35um 19.785um -2.915um 20.785um
paint metal1
box -3.35um 17.0um -3.10um 20.785um
paint metal1
# M9 drain (right column) down
box -10.705um 25.83um -10.25um 26.83um
paint metal1
box -10.50um 17.0um -10.25um 26.83um
paint metal1
# ===== Y (right side, mirror) =====
box 3.27um 14.0um 3.63um 14.785um
paint metal1
box 3.38um 14.0um 3.63um 17.30um
paint metal1
box 2.58um 17.0um 9.98um 17.30um
paint metal1
box 2.395um 19.785um 2.83um 20.785um
paint metal1
box 2.58um 17.0um 2.83um 20.785um
paint metal1
box 9.73um 25.83um 10.185um 26.83um
paint metal1
box 9.73um 17.0um 9.98um 26.83um
paint metal1
# ===== check =====
box -11um 13um 11um 28um
drc check
drc why
writeall force
