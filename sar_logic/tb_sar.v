`timescale 1ns/1ps
module tb;
  reg clk = 0, rst_n = 0;
  always #20 clk = ~clk;                     // 25 MHz
  wire st, stb, s, sb, cmp_clk, eoc, pd, nd;
  wire [7:0] p, n, dout;
  reg  cmp_dec = 0;
  wire cmp = cmp_clk ? cmp_dec : 1'b1;       // StrongARM: output high during reset
  real vin = 0.0, vs = 0.0;
  integer errors = 0, total = 0, D, expct;

  sar_logic dut(.clk(clk), .rst_n(rst_n), .cmp(cmp), .st(st), .s(s), .stb(stb), .sb(sb),
                .cmp_clk(cmp_clk), .p(p), .n(n), .pd(pd), .nd(nd), .dout(dout), .eoc(eoc));

  always @(negedge s) vs = vin;              // snapshot when sampling ends
  always @(posedge cmp_clk) begin            // CDAC + comparator model
    D = {24'd0, ~p};
    cmp_dec = (1.8 * D / 256.0) > vs;
  end
  always @(posedge clk) if (eoc) begin
    expct = $rtoi(vs * 256.0 / 1.8); if (expct > 255) expct = 255;
    total = total + 1;
    if (total <= 5) $display("vin = %0.4f V   code = %0d   expected = %0d", vs, dout, expct);
    if (dout !== expct) begin
      errors = errors + 1;
      if (errors <= 5) $display("ERROR: vin = %0.4f V  code = %0d  expected = %0d", vs, dout, expct);
    end
    vin = ($urandom % 1000000) / 1000000.0 * 1.8;
  end
  initial begin
    vin = 0.5;
    #100 rst_n = 1;
    wait (total == 2000);
    $display("Conversions: %0d   Errors: %0d", total, errors);
    $display("Cycles per conversion: 23  ->  %0.2f MS/s at 25 MHz", 25.0/23.0);
    $finish;
  end
endmodule
