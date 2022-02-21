module DT(
	input 			clk, 
	input			reset,
	output	reg		done ,
	output	reg		sti_rd ,
	output	reg 	[9:0]	sti_addr ,
	input		[15:0]	sti_di,
	output	reg		res_wr ,
	output	reg		res_rd ,
	output	reg 	[13:0]	res_addr ,
	output	reg 	[7:0]	res_do,
	input		[7:0]	res_di
	);

reg [3:0] state;
reg [3:0] next_state;
reg [7:0] minTemp;
reg [3:0] counter;

parameter idle = 4'b0000;

parameter read_rom = 4'b0001;
parameter write_rom_init = 4'b0010;

parameter read_sti_fpw = 4'b0011;
parameter process_fpw = 4'b0100;
parameter write_fpw = 4'b0101;

parameter ready_bpw =4'b0110;

parameter read_sti_bpw = 4'b0111;
parameter process_bpw = 4'b1000;
parameter write_bpw = 4'b1001;
parameter finish = 4'b1010;

parameter waiting = 4'b1111;
//state switch
always@(*)begin
	case (state)
		idle:begin
			next_state = read_rom;
		end
		read_rom: next_state = write_rom_init;
		write_rom_init: begin
			if(counter==4'd15)begin
				if(res_addr == 14'd16383) next_state = read_sti_fpw;
				else next_state = read_rom;
			end
			else next_state = write_rom_init;
			
		end
		read_sti_fpw: begin
			if(res_addr == 14'd16254) next_state = ready_bpw;
			else begin 
				if(res_di) next_state = process_fpw;
				else next_state = read_sti_fpw; 
			end
		end
		process_fpw: begin
		  if(counter==4'd5)next_state = write_fpw;
		  else next_state = process_fpw;
		end
		write_fpw: next_state = read_sti_fpw;

		ready_bpw: begin
			next_state = read_sti_bpw;
		end
		read_sti_bpw: begin 
			if(res_addr == 14'd129) next_state = finish;
			else begin
				if(res_di)next_state = process_bpw;
				else next_state = read_sti_bpw;
			end 
		end
		process_bpw: begin
			if(counter ==4'd5) next_state = write_bpw;
			else next_state = process_bpw;
		end
		write_bpw: next_state = read_sti_bpw;

		finish: next_state = finish;
		default: next_state = idle;
	endcase
end
//counter 
always@(posedge clk,negedge reset) begin
    if(!reset) counter <= 4'd0;
	else if(next_state == write_rom_init) counter <= counter - 4'd1;
    else if(next_state == read_rom) counter <= 4'd15;
	else if(next_state == process_fpw | next_state == process_bpw/*state == process_bpw*/) counter <= counter + 4'd1;
	// origianl : state == process_fpw
	else if(state == read_sti_fpw | state == read_sti_bpw | state ==write_fpw | state == write_bpw) counter <= 4'd0;
end
//sti_rd
always@(posedge clk, negedge reset)begin
	if(!reset)sti_rd <= 1'b0;
	else if(next_state == read_rom)sti_rd <= 1'b1;
	else sti_rd <= 1'b0;
end
always@(posedge clk , negedge reset)state <= (!reset)? idle : next_state;
//sti_addr
always@(posedge clk, negedge reset)begin
  if(!reset) sti_addr<=10'd1023;
  else if(next_state == read_rom) sti_addr<= sti_addr + 10'd1;
end
//res_wr
always @(posedge clk, negedge reset) begin
	if(!reset) res_wr <= 1'b0;
	else if(next_state == write_rom_init) res_wr <= 1'b1;
	else if(next_state == write_fpw || next_state == write_bpw) res_wr <= 1'b1;
	else res_wr <= 1'b0;   
end
//res_addr
always@(posedge clk, negedge reset) begin
   if(!reset) res_addr <= 14'd0;
   else if (state == write_rom_init && next_state == read_sti_fpw) res_addr <= 14'd129;
   else if (state == write_rom_init) res_addr <= res_addr + 14'd1;
   //else if (state == read_sti_fpw || state == write_fpw) res_addr <= res_addr + 14'd1;
   else if (next_state == process_fpw /*|| state == process_fpw*/) begin
	   case(counter)
		4'd0: res_addr <= res_addr-14'd129;
		4'd1: res_addr <= res_addr+14'd1;
		4'd2: res_addr <= res_addr+14'd1;
		4'd3: res_addr <= res_addr+14'd126;
		4'd4: res_addr <= res_addr+14'd1; //write address of write_fpw
		default : res_addr <= res_addr;
	   endcase
   end
	else if (state == read_sti_fpw || state == write_fpw) res_addr <= res_addr + 14'd1;


   else if (state == ready_bpw) res_addr <= 14'd16254;

   else if(next_state == process_bpw /*||state == process_bpw*/)begin
	   case(counter)
	   4'd0: res_addr <= res_addr + 14'd129;
	   4'd1: res_addr <= res_addr - 14'd1;
	   4'd2: res_addr <= res_addr - 14'd1;
	   4'd3: res_addr <= res_addr - 14'd126;
	   4'd4: res_addr <= res_addr - 14'd1;
	   default: res_addr <= res_addr;
	   endcase
   end
   else if(state ==  read_sti_bpw || state==write_bpw) res_addr <= res_addr - 14'd1;

   //else res_addr <= 14'd0;
end
wire [7:0] res_di_addOne;
assign res_di_addOne = res_di + 1'd1;
//minTemp
always@(posedge clk, negedge reset)begin
	if(!reset) minTemp <= 8'd0;
	else if(state == process_fpw)begin
		if(counter == 1) minTemp <= res_di;
		else if (res_di < minTemp) minTemp <= res_di;
	end/*
	else if(state == process_bpw)begin
		if (counter == 0) minTemp <= res_di ;
		else if ((res_di+14'd1)<minTemp) minTemp <= res_di + 14'd1;
	end
	*/
	else if (state == read_sti_bpw) minTemp <= res_di;
	else if (state == process_bpw) begin
		if(minTemp > res_di_addOne) minTemp <= res_di_addOne;
	end
end
always@(posedge clk, negedge reset)begin
	if(!reset) res_rd <= 1'd0;
	else if (next_state == read_sti_bpw) res_rd <= 1'd1;
    else if (next_state == read_sti_fpw) res_rd <= 1'd1;
	else if (next_state == write_bpw | next_state == write_fpw) res_rd <= 1'd0;
end

//res_do
always@(posedge clk, negedge reset)begin
  if(!reset) res_do <= 8'd0;
  else if(next_state == write_rom_init) res_do <= {7'd0,sti_di[counter]};
  else if(next_state == write_fpw) res_do <= minTemp + 8'd1;
  else if(next_state == write_bpw ) res_do <= minTemp;
end

always@(posedge clk, negedge reset) begin
	if(!reset) done <= 1'b0;
	else if (next_state==finish) done <= 1'b1;
end
endmodule