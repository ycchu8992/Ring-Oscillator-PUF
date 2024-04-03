## This file is a general .xdc for the Basys3 rev B board
## To use it in a project:
## - uncomment the lines corresponding to used pins
##   (if you are using the editor in Vivado, you can select lines and hit "Ctrl + /" to comment/uncomment.)
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

# Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]
    set_property IOSTANDARD LVCMOS33 [get_ports clk]
    create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]

## Don't Touch
# set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
# set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
# set_property CONFIG_MODE SPIx4 [current_design]
# set_property BITSTREAM.CONFIG.CONFIGRATE 33 [current_design]

## where 3.3 is the voltage provided to configuration bank 0
    set_property CONFIG_VOLTAGE 3.3 [current_design]
## where value1 is either VCCO(for Vdd=3.3) or GND(for Vdd=1.8)
    set_property CFGBVS VCCO [current_design]