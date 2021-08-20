PROJECT = led
vendor = xilinx
family = spartan6
PART = xc6slx16-ftg256-2
top_module = led

vhdfiles = ../src/led.vhd

all:
	xst -ifn ../src/implement.ifn -ofn implement.log
	ngdbuild -p $(PART) -uc ../src/$(PROJECT).ucf $(PROJECT) -sd .
	map -w -pr b $(PROJECT).ngd -o $(PROJECT).ncd $(PROJECT).pcf
	par -ol std -w $(PROJECT).ncd $(PROJECT)_routed $(PROJECT).pcf
#	trce -v 10 $(PROJECT)_routed.ncd $(PROJECT).pcf
	bitgen -w -b -g UnusedPin:Pullnone -g compress -g Reset_on_err:Yes -g configrate:26 -g spi_buswidth:1 -g startupclk:cclk -g binary:yes $(PROJECT)_routed.ncd $(PROJECT)_routed $(PROJECT).pcf
clean:
	find . -type f -not -name 'Makefile' | xargs rm
	rm -rf xlnx_auto_0_xdb  _xmsgs  xst_work
