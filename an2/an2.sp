* This is the file of AND2

.inc '../90nm_bulk.l'
*********************************************
* This is the subcircuit of the inverter
.SUBCKT Inv DVDD GND In Out
*.PININFO DVDD:I GND:I In:I Out:O
MN      Out     In      GND     GND     NMOS    l=0.1u  w=0.25u m=1
MP      Out     In      DVDD    DVDD    PMOS    l=0.1u  w=0.5u  m=1
.ENDS
*********************************************

*********************************************
* This is the subcircuit of the nand 2
.SUBCKT Nand2 DVDD GND InA InB Out
*.PININFO DVDD:I GND:I InA:I InB:I Out:O
MNA     Out     InA     AS      GND     NMOS    l=0.1u  w=0.25u m=1
MNB     AS      InB     GND     GND     NMOS    l=0.1u  w=0.25u m=1
MPA     Out     InA     DVDD    DVDD    PMOS    l=0.1u  w=0.5u  m=1
MPB     Out     InB     DVDD    DVDD    PMOS    l=0.1u  w=0.5u  m=1
.ENDS
*********************************************

* define VDD and GND voltages
Vdd DVDD    0   1
Vss GND     0   0

* define input signala
Va InA      0   pulse (0 1 0 100n 100n 0.4u 1u)
Vb InB      0   pulse (0 1 0 100n 100n 0.9u 2u)

* main circuit, check and2Circuit.png for diagram
xNand2  DVDD    GND     InA     InB     InvIn     Nand2
xInv    DVDD    GND     InvIn   Out     Inv

.tran 10n 2.1u
.op
.option post
.end
