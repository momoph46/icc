module geofence ( clk,reset,X,Y,R,valid,is_inside);
input clk;
input reset;
input [9:0] X;
input [9:0] Y;
input [10:0] R;
output valid;
output is_inside;
//reg valid;
//reg is_inside;

parameter read = 4'd0;
parameter get_vec = 4'd1;
parameter cal_out = 4'd2;
parameter reorder = 4'd3;// ..3/8
parameter cal_diff = 4'd4;
parameter tri_sixarea = 4'd5;
parameter geofence_area = 4'd6;
parameter finish = 4'd7;
parameter cal_square = 4'd8;
parameter cal_radi = 4'd9;
parameter cal_s = 4'd10;
parameter compare = 4'd11;
parameter geo_mul = 4'd12;
parameter waiting = 4'd13;
parameter geo_point = 4'd14;


reg [3:0] state, next_state;
reg [9:0] xtmp[5:0];
reg [9:0] ytmp[5:0];
reg [10:0] rtmp[5:0];
reg [2:0] i,read_cnt5;
reg signed [10:0] vecx[4:0];
reg signed [10:0] vecy[4:0];
reg [2:0] outcnt [4:0];
reg s_done;
wire read_done, cal_done;
wire tri_done,geomul_done;
reg pass_wait, geo_done;
always @(posedge clk, posedge reset) begin
    if (reset) state <= read;
    else state <= next_state;
end
always @(*) begin
    case (state)
        read: begin
            if (read_done) next_state = get_vec;
            else next_state = read;
        end
        get_vec: next_state = cal_out;
        cal_out: begin
            if (cal_done) next_state = reorder;
            else next_state = cal_out;
        end
        reorder : next_state = cal_diff;
        
        cal_diff: next_state = cal_square;  //4
        cal_square: next_state = cal_radi;  //8
        cal_radi:begin                      //9
            if (s_done) next_state = tri_sixarea;
            else next_state = cal_s;
        end 
        cal_s: next_state = cal_square;     //10
        tri_sixarea:begin                   //5
            //if (tri_done) next_state = geo_mul;
            if (tri_done) next_state = waiting;
            else next_state = cal_diff;
        end
        waiting: next_state = geo_point;    //13
        geo_point: next_state = geo_mul;    //14
        geo_mul:begin                       //12
            //if (geomul_done)next_state = geofence_area;
            //else next_state = geo_point;
            next_state = geofence_area;
        end
        geofence_area :begin                //6
            //if (big_done) next_state = compare; 
            //else next_state = geofence_area;
            if (geo_done) next_state = compare;
            else next_state = geo_point;
        end
        compare: next_state = finish;       //11
        finish: next_state = read;          //7    
        default: next_state = read;
        
        /*
        cal_diff : next_state = finish;
        finish : next_state = read;
        default: next_state = read;
        */
    endcase
end
//cal_diff
/*
always @(posedge clk, posedge reset) begin
    if (reset) {valid,is_inside} <= 2'b00;
    else if (state == cal_diff)begin
        {valid,is_inside} <= 2'b10;
    end
    else {valid,is_inside} <= 2'b00;
end
*/

//-------------//

reg [11:0] p1,p2,p3,p4;
wire [23:0] x_squar, y_squar;
reg [23:0] sqrsum,sqrsum1;
wire [9:0] next_vecx,next_vecy,pos_x,pos_y;
wire [10:0] next_r,pos_r;
reg signed [23:0] tri_area, total; // accumulate final area (6 triangles)
reg [2:0] tri_cnt;
wire [11:0] root1,root0;
wire [11:0] s;
reg [11:0] edge_reg;

always @(posedge clk, posedge reset) begin
    if (reset) tri_cnt <= 3'd0;
    else if (state == tri_sixarea | state == geofence_area) begin
        if (tri_cnt == 3'd5) tri_cnt <= 3'd0;
        else tri_cnt <= tri_cnt + 3'd1;
    end
    else if (state == waiting | state == finish) tri_cnt <= 3'd0;

end

assign next_vecx = (tri_cnt==3'd5)? xtmp[0] : xtmp[tri_cnt+1];
assign next_vecy = (tri_cnt==3'd5)? ytmp[0] : ytmp[tri_cnt+1];
assign next_r = (tri_cnt==3'd5)? rtmp[0] : rtmp[tri_cnt+1];
assign pos_x = xtmp[tri_cnt];
assign pos_y = ytmp[tri_cnt];
assign pos_r = rtmp[tri_cnt];
always @(posedge clk, posedge reset) begin
    if(reset) begin
        p1 <= 12'd0;
        p2 <= 12'd0;
        p3 <= 12'd0;
        p4 <= 12'd0;
    end
    else begin
        case (state)
        cal_diff:begin
            p1 <= (pos_x > next_vecx)? pos_x - next_vecx: next_vecx - pos_x;
            p2 <= (pos_x > next_vecx)? pos_x - next_vecx: next_vecx - pos_x;
            p3 <= (pos_y > next_vecy)? pos_y - next_vecy: next_vecy - pos_y;
            p4 <= (pos_y > next_vecy)? pos_y - next_vecy: next_vecy - pos_y;
        end
        cal_s:begin
            p1 <= s;
            p2 <= (s > pos_r)?s - pos_r : pos_r -s ;
            p3 <= (s > next_r)?s - next_r : next_r -s;
            p4 <= (s > edge_reg)?s - edge_reg : edge_reg - s;
        end
        geo_point:begin
            p1 <= pos_x;        //x0
            p2 <= next_vecy;    //y1
            p3 <= pos_y;        //y0
            p4 <= next_vecx;    //x1
        end
        endcase
    end
end
assign x_squar = p1 * p2;
assign y_squar = p3 * p4;
always @(posedge clk, posedge reset) begin
    if(reset) begin
        sqrsum <= 24'd0;
        sqrsum1 <= 24'd0;
    end
    else if (state== cal_square)begin
       if (s_done)begin
           sqrsum <= x_squar;
           sqrsum1 <= y_squar;
       end
       else begin
           sqrsum <= x_squar + y_squar; 
           sqrsum1 <= 24'd0;
       end
    end
    else if (state == geo_mul) begin
         sqrsum <= x_squar;
        sqrsum1 <= y_squar;
    end
end
wire signed [23:0]part_total;
assign part_total = sqrsum - sqrsum1;

DW_sqrt #(24, 0) U1(.a(sqrsum), .root(root0));
DW_sqrt #(24, 0) U2(.a(sqrsum1), .root(root1));
reg [11:0] edge_reg2;
always @(posedge clk, posedge reset) begin
    if (reset) begin
        edge_reg <= 12'd0;
        edge_reg2 <= 12'd0;
    end
    else if (state == cal_radi) begin
        edge_reg <= root0;
        edge_reg2 <= root1;
    end
end
always @(posedge clk, posedge reset) begin
    if (reset) s_done <= 0;
    else if (state == cal_s) s_done <= 1;
    else if (state == tri_sixarea) s_done <= 0; 
end
wire [12:0] s_mul2;
assign s_mul2 = (edge_reg + pos_r + next_r);
assign s = s_mul2 >> 1;
wire [23:0] product_tri;
assign product_tri = edge_reg * edge_reg2;
always @(posedge clk, posedge reset) begin
    if (reset) tri_area <= 24'd0;
    else if (state == tri_sixarea) tri_area <= tri_area + product_tri;
    else if (state == finish) tri_area <= 24'd0;
end
//
// tri_done
assign tri_done = (tri_cnt == 3'd5);
always @(posedge clk, posedge reset) begin
    if (reset) total <= 24'd0;
    else if (state == geofence_area) total <= total + part_total;
    else if (state == finish) total <= 24'd0;
end

//geo_done
always @(posedge clk, posedge reset) begin
    if (reset) geo_done <= 0;
    else if (state == geo_mul && tri_cnt == 3'd5)geo_done <= 1;
    else if (state == finish) geo_done <= 0;
end
wire compare_flag;
reg c_reg;
wire signed [23:0] total_geo;
assign total_geo = total >> 1;
assign compare_flag = (tri_area > total_geo);
always @(posedge clk, posedge reset) begin
    if (reset) c_reg <= 0;
    else if (state == compare) c_reg <= compare_flag;
    else if (state == read) c_reg <= 0;
end
assign is_inside = ~c_reg;
assign valid = (state == finish);



//-----------reorder------
always @(posedge clk, posedge reset) begin
    if (reset)begin
        for (i=0;i<3'd6;i=i+1)begin
        xtmp[i] <= 10'd0;
        ytmp[i] <= 10'd0;
        rtmp[i] <= 11'd0;
        end
    end
    else if (state == read)begin
        xtmp[read_cnt5] <= X;
        ytmp[read_cnt5] <= Y;
        rtmp[read_cnt5] <= R;
    end
    else if (state == reorder) begin
        xtmp[outcnt[0]+3'd1] <= xtmp[1];
        xtmp[outcnt[1]+3'd1] <= xtmp[2];
        xtmp[outcnt[2]+3'd1] <= xtmp[3];
        xtmp[outcnt[3]+3'd1] <= xtmp[4];
        xtmp[outcnt[4]+3'd1] <= xtmp[5];

        ytmp[outcnt[0]+3'd1] <= ytmp[1];
        ytmp[outcnt[1]+3'd1] <= ytmp[2];
        ytmp[outcnt[2]+3'd1] <= ytmp[3];
        ytmp[outcnt[3]+3'd1] <= ytmp[4];
        ytmp[outcnt[4]+3'd1] <= ytmp[5];

        rtmp[outcnt[0]+3'd1] <= rtmp[1];
        rtmp[outcnt[1]+3'd1] <= rtmp[2];
        rtmp[outcnt[2]+3'd1] <= rtmp[3];
        rtmp[outcnt[3]+3'd1] <= rtmp[4];
        rtmp[outcnt[4]+3'd1] <= rtmp[5];
    end
end
assign read_done = (read_cnt5==3'd5);

//read_cnt5
always @(posedge clk, posedge reset) begin
    if (reset) read_cnt5 <= 3'd0;
    else if (state == read) read_cnt5 <= read_cnt5 + 3'd1;
    else read_cnt5 <= 3'd0; 
end
wire [9:0]ori_x,ori_y;
wire signed [21:0] outres1,outres2,fin_res;
assign ori_x = xtmp[0];
assign ori_y = ytmp[0];
reg [2:0] vid1,vid2;
always @(posedge clk, posedge reset) begin
    if (reset)begin
        for(i=0;i<5;i=i+1)begin
            vecx[i] <= 10'd0;
            vecy[i] <= 10'd0;
        end      
    end
    else if (state == get_vec)begin
        for(i=0;i<5;i=i+1)begin
           vecx[i] <= xtmp[i+1] - ori_x;
           vecy[i] <= ytmp[i+1] - ori_y;
        end
    end
end

//vid1, vid2
always @(posedge clk, posedge reset) begin
    if (reset)begin
        vid1 <= 3'd0;
        vid2 <= 3'd0;
    end
    else if (state == cal_out) begin
        if (vid2==3'd4)begin
            //vid1 <= vid1 + 3'd1;
            vid2 <= 3'd0;
            if (vid1==3'd4)vid1 <= 3'd0;
            else vid1 <= vid1 + 3'd1;
        end
        else vid2 <= vid2 + 3'd1;
    end
    else if (state == reorder)begin
        vid1 <= 3'd0;
        vid2 <= 3'd0;
    end
end
assign cal_done = (vid1==3'd4 && vid2==3'd4);
wire signed [10:0] p1_x,p1_y,p2_x,p2_y;
assign p1_x = vecx[vid1]; //ax
assign p1_y = vecy[vid1]; //ay
assign p2_x = vecx[vid2]; //bx
assign p2_y = vecy[vid2]; //by
//ax*by - ay*bx
assign outres1 = p1_x*p2_y;//10 + 10 = 20
assign outres2 = p1_y*p2_x;
assign fin_res = outres1 - outres2;
//outcnt
always @(posedge clk, posedge reset)begin
    if(reset) begin
        for (i=0;i<5;i=i+1)
            outcnt[i] <= 3'd0; 
    end
    else if (state == cal_out)begin
        if (fin_res < 0) outcnt[vid1] <= outcnt[vid1] + 3'd1;
    end
    else if (state == finish) begin
        for (i=0;i<5;i=i+1)
            outcnt[i] <= 3'd0; 
    end
end




endmodule

