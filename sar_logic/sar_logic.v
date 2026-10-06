// 8-bit SAR control logic for the sky130 SAR ADC
module sar_logic (
  input  wire       clk,
  input  wire       rst_n,
  input  wire       cmp,      // comparator outp: 1 = DAC voltage above input
  output reg        st,       // top-plate sampling switch
  output reg        s,        // bottom-plate sampling switch
  output wire       stb,
  output wire       sb,
  output reg        cmp_clk,  // comparator clock (high = compare)
  output wire [7:0] p,        // bit -> Vref when 0
  output wire [7:0] n,        // bit -> GND  when 1
  output wire       pd,       // dummy
  output wire       nd,
  output reg  [7:0] dout,     // conversion result
  output reg        eoc       // end of conversion pulse
);
  localparam SAMPLE=3'd0, TOPOFF=3'd1, BOTOFF=3'd2, SET=3'd3, CMP=3'd4, DONE=3'd5;
  reg [2:0] state;
  reg [1:0] scnt;
  reg [2:0] k;
  reg [7:0] d;
  reg       conv;

  assign sb  = ~s;
  assign stb = ~st;
  assign p   = conv ? ~d : 8'hFF;
  assign n   = conv ? ~d : 8'h00;
  assign pd  = 1'b1;
  assign nd  = conv;

  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      state <= SAMPLE; scnt <= 0; k <= 3'd7; d <= 8'd0; conv <= 1'b0;
      st <= 1'b1; s <= 1'b1; cmp_clk <= 1'b0; eoc <= 1'b0; dout <= 8'd0;
    end else begin
      eoc <= 1'b0;
      case (state)
        SAMPLE: begin
          st <= 1'b1; s <= 1'b1; conv <= 1'b0; d <= 8'd0; cmp_clk <= 1'b0;
          if (scnt == 2'd3) begin scnt <= 0; state <= TOPOFF; end
          else scnt <= scnt + 1'b1;
        end
        TOPOFF: begin st <= 1'b0; state <= BOTOFF; end
        BOTOFF: begin s <= 1'b0; conv <= 1'b1; d <= 8'b1000_0000; k <= 3'd7; state <= SET; end
        SET:    begin cmp_clk <= 1'b1; state <= CMP; end
        CMP: begin
          cmp_clk <= 1'b0;
          d[k] <= ~cmp;                      // too high -> clear this bit
          if (k == 3'd0) state <= DONE;
          else begin d[k-1] <= 1'b1; k <= k - 1'b1; state <= SET; end
        end
        DONE: begin dout <= d; eoc <= 1'b1; state <= SAMPLE; scnt <= 0; end
        default: state <= SAMPLE;
      endcase
    end
  end
endmodule
