module JAM (
input CLK,
input RST,
output reg [2:0] W,
output reg [2:0] J,
input [6:0] Cost,
output reg [3:0] MatchCount,
output reg [9:0] MinCost,
output reg Valid );

localparam IDLE = 2'D0, SORT = 2'D2, OUTPUT = 2'D3;
localparam get_com = 2'D0, get_cost = 2'D1,comp_cost = 2'd2; 
integer map_i,i,j;
//state
reg [1:0]top_state,top_state_n;
reg access_finish,sort_finish,access_finish_n,sort_finish_n;
//access
reg [2:0]W_n,J_n;
/*
reg [6:0]cost_map_A[0:7];
reg [6:0]cost_map_B[0:7];
reg [6:0]cost_map_C[0:7];
reg [6:0]cost_map_D[0:7];
reg [6:0]cost_map_E[0:7];
reg [6:0]cost_map_F[0:7];
reg [6:0]cost_map_G[0:7];
reg [6:0]cost_map_H[0:7];
reg [6:0]cost_map_A_n[0:7];
reg [6:0]cost_map_B_n[0:7];
reg [6:0]cost_map_C_n[0:7];
reg [6:0]cost_map_D_n[0:7];
reg [6:0]cost_map_E_n[0:7];
reg [6:0]cost_map_F_n[0:7];
reg [6:0]cost_map_G_n[0:7];
reg [6:0]cost_map_H_n[0:7];
*/
//sort
reg [1:0]sort_state,sort_state_n;
reg comb_finish,comb_finish_n;
reg [2:0]combination[0:7];
reg [2:0]combination_n[0:7];
reg [9:0]now_cost, now_cost_n;
reg [9:0]MinCost_n;
reg [3:0]MatchCount_n;
reg [2:0]cost_cnt,cost_cnt_n;
//TOP STATE CTL
always@* begin
    case(top_state)
    IDLE: begin    
        top_state_n = SORT;
    end
        
    /*ACCESS: begin
        if(~access_finish) begin
            top_state_n = ACCESS;
        end 
        else begin
            top_state_n = SORT;
        end 
    end*/
    SORT: begin
        if(~sort_finish) begin
            top_state_n = SORT;
        end 
        else begin
            top_state_n = OUTPUT;
        end 
    end
    OUTPUT: begin
        top_state_n = OUTPUT; 
    end
    default: begin
        top_state_n = IDLE;
    end
    endcase
end

always@(posedge CLK) begin
    if(RST) begin
        top_state <= IDLE;
    end    
    else begin
        top_state <= top_state_n;
    end    
end

//ACCESS
/*
always@* begin
    case(top_state)
    ACCESS:begin
        case(W)
        3'D0: begin
            for (i = 0;i < 8; i = i + 1) begin
                if(J == i)begin
                    cost_map_A_n[i] = Cost;
                    cost_map_B_n[i] = cost_map_B[i];
                    cost_map_C_n[i] = cost_map_C[i];
                    cost_map_D_n[i] = cost_map_D[i];
                    cost_map_E_n[i] = cost_map_E[i];
                    cost_map_F_n[i] = cost_map_F[i];
                    cost_map_G_n[i] = cost_map_G[i];
                    cost_map_H_n[i] = cost_map_H[i];
                end
                else begin
                    cost_map_A_n[i] = cost_map_A[i];
                    cost_map_B_n[i] = cost_map_B[i];
                    cost_map_C_n[i] = cost_map_C[i];
                    cost_map_D_n[i] = cost_map_D[i];
                    cost_map_E_n[i] = cost_map_E[i];
                    cost_map_F_n[i] = cost_map_F[i];
                    cost_map_G_n[i] = cost_map_G[i];
                    cost_map_H_n[i] = cost_map_H[i];
                end
            end   
        end
        3'D1: begin
            for (i = 0;i < 8; i = i + 1) begin
                if(J == i)begin
                    cost_map_A_n[i] = cost_map_A[i];
                    cost_map_B_n[i] = Cost;
                    cost_map_C_n[i] = cost_map_C[i];
                    cost_map_D_n[i] = cost_map_D[i];
                    cost_map_E_n[i] = cost_map_E[i];
                    cost_map_F_n[i] = cost_map_F[i];
                    cost_map_G_n[i] = cost_map_G[i];
                    cost_map_H_n[i] = cost_map_H[i];
                end
                else begin
                    cost_map_A_n[i] = cost_map_A[i];
                    cost_map_B_n[i] = cost_map_B[i];
                    cost_map_C_n[i] = cost_map_C[i];
                    cost_map_D_n[i] = cost_map_D[i];
                    cost_map_E_n[i] = cost_map_E[i];
                    cost_map_F_n[i] = cost_map_F[i];
                    cost_map_G_n[i] = cost_map_G[i];
                    cost_map_H_n[i] = cost_map_H[i];
                end
            end
        end
        3'D2: begin
            for (i = 0;i < 8; i = i + 1) begin
                if(J == i)begin
                    cost_map_A_n[i] = cost_map_A[i];
                    cost_map_B_n[i] = cost_map_B[i];
                    cost_map_C_n[i] = Cost;
                    cost_map_D_n[i] = cost_map_D[i];
                    cost_map_E_n[i] = cost_map_E[i];
                    cost_map_F_n[i] = cost_map_F[i];
                    cost_map_G_n[i] = cost_map_G[i];
                    cost_map_H_n[i] = cost_map_H[i];
                end
                else begin
                    cost_map_A_n[i] = cost_map_A[i];
                    cost_map_B_n[i] = cost_map_B[i];
                    cost_map_C_n[i] = cost_map_C[i];
                    cost_map_D_n[i] = cost_map_D[i];
                    cost_map_E_n[i] = cost_map_E[i];
                    cost_map_F_n[i] = cost_map_F[i];
                    cost_map_G_n[i] = cost_map_G[i];
                    cost_map_H_n[i] = cost_map_H[i];
                end
            end
        end
        3'D3: begin
            for (i = 0;i < 8; i = i + 1) begin
                if(J == i)begin
                    cost_map_A_n[i] = cost_map_A[i];
                    cost_map_B_n[i] = cost_map_B[i];
                    cost_map_C_n[i] = cost_map_C[i];
                    cost_map_D_n[i] = Cost;
                    cost_map_E_n[i] = cost_map_E[i];
                    cost_map_F_n[i] = cost_map_F[i];
                    cost_map_G_n[i] = cost_map_G[i];
                    cost_map_H_n[i] = cost_map_H[i];
                end
                else begin
                    cost_map_A_n[i] = cost_map_A[i];
                    cost_map_B_n[i] = cost_map_B[i];
                    cost_map_C_n[i] = cost_map_C[i];
                    cost_map_D_n[i] = cost_map_D[i];
                    cost_map_E_n[i] = cost_map_E[i];
                    cost_map_F_n[i] = cost_map_F[i];
                    cost_map_G_n[i] = cost_map_G[i];
                    cost_map_H_n[i] = cost_map_H[i];
                end
            end
        end
        3'D4: begin
            for (i = 0;i < 8; i = i + 1) begin
                if(J == i)begin
                    cost_map_A_n[i] = cost_map_A[i];
                    cost_map_B_n[i] = cost_map_B[i];
                    cost_map_C_n[i] = cost_map_C[i];
                    cost_map_D_n[i] = cost_map_D[i];
                    cost_map_E_n[i] = Cost;
                    cost_map_F_n[i] = cost_map_F[i];
                    cost_map_G_n[i] = cost_map_G[i];
                    cost_map_H_n[i] = cost_map_H[i];
                end
                else begin
                    cost_map_A_n[i] = cost_map_A[i];
                    cost_map_B_n[i] = cost_map_B[i];
                    cost_map_C_n[i] = cost_map_C[i];
                    cost_map_D_n[i] = cost_map_D[i];
                    cost_map_E_n[i] = cost_map_E[i];
                    cost_map_F_n[i] = cost_map_F[i];
                    cost_map_G_n[i] = cost_map_G[i];
                    cost_map_H_n[i] = cost_map_H[i];
                end
            end
        end
        3'D5: begin
            for (i = 0;i < 8; i = i + 1) begin
                if(J == i)begin
                    cost_map_A_n[i] = cost_map_A[i];
                    cost_map_B_n[i] = cost_map_B[i];
                    cost_map_C_n[i] = cost_map_C[i];
                    cost_map_D_n[i] = cost_map_D[i];
                    cost_map_E_n[i] = cost_map_E[i];
                    cost_map_F_n[i] = Cost;
                    cost_map_G_n[i] = cost_map_G[i];
                    cost_map_H_n[i] = cost_map_H[i];
                end
                else begin
                    cost_map_A_n[i] = cost_map_A[i];
                    cost_map_B_n[i] = cost_map_B[i];
                    cost_map_C_n[i] = cost_map_C[i];
                    cost_map_D_n[i] = cost_map_D[i];
                    cost_map_E_n[i] = cost_map_E[i];
                    cost_map_F_n[i] = cost_map_F[i];
                    cost_map_G_n[i] = cost_map_G[i];
                    cost_map_H_n[i] = cost_map_H[i];
                end
            end
        end
        3'D6: begin
            for (i = 0;i < 8; i = i + 1) begin
                if(J == i)begin
                    cost_map_A_n[i] = cost_map_A[i];
                    cost_map_B_n[i] = cost_map_B[i];
                    cost_map_C_n[i] = cost_map_C[i];
                    cost_map_D_n[i] = cost_map_D[i];
                    cost_map_E_n[i] = cost_map_E[i];
                    cost_map_F_n[i] = cost_map_F[i];
                    cost_map_G_n[i] = Cost;
                    cost_map_H_n[i] = cost_map_H[i];
                end
                else begin
                    cost_map_A_n[i] = cost_map_A[i];
                    cost_map_B_n[i] = cost_map_B[i];
                    cost_map_C_n[i] = cost_map_C[i];
                    cost_map_D_n[i] = cost_map_D[i];
                    cost_map_E_n[i] = cost_map_E[i];
                    cost_map_F_n[i] = cost_map_F[i];
                    cost_map_G_n[i] = cost_map_G[i];
                    cost_map_H_n[i] = cost_map_H[i];
                end
            end
        end
        3'D7: begin
            for (i = 0;i < 8; i = i + 1) begin
                if(J == i)begin
                    cost_map_A_n[i] = cost_map_A[i];
                    cost_map_B_n[i] = cost_map_B[i];
                    cost_map_C_n[i] = cost_map_C[i];
                    cost_map_D_n[i] = cost_map_D[i];
                    cost_map_E_n[i] = cost_map_E[i];
                    cost_map_F_n[i] = cost_map_F[i];
                    cost_map_G_n[i] = cost_map_G[i];
                    cost_map_H_n[i] = Cost;
                end
                else begin
                    cost_map_A_n[i] = cost_map_A[i];
                    cost_map_B_n[i] = cost_map_B[i];
                    cost_map_C_n[i] = cost_map_C[i];
                    cost_map_D_n[i] = cost_map_D[i];
                    cost_map_E_n[i] = cost_map_E[i];
                    cost_map_F_n[i] = cost_map_F[i];
                    cost_map_G_n[i] = cost_map_G[i];
                    cost_map_H_n[i] = cost_map_H[i];
                end
            end
        end
        default: begin
            for (i = 0;i < 8; i = i + 1) begin
                begin
                    cost_map_A_n[i] = cost_map_A[i];
                    cost_map_B_n[i] = cost_map_B[i];
                    cost_map_C_n[i] = cost_map_C[i];
                    cost_map_D_n[i] = cost_map_D[i];
                    cost_map_E_n[i] = cost_map_E[i];
                    cost_map_F_n[i] = cost_map_F[i];
                    cost_map_G_n[i] = cost_map_G[i];
                    cost_map_H_n[i] = cost_map_H[i];
                end
            end
        end
        endcase
    end
    default: begin
        for (i = 0;i < 8; i = i + 1) begin
            begin
                cost_map_A_n[i] = cost_map_A[i];
                cost_map_B_n[i] = cost_map_B[i];
                cost_map_C_n[i] = cost_map_C[i];
                cost_map_D_n[i] = cost_map_D[i];
                cost_map_E_n[i] = cost_map_E[i];
                cost_map_F_n[i] = cost_map_F[i];
                cost_map_G_n[i] = cost_map_G[i];
                cost_map_H_n[i] = cost_map_H[i];
            end
        end
    end
    endcase
end   
always @* begin
    case(top_state)
    ACCESS: begin
        if(J == 7) begin
            W_n = W + 1;
            J_n = 0;
        end
        else begin
            W_n = W;
            J_n = J + 1;
        end
    end
    default: begin
        W_n = 0;
        J_n = 0; 
    end
    endcase
end 
always @* begin
    if(W_n == 7 && J_n == 7)begin
        access_finish_n = 1;
    end
    else begin
        access_finish_n = 0;
    end
end 
always @(posedge CLK) begin
    if(RST) begin
        W <= 0;
        J <= 0;
        for (map_i = 0;map_i < 8; map_i = map_i + 1) begin
            cost_map_A[map_i] <= 7'd0;
            cost_map_B[map_i] <= 7'd0;
            cost_map_C[map_i] <= 7'd0;
            cost_map_D[map_i] <= 7'd0;
            cost_map_E[map_i] <= 7'd0;
            cost_map_F[map_i] <= 7'd0;
            cost_map_G[map_i] <= 7'd0;
            cost_map_H[map_i] <= 7'd0;
        end
        access_finish <= 0;
    end
    else begin
        W <= W_n;
        J <= J_n;
        for (map_i = 0;map_i < 8; map_i = map_i + 1) begin
            cost_map_A[map_i] <= cost_map_A_n[map_i];
            cost_map_B[map_i] <= cost_map_B_n[map_i];
            cost_map_C[map_i] <= cost_map_C_n[map_i];
            cost_map_D[map_i] <= cost_map_D_n[map_i];
            cost_map_E[map_i] <= cost_map_E_n[map_i];
            cost_map_F[map_i] <= cost_map_F_n[map_i];
            cost_map_G[map_i] <= cost_map_G_n[map_i];
            cost_map_H[map_i] <= cost_map_H_n[map_i];
        end
        access_finish <= access_finish_n;
    end
end
*/
//sort
always @* begin
    case(top_state)
    SORT: begin
        case(sort_state)
        get_com: begin
            sort_state_n = get_cost; 
            cost_cnt_n = 0;
            sort_finish_n = 0;
        end
        get_cost: begin
            if(cost_cnt == 7) begin
                sort_state_n = comp_cost; 
                cost_cnt_n = 0;
                sort_finish_n = 0;
            end
            else begin
                sort_state_n = sort_state; 
                cost_cnt_n = cost_cnt + 1;
                sort_finish_n = 0;
            end
        end
        comp_cost: begin
            if(comb_finish) begin 
                sort_state_n = sort_state;
                cost_cnt_n = 0;
                sort_finish_n = 1;
            end 
            else begin
                sort_state_n = get_com;
                cost_cnt_n = 0;
                sort_finish_n = 0;
            end
        end
        default: begin
            sort_state_n = get_com;
            cost_cnt_n = 0;
            sort_finish_n = 0;
        end
        endcase 
    end
    default: begin
        sort_state_n = get_com;
        cost_cnt_n = 0;
        sort_finish_n = 0;
    end
    endcase
end
always @* begin
    case(top_state)
    SORT: begin
        case(sort_state)
        get_com: begin
            if (combination[7] > combination[6]) begin
                comb_finish_n = 0;
                for (j = 0;j < 6;j = j + 1) begin
                    combination_n[j] = combination[j];
                end
                combination_n[6] = combination[7];
                combination_n[7] = combination[6];
            end
            else if (combination[6] > combination[5]) begin
                comb_finish_n = 0;
                for (j = 0;j < 5;j = j + 1) begin
                    combination_n[j] = combination[j];
                end
                if (combination[7] > combination[5]) begin
                    combination_n[5] = combination[7];
                    combination_n[6] = combination[5];
                    combination_n[7] = combination[6];
                end
                else begin
                    combination_n[5] = combination[6];
                    combination_n[6] = combination[7];
                    combination_n[7] = combination[5];
                end
            end
            else if (combination[5] > combination[4]) begin
                comb_finish_n = 0;
                for (j = 0;j < 4;j = j + 1) begin
                    combination_n[j] = combination[j];
                end
                if (combination[7] > combination[4]) begin
                    combination_n[4] = combination[7];
                    combination_n[5] = combination[4];
                    combination_n[6] = combination[6];
                    combination_n[7] = combination[5];
                end
                else if (combination[6] > combination[4]) begin
                    combination_n[4] = combination[6];
                    combination_n[5] = combination[7];
                    combination_n[6] = combination[4];
                    combination_n[7] = combination[5];
                end
                else begin
                    combination_n[4] = combination[5];
                    combination_n[5] = combination[7];
                    combination_n[6] = combination[6];
                    combination_n[7] = combination[4];
                end
            end
            else if (combination[4] > combination[3]) begin
                comb_finish_n = 0;
                for (j = 0;j < 3;j = j + 1) begin
                    combination_n[j] = combination[j];
                end
                if (combination[7] > combination[3]) begin
                    combination_n[3] = combination[7];
                    combination_n[4] = combination[3];
                    combination_n[5] = combination[6];
                    combination_n[6] = combination[5];
                    combination_n[7] = combination[4];
                end
                else if (combination[6] > combination[3]) begin
                    combination_n[3] = combination[6];
                    combination_n[4] = combination[7];
                    combination_n[5] = combination[3];
                    combination_n[6] = combination[5];
                    combination_n[7] = combination[4];
                end
                else if (combination[5] > combination[3]) begin
                    combination_n[3] = combination[5];
                    combination_n[4] = combination[7];
                    combination_n[5] = combination[6];
                    combination_n[6] = combination[3];
                    combination_n[7] = combination[4];
                end
                else begin
                    combination_n[3] = combination[4];
                    combination_n[4] = combination[7];
                    combination_n[5] = combination[6];
                    combination_n[6] = combination[5];
                    combination_n[7] = combination[3];
                end
            end
            else if (combination[3] > combination[2]) begin
                comb_finish_n = 0;
                for (j = 0;j < 2;j = j + 1) begin
                    combination_n[j] = combination[j];
                end
                if (combination[7] > combination[2]) begin
                    combination_n[2] = combination[7];
                    combination_n[3] = combination[2];
                    combination_n[4] = combination[6];
                    combination_n[5] = combination[5];
                    combination_n[6] = combination[4];
                    combination_n[7] = combination[3];
                end
                else if (combination[6] > combination[2]) begin
                    combination_n[2] = combination[6];
                    combination_n[3] = combination[7];
                    combination_n[4] = combination[2];
                    combination_n[5] = combination[5];
                    combination_n[6] = combination[4];
                    combination_n[7] = combination[3];
                end
                else if (combination[5] > combination[2]) begin
                    combination_n[2] = combination[5];
                    combination_n[3] = combination[7];
                    combination_n[4] = combination[6];
                    combination_n[5] = combination[2];
                    combination_n[6] = combination[4];
                    combination_n[7] = combination[3];
                end
                else if (combination[4] > combination[2]) begin
                    combination_n[2] = combination[4];
                    combination_n[3] = combination[7];
                    combination_n[4] = combination[6];
                    combination_n[5] = combination[5];
                    combination_n[6] = combination[2];
                    combination_n[7] = combination[3];
                end
                else begin
                    combination_n[2] = combination[3];
                    combination_n[3] = combination[7];
                    combination_n[4] = combination[6];
                    combination_n[5] = combination[5];
                    combination_n[6] = combination[4];
                    combination_n[7] = combination[2];
                end
            end
            else if (combination[2] > combination[1]) begin
                comb_finish_n = 0;
                combination_n[0] = combination[0];
                if (combination[7] > combination[1]) begin
                    combination_n[1] = combination[7];
                    combination_n[2] = combination[1];
                    combination_n[3] = combination[6];
                    combination_n[4] = combination[5];
                    combination_n[5] = combination[4];
                    combination_n[6] = combination[3];
                    combination_n[7] = combination[2];
                end
                else if (combination[6] > combination[1]) begin
                    combination_n[1] = combination[6];
                    combination_n[2] = combination[7];
                    combination_n[3] = combination[1];
                    combination_n[4] = combination[5];
                    combination_n[5] = combination[4];
                    combination_n[6] = combination[3];
                    combination_n[7] = combination[2];
                end
                else if (combination[5] > combination[1]) begin
                    combination_n[1] = combination[5];
                    combination_n[2] = combination[7];
                    combination_n[3] = combination[6];
                    combination_n[4] = combination[1];
                    combination_n[5] = combination[4];
                    combination_n[6] = combination[3];
                    combination_n[7] = combination[2];
                end
                else if (combination[4] > combination[1]) begin
                    combination_n[1] = combination[4];
                    combination_n[2] = combination[7];
                    combination_n[3] = combination[6];
                    combination_n[4] = combination[5];
                    combination_n[5] = combination[1];
                    combination_n[6] = combination[3];
                    combination_n[7] = combination[2];
                end
                else if (combination[3] > combination[1]) begin
                    combination_n[1] = combination[3];
                    combination_n[2] = combination[7];
                    combination_n[3] = combination[6];
                    combination_n[4] = combination[5];
                    combination_n[5] = combination[4];
                    combination_n[6] = combination[1];
                    combination_n[7] = combination[2];
                end
                else begin
                    combination_n[1] = combination[2];
                    combination_n[2] = combination[7];
                    combination_n[3] = combination[6];
                    combination_n[4] = combination[5];
                    combination_n[5] = combination[4];
                    combination_n[6] = combination[3];
                    combination_n[7] = combination[1];
                end
            end
            else if (combination[1] > combination[0]) begin
                comb_finish_n = 0;
                if (combination[7] > combination[0]) begin
                    combination_n[0] = combination[7];
                    combination_n[1] = combination[0];
                    combination_n[2] = combination[6];
                    combination_n[3] = combination[5];
                    combination_n[4] = combination[4];
                    combination_n[5] = combination[3];
                    combination_n[6] = combination[2];
                    combination_n[7] = combination[1];
                end
                else if (combination[6] > combination[0]) begin
                    combination_n[0] = combination[6];
                    combination_n[1] = combination[7];
                    combination_n[2] = combination[0];
                    combination_n[3] = combination[5];
                    combination_n[4] = combination[4];
                    combination_n[5] = combination[3];
                    combination_n[6] = combination[2];
                    combination_n[7] = combination[1];
                end
                else if (combination[5] > combination[0]) begin
                    combination_n[0] = combination[5];
                    combination_n[1] = combination[7];
                    combination_n[2] = combination[6];
                    combination_n[3] = combination[0];
                    combination_n[4] = combination[4];
                    combination_n[5] = combination[3];
                    combination_n[6] = combination[2];
                    combination_n[7] = combination[1];
                end
                else if (combination[4] > combination[0]) begin
                    combination_n[0] = combination[4];
                    combination_n[1] = combination[7];
                    combination_n[2] = combination[6];
                    combination_n[3] = combination[5];
                    combination_n[4] = combination[0];
                    combination_n[5] = combination[3];
                    combination_n[6] = combination[2];
                    combination_n[7] = combination[1];
                end
                else if (combination[3] > combination[0]) begin
                    combination_n[0] = combination[3];
                    combination_n[1] = combination[7];
                    combination_n[2] = combination[6];
                    combination_n[3] = combination[5];
                    combination_n[4] = combination[4];
                    combination_n[5] = combination[0];
                    combination_n[6] = combination[2];
                    combination_n[7] = combination[1];
                end
                else if (combination[2] > combination[0]) begin
                    combination_n[0] = combination[2];
                    combination_n[1] = combination[7];
                    combination_n[2] = combination[6];
                    combination_n[3] = combination[5];
                    combination_n[4] = combination[4];
                    combination_n[5] = combination[3];
                    combination_n[6] = combination[0];
                    combination_n[7] = combination[1];
                end
                else begin
                    combination_n[0] = combination[1];
                    combination_n[1] = combination[7];
                    combination_n[2] = combination[6];
                    combination_n[3] = combination[5];
                    combination_n[4] = combination[4];
                    combination_n[5] = combination[3];
                    combination_n[6] = combination[2];
                    combination_n[7] = combination[0];
                end
            end
            else begin
                comb_finish_n = 1;
                for (j = 0;j < 8;j = j + 1) begin
                    combination_n[j] = combination[j];
                end
            end
        end
        default: begin
            comb_finish_n = comb_finish;
            for (j = 0;j < 8;j = j + 1) begin
                combination_n[j] = combination[j];
            end
        end
        endcase
    end
    default: begin
        comb_finish_n = 0;
        for (j = 0;j < 8;j = j + 1) begin
            combination_n[j] = combination[j];
        end
    end
    endcase
end
always @* begin
    case(top_state)
    SORT: begin
        case(sort_state)
            get_com: begin
                W_n = 0;
                J_n = combination_n[0];
            end
            get_cost: begin
                if(W < 8) begin
                    W_n = W + 1;
                    J_n = combination[W_n];
                end
                else begin
                    W_n = 0;
                    J_n = combination[0];
                end
            end
            comp_cost: begin
                W_n = 0;
                J_n = combination_n[0]; 
            end
            default: begin
                W_n = 0;
                J_n = combination_n[0]; 
            end
        endcase
    end
    default: begin
        W_n = 0;
        J_n = combination_n[0];
    end
    endcase
end
always @* begin
    case(top_state)
    SORT: begin
        case(sort_state)
            get_com: begin
                now_cost_n = 0;
            end
            get_cost: begin
                now_cost_n = now_cost + Cost;
            end
            comp_cost: begin
                now_cost_n = now_cost; 
            end
            default: begin
                now_cost_n = now_cost; 
            end
        endcase
    end 
    default: begin
        now_cost_n = now_cost;
    end
    endcase
end
always @* begin
    case(top_state)
    SORT: begin
        case(sort_state)
            get_com: begin
                MinCost_n = MinCost;
                MatchCount_n = MatchCount;
            end
            get_cost: begin
                MinCost_n = MinCost;
                MatchCount_n = MatchCount;
            end
            comp_cost: begin
                if(now_cost < MinCost) begin
                    MinCost_n = now_cost;
                    MatchCount_n = 1; 
                end
                else if (now_cost == MinCost) begin
                    MinCost_n = MinCost;
                    MatchCount_n = MatchCount + 1;
                end
                else begin
                    MinCost_n = MinCost;
                    MatchCount_n = MatchCount; 
                end 
            end
            default: begin
                MinCost_n = MinCost;
                MatchCount_n = MatchCount;
            end
        endcase
        
    end 
    default: begin
        MinCost_n = MinCost;
        MatchCount_n = MatchCount;
    end
    endcase
end
always @(posedge CLK) begin
    if (RST) begin
        sort_state <= get_com;
        combination[0] <= 3'D0;
        combination[1] <= 3'D1;
        combination[2] <= 3'D2;
        combination[3] <= 3'D3;
        combination[4] <= 3'D4;
        combination[5] <= 3'D5;
        combination[6] <= 3'D6;
        combination[7] <= 3'D7;
        MinCost <= ~10'D0;
        MatchCount <= 0;
        comb_finish <= 0;
        sort_finish <= 0;
        now_cost <= 0;
        cost_cnt <= 0;
        W <= 0;
        J <= 0;
    end
    else begin
        sort_state <= sort_state_n;
        for (j = 0;j < 8;j = j + 1) begin
            combination[j] <= combination_n[j];
        end
        MinCost <= MinCost_n;
        MatchCount <= MatchCount_n;
        comb_finish <= comb_finish_n;
        sort_finish <= sort_finish_n;
        now_cost <= now_cost_n;
        cost_cnt <= cost_cnt_n;
        W <= W_n;
        J <= J_n;
    end
end
//output
always @(posedge CLK) begin
    if (RST) begin
        Valid <= 0;
    end
    else if(top_state == OUTPUT) begin
        Valid <= 1;
    end
    else begin
        Valid <= 0;
    end
end
endmodule


