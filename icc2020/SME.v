module SME(clk,reset,chardata,isstring,ispattern,valid,match,match_index);
input clk;
input reset;
input [7:0] chardata;
input isstring;
input ispattern;
output match;
output [4:0] match_index;
output valid;
reg match;
reg [4:0] match_index,mat_idx2;
//reg valid;

reg [3:0] state, next_state;
reg [7:0] str_temp [33:0]; //string length 32-bit
reg [7:0] pat_temp [7:0];  //pattern length 8-bit
parameter idle = 4'd0;
parameter get_str = 4'd1;
parameter get_pat = 4'd2;
parameter waiting = 4'd3;
parameter process = 4'd4;
parameter finding = 4'd5;
parameter finish = 4'd15;
reg [5:0] str_len, counter;
reg [3:0] pat_len,pat_idx,m_reg,m_reg2;

reg head;
reg [5:0] i;
wire find_match, find_star;
reg star_mode;
wire [7:0] str_cell,pat_cell;

always @(posedge clk, posedge reset) begin
    if(reset) state <= idle;
    else state <= next_state; 
end
always @(*) begin
    case(state)
        idle: begin 
             if(isstring) next_state = get_str; 
             else if (ispattern) next_state = get_pat;
             else next_state = idle ;
        end
        get_str: begin 
            if(ispattern) next_state = get_pat;
            else next_state = get_str;
        end
        get_pat: begin 
            if(!ispattern) next_state = waiting;
            else next_state = get_pat;
        end
        waiting: begin
           next_state = finding;
        end
        finding: begin
          if (find_match)next_state = process;
          else if (counter == (str_len+6'd1)) next_state = finish;
          else next_state = finding;
        end
        process: begin
            if(pat_idx==pat_len | counter == (str_len+6'd1)) next_state=finish;
            else if (find_match) next_state = process;
            else next_state = finding; 
        end
        finish: begin
             if(isstring) next_state = get_str; 
             else if (ispattern) next_state = get_pat;
             else next_state = idle ;
        end
        default:next_state = idle;
    endcase
end
// ^ 5E ,$ 24,. 2E, * 2A 

assign str_cell = str_temp[counter];
assign pat_cell = pat_temp[pat_idx];

assign find_match = ((pat_cell==str_cell) | (pat_cell==8'h2E))? 1 : 0;
assign find_star = (pat_cell == 8'h2A);
//matching in process
always @(posedge clk, posedge reset) begin
    if (reset) m_reg <= 3'd0;
    else if (find_match & (next_state==process) ) m_reg <= m_reg + 3'd1;
    else if (find_star) m_reg <= m_reg + 3'd1;
    else if (star_mode) m_reg <= m_reg2;
    else m_reg <= 3'd0;
end
always @(posedge clk, posedge reset) begin
    if (reset) m_reg2 <= 3'd0;
    else if (find_star) m_reg2 <= m_reg + 3'd1;
    else if (state == finish) m_reg2 <= 3'd0; 
end
//star_mode
always @(posedge clk, posedge reset) begin
    if (reset) star_mode <= 0;
    else if (find_star) star_mode <= 1;
    else if (next_state == finish) star_mode <= 0;
end
//match_index
always @(posedge clk, posedge reset) begin
    if (reset) match_index <= 5'd0;
    else if (state == finding & find_match & counter != 6'd0 & !star_mode) begin
        match_index <= (head)? counter : counter - 5'd1;
    end
    else if (state == get_pat) match_index <= 5'd0;
end
//mat_idx2
always @(posedge clk, posedge reset) begin
    if (reset) mat_idx2 <= 5'd0;
    else if (star_mode & state == finding & find_match)mat_idx2 <= counter;
    else if (state == get_pat) mat_idx2 <= 5'd0;
end
//counter
always @(posedge clk, posedge reset) begin
    if(reset) counter <= 6'd0;
    else if (state == finish | state == waiting) counter <= 6'd0;
    else if (find_star) counter <= counter;//m_reg + match_index + 6'd1;
    else if (state == process & next_state == finding) begin
        if (star_mode) counter <= mat_idx2+6'd2;
        else counter <= match_index+6'd2;
    end
    else if (next_state == finding | next_state == process ) counter <= counter + 6'd1;
  
end
//pat_idx
always @(posedge clk, posedge reset) begin
    if (reset) pat_idx <= 3'd0;
    else if (next_state == process) pat_idx <= pat_idx + 3'd1;
    else if (find_star)pat_idx <= pat_idx + 3'd1;
    else if (star_mode) pat_idx <= m_reg2 ; 
    else if (/*next_state == finding |*/ next_state == finish | !find_match) pat_idx <= 3'd0;
end
//get pattern
always @(posedge clk, posedge reset) begin
    if(reset)begin
      //pat_temp[0] <= 8'd32;
      for (i=3'd0;i<=3'd7;i=i+1)
            pat_temp[i]<=8'd0;
    end
    else if (next_state == get_pat)begin // ^ $
       if(chardata==8'h5E | chardata==8'h24) pat_temp[pat_len] <= 8'd32; 
       else pat_temp[pat_len] <= chardata;
    end
end
//head ^
always @(posedge clk, posedge reset) begin
    if (reset) head <= 0;
    else if (chardata == 8'h5E) head <= 1;
    else if (state == finish) head <= 0;
end
//get string
always @(posedge clk, posedge reset) begin
    if(reset) begin
        //str_temp[0] <= 8'd32;
        for (i=6'd0;i<=6'd33;i = i+1)
            str_temp[i]<=8'd0;  
    end
    else if (state == finish & next_state == get_str) str_temp[1] <= chardata;
    else if (next_state == get_str) begin 
        str_temp[str_len] <= chardata;
    end
    else if (state == waiting)begin
        str_temp[str_len] <= 8'd32;
        str_temp[0] <= 8'd32;
    end
end
//str_len
always @(posedge clk, posedge reset) begin
    if(reset) str_len <= 5'd1;
    else if (state == finish & next_state == get_str)str_len <= 5'd2;
    else if (next_state == get_str) str_len <= str_len + 5'd1;
end
//pat_len
always @(posedge clk, posedge reset) begin
    if(reset) pat_len <= 4'd0;
    else if (next_state == get_pat) pat_len <= pat_len + 4'd1; 
    else if (next_state == finish)  pat_len <= 4'b0;
end

always @(posedge clk, posedge reset) begin
    if (reset) match <= 1'b0;
    //else if(star_mode & (pat_len - 4'd1)==m_reg)match <= 1'b1;
    else if (pat_len != 4'd0 & pat_len == m_reg) match <= 1'b1;
    else match <= 1'b0;
end

assign valid = (state==finish)? 1 : 0;

endmodule
