; Configuration file for BTT SKR 3 (firmware version 3)
; executed by the firmware on start-up
;

; General preferences
G90                                          ; send absolute coordinates...
M83                                          ; ...but relative extruder moves
M550 P"SKR 3"                                ; set printer name

; Network
M552 S1                                      ; enable network
M586 P0 S1                                   ; enable HTTP
M586 P1 S0                                   ; disable FTP
M586 P2 S0                                   ; disable Telnet

; Drives
M569 P0 S0                                   ; physical drive 0 goes forwards using default driver timings
M569 P1 S0                                   ; physical drive 1 goes forwards using default driver timings
M569 P2 S0                                   ; physical drive 2 goes forwards using default driver timings
M569 P3 S0                                   ; physical drive 3 goes forwards using default driver timings
M569 P3 S0                                   ; physical drive 4 goes forwards using default driver timings
M584 X0 Y1 Z2 E3:4                           ; set drive mapping
M350 X16 Y16 Z16 E16 I1                      ; configure microstepping with interpolation
M92 X80.00 Y80.00 Z400.00 E93.00             ; set steps per mm
M566 X900.00 Y900.00 Z60.00 E120.00          ; set maximum instantaneous speed changes (mm/min)
M203 X6000.00 Y6000.00 Z180.00 E1200.00      ; set maximum speeds (mm/min)
M201 X500.00 Y500.00 Z20.00 E250.00          ; set accelerations (mm/s^2)
M906 X800 Y800 Z800 E800 I30                 ; set motor currents (mA) and motor idle factor in per cent
M84 S30                                      ; Set idle timeout

; Axis Limits
M208 X0 Y0 Z0 S1                             ; set axis minima
M208 X235 Y235 Z270 S0                       ; set axis maxima

; Endstops
M574 X1 S1 P"xstop"                            ; configure switch-type (e.g. microswitch) endstop for low end on X via pin xstop
M574 Y1 S1 P"ystop"                            ; configure switch-type (e.g. microswitch) endstop for low end on Y via pin ystop
M574 Y1 S1 P"zstop"                            ; configure switch-type (e.g. microswitch) endstop for low end on Z via pin zstop

; Z-Probe
M950 S0 C"servo0"                              ; create servo pin 0 for BLTouch
M558 P9 C"^probe" H5 F120 T6000                ; set Z probe type to bltouch and the dive height + speeds
G31 P500 X-40 Y-10 Z2.95                       ; set Z probe trigger value, offset and trigger height
M557 X10:210 Y10:210 S40                       ; define mesh grid

; Heaters
M308 S0 P"bedtemp" Y"thermistor" T100000 B3950 ; configure sensor 0 as thermistor on pin bedtemp
M950 H0 C"bed" T0                              ; create bed heater output on bed and map it to sensor 0
M140 H0                                        ; map heated bed to heater 0
M143 H0 S120                                   ; set temperature limit for heater 0 to 120C

; T0 = Ext0
M308 S1 P"e0temp" Y"thermistor" T100000 B3950  ; configure sensor 1 as thermistor on pin e0temp
M950 H1 C"e0heat" T1                           ; create nozzle heater output on e0heat and map it to sensor 1
M307 H1 B0 S1.00                               ; disable bang-bang mode for heater  and set PWM limit
M143 H1 S280                                   ; set temperature limit for heater 1 to 280C

; T1
M308 S2 P"e1temp" Y"thermistor" T100000 B3950
M950 H2 C"e1heat" T2 
M307 H2 B0 S1.00
M143 H2 S300

; Fans
M950 F0 C"fan0" Q500                           ; create fan 0 on pin fan0 and set its frequency
M106 P0 S0 H-1                                 ; set fan 0 value. Thermostatic control is turned off
M950 F1 C"fan1" Q500
M106 P1 S0 H-1
M950 F2 C"fan2" Q500
M106 P2 S0 H-1

; Tools
M563 P0 D0 H1 F0 S"Ext0"                       ; define tool 0
G10 P0 X0 Y0 Z0 S0 R0                          ; set tool 0 axis offsets

M563 P1 D1 H2 F1 S"Ext1"
G10 P1 X0 Y0 Z0 S0 R0

; Custom settings are not defined
;M575 P1 S1 B57600                              ; enable support for PanelDue
M575 P1 S2 B57600

; Miscellaneous
M501                                         ; load saved parameters from non-volatile memory
