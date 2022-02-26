module one_sec
#(  parameter VALUE = 20000000)
(
input            clk,
input            rstn,
input            enable,
output reg       out
);

reg[31:0] count;

always@(posedge clk)
begin
    if(rstn) begin 
        count <= 0;
    end else begin
      if(enable && !out)
            count <= count + 1;
        else
            count <= 0;
    end
end

always@(*)
    if(rstn) out <= 0;
    else out <= count == VALUE;

endmodule