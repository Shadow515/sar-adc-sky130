// Wrapper: single-bit ports only, in a fixed order, for the ngspice bridge
module sar_top (
  input  clk, input rst_n, input cmp,
  output st, output s, output stb, output sb, output cmp_clk,
  output p7, output p6, output p5, output p4, output p3, output p2, output p1, output p0,
  output n7, output n6, output n5, output n4, output n3, output n2, output n1, output n0,
  output pd, output nd,
  output d7, output d6, output d5, output d4, output d3, output d2, output d1, output d0,
  output eoc
);
  wire [7:0] p, n, dout;
  sar_logic u (.clk(clk), .rst_n(rst_n), .cmp(cmp), .st(st), .s(s), .stb(stb), .sb(sb),
               .cmp_clk(cmp_clk), .p(p), .n(n), .pd(pd), .nd(nd), .dout(dout), .eoc(eoc));
  assign {p7,p6,p5,p4,p3,p2,p1,p0} = p;
  assign {n7,n6,n5,n4,n3,n2,n1,n0} = n;
  assign {d7,d6,d5,d4,d3,d2,d1,d0} = dout;
endmodule
