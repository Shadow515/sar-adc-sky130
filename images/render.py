import pya, os, glob
lyp = glob.glob("/foss/pdks/sky130A/libs.tech/klayout/**/*.lyp", recursive=True)
for name in ["inverter", "comp", "cdac_array"]:
    gds = "/foss/designs/images/%s.gds" % name
    if not os.path.exists(gds):
        print("missing", gds); continue
    lv = pya.LayoutView()
    lv.load_layout(gds, 0)
    if lyp: lv.load_layer_props(lyp[0])
    lv.max_hier()
    lv.zoom_fit()
    lv.set_config("background-color", "#ffffff")
    lv.save_image("/foss/designs/images/%s.png" % name, 1600, 1200)
    print("saved", name + ".png")
