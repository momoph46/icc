module mac (instruction, multiplier, multiplicand, stall, clk, reset_n, result, protect);
input signed [15:0] multiplier;
input signed [15:0] multiplicand; 
input  clk;
input  reset_n;
input  stall;
input  [2:0] instruction;
output reg [31:0] result;
output reg [7:0] protect;

//Add you design here
//signed multiplier;
//signed multiplicand;
//signed result ;
reg signed [31:0] mul_temp;
reg signed [15:0] mul8_temp1,mul8_temp2;
reg [2:0] instr_temp;
reg signed [31:0] result_temp;
reg signed [7:0] protect_temp;

always @(posedge clk, negedge reset_n) begin
    if(~reset_n) begin
      mul_temp <= 32'd0;
      mul8_temp1 <= 20'd0;
      mul8_temp2 <= 20'd0;
    end
    else if((instruction==3'b001 || instruction==3'b010) && !stall ) mul_temp <= multiplicand * multiplier;
    else if((instruction==3'b101 || instruction==3'b110) && !stall) begin
      mul8_temp1 <= $signed(multiplicand[7:0]) * $signed(multiplier[7:0]);
      mul8_temp2 <= $signed(multiplicand[15:8]) * $signed(multiplier[15:8]);
    end 
end

always @(posedge clk,negedge reset_n) //instr_temp<=(~reset_n)?3'd0:instruction;
begin
  if(~reset_n)instr_temp <= 3'd0;
  else if(~stall) instr_temp <= instruction;
end
always @(posedge clk,negedge reset_n) begin
    if(~reset_n){protect,result}<=40'd0;
    else if (!stall) begin
        result <= result_temp;
        protect <= protect_temp;
        //result <= final[31:0];
        //protect <= final[39:32];
    end
end

always @(posedge clk,negedge reset_n) begin
   //mul_temp = multiplicand * multiplier;
   if(~reset_n) {protect_temp,result_temp}<=40'd0;
   //final <= 40'd0;
   else if (!stall) begin
     
        case(instr_temp)
                3'b000:{protect_temp,result_temp}<=40'd0;
                
                3'b001:{protect_temp,result_temp}<=mul_temp;
                
                3'b010:{protect_temp,result_temp}<=$signed({protect_temp,result_temp})+mul_temp;
                3'b011:begin
                  
                  if($signed({protect_temp,result_temp}) > $signed(40'h007fffffff)) {result_temp}<=32'h7fffffff;
                  
                  else if($signed({protect_temp,result_temp}) < $signed(40'hff80000000)) {result_temp}<=32'h80000000;
                  
                  else {result_temp}<= result_temp;

                end
                
                //8-bit
                3'b100:{protect_temp,result_temp}<=40'd0;
                3'b101:begin
                
                {protect_temp[3:0],result_temp[15:0]} <= $signed(mul8_temp1);
                
                {protect_temp[7:4],result_temp[31:16]} <= $signed(mul8_temp2);
                end
                //MAC
                3'b110: begin
                
                {protect_temp[3:0],result_temp[15:0]} <= $signed({protect_temp[3:0],result_temp[15:0]})+ mul8_temp1;
                
                {protect_temp[7:4],result_temp[31:16]} <= $signed ({protect_temp[7:4],result_temp[31:16]}) + mul8_temp2;
              
                end
                3'b111: begin
                  if($signed({protect_temp[3:0],result_temp[15:0]}) > $signed(20'h07fff)) {result_temp[15:0]}<=16'h7fff;
                  
                  else if($signed({protect_temp[3:0],result_temp[15:0]}) < $signed(20'hf8000)) {result_temp[15:0]}<=16'h8000;
                  
                  
                  if($signed({protect_temp[7:4],result_temp[31:16]}) > $signed(20'h07fff)) {result_temp[31:16]}<=16'h7fff;
                  
                  else if($signed({protect_temp[7:4],result_temp[31:16]}) < $signed(20'hf8000)) {result_temp[31:16]}<=16'h8000;
                  
                end
                
        endcase

   end
end

endmodule


