import numpy as np, matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
M = 7
d = np.loadtxt("enob_codes.txt"); d = d[d[:,0].argsort()]
k, vin, code = d[:,0], d[:,1], d[:,2]
N = len(k)
ideal = np.clip(np.floor(vin*256/1.8), 0, 255)
def enob(x):
    x = x - x.mean()
    P = np.abs(np.fft.rfft(x))**2
    sig = P[M]; noise = P[1:].sum() - sig
    sinad = 10*np.log10(sig/noise)
    return sinad, (sinad - 1.76)/6.02, P
s_adc, e_adc, P_adc = enob(code)
s_id,  e_id,  P_id  = enob(ideal)
print(f"Samples: {N}   Missing samples: {64-N}")
print(f"Your ADC   : SINAD {s_adc:5.2f} dB   ENOB {e_adc:4.2f} bits")
print(f"Ideal 8-bit: SINAD {s_id:5.2f} dB   ENOB {e_id:4.2f} bits")
print(f"Max code error vs ideal: {int(np.max(np.abs(code-ideal)))} LSB")
fig, ax = plt.subplots(2, 1, figsize=(10, 7))
t = np.linspace(0, N, 1000)
ax[0].plot(t, (0.9 + 0.85*np.sin(2*np.pi*M*t/N))*256/1.8, lw=1, color="gray", label="input (in LSB)")
ax[0].plot(k, code, "o", ms=4, label="ADC output code")
ax[0].set_xlabel("sample"); ax[0].set_ylabel("code"); ax[0].legend(loc="upper right")
ax[0].set_title(f"8-bit SAR ADC sine test (sky130, transistor-level + Verilog SAR): ENOB = {e_adc:.2f} bits")
db = 10*np.log10(P_adc/P_adc[M] + 1e-20)
ax[1].stem(np.arange(len(db)), db, basefmt=" ")
ax[1].set_xlabel("frequency bin"); ax[1].set_ylabel("power (dBc)"); ax[1].set_ylim(-80, 5)
plt.tight_layout(); plt.savefig("../images/adc_enob.png", dpi=130)
print("saved images/adc_enob.png")
