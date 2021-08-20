# omdazz
omdazz spartan-6 board examples

https://de.aliexpress.com/item/32801899786.html

## led

Stupid blinking leds, just to verify toolchain.

## Building on linux

xilinx ise env must be sourced and makefile is in build directory.

Example:
```
. /home/opt/Xilinx/14.5/ISE_DS/settings64.sh
cd build
make
```

## Load to board

I use a raspberry pi for that task with urjtag 

https://github.com/stappersg/urjtag

rp gpios must be connected to omdazz fitting to the cable options ( numbers are gpio nubmbers not pin numbers)

```
cable gpio tms=25 tdi=7 tdo=8 tck=24
Initializing GPIO JTAG Chain
jtag> detect
IR length: 6
Chain length: 1
Device Id: 01000100000000000010000010010011 (0x44002093) 
  Manufacturer: Xilinx (0x093)
  Part(0):      xc6slx16 (0x4002)
  Unknown stepping! (0100) (/usr/local/share/urjtag/xilinx/xc6slx16/STEPPINGS)
```

This can be fixed by

adding ```0100	xc6slx16	4``` into /usr/local/share/urjtag/xilinx/xc6slx16/STEPPINGS

( Is unknowen if this is the correct way to fix this - thats why not commited into urjtag)
