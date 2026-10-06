select top cell
edit
# ===== outn vertical: M3 drain + M5 drain =====
box -2.705um 19.785um -2.25um 20.785um
paint metal1
box -2.705um 25.83um -2.25um 27.83um
paint metal1
box -2.50um 19.785um -2.25um 27.83um
paint metal1
# ===== outp vertical (mirror): M4 drain + M6 drain =====
box 1.73um 19.785um 2.185um 20.785um
paint metal1
box 1.73um 25.83um 2.185um 27.83um
paint metal1
box 1.73um 19.785um 1.98um 27.83um
paint metal1
# ===== gate links: M3+M5 gates (left), M4+M6 gates (right) =====
box -2.955um 20.945um -2.665um 25.625um
paint metal1
box 2.145um 20.945um 2.435um 25.625um
paint metal1
# ===== bar A (metal2): outn -> right gates =====
box -2.525um 22.5um 2.45um 22.8um
paint metal2
box -2.51um 22.52um -2.25um 22.78um
paint via1
box 2.16um 22.52um 2.42um 22.78um
paint via1
# ===== bar B (metal2): outp -> left gates =====
box -2.965um 23.5um 2.0um 23.8um
paint metal2
box -2.94um 23.52um -2.68um 23.78um
paint via1
box 1.73um 23.52um 1.99um 23.78um
paint via1
# ===== M7 drain -> outn (bar C) =====
box -6.705um 25.83um -6.25um 26.83um
paint metal1
box -6.50um 24.25um -6.25um 26.83um
paint metal1
box -6.525um 24.25um -2.225um 24.55um
paint metal2
box -6.51um 24.27um -6.25um 24.53um
paint via1
box -2.51um 24.27um -2.25um 24.53um
paint via1
# ===== M8 drain -> outp (bar D, mirror) =====
box 5.73um 25.83um 6.185um 26.83um
paint metal1
box 5.73um 24.25um 5.98um 26.83um
paint metal1
box 1.705um 24.25um 6.005um 24.55um
paint metal2
box 5.73um 24.27um 5.99um 24.53um
paint via1
box 1.73um 24.27um 1.99um 24.53um
paint via1
# ===== check =====
box -8um 19um 8um 28.5um
drc check
drc why
writeall force
