
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


reg [1:0] state, next_state;
reg [3:0] cnt;
reg [6:0] addr1,addr2;//7bits
wire [6:0] addr1_before,addr2_before,addr1_after,addr2_after;
reg [7:0] threshold, outside_data;

parameter idle = 2'd0;
parameter read_gray = 2'd1;
parameter write_lbp = 2'd2;
parameter finish_state = 2'd3;

wire cnt7_done;
wire total;

always @(posedge clk, posedge reset) begin
    if (reset) state <= idle;
    else state <= next_state;
end

always @(*)begin
    case(state)
        idle :next_state = read_gray;
        read_gray:begin
            if(cnt==4'd10)next_state = write_lbp;
            else next_state = read_gray;
        end
        write_lbp:begin
            if(lbp_addr==14'd16254)next_state = finish_state;
            else next_state = read_gray;
        end
        finish_state :next_state = idle;
    endcase
end

assign finish = (state == finish_state);

// lbp_addr
always @(posedge clk, posedge reset) begin
    if (reset) lbp_addr <= 14'd0;
    else if(cnt==4'd10) lbp_addr <= {addr1,addr2}; 
end


assign addr1_after = addr1 + 7'd1;
assign addr1_before = addr1 - 7'd1;
assign addr2_after = addr2 + 7'd1;
assign addr2_before = addr2 - 7'd1; 
// 
always @(posedge clk, posedge reset) begin
    if (reset) threshold <= 8'd0;
    else if (cnt==4'd1) threshold <= gray_data;
    else if (cnt==4'd10) threshold <= 8'd0;
end

always @(posedge clk, posedge reset) begin
    if (reset) outside_data <= 8'd0;
    else if (cnt > 4'd1) outside_data <= gray_data;
end
reg [7:0] totallbp, part_lbp;

wire [7:0] temp;
assign temp = (outside_data >= threshold) ? 1<<(cnt-4'd3) : 8'd0;

always @(posedge clk, posedge reset) begin
    if (reset) totallbp <= 8'd0;
    else if (state == read_gray) totallbp <= totallbp + temp;
    else if (state == write_lbp) totallbp <= 8'd0; 
end

assign lbp_data = totallbp;
assign lbp_valid = (state == write_lbp);
//addr1 addr2
always @(posedge clk, posedge reset) begin
    if (reset) begin
        addr1 <= 7'd1;
        addr2 <= 7'd1;
    end
    else if (state == write_lbp) begin
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
    else if (state == read_gray) gray_req <= 1;
end

//gray_addr
always @(posedge clk, posedge reset) begin
    if(reset) gray_addr <= 14'd129;
    else if (state == read_gray)begin
        case (cnt)
            4'd0:gray_addr <= {addr1,addr2};
            4'd1:gray_addr <= {addr1_before,addr2_before};
            4'd2:gray_addr <= {addr1_before,addr2};
            4'd3:gray_addr <= {addr1_before,addr2_after};
            4'd4:gray_addr <= {addr1,addr2_before};
            4'd5:gray_addr <= {addr1,addr2_after};
            4'd6:gray_addr <= {addr1_after,addr2_before};
            4'd7:gray_addr <= {addr1_after,addr2};
            4'd8:gray_addr <= {addr1_after,addr2_after};
        endcase
    end
end
always @(posedge clk, posedge reset) begin
    if (reset) cnt <= 4'd0;
    else if (state == read_gray) cnt <= cnt + 4'd1;
    else if (state == write_lbp) cnt <= 4'd0;
end


//====================================================================
endmodule



