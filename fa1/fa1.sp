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
.SUBCKT Logic DVDD GND InA InB InCI Out
*.PININFO DVDD:I GND:I InA:I InB:I InCI:I Out:O
MNA1    N1      InA     GND     GND     NMOS    l=0.1u  w=0.25u m=1
MNB1    N1      InB     GND     GND     NMOS    l=0.1u  w=0.25u m=1
MNCI    Out     InCI    N1      GND     NMOS    l=0.1u  w=0.25u m=1
MNA2    Out     InA     N2      GND     NMOS    l=0.1u  w=0.25u m=1
MNB2    N2      InB     GND     GND     NMOS    l=0.1u  w=0.25u m=1

MPA1    P1      InA     DVDD    DVDD    PMOS    l=0.1u  w=0.5u  m=1
MPB1    P1      InB     DVDD    DVDD    PMOS    l=0.1u  w=0.5u  m=1
MPCI    Out     InCI    P1      DVDD    PMOS    l=0.1u  w=0.5u  m=1
MPA2    Out     InA     P2      DVDD    PMOS    l=0.1u  w=0.5u  m=1
MPB2    P2      InB     DVDD    DVDD    PMOS    l=0.1u  w=0.5u  m=1
.ENDS
*********************************************

*********************************************
* This is the subcircuit of the xnor
.SUBCKT Xnor DVDD GND In1 In1_ In2 Out
*.PININFO DVDD:I GND:I In1:I In1_:I In2:I Out:O
MN1     Out     In2     In1     GND     NMOS    l=0.1u  w=0.25u m=1
MN2     Out     In1     In2     GND     NMOS    l=0.1u  w=0.25u m=1
MP1     Out     In2     In1_    DVDD    PMOS    l=0.1u  w=0.5u  m=1
MP2     Out     In1_    In2     DVDD    PMOS    l=0.1u  w=0.5u  m=1
.ENDS
*********************************************

*********************************************
* This is the subcircuit of the xor
.SUBCKT Xor DVDD GND In1 In1_ In2 Out
*.PININFO DVDD:I GND:I In1:I In1_:I In2:I Out:O
MN1     Out     In2     In1_    GND     NMOS    l=0.1u  w=0.25u m=1
MN2     Out     In1_    In2     GND     NMOS    l=0.1u  w=0.25u m=1
MP1     Out     In2     In1     DVDD    PMOS    l=0.1u  w=0.5u  m=1
MP2     Out     In1     In2     DVDD    PMOS    l=0.1u  w=0.5u  m=1
.ENDS
*********************************************

* define VDD and GND voltages
Vdd DVDD    0   1
Vss GND     0   0

* define input signala
Va  InA       0   pulse (0 1 0 100n 100n 0.4u 1u)
Vb  InB       0   pulse (0 1 0 100n 100n 0.9u 2u)
Vci InCI      0   pulse (0 1 0 100n 100n 1.9u 4u)

* main circuit, check fa1Circuit.png for diagram
x1      DVDD    GND     InA     InB         InCI    InCO_   Logic
xInvCO  DVDD    GND     InCO_   OutCO       Inv

xInvA   DVDD    GND     InA     InA_        Inv
xInvCI  DVDD    GND     InCI    InCI_       Inv

xXnor   DVDD    GND     InA     InA_        InB     InX     Xnor
xNor    DVDD    GND     InCI    InCI_       InX     InS_    Xor
xInvS   DVDD    GND     InS_    OutS        Inv

.tran 10n 4.1u
.op
.option post
.end