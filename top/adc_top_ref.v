module adc_top (VDD, GND, vin, vref, vcm, clk, rst_n,
                dout0, dout1, dout2, dout3, dout4, dout5, dout6, dout7, eoc);
  inout VDD, GND, vin, vref, vcm;
  input clk, rst_n;
  output dout0, dout1, dout2, dout3, dout4, dout5, dout6, dout7, eoc;
  wire top, refn, cmp, cmp_clk, st, stb, s, sb, outp, pd, nd;
  wire b0, b1, b2, b3, b4, b5, b6, b7, bd;
  wire [7:0] p;
  wire [7:0] n;
  cdac_full Xcdac (.top(top), .b0(b0), .b1(b1), .b2(b2), .b3(b3), .b4(b4), .b5(b5), .b6(b6), .b7(b7), .bd(bd),
                   .vin(vin), .vref(vref), .s(s), .sb(sb), .VDD(VDD), .GND(GND),
                   .p0(p[0]), .p1(p[1]), .p2(p[2]), .p3(p[3]), .p4(p[4]), .p5(p[5]), .p6(p[6]), .p7(p[7]), .pd(pd),
                   .n0(n[0]), .n1(n[1]), .n2(n[2]), .n3(n[3]), .n4(n[4]), .n5(n[5]), .n6(n[6]), .n7(n[7]), .nd(nd));
  afe Xafe (.top(top), .refn(refn), .vcm(vcm), .st(st), .stb(stb), .VDD(VDD), .GND(GND));
  comp Xcomp (.clk(cmp_clk), .inp(refn), .inn(top), .outp(outp), .outn(cmp), .VDD(VDD), .GND(GND));
  sar_logic Xsar (.VPWR(VDD), .VGND(GND), .clk(clk), .rst_n(rst_n), .cmp(cmp), .st(st), .s(s), .stb(stb), .sb(sb),
                  .cmp_clk(cmp_clk), .p(p), .n(n), .pd(pd), .nd(nd),
                  .dout({dout7, dout6, dout5, dout4, dout3, dout2, dout1, dout0}), .eoc(eoc));
endmodule
