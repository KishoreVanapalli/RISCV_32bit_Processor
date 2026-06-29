module branch_unit(
    input [31:0] pc,
    input branch,
    input zero,
    input [31:0] imm,
    output [31:0] pc_next
);

assign pc_next =
    (branch && zero) ?
    (pc + imm) :
    (pc + 4);

endmodule