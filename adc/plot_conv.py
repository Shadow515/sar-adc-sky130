import numpy as np, matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
d = np.loadtxt("conv.txt")
t = d[:,0]*1e9; top=d[:,1]; refn=d[:,3]; clk=d[:,5]; outp=d[:,7]; s=d[:,9]
m = (t > 100) & (t < 1060)
fig, ax = plt.subplots(3, 1, figsize=(11, 7), sharex=True, gridspec_kw={"height_ratios":[3,1,1]})
ax[0].plot(t[m], top[m], lw=1.5, label="CDAC top plate (inp)")
ax[0].plot(t[m], refn[m], "--", lw=1, label="Reference (inn, 0.9 V)")
ax[0].set_ylabel("Voltage (V)"); ax[0].legend(loc="upper right")
ax[0].set_title("8-bit SAR ADC conversion (vin = 0.505 V, result 72): sky130, transistor-level + Verilog SAR logic")
ax[1].plot(t[m], clk[m], lw=1, color="tab:green"); ax[1].set_ylabel("Comp clk")
ax[2].plot(t[m], outp[m], lw=1, color="tab:red"); ax[2].plot(t[m], s[m], lw=1, color="tab:gray", alpha=0.6)
ax[2].set_ylabel("Comp out\n/ sample"); ax[2].set_xlabel("Time (ns)")
plt.tight_layout(); plt.savefig("../images/adc_conversion.png", dpi=130)
print("saved images/adc_conversion.png")
