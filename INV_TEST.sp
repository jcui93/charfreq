*NETLIST OF 32NM CMOS INVERTER CHAIN

.include "corners"

*Inverter
.macro  inv     in      out     vdd     vbp     vbn     size=1
m1      out     in      vdd     vbp     pfet    l=28n   w='160n*size'
m2      out	in      0       vbn     nfet    l=28n   w='80n*size'
.eom

*Chain
xinv0   in      out0    vdd     vbp     vbn     inv     size=1
xinv1   out0    out1    vdd     vbp     vbn     inv     size=4
xinv2   out1    out2    vdd     vbp     vbn     inv     size=16
xinv3   out2    out3    vdd     vbp     vbn     inv     size=64
xinv4   out3    out4    vdd     vbp     vbn     inv     size=128
xinv5   out3    out4    vdd     vbp     vbn     inv     size=128

*Output Capacitance
cl0   	out0   	gnd     5f
cl1  	out1   	gnd     5f
cl2   	out2   	gnd     5f
cl3   	out3   	gnd     5f
cl4   	out4   	gnd     5f

*Source
vdd     vdd     0       0.9
vin     in      0       0       pulse   0       0.9     0       10p     10p     500p    1.0n
vbp     vbp     vdd     1.000
vbn     0       vbn     1.000

*Transient Analysis
.tran   0.2p      1n

*Print
.option post
.print  tran    v(in)   v(out2) v(vbn)  v(vbp)  i1(xinv3.m1)    i4(xinv3.m1)    i(vin)

*End
.end
