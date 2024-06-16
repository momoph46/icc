module STI_DAC(clk ,reset, load, pi_data, pi_length, pi_fill, pi_msb, pi_low, pi_end,
	       so_data, so_valid,
	       oem_finish, oem_dataout, oem_addr,
	       odd1_wr, odd2_wr, odd3_wr, odd4_wr, even1_wr, even2_wr, even3_wr, even4_wr);

input		clk, reset;
input		load, pi_msb, pi_low, pi_end; 
input	[15:0]	pi_data;
input	[1:0]	pi_length;
input		pi_fill;
output		so_data, so_valid;

output  oem_finish, odd1_wr, odd2_wr, odd3_wr, odd4_wr, even1_wr, even2_wr, even3_wr, even4_wr;
output [4:0] oem_addr;
output [7:0] oem_dataout;

//==============================================================================


reg msb_t;
reg [31:0] data_buf;


//reg [7:0] data_t0;

parameter idle = 2'd0,load_data=2'd1,process=2'd2,final=2'd3;
reg [1:0] state,nxt_state;

wire sflag;
reg [4:0] s,e;

always@(posedge clk, posedge reset) begin
	if(reset)
		state <= idle;
	else begin
		state <= nxt_state;
	end
end

always @(*) begin
	case(state)
		idle:begin
			if(load) nxt_state = load_data;
			else nxt_state = idle;
		end
		load_data:begin
			nxt_state = process;
	
		end
		process:begin
			if(s==e & pi_end) nxt_state = final;
			else if (s==e) nxt_state = idle;
			else nxt_state = process;
		end
		final:begin
			if(sflag) nxt_state = idle;
			else nxt_state = final;
		end
	endcase
end

always@(posedge clk,posedge reset)begin
	if(reset)
		msb_t<=1'd0;
	else if (state==load_data)
		msb_t<=pi_msb;
end




reg [4:0] i,j;
// load pi_data 
always@(posedge clk,posedge reset) begin
	if(reset)
		data_buf <= 32'd0;
	else if (state==load_data | load)begin
		//data_buf[8:23] <= pi_data;
		for (j=8;j<24;j=j+1)
			data_buf[j] <= pi_data[23-j];
	end

end
assign so_data = data_buf[s];
assign so_valid = (state==process);
//assign oem_finish = (state==final);


always@(posedge clk, posedge reset)begin
	if(reset)begin
		s <= 5'd0;
		e <= 5'd0;
	end
	else if(state==load_data)begin
	//else if(load)begin
		case(pi_length)
			2'b00:begin
				if(pi_low)begin
					s <= (pi_msb)?5'd8:5'd15;
					e <= (pi_msb)?5'd15:5'd8;
				end
				else begin
					s <= (pi_msb)?5'd16:5'd23;
					e <= (pi_msb)?5'd23:5'd16;
				end			
			end
			2'b01:begin
				s <= (pi_msb)?5'd8:5'd23;
				e <= (pi_msb)?5'd23:5'd8;
			end
			2'b10:begin
				if(pi_fill)begin
					s <= (pi_msb)?5'd8:5'd31;
					e <= (pi_msb)?5'd31:5'd8;
				end
				else begin
					s <= (pi_msb)?5'd0:5'd23;
					e <= (pi_msb)?5'd23:5'd0;
				end
			end
			2'b11:begin
				if(pi_fill)begin
					s <= (pi_msb)?5'd8:5'd7;
					e <= (pi_msb)?5'd7:5'd8;
				end
				else begin
					s <= (pi_msb)?5'd24:5'd23;
					e <= (pi_msb)?5'd23:5'd24;
				end
			end
		endcase
	end
	else if(state==process)begin
		if(msb_t)s <= s + 5'd1;
		else s <= s - 5'd1;
	end

end




reg [7:0] out_data;
always@(posedge clk,posedge reset)begin
	if(reset)
		out_data <= 8'd0;
	else if(state==process)
		out_data[0]<=so_data;
		for (i=0;i<7;i=i+1)begin
			out_data[i+1]<=out_data[i];
		end

end
reg delay;
reg [7:0] addr;

always@(posedge clk,posedge reset)begin
	if(reset)
		delay <= 0;
	else if (delay)
		delay <= 0;
	else if (state==final & addr[2:0]==3'b111)
		delay <= 1;
	else	
		delay <= 0;
end



always@(posedge clk, posedge reset)begin
	if(reset)
		addr <= 8'd255;
	else if (pi_end & addr==8'd255)
		addr <= 8'd255;
 	else if ((state==final & ~delay) | (state==process & ((msb_t&s[2:0]==3'b110)|(~msb_t&s[2:0]==3'b001))))
		
		addr <= addr + 8'd1;
		
end

reg o_f;
always@(posedge clk,posedge reset)begin
	if(reset)
		o_f <= 0;
	else if(sflag)
		o_f <= 1;
end
assign oem_finish = o_f;
assign sflag = (addr==8'd255)&(state==final);

//assign oem_dataout = {out_data[6:0],so_data};
assign oem_dataout = (state==final)? 8'd0:{out_data[6:0],so_data};
assign oem_addr =  addr[5:1];
wire wr_en;
assign wr_en = (state==final & ~delay) |(state==process & ((msb_t&s[2:0]==3'b111)|(~msb_t&s[2:0]==3'b000)));

assign odd1_wr = ((wr_en)&(addr[7:6]==2'b00)&(addr[3]==addr[0]));
assign even1_wr = ((wr_en)&(addr[7:6]==2'b00)&(addr[3]!=addr[0]));
assign odd2_wr = ((wr_en)&(addr[7:6]==2'b01)&(addr[3]==addr[0]));
assign even2_wr = ((wr_en)&(addr[7:6]==2'b01)&(addr[3]!=addr[0]));
assign odd3_wr = ((wr_en)&(addr[7:6]==2'b10)&(addr[3]==addr[0]));
assign even3_wr = ((wr_en)&(addr[7:6]==2'b10)&(addr[3]!=addr[0]));
assign odd4_wr = ((wr_en)&(addr[7:6]==2'b11)&(addr[3]==addr[0]));
assign even4_wr = ((wr_en)&(addr[7:6]==2'b11)&(addr[3]!=addr[0]));
 
// DAC (process)
// 
//output  oem_finish, odd1_wr, odd2_wr, odd3_wr, odd4_wr, even1_wr, even2_wr, even3_wr, even4_wr;
//output [4:0] oem_addr;
//output [7:0] oem_dataout;




endmodule
