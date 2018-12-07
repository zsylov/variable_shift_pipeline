module variable_shift_pipeline
  (
    input CLK, input RST,
    input[7:0] a,
    input[2:0] shift_width,
    output[7:0] shifted_a
  );

//Definition for Variables in the module
wire[2:0] width_0;
reg[1:0]  width_1;
reg       width_2;
//Shift_width chain
wire[7:0] a0;
reg[7:0]  a1, a2, a3;
//Operates chain

//Load other module(s)
               
//Logical
assign a0 = a;
assign width_0 = shift_width;
assign shifted_a = a3;

always @(posedge CLK or negedge RST)
//Shift_width chain
begin
   if (!RST)
   //Reset
   begin
       width_1 <= 2'b00;
       width_2 <= 1'b0;
   end
   else
   begin
       width_1 <= width_0[2:1];
       width_2 <= width_1[1];
   end
end

always @(posedge CLK or negedge RST)
//Operation
begin
   if (!RST)
   begin
       a1 <= 8'h0;
   end
   else
   begin
       if (width_0[0])
       begin
           a1 <= a0 << 1;
       end
       else
       begin
           a1 <= a0;
       end
   end
end

always @(posedge CLK or negedge RST)
//Operation
begin
   if (!RST)
   begin
       a2 <= 8'h0;
   end
   else
   begin
       if (width_1[0])
       begin
           a2 <= a1 << 2;
       end
       else
       begin
           a2 <= a1;
       end
   end
end

always @(posedge CLK or negedge RST)
//Operation
begin
   if (!RST)
   begin
       a3 <= 8'h0;
   end
   else
   begin
       if (width_2)
       begin
           a3 <= a2 << 4;
       end
       else
       begin
           a3 <= a2;
       end
   end
end

endmodule

