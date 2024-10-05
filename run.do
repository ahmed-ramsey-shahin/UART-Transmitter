vlib work
vlog *.*v
vsim -voptargs=+acc work.UART_TX_Tb
do wave.do
run -all
