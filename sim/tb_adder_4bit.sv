`timescale 1ns/1ps
module tb_adder_4bit;
  reg [3:0] a,b; wire [3:0] s; wire cout; adder_4bit dut(a,b,s,cout);
  integer n,checked=0;
  reg [4:0] expected;
  initial begin
    $dumpfile("wave.vcd"); $dumpvars(0,tb_adder_4bit);

    for(n=0;n<256;n=n+1) begin
      {a,b}=n;
      expected=(n/16)+(n%16);
      #10;
      if ({cout,s} !== expected)
        $fatal(1,"FAIL adder_4bit vector=%0d expected=%h actual=%h",n,expected,{cout,s});
      checked=checked+1;
    end
    if(checked!=256) $fatal(1,"Incomplete test");
    $display("LAB1_PASS adder_4bit cases=%0d",checked);
    $finish;
  end
  initial begin #100000; $fatal(1,"Watchdog"); end
endmodule
