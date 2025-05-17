module ALU_1(
    input [3:0] A,B,
    input [2:0] sel,
    output [3:0] Y
);

reg [3:0] result;

always @ (*) begin
    case (sel)
            3'b000: result = A+B;
            3'b001: result = A-B;
            3'b010: result = A&B;
            3'b011: result = A|B;
            3'b100: result = ~A;
            3'b101: result = ~(A&B);
            default: result = 0;
    endcase
end
assign Y = result;
endmodule

module ALU_2(
    input [3:0] A,B,
    input [2:0] sel,
    output [3:0] Y
);

reg [3:0] result;

always @ (*) begin
    case (sel)
            3'b000: result = A+B;
            3'b001: result = A-B;
            3'b010: result = A&B;
            3'b011: result = A|B;
            3'b100: result = ~A;
            3'b101: result = ~(A&B);
            3'b110: result = (A<<1);
            3'b111: result = (A>>1);
            default: result = 0;
    endcase
end
assign Y = result;
endmodule

module ALU_3(
    input [3:0] A,B,
    input [2:0] sel,
    output [3:0] Y
);

reg [3:0] result;

always @ (*) begin
    case (sel)
            3'b000: result = A+B;
            3'b001: result = A-B;
            3'b010: result = A&B;
            3'b011: result = A|B;
            3'b100: result = ~A;
            3'b101: result = ~(A&B);
            3'b110:
                    if(B>4) 
                        result = (A<<4);
                    else
                        result = (A<<B);
            3'b111: 
                    if(B>4)
                        result = (A>>4);
                    else 
                        result = (A>>B);
            default: result = 0;
    endcase
end
assign Y = result;
endmodule

module ALU_4(
    input [3:0] A,B,
    input [2:0] sel,
    output C_out,Z_out,N_out,
    output [3:0] Y
);

reg [3:0] result;
reg C,Z,N;
always @ (*) begin
    case (sel)
            3'b000: 
                begin
                    result = A+B;
                    if((A+B) > 15)
                    begin
                        C=1'b1;
                        Z=1'b0;
                        N=1'b0;
                    end
                    else if ((A+B) <0)
                    begin
                        C=1'b0;
                        Z=1'b0;
                        N=1'b1;
                    end
                    else if(result == 0)
                    begin
                        C=1'b0;
                        Z=1'b1;
                        N=1'b0;
                    end
                    else begin
                        C=1'b0;
                        Z=1'b0;
                        N=1'b0;
                    end
                end
            3'b001:
                begin
                    result = A-B;
                    if((B) > A)
                    begin
                        C=1'b1;
                        Z=1'b0;
                        N=1'b1;
                    end
                    else if ((A-B)==0)
                    begin
                        C=1'b0;
                        Z=1'b1;
                        N=1'b0;
                    end
                    else begin
                        C=1'b0;
                        Z=1'b0;
                        N=1'b0;
                    end

                end 
            3'b010: 
                begin
                    result = A&B;
                    if(result ==0)
                    begin
                        C=1'b0;
                        Z=1'b1;
                        N=1'b0;
                    end
                    else begin
                        C=1'b0;
                        Z=1'b0;
                        N=1'b0;
                    end
                end
            3'b011: 
            begin
                result = A|B;
                if(result ==0)
                begin
                    C=1'b0;
                    Z=1'b1;
                    N=1'b0;
                end
                else begin
                    C=1'b0;
                    Z=1'b0;
                    N=1'b0;
                end
            end
            3'b100: 
            begin
                result = ~A;
                if(result ==0)
                begin
                    C=1'b0;
                    Z=1'b1;
                    N=1'b0;
                end
                else begin
                    C=1'b0;
                    Z=1'b0;
                    N=1'b0;
                end
            end
            3'b101: 
            begin
                result = ~(A&B);
                if(result ==0)
                begin
                    C=1'b0;
                    Z=1'b1;
                    N=1'b0;
                end
                else begin
                    C=1'b0;
                    Z=1'b0;
                    N=1'b0;
                end
            end
            3'b110:
                    if(B>=4)
                    begin 
                        result = (A<<4);
                        C=1'b0;
                        Z=1'b1;
                        N=1'b0;
                    end
                    else
                    begin
                        result = (A<<B);
                        C=1'b0;
                        Z=1'b0;
                        N=1'b0;
                    end
            3'b111: 
                    if(B>=4)
                    begin
                        result = (A>>4);
                        C=1'b0;
                        Z=1'b1;
                        N=1'b0;
                    end
                    else 
                    begin
                        result = (A>>B);
                        C=1'b0;
                        Z=1'b0;
                        N=1'b0;
                    end
            default:
            begin 
                result = 0;
                C=1'b0;
                Z=1'b0;
                N=1'b0;
            end
    endcase
end
assign Y = result;
assign C_out = C;
assign Z_out = Z;
assign N_out = N;
endmodule


module ALU_5(
    input [3:0] A,B,
    input [3:0] sel,
    output C_out,Z_out,N_out,
    output [3:0] Y
);

reg [3:0] result;
reg C,Z,N;
always @ (*) begin
    case (sel)
            4'b0000: 
                begin
                    result = A+B;
                    if((A+B) > 15)
                    begin
                        C=1'b1;
                        Z=1'b0;
                        N=1'b0;
                    end
                    else if ((A+B) <0)
                    begin
                        C=1'b0;
                        Z=1'b0;
                        N=1'b1;
                    end
                    else if(result == 0)
                    begin
                        C=1'b0;
                        Z=1'b1;
                        N=1'b0;
                    end
                    else begin
                        C=1'b0;
                        Z=1'b0;
                        N=1'b0;
                    end
                end
            4'b0001:
                begin
                    result = A-B;
                    if((B) > A)
                    begin
                        C=1'b1;
                        Z=1'b0;
                        N=1'b1;
                    end
                    else if ((A-B)==0)
                    begin
                        C=1'b0;
                        Z=1'b1;
                        N=1'b0;
                    end
                    else begin
                        C=1'b0;
                        Z=1'b0;
                        N=1'b0;
                    end

                end 
            4'b0010: 
                begin
                    result = A&B;
                    if(result ==0)
                    begin
                        C=1'b0;
                        Z=1'b1;
                        N=1'b0;
                    end
                    else begin
                        C=1'b0;
                        Z=1'b0;
                        N=1'b0;
                    end
                end
            4'b0011: 
            begin
                result = A|B;
                if(result ==0)
                begin
                    C=1'b0;
                    Z=1'b1;
                    N=1'b0;
                end
                else begin
                    C=1'b0;
                    Z=1'b0;
                    N=1'b0;
                end
            end
            4'b0100: 
            begin
                result = ~A;
                if(result ==0)
                begin
                    C=1'b0;
                    Z=1'b1;
                    N=1'b0;
                end
                else begin
                    C=1'b0;
                    Z=1'b0;
                    N=1'b0;
                end
            end
            4'b0101: 
            begin
                result = ~(A&B);
                if(result ==0)
                begin
                    C=1'b0;
                    Z=1'b1;
                    N=1'b0;
                end
                else begin
                    C=1'b0;
                    Z=1'b0;
                    N=1'b0;
                end
            end
            4'b0110:
                    if(B>=4)
                    begin 
                        result = (A<<4);
                        C=1'b0;
                        Z=1'b1;
                        N=1'b0;
                    end
                    else
                    begin
                        result = (A<<B);
                        C=1'b0;
                        Z=1'b0;
                        N=1'b0;
                    end
            4'b0111: 
                    if(B>=4)
                    begin
                        result = (A>>4);
                        C=1'b0;
                        Z=1'b1;
                        N=1'b0;
                    end
                    else 
                    begin
                        result = (A>>B);
                        C=1'b0;
                        Z=1'b0;
                        N=1'b0;
                    end
            4'b1000:
                    begin
                        result = A^B;
                        if(result ==0)
                        begin
                            C=1'b0;
                            Z=1'b1;
                            N=1'b0;
                        end
                        else begin
                            C=1'b0;
                            Z=1'b0;
                            N=1'b0;
                        end
                    end
            4'b1001:
                begin
                    result = A ~^ B;
                    if(result ==0)
                        begin
                            C=1'b0;
                            Z=1'b1;
                            N=1'b0;
                        end
                    else begin
                            C=1'b0;
                            Z=1'b0;
                            N=1'b0;
                    end
                end

            default:
            begin 
                result = 0;
                C=1'b0;
                Z=1'b0;
                N=1'b0;
            end
    endcase
end
assign Y = result;
assign C_out = C;
assign Z_out = Z;
assign N_out = N;
endmodule