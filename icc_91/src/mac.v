module mac (instruction, multiplier, multiplicand, stall, clk, reset_n, result, protect);
input signed [15:0] multiplier;
input signed [15:0] multiplicand; 
input  clk;
input  reset_n;
input  stall;
input  [2:0] instruction;
output [31:0] result;
output [7:0] protect;

//Add you design here
reg signed [31:0] mul_stage2;
reg signed [15:0] mul8_temp1,mul8_temp2;
reg [2:0] instr_stage2;
reg signed [31:0] result_stage2;
reg signed [7:0] protect_stage2;

reg signed [15:0] mulp_t,mulc_t;
reg [2:0] instr;
always @(posedge clk, negedge reset_n) begin
   if(~reset_n) begin
      mulp_t <= 16'd0;
      mulc_t <= 16'd0;
      instr <= 3'd0;
   end
   else if(!stall) begin
      mulp_t <= multiplier;
      mulc_t <= multiplicand;
      instr <= instruction;
   end
end

always @(posedge clk, negedge reset_n) begin
    if(~reset_n) begin
      mul_stage2 <= 32'd0;
      mul8_temp1 <= 20'd0;
      mul8_temp2 <= 20'd0;
    end
    else if((instr==3'b001 || instr==3'b010) && !stall ) mul_stage2 <= mulc_t * mulp_t;
    else if((instr==3'b101 || instr==3'b110) && !stall) begin
      mul8_temp1 <= $signed(mulc_t[7:0]) * $signed(mulp_t[7:0]);
      mul8_temp2 <= $signed(mulc_t[15:8]) * $signed(mulp_t[15:8]);
    end 

end

always @(posedge clk,negedge reset_n) //instr_stage2<=(~reset_n)?3'd0:instruction;
begin
  if(~reset_n)instr_stage2 <= 3'd0;
  else if(~stall) instr_stage2 <= instr;
end

assign result = result_stage2;
assign protect = protect_stage2;

always @(posedge clk,negedge reset_n) begin
   //mul_stage2 = multiplicand * multiplier;
   if(~reset_n) {protect_stage2,result_stage2}<=40'd0;
   //final <= 40'd0;
   else if (!stall) begin
     
        case(instr_stage2)
                3'b000:{protect_stage2,result_stage2}<=40'd0;
                3'b001:{protect_stage2,result_stage2}<=mul_stage2;
                3'b010:{protect_stage2,result_stage2}<=$signed({protect_stage2,result_stage2})+mul_stage2;
                3'b011:begin
                  if($signed({protect_stage2,result_stage2}) > $signed(40'h007fffffff)) {result_stage2}<=32'h7fffffff;
                  else if($signed({protect_stage2,result_stage2}) < $signed(40'hff80000000)) {result_stage2}<=32'h80000000;
                end
                
                //8-bit
                3'b100:{protect_stage2,result_stage2}<=40'd0;
                3'b101:begin
                {protect_stage2[3:0],result_stage2[15:0]} <= mul8_temp1;
                {protect_stage2[7:4],result_stage2[31:16]} <= mul8_temp2;
                end
                //MAC
                3'b110: begin
                {protect_stage2[3:0],result_stage2[15:0]} <= $signed({protect_stage2[3:0],result_stage2[15:0]})+ mul8_temp1;
                {protect_stage2[7:4],result_stage2[31:16]} <= $signed ({protect_stage2[7:4],result_stage2[31:16]}) + mul8_temp2;
              
                end
                3'b111: begin
                  if($signed({protect_stage2[3:0],result_stage2[15:0]}) > $signed(20'h07fff)) {result_stage2[15:0]}<=16'h7fff;
                  else if($signed({protect_stage2[3:0],result_stage2[15:0]}) < $signed(20'hf8000)) {result_stage2[15:0]}<=16'h8000;
                  
                  if($signed({protect_stage2[7:4],result_stage2[31:16]}) > $signed(20'h07fff)) {result_stage2[31:16]}<=16'h7fff;
                  else if($signed({protect_stage2[7:4],result_stage2[31:16]}) < $signed(20'hf8000)) {result_stage2[31:16]}<=16'h8000;
                end
                
        endcase

   end
end

endmodule
