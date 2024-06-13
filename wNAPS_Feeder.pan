ground electrical gnd

parameter FAC=0.6 TYPE=53 F0=50 TSTOP=50+1*150 FAULT=2 SAMAN=0

options outintnodes=yes  seed=19041962

AlL alter group="ph3load" param="type" value=0 annotate=0

Dc dc nettype=1 sparse=2 vreltol=1m vabstol=1m ireltol=1m iabstol=1u

Tr tran nettype=1 stop=TSTOP partitioner=1 acntrl=3 ltefactor=1k \
            method=2 maxord=2 sparse=2 iabstol=1u devvars=yes \
	    tmax=[FAULT-1m,1m,FAULT+1m] tinc=0.5 saman=SAMAN \
	    keepmatrixorder=yes chgcheck=no forcetps=no timepoints=100m \
	    annotate=6 savelist=["omega","pss","ex","dt","tap",
	          "X1.FI1:P","X1.FI2:P","X1.FI3:P","X1.FI5:P",
	          "X1.FI6:P","X1.FI7:P",
		  "X2.FI1:P","X2.FI2:P","X2.FI3:P","X2.FI5:P",
                  "X2.FI6:P","X2.FI7:P",
		  "X3.FI1:P","X3.FI2:P","X3.FI3:P","X3.FI5:P",
                  "X3.FI6:P","X3.FI7:P",
		  "X4.FI1:P","X4.FI2:P","X4.FI3:P","X4.FI5:P",
                  "X4.FI6:P","X4.FI7:P",
		  "X5.FI50:P","X5.FI51:P","X5.FI52:P","X5.FI53:P",
                  "X5.FI54:P","X5.FI55:P",
		  "X6.FI116:P","X6.FI117:P","X6.FI118:P","X6.FI119:P",
                  "X6.FI120:P","X6.FI121:P",
		  "X10.FI230:P","X10.FI231:P","X10.FI232:P","X10.FI233:P",
                  "X10.FI234:P","X10.FI235:P"] 

//endcontrol

Edt     dt  gnd  vsource  vdc=0 v1=0 v2=10/70 td=FAULT tr=1m tf=1m width=TSTOP+1 period=TSTOP+2

Ps1   pss1  gnd omega1 powerss  type=2 kw=10 tw=10 t1=0.2 t2=0.02 t3=0.4 t4=0.04 max=0.1 min=-0.1
Av1   bus1  ex1 pss1   poweravr type=1 vrating=20k ae=0 k0=200 tr=0 t1=0.04 t3=12 t2=1 te=0 vmax=6 vmin=-3
G1    bus1  ex1 gnd omega1 powergenerator type=TYPE phtype=1 vg=1.0490 pg=2.5/2.75   prating=2.75G vrating=20k \
    xl=0.2 ra=0.0025 xd=0.90 xdp=0.27 xds=0.25 td0p=9.0  td0s=0.03 xq=0.60 xqp=0.27 xqs=0.25 tq0p=0.05 tq0s=0.05 h=4.40 d=1.0

Ps2   pss2  gnd omega2 powerss  type=2 kw=10 tw=10 t1=0.2 t2=0.02 t3=0.4 t4=0.04 max=0.1 min=-0.1
Av2   bus2  ex2 pss2   poweravr type=1 vrating=20k ae=0 k0=200 tr=0 t1=0.04 t3=12 t2=1 te=0 vmax=6 vmin=-3
G2    bus2  ex2 gnd omega2 powergenerator type=TYPE phtype=1 vg=1.0490 pg=FAC*4.5/7  prating=7.00G vrating=20k \
    xl=0.2 ra=0.0025 xd=0.90 xdp=0.27 xds=0.25 td0p=9.0  td0s=0.03 xq=0.60 xqp=0.27 xqs=0.25 tq0p=0.05 tq0s=0.05 h=4.60 d=1.5

Ps3   pss3  gnd omega3  powerss  type=2 kw=20 tw=10 t1=0.2 t2=0.02 t3=0.2 t4=0.04 max=0.1 min=-0.1
Av3   bus3  ex3 pss3    poweravr type=1 vrating=20k ae=0 k0=250 tr=0 t1=0.03 t3=12 t2=1 te=0 vmax=7 vmin=-2
G3    bus3  ex3 gnd omega3 powergenerator type=TYPE phtype=1 vg=1.0490 pg=5.04/8     prating=8G    vrating=20k slack=1 \
    xl=0.2 ra=0.0025 xd=1.70 xdp=0.27 xds=0.25 td0p=6.0  td0s=0.03 xq=1.60 xqp=0.27 xqs=0.25 tq0p=0.80 tq0s=0.05 h=4.00 d=1.0

Ps4   pss4  gnd omega4  powerss  type=2 kw=20 tw=10 t1=0.2 t2=0.02 t3=0.2 t4=0.04 max=0.1 min=-0.1
Av4   bus4  ex4 pss4    poweravr type=1 vrating=20k ae=0 k0=200 tr=0 t1=0.04 t3=12 t2=1 te=0 vmax=6 vmin=-3
G4    bus4  ex4 gnd omega4 powergenerator type=TYPE phtype=1 vg=1.0490 pg=4.9/7      prating=7G    vrating=20k \
    xl=0.2 ra=0.0025 xd=1.70 xdp=0.27 xds=0.25 td0p=6.0  td0s=0.03 xq=1.60 xqp=0.27 xqs=0.25 tq0p=0.80 tq0s=0.05 h=4.80 d=1.0

Ps5   pss5  gnd omega5  powerss  type=2 kw=20 tw=10 t1=0.2 t2=0.02 t3=0.2 t4=0.04 max=0.1 min=-0.1
Av5   bus5  ex5 pss5    poweravr type=1 vrating=20k ae=0 k0=250 tr=0 t1=0.03 t3=12 t2=1 te=0 vmax=7 vmin=-2
G5    bus5  ex5 gnd omega5 powergenerator type=TYPE phtype=1 vg=1.0490 pg=3.05/4.75  prating=4.75G vrating=20k \
    xl=0.2 ra=0.0025 xd=1.70 xdp=0.27 xds=0.25 td0p=6.0  td0s=0.03 xq=1.60 xqp=0.27 xqs=0.25 tq0p=0.80 tq0s=0.05 h=4.90 d=1.5

Ps6   pss6  gnd omega6 powerss  type=2 kw=10 tw=10 t1=0.2 t2=0.02 t3=0.4 t4=0.04 max=0.1 min=-0.1
Av6   bus6  ex6 pss6   poweravr type=1 vrating=20k ae=0 k0=200 tr=0 t1=0.04 t3=12 t2=1 te=0 vmax=6 vmin=-3
G6    bus6  ex6 gnd omega6 powergenerator type=TYPE phtype=1 vg=1.0490 pg=4.5/8      prating=8G    vrating=20k \
    xl=0.2 ra=0.0025 xd=0.90 xdp=0.27 xds=0.25 td0p=9.0  td0s=0.03 xq=0.60 xqp=0.27 xqs=0.25 tq0p=0.50 tq0s=0.05 h=5.00 d=1.5

Ps7   pss7  gnd omega7 powerss  type=2 kw=10 tw=10 t1=0.2 t2=0.02 t3=0.4 t4=0.04 max=0.1 min=-0.1
Av7   bus7  ex7 pss7   poweravr type=1 vrating=20k ae=0 k0=200 tr=0 t1=0.04 t3=12 t2=1 te=0 vmax=6 vmin=-3
G7    bus7  ex7 gnd omega7 powergenerator type=TYPE phtype=1 vg=1.0490 pg=1.7/2.6    prating=2.6G  vrating=20k \
    xl=0.2 ra=0.0025 xd=1.70 xdp=0.27 xds=0.25 td0p=6.0  td0s=0.03 xq=1.60 xqp=0.27 xqs=0.25 tq0p=0.80 tq0s=0.05 h=3.30 d=1.0

Ps8   pss8  gnd omega8 powerss  type=2 kw=10 tw=10 t1=0.2 t2=0.02 t3=0.4 t4=0.04 max=0.1 min=-0.1
Av8   bus8  ex8 pss8   poweravr type=1 vrating=20k ae=0 k0=200 tr=0 t1=0.04 t3=12 t2=1 te=0 vmax=6 vmin=-3
G8    bus8  ex8 gnd omega8 powergenerator type=TYPE phtype=1 vg=1.0490 pg=2.6/4      prating=4G    vrating=20k \
    xl=0.2 ra=0.0025 xd=0.90 xdp=0.27 xds=0.25 td0p=9.0  td0s=0.03 xq=0.60 xqp=0.27 xqs=0.25 tq0p=0.05 tq0s=0.05 h=2.80 d=0.5

Ps9   pss9  gnd omega9 powerss  type=2 kw=10 tw=10 t1=0.2 t2=0.02 t3=0.4 t4=0.04 max=0.1 min=-0.1
Tg9   pm9   omega9     powertg type=1 r=1/20.0 ts=0.40 tc=75.0 t3=10.0 t4=-2.4 t5=1.2 gen="G9"
Av9   bus9  ex9 pss9   poweravr type=1 vrating=20k ae=0 k0=200 tr=0 t1=0.04 t3=12 t2=1 te=0 vmax=6 vmin=-3
G9    bus9  ex9 pm9 omega9 powergenerator type=TYPE phtype=1 vg=1.0490 pg=2/2.75     prating=2.75G vrating=20k \
    xl=0.2 ra=0.0025 xd=0.90 xdp=0.27 xds=0.25 td0p=9.0  td0s=0.03 xq=0.60 xqp=0.27 xqs=0.25 tq0p=0.05 tq0s=0.05 h=4.40 d=1.0

Ps10  pss10 gnd omega10 powerss  type=2 kw=10 tw=10 t1=0.2 t2=0.02 t3=0.4 t4=0.04 max=0.1 min=-0.1
Tg10  pm10  omega10     powertg type=1 r=1/20.0 ts=0.40 tc=75.0 t3=10.0 t4=-2.4 t5=1.2 gen="G10"
Av10 bus10  ex10 pss10  poweravr type=1 vrating=20k ae=0 k0=200 tr=0 t1=0.04 t3=12 t2=1 te=0 vmax=6 vmin=-3
G10  bus10  ex10 pm10 omega10 powergenerator type=TYPE phtype=1 vg=1.0490 pg=4.5/7      prating=7G    vrating=20k \
    xl=0.2 ra=0.0025 xd=0.90 xdp=0.27 xds=0.25 td0p=9.0  td0s=0.03 xq=0.60 xqp=0.27 xqs=0.25 tq0p=0.05 tq0s=0.05 h=4.60 d=1.5

Ps11 pss11  gnd omega11  powerss  type=2 kw=20 tw=10 t1=0.2 t2=0.02 t3=0.2 t4=0.04 max=0.1 min=-0.1
Tg11  pm11  omega11      powertg type=1 r=1/20.0 ts=0.04 tc=0.2 t3=0.0 t4=1.5 t5=5.0 gen="G11"
Av11 bus11  ex11 pss11   poweravr type=1 vrating=20k ae=0 k0=250 tr=0 t1=0.03 t3=12 t2=1 te=0 vmax=7 vmin=-2
G11  bus11  ex11 pm11 omega11 powergenerator type=TYPE phtype=1 vg=1.0490 pg=5.04/8     prating=8G    vrating=20k \
    xl=0.2 ra=0.0025 xd=1.70 xdp=0.27 xds=0.25 td0p=6.0  td0s=0.03 xq=1.60 xqp=0.27 xqs=0.25 tq0p=0.80 tq0s=0.05 h=4.00 d=1.0

Ps12 pss12  gnd omega12  powerss  type=2 kw=20 tw=10 t1=0.2 t2=0.02 t3=0.2 t4=0.04 max=0.1 min=-0.1
Tg12  pm12  omega12      powertg type=1 r=1/20.0 ts=0.04 tc=0.2 t3=0.0 t4=1.5 t5=5.0 gen="G12"
Av12 bus12  ex12 pss12   poweravr type=1 vrating=20k ae=0 k0=200 tr=0 t1=0.04 t3=12 t2=1 te=0 vmax=6 vmin=-3
G12  bus12  ex12 pm12 omega12 powergenerator type=TYPE phtype=1 vg=1.0490 pg=4.9/7      prating=7G    vrating=20k \
    xl=0.2 ra=0.0025 xd=1.70 xdp=0.27 xds=0.25 td0p=6.0  td0s=0.03 xq=1.60 xqp=0.27 xqs=0.25 tq0p=0.80 tq0s=0.05 h=4.80 d=1.0

Ps13 pss13  gnd omega13  powerss  type=2 kw=20 tw=10 t1=0.2 t2=0.02 t3=0.2 t4=0.04 max=0.1 min=-0.1
Tg13  pm13  omega13      powertg type=1 r=1/20.0 ts=0.04 tc=0.2 t3=0.0 t4=1.5 t5=5.0 gen="G13"
Av13 bus13  ex13 pss13   poweravr type=1 vrating=20k ae=0 k0=250 tr=0 t1=0.03 t3=12 t2=1 te=0 vmax=7 vmin=-2
G13  bus13  ex13 pm13 omega13 powergenerator type=TYPE phtype=1 vg=1.0490 pg=3.05/4.75  prating=4.75G vrating=20k \
    xl=0.2 ra=0.0025 xd=1.70 xdp=0.27 xds=0.25 td0p=6.0  td0s=0.03 xq=1.60 xqp=0.27 xqs=0.25 tq0p=0.80 tq0s=0.05 h=5.90 d=1.5

Ps14 pss14 gnd omega14  powerss  type=2 kw=20 tw=10 t1=0.2 t2=0.02 t3=0.4 t4=0.04 max=0.1 min=-0.1
Tg14  pm14  omega14     powertg type=1 r=1/20.0 ts=0.40 tc=75.0 t3=10.0 t4=-2.4 t5=1.2 gen="G14"
Av14 bus14  ex14 pss15  poweravr type=1 vrating=20k ae=0 k0=200 tr=0 t1=0.04 t3=12 t2=1 te=0 vmax=6 vmin=-3
G14  bus14  ex14 pm14 omega14 powergenerator type=TYPE phtype=1 vg=1.0490 pg=4.5/8      prating=8G    vrating=20k \
    xl=0.2 ra=0.0025 xd=0.90 xdp=0.27 xds=0.25 td0p=9.0  td0s=0.03 xq=0.60 xqp=0.27 xqs=0.25 tq0p=0.50 tq0s=0.05 h=5.00 d=1.5

Ps15 pss15  gnd omega15  powerss  type=2 kw=20 tw=10 t1=0.2 t2=0.02 t3=0.4 t4=0.04 max=0.1 min=-0.1
Tg15  pm15  omega15      powertg type=1 r=1/20.0 ts=0.04 tc=0.2 t3=0.0 t4=1.5 t5=5.0 gen="G15"
Av15 bus15  ex15 pss15   poweravr type=1 vrating=20k ae=0 k0=200 tr=0 t1=0.04 t3=12 t2=1 te=0 vmax=6 vmin=-3
G15  bus15  ex15 pm15 omega15 powergenerator type=TYPE phtype=1 vg=1.0490 pg=1.7/2.6    prating=2.6G  vrating=20k \
    xl=0.2 ra=0.0025 xd=1.70 xdp=0.27 xds=0.25 td0p=6.0  td0s=0.03 xq=1.60 xqp=0.27 xqs=0.25 tq0p=0.80 tq0s=0.05 h=3.30 d=1.0

Ps16 pss16 gnd omega16   powerss  type=2 kw=20 tw=10 t1=0.2 t2=0.02 t3=0.4 t4=0.04 max=0.1 min=-0.1
Tg16 pm16   omega16      powertg type=1 r=1/20.0 ts=0.40 tc=75.0 t3=10.0 t4=-2.4 t5=1.2 gen="G16"
Av16 bus16  ex16  pss16  poweravr type=1 vrating=20k ae=0 k0=200 tr=0 t1=0.04 t3=12 t2=1 te=0 vmax=6 vmin=-3
G16  bus16  ex16 pm16 omega16 powergenerator type=TYPE phtype=1 vg=1.0490 pg=2.6/4      prating=4G    vrating=20k \
    xl=0.2 ra=0.0025 xd=0.90 xdp=0.27 xds=0.25 td0p=9.0  td0s=0.03 xq=0.60 xqp=0.27 xqs=0.25 tq0p=0.05 tq0s=0.05 h=2.80 d=0.5

Coi   coi   powercoi type=2 gen="G3" attach="G1" attach="G2" attach="G4" attach="G5" attach="G6" attach="G7" \
                            attach="G8" attach="G9" attach="G10" attach="G11" attach="G12" attach="G13" \
                            attach="G14" attach="G15" attach="G16" trpar=no

Tr1   bus1  bus17   powertransformer r=0.00000 x=0.00180     vrating=20k  prating=100M a=1/(20/500)
Tr2   bus2  bus18   powertransformer r=0.00000 x=0.00070     vrating=20k  prating=100M a=1/(20/500)
Tr3   bus3  bus19   powertransformer r=0.00000 x=0.00060     vrating=20k  prating=100M a=1/(20/500)
Tr4   bus4  bus20   powertransformer r=0.00000 x=0.00070     vrating=20k  prating=100M a=1/(20/500)
Tr5   bus5  bus21   powertransformer r=0.00000 x=0.00110     vrating=20k  prating=100M a=1/(20/500)
Tr6   bus6  bus22   powertransformer r=0.00000 x=0.00060     vrating=20k  prating=100M a=1/(20/500)
Tr7   bus7  bus23   powertransformer r=0.00000 x=0.00190     vrating=20k  prating=100M a=1/(20/500)
Tr8   bus8  bus24   powertransformer r=0.00000 x=0.00130     vrating=20k  prating=100M a=1/(20/230)
Tr9   bus9  bus17   powertransformer r=0.00000 x=0.00180     vrating=20k  prating=100M a=1/(20/500)
Tr10 bus10  bus18   powertransformer r=0.00000 x=0.00070     vrating=20k  prating=100M a=1/(20/500)
Tr11 bus11  bus19   powertransformer r=0.00000 x=0.00060     vrating=20k  prating=100M a=1/(20/500)
Tr12 bus12  bus20   powertransformer r=0.00000 x=0.00070     vrating=20k  prating=100M a=1/(20/500)
Tr13 bus13  bus21   powertransformer r=0.00000 x=0.00110     vrating=20k  prating=100M a=1/(20/500)
Tr14 bus14  bus22   powertransformer r=0.00000 x=0.00060     vrating=20k  prating=100M a=1/(20/500)
Tr15 bus15  bus23   powertransformer r=0.00000 x=0.00190     vrating=20k  prating=100M a=1/(20/500)
Tr16 bus16  bus24   powertransformer r=0.00000 x=0.00130     vrating=20k  prating=100M a=1/(20/230)
Tr19 bus19  bus29   powertransformer r=0.00000 x=0.00500     vrating=500k prating=100M a=230/500
Tr20 bus20  bus38   powertransformer r=0.00000 x=0.00150     vrating=500k prating=100M a=1       ; Distribution xformer
Tr22 bus22  bus27   powertransformer r=0.00000 x=0.00700     vrating=500k prating=100M a=230/500
Tr23 bus23  bus28   powertransformer r=0.00000 x=0.00700     vrating=500k prating=100M a=230/500
Tr24 bus24  bus39   powertransformer r=0.00000 x=0.00150     vrating=230k prating=100M a=500/230 ; Distribution xformer
Tr25 bus25  bus40   powertransformer r=0.00000 x=0.00150     vrating=500k prating=100M a=1       ; Distribution xformer
Tr26 bus26  bus41   powertransformer r=0.00000 x=0.00150     vrating=500k prating=100M a=1       ; Distribution xformer

Ln17 bus17  bus34   powerline r=0.00190*4      x=0.02100*4   b=0.22000*4     vrating=500e3 prating=100e6
Ln18 bus34  bus18   powerline r=0.00000        x=0.00500     b=0.05000       vrating=500e3 prating=100e6
Ln19 bus34  bus18   powerline r=0.00000        x=0.00500     b=0.05000       vrating=500e3 prating=100e6
Ln20 bus18  bus30   powerline r=0.00190*4/3    x=0.02100*4/3 b=0.22000*4/3   vrating=500e3 prating=100e6
Ln21 bus17  bus30   powerline r=0.00000        x=0.00100     b=0.00000+1e-10 vrating=500e3 prating=100e6
Ln22 bus17  bus35   powerline r=0.00300/4      x=0.01880/4   b=0.01800/4     vrating=500e3 prating=100e6
Ln23 bus17  bus35   powerline r=0.00300/4      x=0.01880/4   b=0.01800/4     vrating=500e3 prating=100e6
Ln24 bus35  bus21   powerline r=0.00300*3/4    x=0.01880*3/4 b=0.01800*3/4   vrating=500e3 prating=100e6
Ln25 bus17  bus32   powerline r=0.00031/4      x=0.00350/4   b=0.02250/4     vrating=500e3 prating=100e6
Ln26 bus32  bus22   powerline r=0.00031*3/4    x=0.00350*3/4 b=0.02250*3/4   vrating=500e3 prating=100e6
Ln27 bus17  bus33   powerline r=0.00037*3/4    x=0.00348*3/4 b=0.01100*3/4   vrating=500e3 prating=100e6
Ln28 bus33  bus22   powerline r=0.00037/4      x=0.00348/4   b=0.01100/4     vrating=500e3 prating=100e6
Ln29 bus19  bus37   powerline r=0.00200/5      x=0.01550/5   b=0.03200/5     vrating=500e3 prating=100e6
Ln30 bus37  bus20   powerline r=0.00200*4/5    x=0.01550*4/5 b=0.03200*4/5   vrating=500e3 prating=100e6
Ln32 bus20  bus25   powerline r=0.00010        x=0.00075     b=0.04000       vrating=500e3 prating=100e6
Ln34 bus21  bus36   powerline r=0.00630/5      x=0.04428/5   b=0.29200/5     vrating=500e3 prating=100e6
Ln35 bus21  bus36   powerline r=0.00630/5      x=0.04428/5   b=0.29200/5     vrating=500e3 prating=100e6
Ln36 bus21  bus36   powerline r=0.00630/5      x=0.04428/5   b=0.29200/5     vrating=500e3 prating=100e6
Ln37 bus36  bus25   powerline r=0.00630*4/5    x=0.04428*4/5 b=0.29200*4/5   vrating=500e3 prating=100e6
Ln38 bus21  bus36   powerline r=0.007875/5     x=0.05535/5   b=0.50000/5     vrating=500e3 prating=100e6
Ln39 bus36  bus26   powerline r=0.007875*4/5   x=0.05535*4/5 b=0.50000*4/5   vrating=500e3 prating=100e6
Ln40 bus22  bus31   powerline r=0.00190/2      x=0.01550/2   b=0.09520/2     vrating=500e3 prating=100e6
Ln41 bus23  bus31   powerline r=0.00190/2      x=0.01550/2   b=0.09520/2     vrating=500e3 prating=100e6
Ln45 bus24  bus27   powerline r=0.00800        x=0.08400     b=0.33400       vrating=230e3 prating=100e6 
Ln46 bus24  bus28   powerline r=0.00850        x=0.09950     b=0.50000       vrating=230e3 prating=100e6 
Ln47 bus24  bus29   powerline r=0.00920        x=0.10900     b=0.50000       vrating=230e3 prating=100e6 
Ln48 bus25  bus26   powerline r=0.00000        x=0.00005     b=0.00000       vrating=500e3 prating=100e6 

Sh17 bus17 powershunt q=25.00 prating=100M vrating=500k
Sh18 bus18 powershunt q=10.00 prating=100M vrating=500k
Sh21 bus21 powershunt q= 5.00 prating=100M vrating=500k
Sh22 bus22 powershunt q=10.00 prating=100M vrating=500k
Sh23 bus23 powershunt q= 5.00 prating=100M vrating=500k

Sh35 bus35 powershunt q=20.00 prating=100M vrating=500k
Sh36 bus36 powershunt q=30.00 prating=100M vrating=500k
Sh37 bus37 powershunt q=35.00 prating=100M vrating=500k
Sh38 bus38 powershunt q=20.00 prating=100M vrating=500k
Sh39 bus39 powershunt q= 7.00 prating=100M vrating=500k
Sh40 bus40 powershunt q=15.00 prating=100M vrating=500k
Sh41 bus41 powershunt q=15.00 prating=100M vrating=500k

Lo31 bus31 powerload pc=    14.000 qc= 4.0000  prating=100M vrating=500k type=0
Lo32 bus32 powerload pc=    20.000 qc=12.0000  prating=100M vrating=500k type=0
Lo33 bus33 powerload pc=    30.000 qc=12.0000  prating=100M vrating=500k type=0
Lo34 bus34 dt dt powerload pc=    70.000 qc=30.0000  prating=100M vrating=500k ap=2 aq=2 type=1
Lo35 bus35 powerload pc=FAC*75.000 qc=FAC*35.0 prating=100M vrating=500k type=0
Lo36 bus36 powerload pc=    82.000 qc=40.0000  prating=100M vrating=500k type=0
Lo37 bus37 powerload pc=    62.000 qc=28.0000  prating=100M vrating=500k type=0
Lo38 bus38 powerload pc=    55.000 qc=25.0000  prating=100M vrating=500k type=0
Lo39 bus39 powerload pc=    54.000 qc=20.0000  prating=100M vrating=500k type=0
Lo40 bus40 powerload pc=    44.000 qc=26.0000  prating=100M vrating=500k type=0
Lo41 bus41 powerload pc=    54.000 qc=26.0000  prating=100M vrating=500k type=0

// +-------------+
// | Power buses |
// +-------------+

Bus0  bus1  powerbus vb=2.000000e+04 v0=1.049000e+00 theta0=3.787667e+01
Bus1  bus2  powerbus vb=2.000000e+04 v0=1.049000e+00 theta0=4.861926e+01
Bus2  bus3  powerbus vb=2.000000e+04 v0=1.049000e+00 theta0=0.000000e+00
Bus3  bus4  powerbus vb=2.000000e+04 v0=1.049000e+00 theta0=-4.204384e+01
Bus4  bus5  powerbus vb=2.000000e+04 v0=1.049000e+00 theta0=-6.819487e+00
Bus5  bus6  powerbus vb=2.000000e+04 v0=1.049000e+00 theta0=4.329737e+01
Bus6  bus7  powerbus vb=2.000000e+04 v0=1.049000e+00 theta0=5.765018e+01
Bus7  bus8  powerbus vb=2.000000e+04 v0=1.049000e+00 theta0=2.783109e+01
Bus8  bus9  powerbus vb=2.000000e+04 v0=1.049000e+00 theta0=3.787667e+01
Bus9  bus10 powerbus vb=2.000000e+04 v0=1.049000e+00 theta0=4.928180e+01
Bus10 bus11 powerbus vb=2.000000e+04 v0=1.049000e+00 theta0=6.407466e-01
Bus11 bus12 powerbus vb=2.000000e+04 v0=1.049000e+00 theta0=-4.204384e+01
Bus12 bus13 powerbus vb=2.000000e+04 v0=1.049000e+00 theta0=-6.819487e+00
Bus13 bus14 powerbus vb=2.000000e+04 v0=1.049000e+00 theta0=4.329737e+01
Bus14 bus15 powerbus vb=2.000000e+04 v0=1.049000e+00 theta0=5.765018e+01
Bus15 bus16 powerbus vb=2.000000e+04 v0=1.049000e+00 theta0=2.783109e+01
Bus16 bus17 powerbus vb=5.000000e+05 v0=1.031467e+00 theta0=3.597000e+01
Bus17 bus18 powerbus vb=5.000000e+05 v0=1.039022e+00 theta0=4.762567e+01
Bus18 bus19 powerbus vb=5.000000e+05 v0=1.018250e+00 theta0=-1.097472e+00
Bus19 bus20 powerbus vb=5.000000e+05 v0=1.024807e+00 theta0=-4.387224e+01
Bus20 bus21 powerbus vb=5.000000e+05 v0=1.023319e+00 theta0=-8.610504e+00
Bus21 bus22 powerbus vb=5.000000e+05 v0=1.025069e+00 theta0=4.185856e+01
Bus22 bus23 powerbus vb=5.000000e+05 v0=9.881889e-01 theta0=5.586460e+01
Bus23 bus24 powerbus vb=2.300000e+05 v0=1.064649e+00 theta0=2.609679e+01
Bus24 bus34 powerbus vb=5.000000e+05 v0=9.569540e-01 theta0=3.829247e+01
Bus25 bus35 powerbus vb=5.000000e+05 v0=9.736303e-01 theta0=2.496397e+01
Bus26 bus32 powerbus vb=5.000000e+05 v0=1.019566e+00 theta0=3.672864e+01
Bus27 bus33 powerbus vb=5.000000e+05 v0=1.015412e+00 theta0=3.931728e+01
Bus28 bus37 powerbus vb=5.000000e+05 v0=9.610917e-01 theta0=-1.815061e+01
Bus29 bus29 powerbus vb=2.300000e+05 v0=2.894030e+00 theta0=2.170333e+00
Bus30 bus25 powerbus vb=5.000000e+05 v0=9.880094e-01 theta0=-4.676330e+01
Bus31 bus38 powerbus vb=5.000000e+05 v0=1.013785e+00 theta0=-4.855351e+01
Bus32 bus36 powerbus vb=5.000000e+05 v0=9.447767e-01 theta0=-2.146366e+01
Bus33 bus26 powerbus vb=5.000000e+05 v0=9.870667e-01 theta0=-4.688712e+01
Bus34 bus31 powerbus vb=5.000000e+05 v0=9.763659e-01 theta0=4.579899e+01
Bus35 bus27 powerbus vb=2.300000e+05 v0=2.406051e+00 theta0=3.531024e+01
Bus36 bus28 powerbus vb=2.300000e+05 v0=2.464743e+00 theta0=4.636599e+01
Bus37 bus39 powerbus vb=5.000000e+05 v0=1.041005e+00 theta0=2.155414e+01
Bus38 bus40 powerbus vb=5.000000e+05 v0=9.699295e-01 theta0=-5.047822e+01
Bus39 bus41 powerbus vb=5.000000e+05 v0=9.679761e-01 theta0=-5.144312e+01

// +-------------+
// | 8500 Feeder |
// +-------------+

#ifdef FEEDER

parameters VNOM_MV=7.2k VNOM_LV=120 SCALE_SL=0.5

begin power

subckt FeederCkt bus9052 coi
    parameters PRIM=VNOM_MV SEC=VNOM_MV

    #include "8500/Lines8500.inc"
    #include "8500/LoadXfmrs8500.inc"
    #include "8500/TriplexLines8500.inc"

    #ifdef UNBALANCED
    #include "8500/UnbalancedLoads8500.inc"
    #else
    #include "8500/Loads8500.inc"
    #endif

#ifdef ULTC

    Trx     busx     bus9052   tap9052 powertransformer prating=100M \
                                    vrating=SEC a=PRIM/SEC \
                                    kt=1 minkt=0.88 maxkt=1.2

    Uec6  bus9052  ud9052  gnd  uq9052  gnd  powerec type=0 trpar=no
    U6    ud9052   uq9052 tap9052  ULTC TW=20+10*rand() TR=100m

#else ULTC

    Trx     busx     bus9052   powertransformer prating=100M \
                                    vrating=SEC a=PRIM/SEC

#endif

    Px1     _HVMV_Sub_LSB        busx   ph3dq  vrating=VNOM_MV balance=1
    Px2     "regxfmr_190-8593"   busx   ph3dq  vrating=VNOM_MV balance=1
    Px3     "regxfmr_190-8581"   busx   ph3dq  vrating=VNOM_MV balance=1
    Px4     "regxfmr_190-7361"   busx   ph3dq  vrating=VNOM_MV balance=1
    Px5     "190-8593"           busx   ph3dq  vrating=VNOM_MV balance=1
    Px6     "190-8581"           busx   ph3dq  vrating=VNOM_MV balance=1
    Px7     "190-7361"           busx   ph3dq  vrating=VNOM_MV balance=1


#ifdef FEEDER_GFL

begin electrical

parameter GFL_KD=100

#include "8500/Gfl.inc"

end

#endif

ends

model GFL nport veriloga="gfl.va" verilogatrace=["P","Q","Wpll","Vq"]

X1   bus38  coi FeederCkt PRIM=500k
X2   bus31  coi FeederCkt PRIM=500k
X3   bus32  coi FeederCkt PRIM=500k
X4   bus33  coi FeederCkt PRIM=500k
X5   bus34  coi FeederCkt PRIM=500k
X6   bus35  coi FeederCkt PRIM=500k
X7   bus37  coi FeederCkt PRIM=500k

end

model ULTC   nport veriloga="ultc.va" verilogaprotected=no \
                   verilogatrace=["Vmag","Vref","Upper","Lower"]

#endif FEEDER

// ------------------------------------------------------------------

model "3PH-Connector"                          ph3line utype=1 rph=0.501 xph=0.716 r0=0.817 x0=1.598
model "1PH-Connector"                          ph3line utype=1 rph=0.501 xph=0.716 r0=0.817 x0=1.598

model "3P_1/0_AXNJ_DB"                         ph3line utype=1 rph=0.551156 xph=0.200765 bph=48.6655390619471u \
                                                               r0 =1.350357 x0 =0.426882 b0 =48.6655390619471u

model "3PH_H-2/0_ACSR2/0_ACSR2/0_ACSR2/0_ACSR" ph3line utype=1 raa= 0.632570 rab= 0.109951 rbb=0.627184 \
                                                               rac= 0.113538 rbc= 0.110747 rcc=0.634249 \
                                                               xaa= 0.812752 xab= 0.333510 xbb=0.825507 \
							       xac= 0.308271 xbc= 0.350259 xcc=0.808799

model "3PH_H-4_ACSR4_ACSR4_ACSR4_ACSR"         ph3line utype=1 raa= 1.683400 rab= 0.138324 rbb=1.676860 \
                                                               rac= 0.142669 rbc= 0.139294 rcc=1.685430 \
							       xaa= 0.927300 xab= 0.432623 xbb=0.932728 \
							       xac= 0.412253 xbc= 0.450469 xcc=0.925637

model "3PH_H-2/0_ACSR2/0_ACSR2/0_ACSR2_ACSR"   ph3line utype=1 rph=0.501 xph=0.716 r0=0.817 x0=1.598 
model "3PH_H-2/0_ACSR2/0_ACSR2/0_ACSR2_WPAL"   ph3line utype=1 rph=0.501 xph=0.716 r0=0.817 x0=1.598 
model "3PH_H-2/0_ACSR2/0_ACSR2/0_ACSR4_ACSR"   ph3line utype=1 rph=0.501 xph=0.716 r0=0.817 x0=1.598 
model "3PH_H-2_ACSR2_ACSR2_ACSR2_ACSR"         ph3line utype=1 rph=0.501 xph=0.716 r0=0.817 x0=1.598 
model "3PH_H-2_ACSR2_ACSR4_ACSR4_ACSR"         ph3line utype=1 rph=0.501 xph=0.716 r0=0.817 x0=1.598 
model "3PH_H-397_ACSR397_ACSR397_ACSR2/0_ACSR" ph3line utype=1 rph=0.501 xph=0.716 r0=0.817 x0=1.598 
model "3PH_H-397_ACSR397_ACSR397_ACSR2/0_WPAL" ph3line utype=1 rph=0.501 xph=0.716 r0=0.817 x0=1.598 
model "3PH_H-397_ACSR397_ACSR397_ACSR397_ACSR" ph3line utype=1 rph=0.501 xph=0.716 r0=0.817 x0=1.598 
model "3PH_H-397_ACSR397_ACSR397_ACSR4_WPAL"   ph3line utype=1 rph=0.501 xph=0.716 r0=0.817 x0=1.598 
model "3PH_H-4_ACSR2_ACSR2_ACSR4_ACSR"         ph3line utype=1 rph=0.501 xph=0.716 r0=0.817 x0=1.598 
model "3PH_H-4_ACSR2_ACSR2_ACSR4_WPAL"         ph3line utype=1 rph=0.501 xph=0.716 r0=0.817 x0=1.598 
model "3PH_H-4_ACSR4_ACSR4_ACSR2_WPAL"         ph3line utype=1 rph=0.501 xph=0.716 r0=0.817 x0=1.598 
model "3PH_H-4_ACSR4_ACSR4_ACSR4_TPX"          ph3line utype=1 rph=0.501 xph=0.716 r0=0.817 x0=1.598 
model "3PH_H-4_ACSR4_ACSR4_ACSR4_WPAL"         ph3line utype=1 rph=0.501 xph=0.716 r0=0.817 x0=1.598 
model "3PH_H-4_WPAL4_WPAL4_WPAL4_WPAL"         ph3line utype=1 rph=0.501 xph=0.716 r0=0.817 x0=1.598 
model "3PH_H-4_WPAL4_WPAL4_WPAL1/0_TPX"        ph3line utype=1 rph=0.501 xph=0.716 r0=0.817 x0=1.598 
model "3PH_H-4_WPAL4_WPAL4_WPAL4_ACSR"         ph3line utype=1 rph=0.501 xph=0.716 r0=0.817 x0=1.598 
model "1P_1/0_AXNJ_DB"                         ph3line utype=1 rph=0.501 xph=0.716 r0=0.817 x0=1.598 
model "1PH-2/0_ACSRxx2_ACSR"                   ph3line utype=1 rph=0.501 xph=0.716 r0=0.817 x0=1.598 
model "1PH-2_ACSRxx1/0_TPX"                    ph3line utype=1 rph=0.501 xph=0.716 r0=0.817 x0=1.598 
model "1PH-2_ACSRxx2_ACSR"                     ph3line utype=1 rph=0.501 xph=0.716 r0=0.817 x0=1.598 
model "1PH-2_ACSRxx4/0_TPX"                    ph3line utype=1 rph=0.501 xph=0.716 r0=0.817 x0=1.598 
model "1PH-2_ACSRxx4_ACSR"                     ph3line utype=1 rph=0.501 xph=0.716 r0=0.817 x0=1.598 
model "1PH-2_ACSRxx4_WPAL"                     ph3line utype=1 rph=0.501 xph=0.716 r0=0.817 x0=1.598 
model "1PH-2_WPALxx2_WPAL"                     ph3line utype=1 rph=0.501 xph=0.716 r0=0.817 x0=1.598 
model "1PH-4_ACSRxx1/0_3W_CS"                  ph3line utype=1 rph=0.501 xph=0.716 r0=0.817 x0=1.598 
model "1PH-4_ACSRxx1/0_TPX"                    ph3line utype=1 rph=0.501 xph=0.716 r0=0.817 x0=1.598 
model "1PH-4_ACSRxx2_ACSR"                     ph3line utype=1 rph=0.501 xph=0.716 r0=0.817 x0=1.598 
model "1PH-4_ACSRxx4_ACSR"                     ph3line utype=1 rph=0.501 xph=0.716 r0=0.817 x0=1.598 
model "1PH-4_ACSRxx4_WPAL"                     ph3line utype=1 rph=0.501 xph=0.716 r0=0.817 x0=1.598 
model "1PH-4_ACSRxx6_WPAL"                     ph3line utype=1 rph=0.501 xph=0.716 r0=0.817 x0=1.598 
model "1PH-4_WPALxx1/0_TPX"                    ph3line utype=1 rph=0.501 xph=0.716 r0=0.817 x0=1.598 
model "1PH-4_WPALxx2_WPAL"                     ph3line utype=1 rph=0.501 xph=0.716 r0=0.817 x0=1.598 
model "1PH-4_WPALxx4_ACSR"                     ph3line utype=1 rph=0.501 xph=0.716 r0=0.817 x0=1.598 
model "1PH-4_WPALxx4_WPAL"                     ph3line utype=1 rph=0.501 xph=0.716 r0=0.817 x0=1.598 
model "1PH-x2_ACSRx1/0_3W_CS"                  ph3line utype=1 rph=0.501 xph=0.716 r0=0.817 x0=1.598 
model "1PH-x2_ACSRx1/0_TPX"                    ph3line utype=1 rph=0.501 xph=0.716 r0=0.817 x0=1.598 
model "1PH-x2_ACSRx2_ACSR"                     ph3line utype=1 rph=0.501 xph=0.716 r0=0.817 x0=1.598 
model "1PH-x2_ACSRx4_ACSR"                     ph3line utype=1 rph=0.501 xph=0.716 r0=0.817 x0=1.598 
model "1PH-x2_ACSRx4_TPX"                      ph3line utype=1 rph=0.501 xph=0.716 r0=0.817 x0=1.598 
model "1PH-x4_ACSRx1/0_3W_CS"                  ph3line utype=1 rph=0.501 xph=0.716 r0=0.817 x0=1.598 
model "1PH-x4_ACSRx1/0_TPX"                    ph3line utype=1 rph=0.501 xph=0.716 r0=0.817 x0=1.598 
model "1PH-x4_ACSRx2_WPAL"                     ph3line utype=1 rph=0.501 xph=0.716 r0=0.817 x0=1.598 
model "1PH-x4_ACSRx4_ACSR"                     ph3line utype=1 rph=0.501 xph=0.716 r0=0.817 x0=1.598 
model "1PH-x4_ACSRx4_DPX"                      ph3line utype=1 rph=0.501 xph=0.716 r0=0.817 x0=1.598 
model "1PH-x4_ACSRx4_TPX"                      ph3line utype=1 rph=0.501 xph=0.716 r0=0.817 x0=1.598 
model "1PH-x4_ACSRx4_WPAL"                     ph3line utype=1 rph=0.501 xph=0.716 r0=0.817 x0=1.598 
model "1PH-x4_WPALx1/0_TPX"                    ph3line utype=1 rph=0.501 xph=0.716 r0=0.817 x0=1.598 
model "1PH-x4_WPALx2_ACSR"                     ph3line utype=1 rph=0.501 xph=0.716 r0=0.817 x0=1.598 
model "1PH-x4_WPALx4_ACSR"                     ph3line utype=1 rph=0.501 xph=0.716 r0=0.817 x0=1.598 
model "1PH-x4_WPALx4_WPAL"                     ph3line utype=1 rph=0.501 xph=0.716 r0=0.817 x0=1.598 
model "1PH-xx2/0_ACSR1/0_TPX"                  ph3line utype=1 rph=0.501 xph=0.716 r0=0.817 x0=1.598 
model "1PH-xx2_ACSR1/0_TPX"                    ph3line utype=1 rph=0.501 xph=0.716 r0=0.817 x0=1.598 
model "1PH-xx2_ACSR2_ACSR"                     ph3line utype=1 rph=0.501 xph=0.716 r0=0.817 x0=1.598 
model "1PH-xx2_ACSR4_DPX"                      ph3line utype=1 rph=0.501 xph=0.716 r0=0.817 x0=1.598 
model "1PH-xx4_ACSR1/0_ACSR"                   ph3line utype=1 rph=0.501 xph=0.716 r0=0.817 x0=1.598 
model "1PH-xx4_ACSR1/0_TPX"                    ph3line utype=1 rph=0.501 xph=0.716 r0=0.817 x0=1.598 
model "1PH-xx4_ACSR2_ACSR"                     ph3line utype=1 rph=0.501 xph=0.716 r0=0.817 x0=1.598 
model "1PH-xx4_ACSR4_ACSR"                     ph3line utype=1 rph=0.501 xph=0.716 r0=0.817 x0=1.598 
model "1PH-xx4_ACSR4_TPX"                      ph3line utype=1 rph=0.501 xph=0.716 r0=0.817 x0=1.598 
model "1PH-xx4_ACSR4_WPAL"                     ph3line utype=1 rph=0.501 xph=0.716 r0=0.817 x0=1.598 
model "1PH-xx4_WPAL1/0_TPX"                    ph3line utype=1 rph=0.501 xph=0.716 r0=0.817 x0=1.598 
model "1PH-xx4_WPAL4_ACSR"                     ph3line utype=1 rph=0.501 xph=0.716 r0=0.817 x0=1.598 
model "1PH-xx4_WPAL4_WPAL"                     ph3line utype=1 rph=0.501 xph=0.716 r0=0.817 x0=1.598 
model "1PH-xx6_WPAL6_WPAL"                     ph3line utype=1 rph=0.501 xph=0.716 r0=0.817 x0=1.598 
model "2PH_H-2_ACSRx2_ACSR2_ACSR"              ph3line utype=1 rph=0.501 xph=0.716 r0=0.817 x0=1.598 

model "4/0Triplex"      ph3line utype=1 raa= 0.40995115 rab= 0.11809509 \
					rba= 0.11809509 rbb= 0.40995115 \
					xaa= 0.16681819 xab= 0.12759250 \
					xba= 0.12759250 xbb= 0.16681819

model "750_Triplex"     ph3line utype=1 raa=0.04974733 rab=0.02342157 \
					rba=0.02342157 rbb=0.04974733 \
					xaa=0.02782436 xab=0.00669472 \
					xba=0.00669472 xbb=0.02782436

model TR5KVA    ph3transformer model="TR10KVA_SUB" f0=F0
model TR10KVA   ph3transformer model="TR10KVA_SUB" f0=F0
model TR15KVA   ph3transformer model="TR10KVA_SUB" f0=F0
model TR25KVA   ph3transformer model="TR10KVA_SUB" f0=F0
model TR37_5KVA ph3transformer model="TR10KVA_SUB" f0=F0
model TR50KVA   ph3transformer model="TR10KVA_SUB" f0=F0
model TR75KVA   ph3transformer model="TR10KVA_SUB" f0=F0
model TR100KVA  ph3transformer model="TR10KVA_SUB" f0=F0
model TR250KVA  ph3transformer model="TR10KVA_SUB" f0=F0

// Transformer subcircuits.

subckt TR10KVA_SUB (pa pb pc pn sa sb sc sn)
Tr pa sa sb TR10KVA_CIR N=VNOM_MV/(VNOM_LV) R_TR=1.2 L_TR=0.0128/(2*pi*F0)
ends

subckt TR10KVA_CIR (pa sa sb)
parameters N=1 R_TR=1 L_TR=1

Ra   pa lva  resistor r=R_TR

TR1 lva gnd xsa gnd transformer t1=N t2= 1
TR2 lva gnd xsb gnd transformer t1=N t2=-1

Rsa  xsa  sa  resistor r=10m
Rsb  xsb  sb  resistor r=10m

ends

subckt TR15KVA_SUB (pa pb pc pn sa sb sc sn)
Tr pa pb pc pn sa sb sc sn TR15KVA_CIR N=VNOM_MV/(VNOM_LV) R_TR=1.2 L_TR=0.0128/(2*pi*F0)
ends

subckt TR15KVA_CIR (pa pb pc pn sa sb sc sn)
parameters N=1 R_TR=1 L_TR=1

R1 pa  lva  resistor r=R_TR
R2 pb  lvb  resistor r=R_TR
R3 pc  lvc  resistor r=R_TR

TR1 lva gnd sa gnd transformer t1=N t2=1
TR2 lvb gnd sb gnd transformer t1=N t2=1
TR3 lvc gnd sc gnd transformer t1=N t2=1

ends
