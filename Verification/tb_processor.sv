`timescale 1ns/1ps

module tb_processor;

reg clk;
reg rst;

processor_top DUT(
    .clk(clk),
    .rst(rst)
);

always #5 clk = ~clk;

initial
begin
    clk = 0;
    rst = 1;

    #20;
    rst = 0;

    #500;

    $display("x1  = %0d", DUT.RF.regs[1]);
    $display("x2  = %0d", DUT.RF.regs[2]);
    $display("x3  = %0d", DUT.RF.regs[3]);
    $display("x4  = %0d", DUT.RF.regs[4]);
    $display("x5  = %0d", DUT.RF.regs[5]);
    $display("x6  = %0d", DUT.RF.regs[6]);
    $display("x7  = %0d", DUT.RF.regs[7]);
    $display("x8  = %0d", DUT.RF.regs[8]);
    $display("x9  = %0d", DUT.RF.regs[9]);
    $display("x10 = %0d", DUT.RF.regs[10]);

    $finish;
end

endmodule