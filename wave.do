onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group UART_TX_Tb /UART_TX_Tb/CLK_tb
add wave -noupdate -expand -group UART_TX_Tb -color Magenta /UART_TX_Tb/RST_tb
add wave -noupdate -expand -group UART_TX_Tb /UART_TX_Tb/Data_Valid_tb
add wave -noupdate -expand -group UART_TX_Tb /UART_TX_Tb/P_DATA_tb
add wave -noupdate -expand -group UART_TX_Tb /UART_TX_Tb/PAR_EN_tb
add wave -noupdate -expand -group UART_TX_Tb /UART_TX_Tb/PAR_TYP_tb
add wave -noupdate -expand -group UART_TX_Tb /UART_TX_Tb/deactivate_valid
add wave -noupdate -expand -group UART_TX_Tb -color {Cornflower Blue} /UART_TX_Tb/outputs
add wave -noupdate -expand -group UART_TX_Tb -color Orange /UART_TX_Tb/TX_OUT_tb
add wave -noupdate -expand -group UART_TX_Tb -color Gray70 /UART_TX_Tb/busy_tb
add wave -noupdate -expand -group UART_TX /UART_TX_Tb/DUT/P_DATA
add wave -noupdate -expand -group UART_TX /UART_TX_Tb/DUT/CLK
add wave -noupdate -expand -group UART_TX -color Magenta /UART_TX_Tb/DUT/RST
add wave -noupdate -expand -group UART_TX /UART_TX_Tb/DUT/Data_Valid
add wave -noupdate -expand -group UART_TX /UART_TX_Tb/DUT/PAR_EN
add wave -noupdate -expand -group UART_TX /UART_TX_Tb/DUT/PAR_TYP
add wave -noupdate -expand -group UART_TX -color Orange /UART_TX_Tb/DUT/TX_OUT
add wave -noupdate -expand -group UART_TX -color Gray70 /UART_TX_Tb/DUT/busy
add wave -noupdate -expand -group UART_TX /UART_TX_Tb/DUT/mux_sel
add wave -noupdate -expand -group UART_TX /UART_TX_Tb/DUT/ser_done
add wave -noupdate -expand -group UART_TX /UART_TX_Tb/DUT/ser_data
add wave -noupdate -expand -group UART_TX /UART_TX_Tb/DUT/par_bit
add wave -noupdate -expand -group UART_TX /UART_TX_Tb/DUT/ser_en
add wave -noupdate -expand -group counter /UART_TX_Tb/DUT/serializer/counter/CLK
add wave -noupdate -expand -group counter -color Magenta /UART_TX_Tb/DUT/serializer/counter/RST
add wave -noupdate -expand -group counter /UART_TX_Tb/DUT/serializer/counter/en
add wave -noupdate -expand -group counter /UART_TX_Tb/DUT/serializer/counter/done
add wave -noupdate -expand -group counter /UART_TX_Tb/DUT/serializer/counter/counter
add wave -noupdate -expand -group serializer /UART_TX_Tb/DUT/serializer/CLK
add wave -noupdate -expand -group serializer -color Magenta /UART_TX_Tb/DUT/serializer/RST
add wave -noupdate -expand -group serializer /UART_TX_Tb/DUT/serializer/ser_en
add wave -noupdate -expand -group serializer /UART_TX_Tb/DUT/serializer/Data_Valid
add wave -noupdate -expand -group serializer -color Gray70 /UART_TX_Tb/DUT/serializer/busy
add wave -noupdate -expand -group serializer /UART_TX_Tb/DUT/serializer/P_DATA
add wave -noupdate -expand -group serializer /UART_TX_Tb/DUT/serializer/ser_done
add wave -noupdate -expand -group serializer /UART_TX_Tb/DUT/serializer/ser_data
add wave -noupdate -expand -group serializer /UART_TX_Tb/DUT/serializer/registered_data
add wave -noupdate -expand -group serializer /UART_TX_Tb/DUT/serializer/i
add wave -noupdate -expand -group FSM /UART_TX_Tb/DUT/fsm/CLK
add wave -noupdate -expand -group FSM -color Magenta /UART_TX_Tb/DUT/fsm/RST
add wave -noupdate -expand -group FSM /UART_TX_Tb/DUT/fsm/ser_done
add wave -noupdate -expand -group FSM /UART_TX_Tb/DUT/fsm/PAR_EN
add wave -noupdate -expand -group FSM /UART_TX_Tb/DUT/fsm/Data_Valid
add wave -noupdate -expand -group FSM /UART_TX_Tb/DUT/fsm/mux_sel
add wave -noupdate -expand -group FSM /UART_TX_Tb/DUT/fsm/ser_en
add wave -noupdate -expand -group FSM -color Gray70 /UART_TX_Tb/DUT/fsm/busy
add wave -noupdate -expand -group FSM -color {Slate Blue} /UART_TX_Tb/DUT/fsm/current_state
add wave -noupdate -expand -group FSM -color Yellow /UART_TX_Tb/DUT/fsm/next_state
add wave -noupdate -expand -group par_calc /UART_TX_Tb/DUT/par_calc/CLK
add wave -noupdate -expand -group par_calc -color Magenta /UART_TX_Tb/DUT/par_calc/RST
add wave -noupdate -expand -group par_calc /UART_TX_Tb/DUT/par_calc/Data_Valid
add wave -noupdate -expand -group par_calc /UART_TX_Tb/DUT/par_calc/PAR_TYP
add wave -noupdate -expand -group par_calc /UART_TX_Tb/DUT/par_calc/P_DATA
add wave -noupdate -expand -group par_calc /UART_TX_Tb/DUT/par_calc/par_bit
add wave -noupdate -expand -group mux /UART_TX_Tb/DUT/mux/mux_sel
add wave -noupdate -expand -group mux /UART_TX_Tb/DUT/mux/ser_data
add wave -noupdate -expand -group mux /UART_TX_Tb/DUT/mux/par_bit
add wave -noupdate -expand -group mux /UART_TX_Tb/DUT/mux/out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {170000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {409500 ps}
