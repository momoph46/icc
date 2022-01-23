module avg #(parameter n=12)
    (din, reset, clk, ready, dout);
input reset, clk;
input [15:0] din;
output reg ready; 
output reg [15:0] dout;

// ==========================================
//  Enter your design below
// ==========================================

reg [15:0] arr [0:n-1];
reg [19:0] sum, n_mul12; //max 12, so left shift 4-bit
reg [15:0] temp;
reg [3:0] i;

always @(posedge clk, posedge reset) begin
    if(reset)begin
        sum <= 20'd0;
        for (i=0;i<n;i=i+1)
            arr[i]<=16'd0;
    end

    else begin
        //for(i=0;i<n-2;i=i+1)
            //arr[i]<=arr[i+1];
        //arr[n-1] <= din;
        
        arr[0]<=arr[1];
        arr[1]<=arr[2];
        arr[2]<=arr[3];
        arr[3]<=arr[4];
        arr[4]<=arr[5];
        arr[5]<=arr[6];
        arr[6]<=arr[7];
        arr[7]<=arr[8];        
        arr[8]<=arr[9];
        arr[9]<=arr[10];
        arr[10]<=arr[11];
        arr[11]<=din;

        sum <= sum - arr[0]+din;
    end
end
reg [19:0] dis,t_dis; 
always @(*) begin
    temp=16'd0;
    t_dis = 20'hfffff;
    //avg=sum>>3;
    for (i=0;i<n;i=i+1)begin
        n_mul12 = (arr[i]<<3)+(arr[i]<<2);
        /*if(n_mul12 <= sum & arr[i]>temp)begin
            temp = arr[i];
        end
        else 
            ;*/
        if (n_mul12 <= sum) dis = sum - n_mul12;
        else dis = n_mul12 - sum; 
        if (dis < t_dis)begin
            t_dis = dis;
            temp = arr[i];
            
            //if( <= temp ) temp = arr[i];
            //else ;
        end
        else if (dis == t_dis) begin
            if(arr[i] <= temp) temp = arr[i];
        end
        else ;
        //if( <= temp ) temp = arr[i];
            //else ;
    end
end
always @(posedge clk, posedge reset) begin
    if(reset) dout <= 16'd0;
    else dout<= temp;
end
reg [3:0] c;
always @(posedge clk, posedge reset) begin
    if(reset) c <= 4'd0;
    else if(c != 4'd12) c<=c+1;
end
always @(negedge clk,posedge reset) begin
    if(reset) ready <= 0;
    else if(c == 4'd12) ready<=1;
end

endmodule
