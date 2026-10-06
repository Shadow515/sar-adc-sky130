select top cell
edit
# ===== inp (M1 bottom gate pad, out to the left) =====
box -3.40um 5.5um -3.10um 6.625um
paint metal1
box -6.0um 5.5um -3.10um 5.8um
paint metal1
# ===== inn (M2 bottom gate pad, out to the right) =====
box 2.58um 5.5um 2.88um 6.625um
paint metal1
box 2.58um 5.5um 5.48um 5.8um
paint metal1
# ===== body ties (li): M1/M2 rings down to M0 ring =====
box -2.44um 5.0um -2.24um 6.085um
paint locali
box -2.44um 5.0um -0.75um 5.2um
paint locali
box -0.95um 3.5um -0.75um 5.2um
paint locali
box 1.72um 5.0um 1.92um 6.085um
paint locali
box 0.23um 5.0um 1.92um 5.2um
paint locali
box 0.23um 3.5um 0.43um 5.2um
paint locali
# ===== body ties (li): M3/M4 rings down to M1/M2 rings =====
box -2.40um 15.485um -2.20um 19.0um
paint locali
box 1.68um 15.485um 1.88um 19.0um
paint locali
# ===== make leftover small gate pads bigger (met1.6) =====
box -0.405um 2.945um -0.115um 3.30um
paint metal1
box -2.955um 19.27um -2.665um 19.625um
paint metal1
box 2.145um 19.27um 2.435um 19.625um
paint metal1
box -2.955um 28.035um -2.665um 28.40um
paint metal1
box 2.145um 28.035um 2.435um 28.40um
paint metal1
box -10.955um 25.27um -10.665um 25.625um
paint metal1
box -6.955um 25.27um -6.665um 25.625um
paint metal1
box 6.145um 25.27um 6.435um 25.625um
paint metal1
box 10.145um 25.27um 10.435um 25.625um
paint metal1
# ===== check whole layout =====
select top cell
box -13um -3um 14um 31um
drc check
drc why
writeall force
