module SET ( clk , rst, en, central, radius, mode, busy, valid, candidate );
input clk, rst;
input en;
input [23:0] central;
input [11:0] radius;
input [1:0] mode;
output busy;
output valid;
output [7:0] candidate;

reg busy;
reg [7:0] candidate;
// initialize all data
reg [7:0]square[8:0]; 
// This way will create latch !!!

always @(posedge clk, posedge rst) begin
    if(rst)begin
       square[0] <= 8'd0;
       square[1] <= 8'd0;
        square[2] <= 8'd0;
        square[3] <= 8'd0;
        square[4] <= 8'd0;
        square[5] <= 8'd0;
        square[6] <= 8'd0;
        square[7] <= 8'd0;
        square[8] <= 8'd0;
		
		//square[8:0] <= {72'd0};
	end
	else begin
		square[0] <= 8'd0;
       square[1] <= 8'd1;
        square[2] <= 8'd4;
        square[3] <= 8'd9;
        square[4] <= 8'd16;
        square[5] <= 8'd25;
        square[6] <= 8'd36;
        square[7] <= 8'd49;
        square[8] <= 8'd64;
		//square[8:0] <= {8'd64,8'd49,8'd36,8'd25,8'd16,8'd9,8'd4,8'd1,8'd0};
	end
end


//central
reg [3:0] a_x,a_y,b_x,b_y,c_x,c_y;
always @(posedge clk, posedge rst) begin
    if(rst) begin
        {a_x,a_y,b_x,b_y,c_x,c_y} <= 24'd0;
    end
    else if (en) begin
        a_x <= central[23:20];
        a_y <= central[19:16];
        b_x <= central[15:12];
        b_y <= central[11:8];
        c_x <= central[7:4];
        c_y <= central[3:0];
    end
end
//mode 
reg [1:0] mode_t;
always @(posedge clk, posedge rst) begin
    if(rst) mode_t <= 2'b00;
    else if(en) mode_t <= mode;
end
// radius
reg [3:0]a_r,b_r,c_r;
always @(posedge clk, posedge rst) begin
    if(rst) {a_r,b_r,c_r} <= 12'd0;
    else if(en)begin
        a_r <= radius[11:8];
        b_r <= radius[7:4];
        c_r <= radius[3:0];
    end 
end
/*--------*/
// Maybe need FSM 
parameter idle = 2'b00,
          test = 2'b01,
          finish = 2'b10;
reg [1:0]state, next_state;
reg [3:0] x,y; //1~8

always @(posedge clk, posedge rst)state <= (rst)? idle : next_state;
always @(*)begin
    case(state)
        idle:begin
            next_state = (en) ? test : idle;
        end
        test:begin
            next_state = ((x==8) & (y==8))? finish : test;
        end
        finish:begin
            next_state = idle;
        end
        default:begin
            next_state = idle;
        end
    endcase
end

always @(posedge clk, posedge rst) begin
    if(rst) begin
        x<=4'd1;
        y<=4'd1;
    end
    else if (state == test) begin
        if (x!=8) x <= x + 4'd1;
        else begin
            x <= 4'd1;    
            y <= y +4'd1;
        end
    end
    else if(state == finish) begin
        x<=4'd1;
        y<=4'd1;
    end
end
wire [3:0] dis_ax, dis_ay, dis_bx,dis_by,dis_cx,dis_cy;
reg [7:0] r_c;
wire flag_a,flag_b,flag_c; 
assign dis_ax = (a_x > x)? a_x - x: x - a_x;
assign dis_ay = (a_y > y)? a_y - y: y - a_y;
assign flag_a = ({1'b0,square[dis_ax]} + {1'b0,square[dis_ay]}) <= square[a_r];
assign dis_bx = (b_x > x)? b_x - x: x - b_x;
assign dis_by = (b_y > y)? b_y - y: y - b_y; 
assign flag_b = ({1'b0,square[dis_bx]} + {1'b0,square[dis_by]}) <= square[b_r];
assign dis_cx = (c_x > x)? c_x - x: x - c_x;
assign dis_cy = (c_y > y)? c_y - y: y - c_y;
assign flag_c = ({1'b0,square[dis_cx]} + {1'b0,square[dis_cy]}) <= square[c_r];
reg[1:0] tmp;
always @(posedge clk, posedge rst) begin
    if(rst) r_c <= 8'd0;
    else if(state == test) begin
       case(mode_t)
            2'b00:begin
                // **why add 1'b0 ? 
                //if(({1'b0,square[dis_ax]} + {1'b0,square[dis_ay]})<=square[a_r])
                if(flag_a)
                    r_c <= r_c + 8'd1;
            end
            2'b01:begin
                /*if((({1'b0,square[dis_ax]} + {1'b0,square[dis_ay]})<=square[a_r]) &
                   (({1'b0,square[dis_bx]} + {1'b0,square[dis_by]})<=square[b_r]))*/
                if(flag_a & flag_b)
                   r_c <= r_c + 8'd1;
            end 
            2'b10:begin
                /*if((({1'b0,square[dis_ax]} + {1'b0,square[dis_ay]})<=square[a_r]) ^
                   (({1'b0,square[dis_bx]} + {1'b0,square[dis_by]})<=square[b_r]))*/
                if(flag_a ^ flag_b)
                   r_c <= r_c + 8'd1;
            end
            2'b11:begin
                //if(((flag_a & flag_b)|(flag_b & flag_c)|(flag_a & flag_c)) & !(flag_a & flag_b & flag_c))
				//if((flag_a & flag_b & !flag_c)|(flag_b & flag_c & !flag_a)|(flag_a & flag_c & !flag_b))
				tmp = 2'd0;
				if(flag_a)tmp = tmp+1;
				if(flag_b)tmp = tmp+1;
				if(flag_c)tmp = tmp+1;
				if(tmp==2'd2) 
				    r_c <= r_c + 8'd1;
            end
            default:begin
                r_c <= 8'd0;
            end
       endcase 
    end
    else if(state == finish)begin
        candidate <= r_c;
        r_c <= 8'd0;  
    end
end
 
reg v_r;
always @(posedge clk, posedge rst) begin
    if(rst)v_r <= 0;
    else if(state == finish) v_r <= 1;    
    else v_r <= 0;
end
assign valid = v_r;

//busy
always @(posedge clk, posedge rst) begin
    if(rst) busy <= 0;
    else if(en) busy <= 1;
    else if(state == finish) busy <= 0;
end
endmodule