module mux_8to1_t ();

    parameter DELAY = 5;

    reg [7:0] in;
    reg [2:0] sel;
    wire mux_out;

    //====================================
    // TODO: Connect your module here. Please connect it by port name but not order
    MUX_8to1 name_of_chip(.a (in[0]),.b (in[1]),.c (in[2]),.d (in[3]),.e (in[4]),.f (in[5]),.g (in[6]),.h (in[7]),.sel (sel),.mux_out (mux_out));
    //====================================

    integer i, error_count;
    initial begin

        $display("===== Simulation ======");

        error_count = 0;

        for(i = 0 ; i < 8 ; i = i + 1) begin
            
            sel = i[2:0];

            
            if(i==0)begin
                in = 7'b1;
            end

            #DELAY;

            if(mux_out !== 1'b1) begin

                $display("[ERROR] sel = %b,  mux_out = %b, correct mux_out should be %b",
                    sel, mux_out, 1'b1);
                error_count = error_count + 1;
            end
            else begin
                $display("[CORRECT] sel = %b,  mux_out = %b", sel, mux_out);
            end

            /*
            if(mux_out !== test_mux_out(sel)) begin

                $display("[ERROR] sel = %b,  mux_out = %b, correct mux_out should be %b",
                    sel, mux_out, test_mux_out(sel));
                error_count = error_count + 1;
            end
            else begin
                $display("[CORRECT] sel = %b,  mux_out = %b", sel, mux_out);
            end
            */
            in = in<<1;
        end

        if(error_count === 0)
            $display("All Correct!!");
        else    
            $display("There are %d errors QQ", error_count);


        $finish;
    end

    /*
    // TODO
    function test_mux_out;
        input [2:0] sel;
        begin
            if(sel[3] === 1)
                test_mux_out = 4'b1000;
            else if(sel[2] === 1)
                test_mux_out = 4'b0100;
            else if(sel[1] === 1)
                test_mux_out = 4'b0010;
            else if(request[0] === 1)
                test_mux_out = 4'b0001;
            else
                test_mux_out = 4'b0000;
        end
    endfunction
    */
    //====================================

endmodule
