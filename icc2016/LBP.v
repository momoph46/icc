
`timescale 1ns/10ps
module LBP ( clk, reset, gray_addr, gray_req, gray_ready, gray_data, lbp_addr, lbp_valid, lbp_data, finish);
input   	clk;
input   	reset;
output  [13:0] 	gray_addr;
output         	gray_req;
input   	gray_ready;
input   [7:0] 	gray_data;
output  [13:0] 	lbp_addr;
output  	lbp_valid;
output  [7:0] 	lbp_data;
output  	finish;
//====================================================================


// {addr1,addr2} = gray_addr(14bits);
//reg [7:0]lbp_data;
reg [13:0]lbp_addr;
reg [13:0] gray_addr;


reg [2:0] state, next_state;
reg [2:0] cnt7;
reg [6:0] cnt127;
reg [6:0] addr1,addr2;//7bits
wire [6:0] addr1_before,addr2_before,addr1_after,addr2_after;
reg [7:0] threshold, outside_data;

parameter idle = 3'd0;
parameter set_grayaddr = 3'd1;
parameter set_threshold = 3'd2;
parameter res2lpb= 3'd6;    //LBP finish
parameter outside_addr = 3'd3;
parameter set_outdata = 3'd4;
//parameter compare_shift = 3'd4;
parameter add = 3'd5;
parameter finish_state = 3'd7;

wire cnt7_done;
wire total;

always @(posedge clk, posedge reset) begin
    if (reset) state <= idle;
    else state <= next_state;
end
always @(*) begin
    case (state)
        idle :next_state = set_grayaddr;
        set_grayaddr: next_state = set_threshold;
        
        set_threshold : next_state = outside_addr;
        outside_addr: next_state = set_outdata;
        //set_outdata: next_state = compare_shift;
        set_outdata: next_state = add;
        //compare_shift: next_state = add;
        add : begin
            if (cnt7_done)next_state = res2lpb;
            else next_state = outside_addr;
        end
        res2lpb : begin
            if (total) next_state = finish_state;
            else next_state = set_grayaddr;
        end
        finish_state: next_state = idle;
        default : next_state = idle;
    endcase
end
assign finish = (state == finish_state);
assign cnt7_done = (cnt7==3'd7);
assign total = (lbp_addr==14'd16254);

// lbp_addr
always @(posedge clk, posedge reset) begin
    if (reset) lbp_addr <= 14'd0;
    else if(state == add) lbp_addr <= {addr1,addr2}; 
end


assign addr1_after = addr1 + 7'd1;
assign addr1_before = addr1 - 7'd1;
assign addr2_after = addr2 + 7'd1;
assign addr2_before = addr2 - 7'd1; 
// 
always @(posedge clk, posedge reset) begin
    if (reset) threshold <= 8'd0;
    else if (state == set_threshold) threshold <= gray_data;
end


always @(posedge clk, posedge reset) begin
    if (reset) outside_data <= 8'd0;
    else if (state == set_outdata) outside_data <= gray_data;
end
reg [7:0] totallbp, part_lbp;
//wire c ; // compare with threshold
wire [7:0] temp;
assign temp = (outside_data >= threshold) ? 1<<cnt7 : 8'd0;
//assign temp = c << cnt7; 
/*
always @(posedge clk, posedge reset) begin
    if (reset) part_lbp <= 8'd0;
    else if (state == compare_shift) part_lbp <= temp;
end*/
always @(posedge clk, posedge reset) begin
    if (reset) totallbp <= 8'd0;
    //else if (state == add) totallbp <= totallbp + part_lbp;
    else if (state == add) totallbp <= totallbp + temp;
    else if (state == res2lpb) totallbp <= 8'd0; 
end

assign lbp_data = totallbp;
assign lbp_valid = (state == res2lpb);
//addr1 addr2
always @(posedge clk, posedge reset) begin
    if (reset) begin
        addr1 <= 7'd1;
        addr2 <= 7'd1;
    end
    else if (state == res2lpb) begin
        if (addr2 == 7'd126) begin
            addr2 <= 7'd1;
            addr1 <= addr1 + 7'd1;
        end
        else addr2 <= addr2 + 7'd1;
    end
end

reg gray_req;
always @(posedge clk, posedge reset) begin
    if(reset) gray_req <= 0;
    else 
        begin 
        case (state)
            set_grayaddr: gray_req <= 1;
            outside_addr: gray_req <= 1;
            default :gray_req <=0;
        endcase    
    end
end

//gray_addr
always @(posedge clk, posedge reset) begin
    if(reset) gray_addr <= 14'd129;
    else if(state == set_grayaddr)  gray_addr <= {addr1,addr2};
    else if (state == outside_addr)begin
        case (cnt7) 
            3'd0:gray_addr <= {addr1_before,addr2_before};
            3'd1:gray_addr <= {addr1_before,addr2};
            3'd2:gray_addr <= {addr1_before,addr2_after};
            3'd3:gray_addr <= {addr1,addr2_before};
            3'd4:gray_addr <= {addr1,addr2_after};
            3'd5:gray_addr <= {addr1_after,addr2_before};
            3'd6:gray_addr <= {addr1_after,addr2};
            3'd7:gray_addr <= {addr1_after,addr2_after};
        endcase
    end
end
always @(posedge clk, posedge reset) begin
    if (reset) cnt7 <= 3'd0;
    else if (state == add) cnt7 <= cnt7 + 1;
end


//====================================================================
endmodule
