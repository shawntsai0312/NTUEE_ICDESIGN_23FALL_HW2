* This is the file of FA1

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
* This is the subcircuit of the (AB+CI(A+B))
.SUBCKT Inv DVDD GND In Out
*.PININFO DVDD:I GND:I In:I Out:O
MN      Out     In      GND     GND     NMOS    l=0.1u  w=0.25u m=1
MP      Out     In      DVDD    DVDD    PMOS    l=0.1u  w=0.5u  m=1
.ENDS
*********************************************

*********************************************
* This is the subcircuit of the xnor
.SUBCKT Inv DVDD GND In Out
*.PININFO DVDD:I GND:I In:I Out:O
MN      Out     In      GND     GND     NMOS    l=0.1u  w=0.25u m=1
MP      Out     In      DVDD    DVDD    PMOS    l=0.1u  w=0.5u  m=1
.ENDS
*********************************************

*********************************************
* This is the subcircuit of the xor
.SUBCKT Inv DVDD GND In Out
*.PININFO DVDD:I GND:I In:I Out:O
MN      Out     In      GND     GND     NMOS    l=0.1u  w=0.25u m=1
MP      Out     In      DVDD    DVDD    PMOS    l=0.1u  w=0.5u  m=1
.ENDS
*********************************************

Vdd DVDD    0   1
Vss GND     0   0

Va  InA       0   pulse (0 1 0 100n 100n 0.4u 1u)
Vb  InB       0   pulse (0 1 0 100n 100n 0.9u 2u)
Vci InCI      0   pulse (0 1 0 100n 100n 1.9u 4u)

* xNand2  DVDD    GND     InA     InB     InvIn     Nand2
* xInv    DVDD    GND     InvIn   Out     Inv

.tran 20n 2.1u
.op
.option post
.end