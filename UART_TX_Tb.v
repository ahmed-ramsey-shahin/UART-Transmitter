`timescale 1ns/1ps

module UART_TX_Tb ();
    reg         CLK_tb;
    reg         RST_tb;
    reg         Data_Valid_tb;
    reg  [7:0]  P_DATA_tb;
    reg         PAR_EN_tb;
    reg         PAR_TYP_tb;
    reg         deactivate_valid;
    reg  [10:0] outputs;
    wire        TX_OUT_tb;
    wire        busy_tb;

    UART_TX DUT (
        .CLK(CLK_tb),
        .RST(RST_tb),
        .Data_Valid(Data_Valid_tb),
        .P_DATA(P_DATA_tb),
        .PAR_EN(PAR_EN_tb),
        .PAR_TYP(PAR_TYP_tb),
        .TX_OUT(TX_OUT_tb),
        .busy(busy_tb)
    );

    always #2.5 CLK_tb = ~CLK_tb;

    initial begin
        reset();
        // Test Case  1 (Data is not valid)
        test_case_01();
        $display("*********************************************************************************");
        
        // Test Case  2 (Data is valid & No parrity & No parrity & Valid always active)
        test_case_02();
        $display("*********************************************************************************");
        // Test Case  3 (Data is valid & Even parrity & No parrity & Valid always active)
        test_case_03();
        $display("*********************************************************************************");
        // Test Case  4 (Data is valid & Odd parrity & No parrity & Valid always active)
        test_case_04();
        $display("*********************************************************************************");
        $display("Repeating Test Case  1 again to validate that everything is fine");
        // Test Case  1 (Data is not valid)
        test_case_01();
        $display("*********************************************************************************");
        // Test Case  5 (Data is valid & Even parrity & Valid not always active)
        test_case_05();
        $stop;
    end
    
    task reset;
        begin
            CLK_tb           = 1'b0;
            RST_tb           = 1'b0;
            P_DATA_tb        = 8'd0;
            Data_Valid_tb    = 1'b0;
            PAR_EN_tb        = 1'b0;
            PAR_TYP_tb       = 1'b0;
            outputs          = 8'd0;
            deactivate_valid = 1'b0;
            #2 RST_tb        = 1'b1;
        end
    endtask

    task save_outputs;
        input is_parity_included;
        integer i;
        integer iterations;
        begin
            iterations = 10;

            if (is_parity_included) begin
                iterations = 11;
            end

            @(negedge CLK_tb) outputs[10] = TX_OUT_tb;

            for (i = 2; i < 10; i = i + 1) begin
                @(negedge CLK_tb) outputs[i] = TX_OUT_tb;
            end

            if (is_parity_included) begin
                @(negedge CLK_tb) outputs[1] = TX_OUT_tb;
                @(negedge CLK_tb) outputs[0] = TX_OUT_tb;
            end
            else begin
                @(negedge CLK_tb) outputs[1] = TX_OUT_tb;
            end
        end
    endtask

    task validate_output_and_print;
        input [10:0]  actual_output;
        input [10:0]  expected_output;
        input integer test_case_number;
        input         ten_bit_flag;
        reg           error_flag;
        begin
            error_flag = ~((ten_bit_flag ? actual_output[10:1] : actual_output) == (ten_bit_flag ? expected_output[10:1] : expected_output));
            $display(
                "Test Case %2d %s Actual Output = %11b, Expected Output = %11b",
                test_case_number, (error_flag ? "Failed" : "Passed"),
                (ten_bit_flag ? actual_output[10:1] : actual_output),
                (ten_bit_flag ? expected_output[10:1] : expected_output)
            );
        end
    endtask

    task test_case_01;
        begin
            @(negedge CLK_tb) Data_Valid_tb = 1'b0;
            $display("Test Case  1 (Data is not valid)");
            save_outputs(0);
            @(negedge CLK_tb);
            validate_output_and_print(outputs[10:1], 10'b1111111111, 1, 1);
        end
    endtask

    task test_case_02;
        begin
            @(negedge CLK_tb) Data_Valid_tb = 1'b1;
            PAR_EN_tb = 1'b0;
            P_DATA_tb = {$random} %(2**8);
            save_outputs(0);
            @(negedge CLK_tb) Data_Valid_tb = 1'b0;
            $display("Test Case  2 (Data is valid & No parrity & Valid always active)");
            @(negedge CLK_tb);
            validate_output_and_print(outputs[10:1], {1'b0, P_DATA_tb, 1'b1}, 2, 1);
        end
    endtask

    task test_case_03;
        begin
            @(negedge CLK_tb) Data_Valid_tb = 1'b1;
            PAR_EN_tb  = 1'b1;
            PAR_TYP_tb = 1'b0;
            P_DATA_tb = {$random} %(2**8);
            save_outputs(1);
            @(negedge CLK_tb) Data_Valid_tb = 1'b0;
            $display("Test Case  3 (Data is valid & Even parrity & Valid always active)");
            @(negedge CLK_tb);
            validate_output_and_print(outputs[10:0], {1'b0, P_DATA_tb, ^P_DATA_tb, 1'b1}, 3, 0);
        end
    endtask

    task test_case_04;
        begin
            @(negedge CLK_tb) Data_Valid_tb = 1'b1;
            PAR_EN_tb  = 1'b1;
            PAR_TYP_tb = 1'b1;
            P_DATA_tb = {$random} %(2**8);
            save_outputs(1);
            @(negedge CLK_tb) Data_Valid_tb = 1'b0;
            $display("Test Case  4 (Data is valid & Odd parrity & Valid always active)");
            @(negedge CLK_tb);
            validate_output_and_print(outputs[10:0], {1'b0, P_DATA_tb, ~^P_DATA_tb, 1'b1}, 4, 0);
        end
    endtask

    task test_case_05;
        begin
            @(negedge CLK_tb) Data_Valid_tb = 1'b1;
            PAR_EN_tb  = 1'b1;
            PAR_TYP_tb = 1'b0;
            P_DATA_tb = {$random} %(2**8);
            deactivate_valid = 1'b1;
            save_outputs(1);
            $display("Test Case  5 (Data is valid & Even parrity & Valid not always active)");
            @(negedge CLK_tb);
            validate_output_and_print(outputs[10:0], {1'b0, P_DATA_tb, ^P_DATA_tb, 1'b1}, 5, 0);
        end
    endtask

    always @(*) begin
        if (deactivate_valid) begin
            @(negedge CLK_tb) Data_Valid_tb = 1'b0;
        end
    end
endmodule
