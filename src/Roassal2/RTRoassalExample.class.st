"
RTRoassalExample new installTitle: 'GroupOfGroups' 
		code:
		'
^ v'
	
"
Class {
	#name : #RTRoassalExample,
	#superclass : #RTAbstractExample,
	#category : #'Roassal2-ExampleBrowser'
}

{ #category : #sources }
RTRoassalExample >> exampleAddingAndRemovingEdges [

| v es anim edges |
v := RTView new.
v @ RTDraggableView.

es := RTEllipse new elementsOn: RTObject withAllSubclasses.
v addAll: es.
RTMetricNormalizer new
	elements: es;
	normalizeSize: #numberOfLinesOfCode min: 5 max: 30 using: [:vv | vv sqrt * 5 ];
	normalizeColor: #numberOfMethods using: (Array with: Color green with: Color red );
	alphaColor: 0.3.
	 
anim := RTForceLayoutStepping new view: v.
v addAnimation: anim. 

v addMenu: 'add edges' callback: [ 
	edges := RTEdgeBuilder new
		view: v;
		objects: RTObject withAllSubclasses;
		connectFrom: #superclass.
	anim addEdges: edges ].

v addMenu: 'remove edges' callback: [ 
	v edges do: #remove.
	anim removeAllEdges.
	v signalUpdate ].

	^ v
]

{ #category : #icons }
RTRoassalExample >> exampleAddingAndRemovingEdgesIcon [
	^ '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
AElFTkSuQmCC'
]

{ #category : #sources }
RTRoassalExample >> exampleAddingNodeDynamically [
| v stepping |
v := RTView new.
v @ RTDraggableView.
stepping := RTForceLayoutStepping new view: v.
stepping after: [ v canvas camera focusOnCenter ].
v addAnimation: stepping.

v canvas addMenu: 'Add circle' callback: [ 
	| el |
	el := (RTEllipse new size: 20; color: (Color blue alpha: 0.4)) element.
	el @ RTDraggable.
	el translateTo: 5 atRandom @ 5 atRandom.
	v add: el.
	stepping addNode: el.
	v signalUpdate.
].

v canvas addMenu: 'Add connected circle' callback: [ 
	| el edge |
	el := (RTEllipse new size: 20; color: (Color blue alpha: 0.4)) element.
	el @ RTDraggable.
	el translateTo: 5 atRandom @ 5 atRandom.
	v add: el.

	edge := RTLine edgeFrom: el to: v elements atRandom.
	v add: edge.

	stepping addNode: el; addEdge: edge.
	v signalUpdate.
].

	^ v
]

{ #category : #icons }
RTRoassalExample >> exampleAddingNodeDynamicallyIcon [
	^ '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
t8bt/+2frM7BYLwVAAAAAElFTkSuQmCC'
]

{ #category : #sources }
RTRoassalExample >> exampleAligningGroups [

| rootClasses groups v elements edges |
rootClasses := Array with: RTShape with: RTLayout with: RTBuilder.

groups := rootClasses collect: [ :cls |  | g |
	g := RTGroup new.
	elements := (RTEllipse new size: 8; color: Color blue) elementsOn: cls withAllSubclasses.
	g addAll: elements.
	edges := RTEdgeBuilder new
		view: g;
		objects: cls withAllSubclasses;
		connectFrom: #superclass.
	RTTreeLayout on: elements edges: edges.
	g
	].

v := RTView new.
groups do: [ :aGroup | v addAll: aGroup ].
RTHorizontalLineLayout new gapSize: 30; on: groups.

RTAlignment new elements: groups; bottom.

	^ v
]

{ #category : #icons }
RTRoassalExample >> exampleAligningGroupsIcon [
	^ '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
RU5ErkJggg=='
]

{ #category : #sources }
RTRoassalExample >> exampleAlignmentFromTop [

| rootClasses groups v elements edges |
rootClasses := Array with: RTShape with: RTLayout with: RTBuilder.

groups := rootClasses collect: [ :cls |  | g |
	g := RTGroup new.
	elements := (RTEllipse new size: 8; color: Color blue) elementsOn: cls withAllSubclasses.
	g addAll: elements.
	edges := RTEdgeBuilder new
		view: g;
		objects: cls withAllSubclasses;
		connectFrom: #superclass.
	RTTreeLayout on: elements edges: edges.
	g
	].

v := RTView new.
groups do: [ :aGroup | v addAll: aGroup ].
RTHorizontalLineLayout new gapSize: 30; on: groups.

RTAlignment new elements: groups; top.

^ v
]

{ #category : #icons }
RTRoassalExample >> exampleAlignmentFromTopIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAFeUlEQVR4XuWavWtTURjG76Au
OrpVOourH+AkDg5ORR1EcFD8A4p2KIKoYIuCoIhTHV3Eog5+TFWUoovWP0CdlH43bb5zk6Z5
4n3O6UlvLomN6W0S+jwQbnJzcj7e3znv+56T61Wr+uolefom0AeiL30g+kD0pQ9EH4i+9IHo
A9GXPhB9IPrSB6IvfSD6QPSlD0QfiL70gegD0Zc+EH0g+tIHoi99IPpA9KUPRB+IvvSB6APR
lz4QfSD60geiL30g+kD0pQ9EH4i+9IHoA9lO3boFTE0B+ji6CKRSqSCZTGJ5eRmeB4yMFJBK
pZDJZKAPpENaXV2F7/tYXFzEysoKyuWyeRWLRXPfgSKkmZkZA2xtbQ36QGJULpczBqdx8/m8
MXyhUDBG5ntCcmWjq4O/Jby5uTmzevh5Jxidk45jpR1KpRKWlpbMJDTeYjsaZGM0Pmc3r2yY
ChuUMKjob2n46D3WwRWVzWbNa35+3gyo0e97SRw3+0k7OAB8cQycaLOzs7UrXxy7FxdxNuKM
5FaBM5iD8y+jh8W6Gt3nbGK9BMs6+J6rh/edy+u06HLZF9eHdDoN2sONg96BfeT96enpGgyu
CvafIFjGTbi2gBw8CFy4UDEdYCXPniEIzNbFuFXAQD06uuGerl4F9u1DS4ZzZZt9T9Cs99Kl
Mi5e9PHoUR7HjxeCTC2DEyfy1WQyY/rz/Hk8K4h1PX1aMmMlABqXRuR3bIPf896BA+Xq5OQC
Tp7MY2wsgStXchgcTOPu3TTOnctiYiKFgYFsNZFI4fTpXHVqKodTp3K4d6+Ay5cLOH9+rT0g
BPDhw8ZggwmA4eF6Qw8PF+pS2Y8fETRcbslALHv/fqU26GZ6/x6gQb59A5g6B4swuLpUuloN
PFssQIaGMsEsrzScTAsL9W3aPgBfv9q+sY92PECjstevF03Z8XFb1ovTX0bdS3RptxqUWda9
J5Ruxgq6YboX9oOuKG7XGHXPXpyZVPgeP0eDeKtAooPm526kv5xkzAIJgpOE/YgbyrYAcavB
BTM3w6MpbXjmbzYro/cIeDMXFqdce65NQmD/OVZOjrigxAKEseHXL6wbH3j1ynb6wQPbybEx
+3liwg+yB+DHD+D7d4BlX7/+t/txZZu5MhpichJBzh6/G2OdrJsQnjyxk+zhQ3t9+dI3/f/y
xcfPnwgypbIpu9U2X7womnq3BGTXLgRZja2EwYlZxps3Nttg5svr6Ki9XrsGHDkC7NljA5q3
SYtHjwK7d6Opi+IqZB3MxOIGwjpZ9507lfXMyX5+985e2X/27dgxgOPyvHgyOBfoe+ZwMSzu
6J2r6PWN3446XGzmT13g5/topqYPpINnOy54hjMx7oC5y9cH0kGFT3qjexCXcW121CIP5MwZ
4Pbt9v3779/A/v08RinWzn2os2ftLjdc9s8foK+Pp6NZ9PcDnz/v7LjSVSABi7o6mgFxZfv6
9IE0Db6tbvL+Z/PH+BE9gtEP6i36/a3+WRQFQtfFl2JmtWUgPBKJG0i4vp3yz2BHgLgZHKfL
Cp95udWiuClsCwi3+kNDwOHD9jiknUbfvkXtaKLR8cHgYDzHEhJAPn1C3YFhuw0/frzx2/Fx
v+6ALZHgH2Al/RXSLTX6/6OTR+36QCJiPArHFMYp1QfmvF5ZHeHAziwrvIPXB9JB3bhRNn/+
j4z45mGA8IMLN29W9E97O96B9cd19u4FmL0NDACHDtmnNPgokT4QfekD0Zc+EH0g+tIHog9E
X/pA9IHoSx+IPhB96QPRlz4QfSD60geiD0Rf+kD0gehLH4g+EH3pA9GXPhB9IPrSB6IPRF/6
QPSB6EsfiD4QfekD0Zc+EH0g+tIHog9EX/pA9IHoa1v0F3yNzF9907LgAAAAAElFTkSuQmCC'
]

{ #category : #sources }
RTRoassalExample >> exampleAnimatedCircle [
	| nbOfCircles  v shape mousePos |
	nbOfCircles := 25.
	
	mousePos := 50 @ 50.
	v := RTView new.
	shape := RTEllipse new sizeElement: [ :el | ((el position - mousePos) r abs / 3) min: 50 ]; color: (Color blue alpha: 0.4).
	v addAll: (shape elementsOn: (1 to: nbOfCircles)).
	RTGridLayout on: v elements.
	
	v when: TRMouseMove do: [ :evt |  Transcript show: evt position printString; cr . mousePos := evt position. v elements do: #updateShape. v canvas signalUpdate ].
	

	^ v
]

{ #category : #icons }
RTRoassalExample >> exampleAnimatedCircleIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABjCAYAAABt56XsAAAD8UlEQVR4XuWZCUuVQRSGp5Jc
U3HJNENBczfXLCuXXHFX3BUVS/3/PyHepsM3M3cSkYLieWDg+vrduTBnzvo5Pnz48OHDhw8f
Pnz48OHDhw8fPnz48OHDhw8fPnz48OHDhw8fPnz48OHDhw8fPnz48OHDhw8fPnz48OHDhw8f
Pnz48OFzD2/eOHdx4dzdnXOTk4U+MeG1y0vnOjq89uSJcwsLXt/YcK6hweutrc4dHnr98+di
j6Eh575/92tkpNA/ffLPHh3574r6eufW172+uOjcs2dQg+gAwvX6tT+kVBdzc7G2u+v1q6tY
lyEqK0v3qKlxrq8v1r5983tsb8e6jMI3yJ33DPOOcMk7jo/zhkq16Wnveane1eXc+/cP20Ne
i+TkJD6IxkYfPkLt/Nw/qwMN9bU1r29txbqFodvbQtNnGTX1Pn1XLC/Hen8/1CBVVYVX6FYb
Cl2mv3hR6OPjPtdIN3TQ+lv6wECht7QUe7x6Vei9vcUeT5/GeUtLv4Gmudm57u5SXR7x8mWs
6QB1eysqYl1GU35IaW+PDW3o2draWCsv93tjE7pQVWRhYmen0MMkOztb3Pibm9LQ9PZtHN7k
dUIhzXRVUHboYZg0I4ahTL8RehQ6qQ8OllZClnhXVvIVUvrs1JRzdXWluvJTrmDIVWqbm3yD
/Fyjo84ND+errDR5K1Hn9vj40fcoqS4v+F2VFXqe1v4+1CDWjFkTaElWocd0NYFpWNHq7PS6
DBAaSZ4gFALTnkUVXFh9WThMy2QLh0jkEQolYTKVYaS9exc/a2EnTdQ9PV5X8xeiiimtmqyy
U7UVYpVdUxO8ylIYUXJXtRUevEYcygcKV4YS+Py8D20hOkh18qqqDHXr8h6t6ur44OUZYeks
ZHztLeNiUZgKQ4UOTiVtqF1fF6VqqGuulYYmG7/kcksu7O3t5ccyKi74Sf2e0YnC2enpw8Ye
8jYNJFNd3iWPe8geqrr4Bvk1b8odppiZibWzs9IRiZZyhvqNdA/ljrGx/N7pnEyhC0lbW37C
+vVraQgSKkftBlsCV8NoRgn7B4Ud2yMcv6tqs4rMGkDlG3sNoFE+Hz7/BkqydrtVbRkWWvS/
sCew261bXFZW9BZ2u5eW+Gf6R3OI+guFkVyctzd9tiy06I1gqIfhic9fqrLUKD60yvryhX+u
jyadISn8aJSem1np5of66qrXDw7yIxU+j+D5c19RadakiivMLWr41PyF7z7UTStUffgQ7yOv
kJ57r8KHDx8+fPjw4cOHDx8+fPjw4cOHDx8+fPjw4cOHDx8+fPjw4cOHDx8+fPjw4cOHDx8+
fPjw4cOHDx8+fPjw4cOHD5//mx9m6Vpqr6HZGwAAAABJRU5ErkJggg=='
]

{ #category : #sources }
RTRoassalExample >> exampleAnimatedDots [

| v elements s |
v := RTView new.
v @ RTDraggableView.
elements := (RTEllipse new size: 20; color: (Color blue alpha: 0.3)) elementsOn: (1 to: 100).
v addAll: elements.
elements @ RTDraggable.

s := RTForceLayoutStepping new view: v.
v addAnimation: s.

	^ v
]

{ #category : #icons }
RTRoassalExample >> exampleAnimatedDotsIcon [
	^ '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'
]

{ #category : #sources }
RTRoassalExample >> exampleAnimationStartStopButton [

| v elements stepping |
v := RTView new.
v @ RTDraggableView.
elements := (RTEllipse new size: 20; color: (Color blue alpha: 0.3)) elementsOn: (1 to: 100).
v addAll: elements.
elements @ RTDraggable.

stepping := RTForceLayoutStepping new view: v.
stepping addStartStopButton.
"Uncomment the next line to have the animation from the beginning"
"v addAnimation: stepping."

	^ v
]

{ #category : #icons }
RTRoassalExample >> exampleAnimationStartStopButtonIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAB0ElEQVR4XuXVsWrCUBiGYe/d
zSFkl0CmkMXFTQUnQRK9Ae9AEG9AzK89KbTQQjfbU54PHDwu4TyGd/J4+MtpE/8KfBB/P4H0
fR+n0yn2+318/bFt26jrOu73e/hX9Usg5/M5qqqKsixjvV6Plz8MwwiwWCwioRyPx7her+NZ
0zSREP2rexFI13Wx3W6jKIqYzWYfb8Nms4nb7TaeJaD0fTqdRgKZz+c+iN8QH8SfD+LPB/FB
/PkgPog/H8QH8eeD+CD+fBAfxJ8P4s8H8UH8+SA+iD8fxAfx54P4IP58EH8+iA/i7w9BLpeI
5fL9s9tFiGdZgaxWnw+YPuJZViCHw/cH1M6yAom3pYdM/5z0OotnftT9qPtR96PuR92Puh91
P+p+1P2o+1H3o+5H3Y+6H3U/6v78qPtR96PuR92Puh91P+r+/Kj7Ufej7kfdj7ofdT/qftT9
qPtR96PuR92Puh91P+p+1P2o+1H3o+5H3Y+6H3V/ftT/X4SzBVEjnC2IGuFsQdQIZwvizwfx
Qfz5ID6IPx/Enw/ig/jzQXwQfz6ID+LPB/FB/Pkg/nwQH8SfD+KD+PNBfBB/PogP4s8H8eeD
+CD+fBAfxJ8P4oP4e9meacybRQbJVu4AAAAASUVORK5CYII='
]

{ #category : #sources }
RTRoassalExample >> exampleAnotherTreeLayout [
	| view elements |
	view := RTView new.
	elements := RTBox elementsOn: (1 to: 100).
	elements @ RTDraggable.
	view addAll: elements.
	RTEdgeBuilder new
		view: view;
		objects: (1 to: 100);
		shape: (RTLine new color: Color purple);
		connectFrom: [ :v | v // 2 ] to: #yourself.
	RTTreeLayout on: view elements edges: view edges.
	view edges do: [ :e | e trachelShape pushBack ].
	view @ RTDraggableView.
	^ view
]

{ #category : #icons }
RTRoassalExample >> exampleAnotherTreeLayoutIcon [
	^ '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
gg=='
]

{ #category : #sources }
RTRoassalExample >> exampleArc [

| view shape label elems |
view := RTView new.
view @ RTDraggableView.

shape := RTArc new
    innerRadius: [ :i | i *50];
    externalRadius: [ :i | (i * 50) + 4];

    alphaAngle: 45;
    betaAngle: 135;
    color: Color black.
elems := shape elementsOn: (1 to: 10).
view addAll: elems.
elems @ RTHighlightable.

label := RTLabeled new text: #yourself.
label bottomLeft.
elems @ label.

^ view
]

{ #category : #icons }
RTRoassalExample >> exampleArcIcon [
	^ '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
AABJRU5ErkJggg=='
]

{ #category : #sources }
RTRoassalExample >> exampleArrow [
	| v es c arrow |
	v := RTView new.
	c := RTMultiLinearColor new.
	es := (RTEllipse new
		size: 30;
		color: [ :e | c level: e / 10 ]) elementsOn: (1 to: 10).
	v addAll: es.
	es @ RTDraggable.
	arrow := RTArrowedLine new
		color: Color red;
		attachPoint: RTVerticalAttachPoint instance.
	RTEdgeBuilder new
		view: v;
		objects: (1 to: 10);
		shape: arrow;
		connectFrom: [ :n | n // 2 ] to: #yourself.
	RTTreeLayout new on: es.
	^ v
]

{ #category : #icons }
RTRoassalExample >> exampleArrowIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABjCAYAAABt56XsAAAFKklEQVR4XuXa20+bZRwH8DeZ
Xmy72Y033vgXmE3RcTEvvJjRmI0sMTHgjQkaJGbrJDswI6Q6Ix64YAnLSEtwcQQZ4TBoDDAP
VBAYh25jcoaV4UopR0XAAqX9vr5PyVv6tm9HW4pgvt8nv0D6vjTwfHif533ep5Is82cvReLv
An4Q/vCD8IPwhx+EH4Q//CD8IPzhB+EH4Q8/CH/4QfhB+MMPwg/CH34QfhD+8IPwg/CHH4Q/
/CD8IPzhB+EH4Q8/CD8If/hB+EH4ww/CH34QfhD+kIE8Sv8MNilJFvX7cyfgXVgCP8guZfpq
RQBDrZ5njvOD7FbuK50fCiKKH2SX0n84jR9kL2Xhx44wkMFX3uMfsnYVpb4Njw35GH/xFJxG
E/9d1m4HbW3AnTvA+jrQ2gpYLPxXyH8KoHS8/+vYGDA8DJGwc+rqgOVl4MED8IPsNEhlJdDZ
CXR1bdnZWFwE+vqA6mqgvx+YmQE/SAKzVFoDX1YWMD4eU8fC6wUuXoQ3+xImeufBD7LNjNf1
wLzvA5ikDFlUd25dbCBKrqY0IkMyyaIuH6nC5MCf4AeJI+srngBEcDmtQ1F3aHHqzwEMtb54
qYYfJJ70FjbpgtiMlqjfIxRDLX6QODLZMqIP8mn0t7cXni0FP0gCU/NyngbF/FQmPEsrUYMM
WZ1hGOVnWvmHrLjnEfcaxBD1y/MGdOXUYrrrUcyd2f7dMMoyW2B++ydYjDbw32Vtd/0hVuMd
HUB7u7/ieo+SEuDWLf7b3m1BtLQACwv+BV7gNZcLmJiAWF9E9R5iUWi1bv682Qz4fPxDVlwg
djvQ3Q31kYnmmMMBP9jNm0/sXLGqF+cGP35BbS0wNwd+kFhW5gteTKekAwMDETtOXDme9AwM
/KbfuYMtw5i9diPs2GpVNcbPf8IPEvXa4dUhJEk2WS2bdVH3vORkQFL+CrWamzceNjbfXYSU
ZJPVSn53MND5JwobIGWYZLUquh+CH+QJKSuY0mCoFZrsbC2GWv4/LAhDrUuFDtTcG9NgqLXi
8YIfJELOvDGiC9LXqf1Eyf79sYEcOHYXRotN1gP5urGHHyRSCs45dEHcS9r/4pMnYwNJyRoV
ILpXyL0/ZvlBIuUfpeNDMcScEnqe2OoIxUhL25hDUj+2IxSk3+72H9uXadagHM2r4Z9Dtop7
2YsrFxzIPdqIymuRN5acTsBgAFJfn0d5uXb3sKxhHqfOjcKQ/xiuOU/gmE95HJ9T24XXCn7A
lw33wX+XFe0apKhoY598bW3r3cGmpv/1XvqeBsHkJGDbfN6k7o1HgvGfr4CIfXR+kJ0AOXsW
mN/caoXbDZSWAsXF+iCNjcoYlMN/hexE7H/PwJV1OmyYQn09Rr45jzWfJ6zjZzELe8VX/CCJ
TJvrIQ6UnIZkypBFie/bp+z+Ts6dKIJkS5LVenPE4H99FatIVpokb7bbuM3/uaxE5HDl5QCG
WkeqPodjbVqDoVbtX7/ifaUFY6iNHyQRv0gIhlr5rhu6IEanST6Ig/wgO5VD18+GXSGHrn+E
XveoLsiVqe/xltL4QXYoVudQ2NUhXhM5PvyhBuWF/nf880Qf+vC00oIx8pDHP4ckKq0u5VmT
zSKLEpN88LG8yW8hhilRPmzu9jnhhFHeaOUo51+H8IcfhB+EP/wg/CD84QfhDz8IPwh/+EH4
QfjDD8IPwh9+EH4Q/vCD8IcfhB+EP/wg/CD84QfhB+EPPwg/CH/4QfjDD8IPwh9+EH4Q/vCD
8IPwhx+ELf8CoRrNZjC/o6EAAAAASUVORK5CYII='
]

{ #category : #sources }
RTRoassalExample >> exampleArrowedAndLabelledLine [
| v e1 e2 l |
v := RTView new.

e1 := (RTEllipse new size: 20) elementOn: 'hello'.
e2 := (RTEllipse new size: 20) elementOn: 'world'.

e1 @ RTDraggable.
e2 @ RTDraggable.

l := RTEdge from: e1 to: e2.
l + (RTLine new color: Color red).
l + (RTSimpleArrowHead new color: Color red).

e2 translateBy: 60 @ 80.
v addAll: (Array with: e1 with: e2 with: l ).

e1 @ RTLabeled.
e2 @ RTLabeled.

"Note that the RTLabelled interaction has to be set after having added the element in the view"
l @ (RTLabeled new text: 'lining up!').

	^ v
]

{ #category : #icons }
RTRoassalExample >> exampleArrowedAndLabelledLineIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABjCAYAAABt56XsAAACf0lEQVR4XuXZ3YtSQRyH8QPi
S0q+oK6ix1fwbdd1u3BR0VUQsRA2iLroogOxhHSVFBEERRcSLCh0ZRd7sYW3etOl1GVdebm3
C3YRsftXnM4IQl120c6J58MMczyeq+8wDL8ZhY+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+P
j4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4/vf5NIJJq//47FYnV+KhI1m81XvV5v
0u12x5qmfa7X6y/y+fydWq32jJ+OpBXi9/uzPp8vHQ6H98QKSSaTrUgkss9PRyKHw3FtMBi8
Ed1utzv4iUg2n8+/rVYrXfTZbPaVn4hkm8n4OZutR34ikk2n04WYiB+LhT49PV3wEzGBfr//
XHRNUTR+GiazvW58phE2mlEh8otEs60Si6JY+EmYCH8/kUgcm3i93lSpVHrgcrm2RBVfrVYH
R9nssVHF3xDfuN1u1ajiy8b7p0Yx6eWn9o8nJB6PN1RVrVYqlSfinCuTyfSM8fX+zs5D8Y34
v1wuPxbPTqczwE9NgmKxeP9od/ed2E+sVqtTdJvNdp2fjGStdeMzlXvr9qdQKFQSY6FQuMtP
6IqJe5JbBwdvG43GS3FM3+l0jsXmHwwGt8W+w0/oihnht1KpVDupqo1cLnf7Ziz2yOPxJNLp
dCcajVb4CUnStljaw+Hw/afDwy/8+xMTWC6Xl5eTif797Ew3ni/4iUi2Oj/XL05O9M09Cj8R
ycbj8cfNZIxGow/8REwgEAhsic5Pgo+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+P
j4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+P76/8Al/ZjWaoPOt3AAAAAElFTkSuQmCC'
]

{ #category : #sources }
RTRoassalExample >> exampleArrowedBezier [
	| v shape  edge els |
	v := RTView new.
	shape := RTEllipse new size: 10; color: (Color purple alpha: 0.3).
	els := (shape elementsOn: (1 to: 6)) @ RTDraggable.
	v addAll: els .
	RTHorizontalLineLayout on: v elements.
	edge := (RTEdge from: els first to: els last) + ((RTBezierLine new controllingElements: v elements)  + (RTEmptyArrowHead new) ).
	v add: edge.

	^ v
]

{ #category : #icons }
RTRoassalExample >> exampleArrowedBezierIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABjCAYAAABt56XsAAABCUlEQVR4XuXRIQoCURQF0A8i
DGgSwWCTCTpBTAb34Tp+NAjKiLgBbWYXNGifJVjsyjSxOQyInAMvXG67L/h8Pp/P5/P5fD6f
z+fz+Xw+n8/n8/l8Pp/P5/P5fD6fz+fz+Xw+n8/n8/l8Pp/P5/P5fD6fz+fz+Xw+n8/n8/lI
aZpO/BUa0ArtpIlcFMU9y7LZZ+/7wiCMFpt4uMQYt9Wt4vpUN5dl+bwWt8e4M1/6y9aUhG6/
F4bTJnL1kP3ucH7vfT+U5/nRX8Hn8/l8Pp/P5/P5fD6fz+fz+Xw+n8/n8/l8Pp/P5/P5fD6f
z+fz+Xw+n8/n8/l8Pp/P5/P5fD6fz+fz+Xw+n+/vvADh2zp6vpL8RAAAAABJRU5ErkJggg=='
]

{ #category : #sources }
RTRoassalExample >> exampleArrowedEdges [
	| view els |
	view := RTView new.
	els := (RTBox new
		size: 10;
		color: Color blue;
		borderColor: Color veryLightGray)
		elementsOn: Collection withAllSubclasses.
	els @ RTDraggable.
	view addAll: els.
	RTEdgeBuilder new
		view: view;
		objects: Collection withAllSubclasses;
		shape:
			(RTLine new
				attachPoint: RTShorterDistanceAttachPoint new;
				color: Color veryDarkGray)
				+
					(RTSimpleArrowHead new
						attachPoint: RTShorterDistanceAttachPoint new;
						color: Color veryDarkGray);
		connectFrom: #yourself toAll: #subclasses.
	RTTreeLayout on: els.
	view @ RTDraggableView.
	^ view
]

{ #category : #icons }
RTRoassalExample >> exampleArrowedEdgesIcon [
	^ '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'
]

{ #category : #sources }
RTRoassalExample >> exampleArrowedLineWithOffset [
| v e1 e2 e3 e4 line |
v := RTView new.
e1 := (RTEllipse new color: (Color blue alpha: 0.4); size: 20) element.
e2 := (RTEllipse new color: (Color red alpha: 0.4); size: 20) element.
e3 := (RTEllipse new color: (Color yellow alpha: 0.4); size: 20) element.
e4 := (RTEllipse new color: (Color green alpha: 0.4); size: 20) element.
e1 @ RTDraggable.
e2 @ RTDraggable.
e3 @ RTDraggable.
e4 @ RTDraggable.

v add: e1; add: e2; add: e3; add: e4.

line := RTArrowedLine new color: Color red.
line withOffsetIfMultiple.
v add: (line  edgeFrom: e1 to: e2).
v add: (line  edgeFrom: e2 to: e1).
v add: (line  edgeFrom: e1 to: e2).

v add: (line  edgeFrom: e2 to: e2).

v add: (line  edgeFrom: e3 to: e4).

RTCircleLayout on: (Array with: e1 with: e2 with: e3 with: e4 ).

	^ v
]

{ #category : #icons }
RTRoassalExample >> exampleArrowedLineWithOffsetIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABjCAYAAABt56XsAAACLklEQVR4XuXXzUpbQQCGYS/K
S/FSxGuJWBFcWEGswUXBlSCCYrEmhILgLm6kiy6sujDw2Tnxpw0UIQZOTvK8w0BWWczDzJlZ
eHrya1IL/hL4IH4+iA/i54P4IH4+iA/i54P4IH4+iJ8P4oP4+SA+iJ8P4oP4+SA+iJ8P4ueD
+CB+PogP4ueD+CB+PogP4ueD+PkgPoifD+KD+PkgPoifD+KD+PkgfvMGcpObfC6jVcb3MnyQ
KbeXvSHG6/BBplw7bR+kaUfWdhn+kdWQ8viYLC7G/6g3BWRrKzk89EEagbGzM4TIw4MPMnWM
/f3475BpLX5+jix+Dg7Gxri/T6rpg0wE8SvJpzJbZX55Pp6Oj8de1E6n/EPreXa7zUZpOMi3
F4yX+bsz9mLm7OwN43X6IB8G+TEKktuxFjOnp0m/n83NvxjVbx9kIpRy3uRrmf0PYVS/B91e
jo4ynIOBD1I/4j8Y6fVS5d+yGoaRdjvZ2EhWV/0dUgvE7m7e2xm5vExOTvxrb20gKyvJ+Xm5
KZer8v8wLi6SuzsfpBaMq6tkefldDP8bUhdGeWe83WmXlsrTpbxdrq8zixjzAbK+PvLqm9Wd
MZ87ZG0ts4wxX9+Q6qiaofcG9TD0Qfx8EB/EzwfxQfx8ED8fxAfx80F8ED8fxAfx80F8ED8f
xM8H8UH8fBAfxM8H8UH8fBAfxM8H8fNBfBA/H8QH8fNBfBA/H8QH8fNB/HwQH8TPB/FB/Cbq
Dwek5Kyq+eWvAAAAAElFTkSuQmCC'
]

{ #category : #sources }
RTRoassalExample >> exampleAttachPoint [
|v ellipse box roundedBox e1 e2 e3 l1 l2 l3 ap|
v := RTView new.

ellipse := RTEllipse new
    width: 100;
    height: 50;
    borderColor: Color black.

box := RTBox new
    width: 50;
    height: 100;
    borderColor: Color black.

roundedBox := RTRoundedBox new
	borderRadius: 25;
	borderColor: Color black;
	width: 80;
	height: 50.

e1 := ellipse element.
e2 := box element.
e2 translateBy: 200 @ 0.
e3 := roundedBox element.
e3 translateBy: 40 @ 100.

v add: e1; add: e2; add: e3.

ap := RTBorderAttachPoint new offset: 10.

l1 := RTDoubleArrowedLine new
	headStart: RTFilledNarrowArrow asHead;
	headEnd: RTSimpleArrow asTail;
	attachPoint: ap;
	color: Color black;
	edgeFrom: e1 to: e2.

l2 := RTDoubleArrowedLine new
    headStart: RTFilledNarrowArrow asHead;
    headEnd: RTSimpleArrow asTail;
    attachPoint: ap;
    color: Color magenta;
    edgeFrom: e2 to: e1.
    
l3 := RTStyledMultiLine new
    head: RTEmptyDiamond asTail;
    tail: RTNoDecorationShape asHead;
    attachPoint: ap;
    color: Color magenta muchLighter;
    edgeFrom: e2 to: e3.
    
v add: l1; add: l2; add: l3.
    
v elements @ RTDraggable.
^ v
]

{ #category : #icons }
RTRoassalExample >> exampleAttachPointIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAABAklEQVR4XuXRAQ0AAAgCQfuX
VmMwju0LcPNbv6j8E3wQPx/EB/HzQXwQPx/EB/HzQXwQPx/EzwfxQfx8EB/EzwfxQfx8EB/E
zwfx80F8ED8fxAfx80F8ED8fxAfx80H8fBAfxM8H8UH8fBAfxM8H8UH8fBA/H8QH8fNBfBA/
H8QH8fNBfBA/H8TPB/FB/HwQH8TPB/FB/HwQH8TPB/HzQXwQPx/EB/HzQXwQPx/EB/HzQfx8
EB/EzwfxQfx8EB/EzwfxQfx8ED8fxAfx80F8ED8fxAfx80F8ED8fxM8/wAfx80F8ED8fxAfx
80F8ED8fxAfx80H8fBAfxM8H8UH8fJDuDpK06ys7QL90AAAAAElFTkSuQmCC'
]

{ #category : #sources }
RTRoassalExample >> exampleBezier [
| v shape  edge els |
v := RTView new.
shape := RTEllipse new size: 10; color: (Color purple alpha: 0.3).
els := (shape elementsOn: (1 to: 6)) @ RTDraggable.
v addAll: els .
RTHorizontalLineLayout on: v elements.

v elements first translateBy: -50 @ 50.
v elements third translateBy: -10 @ 20.
v elements fifth translateBy: 0 @ -60.
v elements last translateBy: 150 @ 100.

edge := (RTBezierLine new controllingElements: v elements) edgeFrom: els first to: els last.
edge when: TRMouseEnter do: [ :ev | edge trachelShape color: Color random. ev signalUpdate ].
v add: edge.

	^ v
]

{ #category : #sources }
RTRoassalExample >> exampleBezier3 [
| v e1 e2 e3 lineShape s edge|
v := RTView new.

s := RTEllipse new color: (Color red alpha: 0.4); size: 30.
e1 := s elementOn: 'Begin'.
e2 := s elementOn: 'End'.
e3 := s elementOn: 'Middle'.


lineShape := RTBezier3Line new.
lineShape controlElement: e3.

lineShape attachPoint: (RTShorterDistanceAttachPoint instance).
edge := lineShape edgeFrom: e1 to: e2.

v add: e1; add: e2; add: e3; add: edge.

e1 @ RTDraggable.
e2 @ RTDraggable.
e3 @ RTDraggable.

e2 translateBy: 80 @ 50.
e3 translateBy: 40 @ 25.

^ v
]

{ #category : #icons }
RTRoassalExample >> exampleBezier3Icon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAABuUlEQVR4XuXYTYrCQBCAUe9/
AlHQhQu3gl5D7+BKQVzIENObKScZRok/26GTfh/kAnkk1dWj282vT438V+CD+PkgPoifD+KD
+PkgPoifD+KD+Pkgfj6ID+Lng/ggfj6ID+Lng/ggfj6Inw/ig/j5ID6Inw/ig/j5ID6Inw/i
54P4IH4+iA/i54P4IH4+iA/i54P4+SA+iJ8P4oP8W3E8RqxWEbNZxG4XPkhOjMMhYjx+fjab
8EFygbRfxitI8/gguUDa35QP0iOQ7fYdZDqNqqrCB8mF0syMLkacz78YdV3H09Cfz6MF9EFy
QTWl/f79C1qvwwfJOPTTYlHUjBk2yN/Q/3o5jfkguUCaRfGOcGl+Vfc544P0ZOin5TK+T6f4
uOkPZOgXd5eVUorHCezTpt/zoV/k5WJ7ArterzHETb/o294hbvplg3SGfne59EH6sulPJo9N
3wfx80F8ED8fxAfx80F8ED8fxM8H8UH8fBAfxM8H8UH8fBAfxM8H8fNBfBA/H8QH8fNBfBA/
H8QH8fNB/HwQH8TPB/FB/HwQH8TPB/FB/HwQH8TPB/HzQXwQPx/EB/HzQUrvB3WSZ0g6cvlU
AAAAAElFTkSuQmCC'
]

{ #category : #sources }
RTRoassalExample >> exampleBezierAndCenterOfObjects [

| v es startingElement shape |
v := RTView new.

es := (RTEllipse new color: (Color blue alpha: 0.4); size: 15) elementsOn: (1 to: 20).
v addAll: es.
es @ RTDraggable.

"we are properly locating the nodes"
startingElement :=  (RTEllipse new color: (Color red alpha: 0.4); size: 20) element.
v add:  startingElement.
startingElement @ RTDraggable.

RTCircleLayout new initialRadius: 80; on: es.
es translateTo: 0 @ 0.

startingElement translateBy: -150 @ 0.

"Building the bezier lines"
shape := RTBezierLine new
				centerOfObjects: (1 to: 20) inView: v.
v addAll: (shape edgesFrom: startingElement toAll: es).		

	^ v
]

{ #category : #icons }
RTRoassalExample >> exampleBezierAndCenterOfObjectsIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABjCAYAAABt56XsAAAHNklEQVR4XuWaW0wUVxjHZ8Fd
FkFYuSwL7HK/LSCy7MIuBARBuewKrIhIQRABIZbAVrSUXikJiTXyYFGjSUs0prEPTfqg1b7Y
xMQHExISGjE8WO1LkyZ9aGKb9KXp5XwOkz0zDCug9sL/l53MnJkz58D3zfluMwI++OCDDz74
4IMPPvjggw8++OCDDz744IMPPvjggw8++OCDDz744IMPPvjggw8++OCDDz744IMPPvjggw8+
+Py30esFwW4X9/j8w8THC4LHIwiJif5zx44JwsCAuJcwm8V+1B+fVwgJXtr8CnG5pqblClHr
h89LICFBEHJy/O39+ysqTp8ThK4u3mS5XN0DcpPV3S0qyev1n6NxaDx8NkhsrP8pLyz0n4+M
jIuLkwnW5XJV8e2kpKQ06uc/Q/dLY9G4+GyAuDgSYGvr+SuCkJsbSAHKdllZWbV8rNxcr/fj
WVEhRiO+bDeM1SoIRUXR0dHGQAJXKqSgoKCYb5tMJjONIzd/+KwBh0N8iqtkAs7IyLBmZWXl
8ecsFkuamkIKCwudfL+dO3eWJCYmJsvnofFpHgqX8QkYRRmNo2+qRUfKVcIrgT9Wrh6j0Ri/
nnnwkWGzkZDy89sO2+32MuXVtra2Pum4oqKiVk0hvLnq7e19QzlGUVFRWV5e2+GVwQI+AUlN
Tc0i4fHnghjZ2dk7pLZOpwtZVlQv7XklshUVq6aMhIQEC750n0t6umjPdTrlFfIBkZGRUZyP
KOH9CCklNjbWRG2DwfCsX35+flFeXp6N76e24sT5aN60NHwdqGbg9fVqV0kJvIDr6+tbyNHT
8e7du91sp2G+o0ZaJbm5uYWcCXOoK4NoaMDP6FdRiMl0ciwzs7MnMzMzj4WpiSufZZ3O6XRW
0rHb7T5IvoIETf6DVhFbHdG0UqTVkpKSkrEyuhIxm80pZBKzsw/30rz4ClEtkfhD0G3btkWW
lpZWk2KYgmRJ4ZEjR4arqqoaTp06NVVcXFzR1NT0mlar1Umrgtp0PwldscpcpLTq6mpPaGjo
Vv8VmneTllRinv1eLlsYs7OzX7GI6cTly5e/pEhrcHBwLCQkRN/c3NzR3t7eT6uCwmJSlHQf
ux566NChPo1GE0T9oJ5vA/uxMKeXjDGr5nnXdzeVyOkpjY8n503C9vl8E319faMXL178YmZm
5vPr169/c+fOnaWjR4/66I6oqKhYOq6rq2uh0Lampmaf9NQnJydndHV1vR4REWFY7/ybRiHs
v7GTMqaczulrPt+N93y+aRLq87bJyckLc3OLT588efIX2/58/PjxH48ePfp9cXHxl4WFhZ/n
5+d/unv37ndXr179mvHtgwcPnt6/f/8Hao+NjZ1eyxzP367dcDqV5fv/e8WJ/bgXEAPhghC+
JhMXExPX2XnmEgnF57vw2dTU1KWHDx/+urS09Nu9e/e+n5ub+3F4ePj9s2fPXrl9+/bC+Pj4
mdraWi85a1ole/bsaerv7x9lYe4LlEDa28U/m/abCJat7agThDpWxTOv/271kjiLqnaNjIx8
cPPmzflbt24tDA0NvUNOmUJdZpaGyHd0dHQMMnMV5q9SVbmZKdvPal/51PdF5sdnJRrmkDtp
o8bx48fHJyYmZii68ng8beTEKaqia1R8zMnJKWhsbGxXhsvUt6WlpQtfnGv3QnZ6G0juejnP
aFUTIGXglI1TxMWEfJDqWZSH0EqhomJwcPAW6kdJI1/r4iEFer3eTrFF89G8VJrHR1oEGrLh
yclvvet2f3R+tV6UR0gJIxP2XkYzJYd6vX4rJYwsvNWwyGo7X3632Wwuh8NRvtqYTU3Tl2he
0YfQ34HPMtKXI2WqJY7u7u4hvl1SUrJrOdfQM6GXSiUS6Tpz9Cf5/pSPqM9L8ym/WMFnGa1W
eYZyCuULp4aGhlauaJhK+8rKymc1MIrAuKKk7K0hrSb1dyMr58VHhuhHqD4VFhYmC5/JBEnH
fPlDUojkQwhmykKZQtPlI0fFsCJlET8PPgFpaSET0tx87hN11++v2rLsvFE65l9Q8VGW8t26
BBv/U9FUkUPHJwCrf+DW2trao4yW1BTCmy2C8pT1zIOPDBMrndfVyT8VXf1JV1MIq/yu8Alk
/uRnaHyax2TCl/m6qKzU6z2NFktSmmJ1dKymEKXZItLTM6xardtD4+HLdOMVMiuZFIPBd0L5
uU55efneQAqR3h7y3mf7dt+oaKKsVnzZbojwcH9+IpXGTSaNxu4IDrYkBVJISEja8jt6ySTR
/VK+ERaGL9sXIijIf9zTY7dPnpE746wsl2uEvYbNzOSdts324Wnqrz4OPi+JAwdEZfCCHhgw
m998W64kuk5t6o/PK0T6bCciwn9u3z5R+LSXoOvUDz8L/5fAf5+BDz744IMPPvjggw8++OCD
Dz744IMPPvjggw8++OCDDz744IMPPvjggw8++OCDDz744IMPPvjggw8++Gxa/gaxvt0BZhXI
eQAAAABJRU5ErkJggg=='
]

{ #category : #sources }
RTRoassalExample >> exampleBezierCurve [

"Moving each extremity will reposition the control points"		
| v e1 e2 l s p1 p2 | 
v := RTView new.

e1 := (RTEllipse new size: 15; color: (Color blue alpha: 0.4)) element.
e2 := (RTEllipse new size: 15; color: (Color blue alpha: 0.4)) element.

e1 @ RTDraggable.
e2 @ RTDraggable.

e2 translateBy: -150 @ 150.

p1 := RTBox element.
p2 := RTBox element.
p1 translateTo: (e2 position x + e1 position x / 2) @ e1 position y.
p2 translateTo: (e2 position x + e1 position x / 2) @ e2 position y.

"It is not necessary to add the control points to the view"
"v add: p1.
v add: p2."

s := RTBezierLine new.
s controllingElements: (Array with: p1 with: p2 ).
l := s edgeFrom: e1 to: e2.

e1 trachelShape addCallback: 
	(TRTranslationCallback block: [ :shape :step | 
		p1 translateTo: (e2 position x + e1 position x / 2) @ e1 position y.
		p2 translateTo: (e2 position x + e1 position x / 2) @ e2 position y ]).
e2 trachelShape addCallback: 
	(TRTranslationCallback block: [ :shape :step | 
		p1 translateTo: (e2 position x + e1 position x / 2) @ e1 position y.
		p2 translateTo: (e2 position x + e1 position x / 2) @ e2 position y ]).


v add: e1.
v add: e2.

v add: l.

	^ v
]

{ #category : #icons }
RTRoassalExample >> exampleBezierCurveIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABjCAYAAABt56XsAAABu0lEQVR4XuXawYsSURzA8ddh
OwwxYwkxSx2dAQ1UHLPN2GQVD2rQJXLxJsF27P+/pezBU9ghl198PvAuwzt9H4/hvZnk8/l8
Pp/P5/P5fD6fz+fz+Xw+n8/n8/l8Pp/P5/P5fD6fz+fz+Xw+n8/n8/l8/1BVpdQ0focQsiyl
h4fHcXvr93hCZVm+HQwGk+12+6Oqqt7j06ur04Lc3PiVnsB0Ol0sl8uvf56R5ynVtV/qwnq9
3nA8Hn/ySwQwGo2mh/HRLxFAnuetfr//3i8RxHq9/uZXCKJpmqlfIZDZbLbyKwRSFMVLv0IQ
i8Xii18hkLqu3/kVYr3Q/UNgJPv9/pdfIZDVauWfPyI5XCLO/QqBDIfDD36FQE7fOHwhZFn2
wq/g8/n+A51Op+tXCGS32/30KwRSluUbv0Igm83mu18hiFar9cqvEMhkMvnsVwji+YF/IAzi
2UG73X7tl7iYu7uU7u9Tur4+N/N4kdjtdgd+s4spitNPz/P5uUNgnuf+zwyXd9wdxwU5v0N8
Pp/P5/P5fD6fz+fz+Xw+n8/n8/l8Pp/P5/P5fD6fz+fz+Xw+n8/n8/l8Pp/vr/wGmY0mlw5w
+SYAAAAASUVORK5CYII='
]

{ #category : #icons }
RTRoassalExample >> exampleBezierIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABjCAYAAABt56XsAAACcUlEQVR4XuXb3W/SUBjH8YPI
qFHREayhikDBUkbLW+2kkAUUEl9ivDMh3K2JmYk323/hpX+yPUYTQzagCOzA93NJS6C/59Cn
57QIPj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+
OF2Uey+E+4mfhCKOheE8Fyfv+Unw8fHx8cXhOE7Xdd1XYRhedjqdwDTNWjqd1vjJ3GJB5l/z
ff+sVqu5/HR2LJvN5hZtb7fbr6NfTY+f1I5MJpPPy/aRpy/btpv8tHZA9oxV9221Wn6lUrH5
qW1J1COcuO/pdrtB1HM8fnprSIrUjVdKiUTizqnXG6/Zd55EV2X8osTxVJj9RWtT388vf/zv
2tVgMBjzk17RfXFcyIpn1zZiz/P6i7bHEQTBG37aS2QymceWZf3uD8VisTrfmDf9ec1m00+l
Ukf85Ofoum7IYvx7iZrP5wvheXhVrVbr2xzNsvCyt/Cr8IcsghypcXvJJpVKpZeRE3Qh5Ey6
Xq/f2As08SC3iV6xKsMwCsiZvaZp96JT0FtVe5gcKJhiRJOzftQv8krPgZLJu+tMPPdrohcd
5HA4/LBP37lcLlsHOeOWSxb7OuIOamHSELXxty9XP/f9OEaj0cfDaN47vkrapul0+pU/QVGM
vE3MT0Exs9nsgp8Cv6fwLdNoNDr8FBTDvyWsoOhWQeO6R5H4bhH/cSNFi+K5p+OHImfy01DE
mf0u5P9PRSFyZeKR0C1+Enx8fHx8fHx8fHx8fHx8fHx8fHx8fHx8fHx8fHx8fHx8fHx8fHx8
fHx8fHx8fHx8fHx//QL7WkIkODawDAAAAABJRU5ErkJggg=='
]

{ #category : #sources }
RTRoassalExample >> exampleBezierLinesUsingObject [

| v  es assocs centralPoint eb |
v := RTView new.
es := (RTEllipse new size: 15) elementsOn: (1 to: 15).
v addAll: es.
RTCircleLayout on: es.

centralPoint := (RTEllipse new size: 10; color: Color red) elementOn: -1.
centralPoint translateTo: es encompassingRectangle center.
v add: centralPoint.
centralPoint @ RTDraggable.

es @ RTLabeled.

eb := RTEdgeBuilder new.
eb view: v.
eb shape bezierLineUsingObjects: #( -1 ) inView: v.
assocs := OrderedCollection new.
assocs add: 1->10.
assocs add: 2 -> 10.
assocs add: 3 -> 10.
assocs add: 5-> 10.
eb useAssociations: assocs.

^ v
]

{ #category : #icons }
RTRoassalExample >> exampleBezierLinesUsingObjectIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAFc0lEQVR4XuWdWUokQRCG6xpe
xZt5HS/gkw+CIIgP4oMgCor7vu/7Gj3+DdkkNd12ZVVkVmT/ATI6bS+VX8UemRadDr9YkoJ/
CfiB8As/EH4g/MIPhB8Iv/AD4QfCL/xA+IHwCz8QfuEHwg+EX/iB8ANpR3Z2duTr60v4gRiR
vb09WVhYkJ+fn8pQHh8fBbKxsSH8QAzJ4uIiPxBtOT09lV8t6dzd3UmAVnW2t7eFH8gQWV1d
lampKQk0Wb2vEAHAEIiUQI6Pj7v+IOQ5Z2dnXQ2BX6j6nIeHB3EQLUOh8SEvLy89ICEg6YDg
bj08PJS3t7foi4T3ABh+k1XBH+zv75taqMvLy+7nWVtbEzYgXVPiFsCSbG5uytHRkdD5ECRs
HX7hTAxDzdbV1ZXwAzEgv8FGz78hZM4aCAp/W1tbgsw4VyDPz8+9MPnz81Oy15Dp6Wn5+PjI
2jd8f38HFTDNAkEmPTc311laWuJ31lY0BHYXdphfDABBRuzs7+3tLb+WtA0ETtABubi44Adi
wWTBoT89Pcn7+7vAp7y+vo4UGBQokafgGrPLQwAHmnJzc5N95OULrml2dlayTAyhKfjCnYUY
HyFlzjBgjhFFaudaRepkC1AQgblSeM5gEEVqBy3JSyf39/fd6Q8HBIlXjmDQx3GBC64pWyAQ
5+ChKQDhfgaYXHyMX1rRbHq1Vlx0HUL8CwEUBwMXa72z5/yi9g3UGAjCvjrdPuQqzkwBCi4O
4oeRgAI4/HlIoKyvr0vdO8x9D1/ifoa2+HkLwAFayqrryCWGVaXca/AnQqAd5Wor/m+UtaYx
EGSrcGyYJmzqT/pBQW+lnz+BeQMY7Uw5eyB1pwjLmXy5r+58ih+ZDRoVAjQ8NgqaU2iYHI2p
kX6LiUUuRzH4vb+GIgAH8CwPw5n2IX+ZLt+h91v0Ya8HcAADkxd7P4lW+FtYi+tDYJWjsSqv
j9cBJO3KQOh8chZABpmuQRGZn6/UWWDc1Xg/QGo6yjo5OanSfzcHBGbmL/MyyDdgMTScOuA6
zWujWmByLmvYQpRNm0xMiIyPi3tMuxkG2NBOVypBMdH/DH5dq+kUZmG5TjTscWciZGxMOkXx
n39JMVEPwXSjVqHRLJAqF9YvLO73OrEjLPgvDGVrzA+oAIk1fzVMS/ykcJhfApgchrpVgMzP
z0tbWuJsfFV4I79hBxeJ4YVYHzDE3FSB4kyd1SmYIuWdrJW9a32W0MQyCyDYRRtzS1qdZCt0
+0DKiCw6EI1qb5PsfZDUGTyAdrXdBCs0TAri8JiqX7fnUbfimyJUzi4PaeLcm2qXD+Yvk4lT
KDAmSwmkagSlERj0y2H6gTk4OBBaDWlaOGwCdBgYSiCuRNHk+RpNJDdDBjAwV+fn50ILRCPf
Kffq64q/S1dzvjcrIFp9cg0o/i6xpuYwCRAcpae9d0KzOKilKdQ+xGXVowwlOyCa5sEilGhA
0KxB00Z7uiPGvJUlKEWsnME5PO3SfKyShhUoUYAgRndAYox3xlq4cp4CDU99jleWpwHFHLD2
oeDowdQn3WUJJHbvwgUOy8vLycvxWQJJsQ8R4fX19XXU9rRJIOjuhdppzV2vVUojKSfpWweC
Y5xmZmakzVxkkJ9yQFLuDG4dCCImnD5n0TTCf6TuHBYWSiGolqY4OABH0loZZjALxJkFhJgB
9l1WVlaCFxaHIlvfWWUGSEhvGk2hOkBykNaBIKsPvWsBBKdOh74XoJ+cnJie8c0yD8GChk6a
+4fFWD4LMksgu7u73cXF3R6STDoglh17rn8UzORfVKAF4kLlUTz7hP/sd34g/MIPhB8Iv/AD
4QfCL/xA+IHwCz8QfiD8wg+EX/iB8APhl1ryDy61TE1yL2FZAAAAAElFTkSuQmCC'
]

{ #category : #sources }
RTRoassalExample >> exampleBitmap [

	| v s |
	v := RTView new.
	s := RTBitmap new.
	s form: RTIcon roassal.
	v add: s element.
	^ v
]

{ #category : #icons }
RTRoassalExample >> exampleBitmapIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAADKUlEQVR4XuXZzSu0URyH8clL
NvK2UFbKQrGwtreyEBtRdnb+DCmxICkriewoG1aUslI0ZjE0qxlqzDQLJU0z8jpf928O5vHM
jCzmnh7PddUdc8+Z0vl03+eeIyDx+5cK8KeAD8KPD8IH4ccH4YPw44PwQfjxQfgg/Pgg/Pgg
fBB+fBA+CD8+CB+EHx+ED8KPD8KPD8IH4ccH4YPw44PwQfjxQfgg/Pgg/PggfBB+fBA+CD8+
CB+EHx+ED8KPD8LvvwB5eJBOT6WNDWlpSVpZkfb2pHSaD1K1cjlpe1vq6fH+6oA7Ghultjap
vr5wbmzMjeWD+NjRkdTU5CZ8aEg6Ppaen7+OsXN1dW7M3Fz+VNq7YpLJpDf0mQ9SsdbW3CT3
9krxuLS/L83Ofj92cDCPEQwGdXZ2plAo5F00OT5IRW5TNsHDw+713V3h1lSqnR333uRk/sow
DDsMhg9SKZC+vsLrqys34XZrKtXIiHv/5EQvLy/5K8MwotEoH6RiPT4Wfp+edhM+Olo8bmHB
vbe8/OV0IpHgL+q+NTHhJt3WkGzWPe6urkrd3VJXl3R+XvQRu3XxQfyqocGB2HeQjo7CenJw
UPYjfBC/F3g77PeZGamz073e2uKDVL1YrPgJa3fXvW5v54NUvfl5N/nj41/Pt7a685ubfJCq
NjXlJt6etP7M9rDsfG2tlMkU3eb4IH71sS3ifbcoqr/fvWdryu2t9PQkDQzwQaqyoJfKHoFb
Wgpj7Fhf59+yfOvy0k1yTU35MXa7svXFrpbDQ/4a4muLiw6kufn9y/ujUqmU92+Rh28/duft
ff2mbZPfA3J/L11fv9+9cp+7uPbT9qxKdXNz8znu4uKCv5flVxnv1vSxi2tHzPt+Eve25f8+
IpEIf7e3Wp17e1Y2yeFwuOyYrLfQ2xg7rt+vLj6Ij72+vv7g4Sz3o3F8EH58ED4IPz4IH4Qf
H4QPwo8Pwgfhxwfhxwfhg/Djg/BB+PFB+CD8+CB8EH58EH58ED4IPz4IH4QfH4QPwo8Pwgfh
xwfhxwfhg/Djg/BB+PFB+CD8+CB8EH58EH58ED4IPz7Ib+0NJ43wr9GLX5MAAAAASUVORK5C
YII='
]

{ #category : #sources }
RTRoassalExample >> exampleBlinking [

| classes v shape es labels |
"Set here the classes you wish to visualize"
classes := Collection withAllSubclasses.

v := RTView new.
v @ RTDraggableView.
shape := RTBox new width: [ :cls | cls numberOfVariables * 5  max: 5 ]; height: [ :cls | cls numberOfMethods sqrt * 2 ].
es := shape elementsOn: classes.
v addAll: es.
RTFlowLayout on: es.
RTMetricNormalizer new
	elements: es;
	normalizeColor: #numberOfLinesOfCode.

"Set here the classes you wish to visualize"
labels := (RTLabel new height: 8) elementsOn: classes.
RTFlowLayout new gapSize: 0; on: labels.
v addAll: labels.
RTConstraint move: labels onTheRightOf: es.
labels translateBy: 20 @ 0.

labels @ RTHighlightable.
labels when: TRMouseClick do: [ :event | RTBlink new color: Color blue; on: (es elementFromModel: event element model) ].

es @ RTHighlightable.
es when: TRMouseClick do: [ :event | RTBlink new color: Color blue; on: (labels elementFromModel: event element model) ].
^ v
]

{ #category : #icons }
RTRoassalExample >> exampleBlinkingIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAaX0lEQVR4XuXc5a9kxdYG8POv
kPAN/UZIIIQECXzFA8EtSNBBBveLDe7u7gzu7u7ubgODDLLn7V+F56TY7+7T5zBnLszdnXS6
e++qVatqaT17dY3Nn9//17/pNdb/Jei/QPr/6r9A+i+Q/r/6L5D+C6T/r/4LpP8C6f+r/wLp
v0D6/+q/QPr/6r9A+i+Q/r/6L5D+C6T/r2kXyK+//tr8Om9e49X/5fgXCOSk//ynOXzmzPnf
fftt/wWyKAjkyy+/bJ555pkJhfXcc881Tz/99Hibc8455y/tX3/99eb3338fKfAnn3yy+eWX
X0q7J554onn//ffL71zzYtF1n9dee615+eWXm5rGW2+91Xz11VdNV3uvzz//vPHO748++qj5
O3PV/qWXXmq65jGs/zXXXPOXew8//HDz5ptvNt99910zqRhyySWXNHPmzGk+++yzZtasWc2B
Bx7YvP3222WBX3nlleabb75pMHb88cc3mfzmm2/efPjhh43Bs2Cnn356s/feezfHHntsGfyx
xx4r19AwKe1PO+205sorryy/X3311ebss89uzjjjjOb7778v7Y2pL5p77rlnc8EFFzQm77v7
t956a7PGGms0Tz31VHPeeeeV34TzwQcfNH/88Ufz448/NrfccksRBr7NBz18bLDBBs1U56o9
PrU57rjjynzRx8N9991XFOmYY45pttpqq8KrtbnxxhvLfC699NLCn/vo4+Hyyy9vFmpQJ4i2
xj3//PP/Nddo4T/++OPx8SzoIp9lkfjXX39dtMabeZMwDbn66qubTz75pGige7Tnp59+argo
C0HyrqHjtwWxSL/99lvR2BdeeKG0Yx0//PBDue59//33Nz///HOhja62TNvY77777rh506jb
brut3EfH9Xfeead8d+2kk04a51d/tIxz8cUXl7buhXff9bv22muLlRibVruOv7vuuqvwZt76
WBPuy72sg7aZFz7NgQUZWzt8uGYd9DcH7fTDFxojBXL44Yc3t99+e8PUmPFmm21WCJ911lnN
wQcfXEwPoTvuuKPZcsstm6uuumrc/J599tnx2OH33XffXRbilFNOKS7FYp566qnFbL/44ouy
AHvttVdz0EEHFTd38803NxdeeGGhcf7555exvU2QKzrqqKOatdZaqxFvuA/jrrzyysV96LPT
TjuN83vooYeWT3M54ogjCs9rrrlmcSfG0O6GG24o/HM9xjZ3181bH/xff/31pS869957b2mX
ddAv8zJfc+AR3DfH8LHMMssUWtbl0UcfLWOIlw8++GAz9vlAO4omDxZkMoF3Ki9SXxhmTQuH
3aOR/wRPU33NnTu3k4+xg/fbr2RYxx99dNOVadGMbbbZpkiWxuy3337NvMG+RQBmASZIY30X
WN97771CQ2BmCdwAF0ajaICYog93wjruueee8d+HHHJI88YbbzSffvpp0XY04/pMgJXstttu
hT4XIqB70y6ukVvgjrgMFq2/YCwIs2CukEY+8sgjzWWXXVY0WB+WZn7XXXddoZVxWcAVV1xR
LJD1CMI0Hj33BfPwLlkxF3O0Hg888EDhAz1z0Z97evHFFwvP+EgigxZezj333GbsooGJzR0Q
vX0QK2QhbYE89NBDZaGZJLeASe0MKIswYRPUZvbs2eOZlnuEEH8erSYoPlp//aR8+c2MCZRP
R8996au+6PHZ3As6FsPiWAQ+2W8+/tuBUmlr0vqjTcgysygNK+IW3dcn85POEiy3arEs2uOP
P17mTJHQJEjX8CVehneCyBzR9UYLbwSkP7cshuDbmIltaOGZsPoPnSxqWdbJJ59c9g8kzsXY
J9BGLoNGsSDfb7rppmKitInUmToNsyfwpl3auqeN3yyCudMUgZNr009gpM0CdyyHu/Rd4D96
4F5d811WhB63tu666xZeBFEuwBisAU2WzPqM4b43t4ZHPOHtoosuKu6SxnKf5okOt41W9ie+
o2N9eAFrYnxrpb/gbq0yJ2vnE68T9Tf+mBvcTD7bAmFaFkJjTIsfBHHCCScUs7NwBuBfEY/Z
WixmzEWZMGFpy49zU1wIE5VWc0WE4DObPSZ+5513lr7aESqX6B4kgAL4bpJxN/iRgtZjEDaa
2dThgdAST/zW1yd+uQ73+X3XuTt84Mc9fPqO1+ywrUkULnsdsSVzsnY+8TpRf31HWogJtbOv
erNVwyP17wT3royi3b+OMRjMPqP94n+7rhs7+x0KUMMZNR/1q1Y+/c2zbsvfT5QhiR0Zb6pu
KWNnLzIll3XkkUcWLdlxxx2bGTNmNLvuumuz7777lnx9pZVWKlpBYDNnzmw23XTT4t5oNBcj
O7G4NFp/ATj9WR0t1F+Q41q0yWYJ9LD99tsXujTLdfRlQ4cddlhxKZIM7bRh9mjJAvHAKvDB
RciKXMucTjzxxJJZcX3p7zfXZE5pxyp5AhZIg43Piuxz8MjCzMF17mr//fcf34uYj3Ux3002
2aSMY8/C1fIKSZhkjiwGHXu7SQd12UgN0dNoC8kVRera+M4EfRJA3T/X87vun2uxxtCq6dVj
01Kf2T1zJ/pmtx9a2ky0v0r/9vX0Meeap7R1zRtv9VjD9k31fOpX+7HHSIG0kVyaQvN9j9kG
MaWRvguiQVDz2fWSQvrUj0+nkW0Etv3SjvZ3TT7Xar4sYM1XFnQivuy0o8Fd24CafgJzjWpn
PODosDHE3Pq3Pngb+2HgO2cPTPrHIX6bb+YOaCBTW3bZZUsGIfuw8QuSyeSYPYb54p133rnQ
c11/PpqbWmKJJcatQn+uTz9vNGVDFnaXXXYpWQ7amJeNoc0VbrfdduM4mTYCuY0XHsMXFyEr
4jJrvhITkzGGL23CVyBy14xNANwTXsEchBm0Gq+LL7546RtUe/311y/97Yn01S/7L9+1sz65
jgcbXp9jcwadLt5jj+aHjgDzd142VKPaRIOmi3YXqjzdfLHMhTGn/xfUf4R+TiAQ5gtMkxll
Zynb8TuoqQAHARVs3Ze+CVb8fDIq1qVfkFVZDG0KNNKFwNJC9+3OayjdfQsgPZWSGk+aCaZw
jVYHITYmS0I3KCvayejsG4LQ5rlM3vrQcq5EWqw/vt0zZ3HBNe2M5R6a6PuOF2sX9JhLDiJs
LNcSf4wjHpUYcukgyxgmkGQfMosaNbXgQU2ZMddlgTEhq1pyySXLYsmGvOLSbMagrB48ybZk
cbS7C4EVq6CmXJB9Bx4SBC2QbMnDsN13370sALeEF4qhr+wKr/hAV/t99tmn8HDmmWcWnriu
QCheMCnIrOwKLX210Qdd97g0Lsx4sji82mgaTz9tuSCuVWZFMWVn5hp3Szja2aPI4tZZZ53i
esfCSDuL+m8iuf8WBHZBkeZRL89qRrqs4wdaW9DePz+7LKQLCXWdRJmu67RFYGXCTJrWsRQa
zvW4xm3FugRd7WmyQE2LfHqjR3vc1w4diLMc3thBTaeTfh52+c19CvTcCtrmBp7RR6amvz2Q
NZFU5FkG5Nb9rBE36P4WW2xRMtXcsx1giZ0CeXQwGD/72iC7+bWV7wc66UJCMSkF5ipcNwgz
tiDeJmBiTB7kkTwckxaH2UqptTMGzTNJ/p9Q0XZfOwGVK0QfzhTUdLrpiwNoRciytjzjN2bg
fjxQCGsC8dXOnirocFDqwDCB4r0oFZ4IsFMgzw4a/DIg6vPx2bPn+95/zPUfRHvPGwS57wcB
3efJ228///tWcA/aS7LMTe5MSwQj0mfmeYTpIRA3ADbwe/XVVy/t+E73tKc9bTRWFiPLoGXc
o0xE0AuCzCJpG6iDRtNavNA8b20FWt9pnw2aNnimwXj0G3qMJlrgGHsevJmjtlyS/sbTD6Qi
EWBBxsUbQBDPeJFNmRfavpsb2CT7GTTzzCd8c2E8iGzP/HkXVsV6WdhIgQTtJQiL4G0BpHLu
8b8Y3mOQOpskszeg3zIOboH5uifmEFAbjZX5oGuixpGBJRXlCtFwXzxwXXroNxomgbaF5W64
Me35bbTyYMtvfMt69NUnRRfGISixJ+m369yKmIIv7olb1BfP5h3Bou27ucWlyeLQdC3JQJBy
9MWTIMiEhjfzGYdOhgmkRl/50q5nwV0IbRf+VD8xrLOVNmI6KpOpUd+gzMYfhhfVKK6x53XE
yukc49sqORo29jAUelwgHw0Q3fcHJvxbC2hjzqpJVHDIx0EavtMUSCakk4bIGlgSU+biaJH7
q622WqHHhbEQaKr8Xs4uU+NOFLpxOSyFG4FxoUWzaQ9XR5vk8ZIJ6DPtpYWqVGiiTxP2Scvl
9YIzDd12220LT2h4/Mxloi8w1+gstDlVLQsyBndsb0TrQUX2KlySlzFrFFp71rbCCiuU5GHs
6oFZ0/obBgs2d4L9QI1Y1hrc1hiDynzym1/uotG156lRWe34cZqaPkGH232HaW37xeVllx6k
tk0nKPKCjNEGLrmwALIZu0ahs57c47iFnDLIz+d07EPaaG8bTbVItLjrXvoPQ4YxUk9gIgRW
4MtuPFDMsBraFDkEna3h9fDT5rGewzCkdyIa4iLL6moPgaiV1EuCYU3aGNhI+F0WYPIyD1AD
92LhmBwENoEQwhmkldkzP0GVOXYhw6o+BFimXCPDKXgzHvrJWEDZitS4OePLbmzE4FqJSx5o
2Wdwlyna017ATwmrYKpt6nYtfBBt1mN84+oXNBcdY2Wc0NDOOqAB+pGAaK+fBXcvD6MoniSI
0LQRl7h+EAu6slNr849VnUy2zna6UNQFQYG9hm3kpkJjMnMbKZD8RSDoJ82ggVDSuBnXUqPK
dH13P7WxNEJ/ppvaVkFV1iIj0V5erl0Q5dTU0m7t8OGTZrnH/0oTJRdpE1ilq75YgDWWfUV4
MZZrqbn1iX/X6nGCKqMtncdr+GNVNaIbBFhSkHpjbViy9qHLclzTJu3QHykQE2aushGIKeLM
mfvg110jMJkRJBPzyVS4oqCbFkmAh/7K1pi4Z80WQXubKO2CKLuGadmb8WV72nMHxsQD/oLE
ep4ds++qLxYHZTQrrrji+MYSXaVDGZOLSQ1uPU5QZTz5bjzzMp7si+tNgVxoyqCMby9mr0JY
5oKuvnGJEOwaxR6bLoQzFjOdta40aEER4gVFkhe0P+FOZQ1GCkQenn8z2YMwL79pVBBQWlWj
sLQ1taupjxUsaQo62qgOoZH2Jqnl9aZlEgXBOUiySUkJaaM9RNBlVkjz8RJ0V5BkWSzVs27J
BD5Sy4t3+w5ILbr6S0pYrgUxHzxxc6wNLywM7Ty48p21peaY60ztcR5Hd9VCc3cSiboWuq4t
RnekQPhTHVOjKqeW+QTp9Ske1CiszCq1qwRjcoTATX3xZ5W9IBn0NE8HMR3afKrdrHGD3ooD
XFvQ5UAqrrtvkTws0pfA0NKeX/c9aDWaQWpDI0Vy4YlXQMPcfHeN4qBlE5laXn0S/7QVg4bV
QqOB17oWuq4txv/YpQMf7D13sHhXDnzeovSw6H8S7T1qxoz53nOG/OmT2ZE6U7fBos2pzQV7
+KRhYA33WALXQzO76mxreu5rJ8hqZzzXuAyZyFTaymqMk5JWbtOYeAFtTIY3Fqwv66PF9joy
OG5Pe/M2VhDk/OnGPoL7DRKcGuJc1y4lQmihI+DnOQmXzrWVqpNRAmG2kE+MyHSYaMwrNbje
iS2+mxR/31VnW9PjT7WLqYtXeXBkoabS1uS5DeYv6zFhvFhYGc5keTM/1/L/k/xbV7ZkHO/8
nQ2d7Ce4oiDBxnKf8ohX2vmd5Mi4QYLxI1ZBuLnThbYxrCv+avSUH++qJKRB+Stzu30XOspa
6/Zd2UyNVdV/rR6G9gbHCtSSnflPHQ/t0AtPw5Db1O921f8aI9cJPTTG5gwC3HF//ntq1iBb
asPoshM1p0wReiu/Zv7MG4wiaJM2E+ZiaKa29ikyGdkP6+FSUoBGc1gZhnz6zZSluRDfdnuv
xRZbrLRlpSAHAnAf2sw9yVRShytgB3GmobSX69AeCkuj8W0+aLmPhvhpv4GGvcxyyy1XIBCa
DwmWRZkzF4Re6pjr+mEWbC5ZbGvFNRK2dfQ2JovZYYcdCv941x/fRSDzpnC0RhslTT3tMO1M
TW/oR1P1I6w2whv67fY1GhykNPXEcQVtq6wtbBiynL71M4yuOt1hdcdt5Db3zK1dF01JvYMm
pwa5pjXSZQlA3l3YC189mXpcvrk+bSEoMT/ehRl5JlILo+5bn3owEc6FRv4OlzggJhAiTWSN
NVpc051oLoO1mF+7MPGHu2VxPAOLEEPa/8evea3v1Ui0dRpjYj8PBnhx8Px7XsduG1TgQUyQ
UwGIi0l96mTqcbk31wye/ywyf4yn3tU78AO3Jdgxa7k6N+W+jKQ+9QA/gUny76ac1mDRXfdH
SlrJUnJyg3sWUZ1yUNzQzVxWWWWVv9DNXLgWAd8c7DNsKq2BQC0rS8ZmE+w7t21DKAs1P/xy
bfZCqT3Onof7GreQYQKZbjT17yKjk0V+F+ZpDVPl/acpVPCE9kiB0CRuJCcdCHy0n6nm9Ib2
qQ6gjfyrSbDXjvtIja70M/sM9NwPohok1sIajyvw3ZsLo0113W/Q45wIIatBU0BPVUdOnpDJ
sKCcSpF6XrwE1ea68pSSloevnCqhfWqUU4nonhiUGmjfeZHUKtd1wkEcrJPPrF14GikQrkOm
BenMZsbDHYsL92Gm9WkGmGJ+3I17wWnWXnvtkn2kZheSuvXWWxf3gU4QVbhYal59D8wgs0kl
IhfiE0rqwZWTEdxD2wJyQ4RAcdDBP7cF0llqqaXKQhsjwRYvqTwkFM/MuRjtzZviuF+fZGEs
p0ak7sC1ugYaNsblaZ86Yddlc+ZlnYyRtcMPmgvdZf3bXrR0ss/HR6G3o06N+Du1viMFErRW
sKOV0jnfPYcQcJljTlEgbS4pNbE0nmYyY8AkLQAu0jZuRTtBL0ipAGn/IVmwt/H8IMiuPtzg
LX8ecMD6uJI8yaPdYgyEGC1abgyWx3qCzHJp+HE9tb76hz8uC+/586h9i/0KWvkDj8SFB+Ap
0PbGa5snzz38zr/OkgqzCPzyDpId60m4BVwcJZCgtUFK6xzdYLQtpyjkgVZqYm2CpHjiR2AO
/tcbgxYmcIV7XAva3Az/amJBdrmsnDRh4RNP6qCIrqytPsUhpzDUyKx2eZ6f4obwZ7zEE58E
h3+0CM18ZFTmG8Rav6DFNU/WjnCtU9Yuz9fzt7mcChEEuf8nOfzb0F6SmzUwt4MOOGC+dxs6
oUUkTENZArdBU7giUmWuTBVEIR93jSvTLoho/kCfjRgLyPPt/InedUmD7G299dYbP0WB21Ct
wsxZRt3G84mcCJEkYhiSC4zMiQr4yilz4V3GRXPBK0Gw1famrrmej3upvPGnIxrOnaGZkyHw
ympZlCQCP6xFISGrlVGhxUK4SimyfmPZsufdhlD4/KCTfB6zJDQ+1WB8ejZBKSwWrPja+sSF
PNPObjwPhXKSQuAW2JG+OUWB341r0b9ugxf98xSOoIchuVEEgosCcFvh3aIStgUKgk0RZZVB
a71t7NzjwvBvLfTBJ6HhhxJpk6zQGGIGN2xNZKN4R1c/MY9ACpY1yoT4Sosvh89z7+BDbdT0
2xaEH1ggnzU6O5Xa2rqGuJ0hDTvdoQslrjeNNWTRRaM+XWLYq+v/7e065q5TLyaiMVIgpEey
TJe0wRqkmmcAdc0tzZUpybmZO41SEMclYJJJM1lop72JYI2ecXJNIgBC2GijjQp91yCtXIFx
8scY7s4948lwtEXDIrAMNPVbeumlx/8LaPLcDvqyG64MDzmBwtj2DwneqfcN4m28/LOKFeon
27QWXF9Oi6jrmLk03+098B0kefnlly99ZbDWwF5m4403bsZegUUN3pjlIoZJvUZT26cypOZW
37pktKs+1isahEYbdRWb2lbgd7s2tqsixvekllxC6NRjsOKApW0rr0+I6EJ587tGckO/vW5d
pzekXdvyEi5cH7vvnnvmezPbWzsOMavRXosSJLbeKA17QJMDXPjomk5tqjSkLsqr0dnUe3XR
DmLbxrja/Wve6nastk2zRngnS6fmf6IyqlqhKK0YJ/bUc5+UywraK4gyMQshUOYAS9oCARV4
g2aCDKLtQVVBJ54bC8BiQSoUuZz8r1w/mqJfTvEEtwiIqfUlBGPgg+sQiLkyPLHUdn8BVfug
w6ndtSj5/6Df7tdo9WTpEBQaFBUPypD0MR/0jYOW9uaROmdrSgiua2fzWY7WWBRy84lOiv6f
24dMZjHyn4qcoUjDxRv+GLjXda5tztjNwx/pca5JFOpzdbkAlsSl5Vxd2hb3qI/kYdQZuKwG
LdaLjxRIaO9P/9xxUFZBONor/mmnXwohglWltjf3c7o2dwx2yfm+QcX1r+nhrat9TnMIgu5T
Sjyp2l75u0VaddVVC5rJ9LgpE9twww07z7WFoOqfP0XKUmA7MjDZRH2uLlclI/NpMWQ6NZrM
TchERp2BK97g18Qton0GPvCHNr6Csh5wwAEl+8k5u3hzBrCs0DzR83ArJ1m4bw5+GxtP0Go8
ws2CiuMz9LTHW1f7wPCuE1bqncf+bt3twupXF+pNtv9Ux5nMiQrDanunWkg4Vd5GCqSuO805
uyAL5ilTMLmcypbHs9wcLYfk5rFr+qVaJJXj9hC0RmBnea7nDNs2Ggp55XIEWGMKwJIOiDBe
2ufkhj5+uEd7CJ/44tpodGp58YZ3eynz5ooFWu3xqz0euCYuMAUa9bxYpsBvh+9TkmAuXDSL
0QYdvOVEiPb5viMFUtedBhoRUyyejQ4XgDEpnMHsxgOLBGrhL9MPRKAdekF0U0+b821zhm0b
DeUmc1pQ7dvtyi1C+5zc0OfquI8crMwN6i8VreuLcy5v4pZxCd0a5BQjcShnbnXNy9hiKRdG
EJmfTwsv7qXIEH20a777j/YuallW/1/9F0j/BdL/V/8F0v9X/wXSf4H0/9V/gfRfIP1/9V8g
/RdI/1/9F0j/BdL/V/8F0v9X/wXSf4H0/9V/gfRfIP1/Tefr/wDH0uGMiEHTlQAAAABJRU5E
rkJggg=='
]

{ #category : #sources }
RTRoassalExample >> exampleBorderWidth [

| v shape |
v := RTView new.

shape := RTBox new size: 50; borderColor: Color black; borderWidth: #yourself.
v addAll: (shape elementsOn: (1 to: 10)).
RTHorizontalLineLayout on: v elements.

	^ v
]

{ #category : #icons }
RTRoassalExample >> exampleBorderWidthIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAACXklEQVR4XuXYwaoBURjA8YmF
lTyHslSEkuy9CllQUvIsFhZSs7YgkWdQxFNg5Tt3ztyOzGbOOW7d1P9f32Lqc+/M/GYzEyjF
75sK+LeAD8KPD8IH4ccH4YPw44PwQfjxQfgg/Pgg/PggfBB+fBA+CD8+CB+EHx+ED8KPD8KP
D8IH4ccH4YPw44PwQfjxQfgg/Pgg/PggfBB+fBA+CD8+CB+EHx+ED8KPD8KPD8IH4ccH4YPw
44PwQf7c/X4XlzH7q9VKXMb8ZjKZOM3xePTa3+/38f5gMBCXWa/XcrvdpF6vO81isZDT6SRB
EKggOlDb7Tb+h41GQw2HQ+tMp9N4v1KpqG63ax19Uc/nU3z29UUVCgUVnXDqlEol1Ww2Rf9G
X1Aul0udbDYb75l91/Hdb7Va4rOfyWR+96/X6wuk3+8rfWwbA6Jvnsu+AXHZv1wuL5BqtWrd
n8/nCRDbfq/XS9xg274+50/2DYhtv1ar8UH4IHwQPggfhA/CB+GD8EH4IHyQLwIpFotqNpul
zmg0SoDYXjo18vsNtu3rl9lP9g1IuVxOnXw+nwTZ7XbyeDy8PiVEN81r/3A4eO1vNhulPz20
222nWS6Xcj6fnd+Mx+Ox6HNy3e90OqLPyXU/ekBUGIbOfz96SEQ/5PEx/3Me/2svPz4IH4Qf
H4QPwo8Pwgfhxwfhg/Djg/Djg/BB+PFB+CD8+CB8EH58ED4IPz4IPz4IH4QfH4QPwo8Pwgfh
xwfhg/Djg/Djg/BB+PFB+CD8+CB8EH58ED4IPz4IPz4IH4QfH4QPwo8Pwgfh9w/9AEtPZnpj
vs3ZAAAAAElFTkSuQmCC'
]

{ #category : #sources }
RTRoassalExample >> exampleCellLayout [
	| view substrings |
	view := RTView new.
	substrings := (RTCellLayout >> #doExecute:) sourceCode substrings.
	view addAll: (RTLabel elementsOn: substrings).
	RTCellLayout on: view elements.
	view @ RTDraggableView.
	^ view
]

{ #category : #icons }
RTRoassalExample >> exampleCellLayoutIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABjCAYAAABt56XsAAAGcklEQVR4XuWbe28UZRTGX2KB
tuCNxRabBtKyLZsWWqQtFAo7XEqtVErFFipKQancjNQiWRNdWVQMmhglxhhJCImE/zQxUUNM
jH4Mv4Hfw3Pkee3byc5259JM6/NLTqe7M+/tvDvvucw7hh9++OGHH3744Ycffvjhhx9++OGH
H3744Ycffvjhhx9++OGHH3744Ycffvjhhx9++OGHH3744YcffpYduwO+f1PkYsC5rb7PJ0We
9n3XJ9Jdpuw+kdMi2Qh9/TTk9a+mpNOuMuObKqM3pV3/nBK5JzIrclmkIHJfZELkjMh+kR0i
dSIjON+PSutFJn2V6vnfUO9HIj+IDON6206TyGaRvSLjIkWR7SKDIldF1pTp7AcieZGf0Mav
IRXzTkoTksf46h3dlqA3OxbV9Ysi27RAm8iQyBaRHpFekSMizZCNIq+IjOLcLpHDzi++w9eB
AZHXUG8f7oIs7j7bTg2Unsc1ehzDndURMLCd6PQw6joVUjH9KU3IJozPQL+qWw/9sWNRPW8Q
2cO/SPPDz0JchZyAQXaXnri3aiU2LlK9SktC9SS9ZFm8gPGv8ntCBvbiJoyNiej9qJH6XOQ6
bMMt2BV7rgSj/DaMeq6KekdQnw7uPXxWQ/+Jc+4Y+j4j8rWv/DjKfQb78wd+hG7/1Bk5j7JP
JGzUrzn91PHfcfRxA3074BZUg3tIpBUGO+odoo1m4FVt9jkH9px+PgfDP1ZlvR7q24RyrnPg
OW3tgvFUI9noK38IzkkW7vYBX//yqNtfNqk7xPbTg+fq6kPbPM6/YPPDTxi2BHzvN/hJGOew
rECgahbZ2ajWKYhCC5Ynu3wFBlw7ccEs1tV9CO09BC4jCGRyMH7tiOA7oaQVTn318Np2JzyY
D0UOxijvYVx5Z7zbYCs9Z8wnYdjPJtTvbgTSPTDcHtooQa8juBFsH/6NHNXir4cnotHwF5iA
fqQ33kVlk0iHfAejbaCklU4HcpiUlQlPyCA8FC9i+ecxrrwz3lqRBuecjvcKxvs9zsfltKOr
K04bJfz/FTxa2wd++OEnFHUxy7tG/qllrIcGLG9+J2CD73Mrjmozn63gGDVX23AnKrNB4Qv4
XAODtyrCWq/lLmHt1LR6L44NMRQ0CQXtQPCnbTwHm+LB0WjDdTlkHtZFLN+N6zSifwxOi4cx
TKO+flxzEfaoExH5UTP/eZAdfwE6zTtt2nNDTqbkP0NjDfhRVHwTBjzsHVNEXX9jQjQt8SM6
1BVjQk5gMGr8/nSM4104JhqBP4QRVUW/HqP8A5ELmJBWRNNfwlu6BEX+As9vGnfGQaRARn13
gx3/bej0Fgx6yTlXRB9WG/vHweZw1idw29u6ahNeTlwPLuO0UYc7OhOzvP+JZyNyTk863631
JQXXVWivtoJOa4OSi/zww0+QES4kWN9hOAVqWGewbmsb78OQzUSsNw8bF4c0HuOedbIBapfW
wL4F2uZ7CU/IQ3gqP+N4DW1YwzUVsd7HY0ymTWE8SGFCJmDoNdX0MSZl1FRhcJJi7QJt1JCt
QH0YfzlngR9++EmdAgxYN5YnDZqGYU/acU0OwdU4ArEOGOx63NYtSLtMJpjW0ZTO5RT0oc7I
cUTyBtmAEvrShExABwLQ3sWaEN0soHn+Y/Ao7M5FTVmMmbm0t32GfA5Ha/SLKO86ADqQOzH7
ltaEFPF/CR6o3bl4Gz9Mu2Hw/mJ0wN252IOUQhau7yx+EXZzgk7Mdaeze5GusJsNBhN2W/tM
9OcpUXE3OazGj8JDKkfTOFvN3CaHDP8Cyw8/YdDU+3kT7fUANwB72eD5cML4n0Vk/69e0QSO
uhNwCEZoP74bD1mfelXfiryRcD/PwM54Zu61CO2n3ZRQcLy2oJROGu+IdCNbUTWDMKT2IdWQ
mXuIsseE3z3ShmNzwgNTt/AGnAZ1FrrQT7tbcQB9rbTNZyilH33orVK1y+RujrNfqonfIvGz
JBhArOE3vuXeMbQxQabC+psU2ZSWrPxScBI0Uv/GPNr49TsidU2d/2Xmv0Zgd75rWuEtBEpT
KD9t5qfb474eUFqs1MQCFJfCHWIjdftqQxaGuNxrBM+YR1s6G3HddidS7/HV/RIUGwUvhSh9
SUwIP/O5wK8Cfvjhhx9++OGHH3744Ycffvjhhx9++OGHH3744Ycffvjhhx9++OGHH3744Ycf
fvjhhx9++OGHn5j8A9TB373eT7gUAAAAAElFTkSuQmCC'
]

{ #category : #sources }
RTRoassalExample >> exampleCellLayoutWithCircle [
	| view els |
	view := RTView new.
	els := RTEllipse new size: #yourself; elementsOn: ((1 to: 20) collect: [ :v | 50 atRandom ]).
	view addAll: els.
	
	RTCellLayout new lineItemsCount: 5; on: view elements.
	view @ RTDraggableView.
	^ view
]

{ #category : #icons }
RTRoassalExample >> exampleCellLayoutWithCircleIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABjCAYAAABt56XsAAAE50lEQVR4XuXbbUgcRxgHcFOM
xoq2Ul/S6BnPpipoowbfuaRJQ0BBBV9Qg1grWvAtSgWN2qKiGLGo1BNLiAVrlIpB0PZDUQ98
g6JWEak5fEnUL8mHUigUGpJ8SJt5IAvLsLO3K1e19//BwLH73I47z93NzM7ohA8fPnz48OHD
hw8fPnz48OHDhw8fPnz48OHDhw8fPnz48OHDhw8fPnz48OHDhw8fPnz48OGTq66ubh4YGPip
ra3t25SUlGxRnMFgCG5paTH39PTcj4+Pv6p2zd7e3h+UjsfFxV3p7u6+r/Vva29vvwuTiNjY
WNPBwcG/fJmYmFjmY728vN7j40wm0w29Camqqmqi9+J/DRQoJUMqZrN5lP8W8TEWi8WK34p2
UlpaelstIfynWCkhU1NTv+G3pB37DT0J8fDweIc/n5SUdB2/JY8pIcTf3z9Q6tSpc8ZvRTti
jXteLRnLy8tP8FvpiFVWVn6plIzd3d2XoaGhH+G30DHIz88vHR4etlAi9vf3X9XX13cGBweH
4rcMPnz4Tlb/8RX1IXre4+Pjc5ZGWVJf09zcbKZjSrHp6ek37VFvf3//g83Nzb8cPiGnGWdn
59N63jM/P/+YHwDQsf+yXpiE6JWXl/e5aIicm5tbgt9CJ2giSefwW+iIVVRUNIoSUl5e3oDf
QkfM1dX1DJun/MMng465uLi44rfQMWCLUh/PzMxYpWTQazqG3zLHLCgo6ENWLuC3BD4MNTU1
rVtbW8/oZ2hlZeVpYWHhLVEsWxfx7OjouCf9bLG1+B8jIiIu8XExMTEmmj9QH5OcnJypdK2G
hoav6fkZXWdxcXE/LS0tT1Svr6/v+11dXd9L9bLnbzPR0dEJDpUIPz+/c3t7e6+URk7T09Ob
fDxbA7ksGmllZ2d/Jo/lz1Nd0rmQkJBw0XVGR0fn+HoTExOvieIbGxu7HCYhGxsbf6qtiQwN
DU2pNTJfDAaDURRbUlJSI53b2dl5oXYd+sZKsW5ubm/bqpcl7JP/fTLYz0iWrRulcoqh+OLi
4i9sxba2tvaLGp09MXGh45mZmZ9qqVe6Tl1dXYet2IWFhT2HnnnLS05OTrHWeKvV+rf8k93U
1PQN628G5H2M1nql+LW1td/1xDt8QoqKiqq1xs/Ozu7Yq14pfnV1FSMhBQUFFVpulHabUHxk
ZGScrVgtj9UzMjIK9DRwbW3tHVux7InzI4fo1G3dKBtpPZTHj4+P/yKKpT5Da734nboAbeUR
3STNHzw9Pd/l3zM2NrbAxy4tLT1xd3f30Fqv0WgM0TPsTUhIuCqKp07foeYigYGBH0xOTv4q
v8m+vr6xtxiV+Ys/9QVUwsPDow9bNzWmNA+am5vbTU1NzRXF0spkZ2fnd9LfODg4+LPDTQzx
4cOnRs+mhaioqPj19fU/qNBrW9fOysoq3N7efk6FJoPyc9IzqZGREQttT1W7Dv3LBExC9Gxa
kM8ftCzZioax9AhFfpweTuJ/NZz0b1qghSjpvJZFKVFC+IkhPeXFz4bT4TYteHt7+1HRcn0a
vioNZcPCwi7K68JfcXzjKDYtlJWV1VPhjwcEBBgp6bRmgp+JN/A3LZxA+JsWTij8TQv48OHD
hw8fPnz48OHDhw8fPnz48OHDhw8fPnz48OHDhw8fPnz48OHDhw8fPnz48OHDh+9QXgOox3JY
RZSQNAAAAABJRU5ErkJggg=='
]

{ #category : #sources }
RTRoassalExample >> exampleChangingCargeInForceLayout [

| v es setSizeAndColor s layout |
v := RTView new.
v @ RTDraggableView.
es := RTEllipse elementsOn: (1 to: 30).
es @ RTDraggable.
v addAll: es.
RTEdgeBuilder new
	view: v;
	moveBehind;
	connectFrom: [ :vv | vv // 2 ].
	
setSizeAndColor value.

s := RTForceLayoutStepping new view: v.
layout := RTForceBasedLayout new.
s layout: layout.
v addAnimation: s.

setSizeAndColor := [ 
		RTMetricNormalizer new
			elements: es;
			normalizeSize: #yourself;
			normalizeColor: #yourself;
			alphaColor: 0.5.
		es do: [ :e | layout set: e charge: e model negated * 5 ].
	 ].

v addMenu: 'Change Weight' callback: [ 
	es do: [ :e | e model: 30 atRandom ]. 
	setSizeAndColor value.
	v signalUpdate.
	].

^ v
]

{ #category : #icons }
RTRoassalExample >> exampleChangingCargeInForceLayoutIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAACoklEQVR4XuXcu4oiQRiG4bls
UwMDQcFAwUQwUMFAvALRREUx0RtQQcXz+Xz4e/iKaZNld4Nhmx3eF5pqtCepZ6rKqD88j9//
1Ad/Cvgg/P4EUqvVrFKpWKFQsL89nM/nrVgsWqlUcs92Oh03+n/bbDaNP6XfBGk0Gu9JTaVS
bxzda+JzuZyVy2VbLpfWarWsXq9bKBSyaDTqnovH4+/nE4kEH+S7IMfj0dLptPV6PdN/fCwW
e98LIhKJWDabdRNdrVa9brdrz+fTMpmMey4cDlsymXTPt9ttu91ufBT+GcIH4ccH4YPw44Pw
44PwQfjxQfgg/PggfBB+fBA+CD8+CB+EHx+EHx+ED8KPD8IH4ccH4YPw44PwQfjxQfjxQfgg
/PggfBB+fBA+CD8+CB+EHx+EHx+ED8KPD8IH4ccH4YPw44P8vuFwaLvdzmazmbvm87kbx+Ox
jUYj0/f6TPd8kAA7nU6m63K52H6/d2+R0P35fLbX62X3+50PEtQK0aRvNhvbbrd2OBxstVrZ
dDp1IF+Xp+8UHySABKDVIZTJZOJgtG0JR+9v8a+f9u6VHwmiSdYZIQTBaFwsFu5cEdBgMHBb
mO6v1ysfJKgVIgh/21qv127U9Xg8HILOEf4ZEkB6d5cgtCK0LWm1CMQ/S/zDXSDa1vgg/zj/
15O2pa+D3BOAYPSdVokgBKLDnw8SQP1+34HoXqtFoyAEo9WibUsriP8rK8B8CE28Rm1Z/srR
KBz+GcKPD8IH4ccH4YPw44Pw44PwQfjxQfgg/PggfBB+fBA+CD8+CB+EPwV8EH58ED4IPz4I
H4QfH4QPwo8Pwgfhxwfhxwfhg/Djg/BB+PFB+CD8+CB8EH58EH58ED4IPz4IH4QfH4QPwo8P
wgfhxwfh92ufH5Zw558V2rYAAAAASUVORK5CYII='
]

{ #category : #sources }
RTRoassalExample >> exampleCircleCould [

| v |
"The GlobalBuilder allow you to normalize the size or the colors across a number of elements. Consider the example:"
v := RTView new.
v addAll: ((RTEllipse new color: (Color red alpha: 0.3)) elementsOn: Collection withAllSubclasses) @ RTPopup.
RTMetricNormalizer new
	elements: v elements;
	normalizeSize: #numberOfLinesOfCode min: 10 max: 60;
	normalizeColor: #numberOfMethods using: (Array with: Color gray with: Color red ).
RTRectanglePackLayout on: v elements.

"elements provided to #elementsToConsider: are resized and have a colors chosen between these elements."

	^ v
]

{ #category : #icons }
RTRoassalExample >> exampleCircleCouldIcon [
	^ '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
AABJRU5ErkJggg=='
]

{ #category : #sources }
RTRoassalExample >> exampleCircleLayoutAndEdges [
	| v els |
	v := RTView new.
	els := RTBox new
		size: 10;
		elementsOn: (1 to: 100).
	v addAll: els.
	els @ RTDraggable.
	RTEdgeBuilder new
		view: v;
		objects: (1 to: 100);
		shape:
			(RTLine new
				color: (Color blue alpha: 0.4);
				withVerticallAttachPoint;
				yourself);
		connectFrom: [ :value | value // 2 ] to: #yourself.
	RTCircleLayout new
		initialRadius: 260;
		on: v elements.
	v @ RTDraggableView.
	^ v
]

{ #category : #icons }
RTRoassalExample >> exampleCircleLayoutAndEdgesIcon [
	^ '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'
]

{ #category : #sources }
RTRoassalExample >> exampleClusterLayout [
	| v |
	v := RTView new.
	v
		addAll:
			((RTEllipse new
				color: Color purple;
				size: 10) elementsOn: Collection withAllSubclasses) @ RTDraggable.
	RTEdgeBuilder new
		view: v;
		objects: Collection withAllSubclasses;
		connectFrom: #superclass to: #yourself.
	RTClusterLayout on: v elements edges: v edges.
	v edges do: [ :e | e trachelShape pushBack ].
	^ v
]

{ #category : #icons }
RTRoassalExample >> exampleClusterLayoutIcon [
	^ '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
UUkAAAAASUVORK5CYII='
]

{ #category : #sources }
RTRoassalExample >> exampleCodeAuthorship [

"Code authorship
 Red dot = author, purple dot = class, edge = commit.
"
| classes classesToAuthors authors  authorsToClasses eb v classesElements authorsElements l |
classes := RTShape withAllSubclasses.

classesToAuthors := (classes collect: [ :cls | cls -> ((cls methods collect: #author) asSet sortedAs: #yourself ) ]) asDictionary.
authors := (classesToAuthors values flatCollect: #yourself )asSet sortedAs: #yourself.
authorsToClasses := (authors collect: [ :anAuthor | anAuthor -> (classesToAuthors associations select: [ :as | as value includes: anAuthor ] thenCollect: #key) ] ) asDictionary.

v := RTView new.
classesElements := RTEllipse new color: Color purple trans; size: 5; elementsOn: classes.
v addAll: classesElements.
classesElements @ RTPopup.

authorsElements := RTEllipse new color: Color red; elementsOn: authors.
v addAll: authorsElements.
authorsElements @ RTPopup.

eb := RTEdgeBuilder new.
eb moveBehind.
eb shape line color: (Color veryLightGray alpha: 0.2).
eb view: v.
eb fromElements:  authorsElements.
eb toElements: classesElements.
eb connectToAll: [ :a | authorsToClasses at: a ].

RTMetricNormalizer new
	view: v; 
	objects: authors;
	normalizeSize: [ :a | (authorsToClasses at: a) size ].


RTCircleLayout on: authorsElements.
RTForceBasedLayout on: classesElements.
authorsElements translateTo: classesElements center.


l := RTForceBasedLayout new.
authorsElements do: [:ae | l fix: ae at: ae position ]. 
l on: authorsElements, classesElements.
^ v

]

{ #category : #icons }
RTRoassalExample >> exampleCodeAuthorshipIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAHqElEQVR4XuWb224TVxSGLW64
R+IZeAh4BJC4gdfgAUCCa96AXkDVigqk9iYFiahCprQQVWmhlBYrCSGQOIRJYpzEpzi2V+p/
J7+7u5kZz3h8mPFa0sixZ2bPZH17HfdM7vBQv6RJcvpVoB+IftEPRD8Q/aIfiH4g+kU/EP1A
9It+IPqB6Bf9QPSLfiD6gegX/UD0A9Ev+oHoB6Jf9APRD0S/6AeiX6YPiLx8KXLvnugHkiJp
e55A9AMZ+p0MfivtdntqoKTKQvb390U7lFQBOTg4EChWM5TUxRAoVTOU1AFptVqCLSnUMChy
4YLIiROiH0hE6XQ6iaHgfD8ogNW6fVua58/rBxJHmfhsNptDtRTEKI5fq9USuUZ1dQishEod
hgu0xwEY/La3t6cLiJw7J9J1D4NmXGaMrgzqvgCVyqelEDR+bzQaktQKswVkZkbqT58O7B5s
K4mbOUHh9jmE4lpKtVoVdS4LsxAKqVQqZlbGtRI7rkSJG0HHYp89JoCjGI1zT1MTQ1iFxwVD
K4kS5G1lB41lWxvGw3d8pqV2yU2qNQIwUAR+C5v9rpL9lO4G7TDrsd0X02ts9XpdVGZZ7iyH
grFBIUFWY1uJ7b7i1iv2sfjbtlobquTzcpjP60l7/VwPwdBq/OoH1/fHcTMuVN4H3RiAcEJI
sSitpSVRVYcExQPOVgiUThhUqF9dETXYh10P49sWl7RTkMnCMCxI2z0tuDMkAu7xg7orFxS2
5fkNA59ubFJBfuKVepTMKX/rtZm9OJZuJur5/ap9WuD7F5vC2oVj9svaprZ1EqRUu0pnZc19
+NsOyoMCseFiHFxn7u6CbCyURS0QPyj060FFpg0GLi1I6e1WJzTeuNd99u0b833xeXEirisx
EHnwQOTMGdOCQIuEM7dR25f1NyWhj8bGwOkKf6diMQYzH85aOz2GEvGJ6+Fa2HB9NAu5n8dv
LH2WrQ87Eif7whgM8OO2kqFYiBx3Tel/2aLY+VSJ9c9ELdBsJdrLvrSc/FevpfDzmgQlCX6u
0f1OqEnW+VPrsjjTwtoUtusYpEVij4/vle1Gz3rce3Gv73c9ptawVj8rmroYwqwJioTrcf/p
flCClITxXBcFpdoJAYBEaVxy8oyz+ZiqOsR1eWHuK8y3b3/oxpJK4wv/74KhG3v2TSFwLEyW
lz++k1ZzPIXiRICEtciDsio/lxfmSjg+r2Uf67bc2eAMysZYmE4lEHfhaNA6BQqmq7OLRelI
4NIvMy8bBBVNN+ZnebRcgFmZ3zxq3ddGk33lxhkzkvSHgmKKPfOhuPnvl8xMB6x+98K1ETv4
swvsAn1+t2DGfPvbR/P769n3kuksaxgFVlCXODAdt2KS32Sw6xuOT1eG37aLO7LwS1Fc1zWs
/2fsQJI8oBDXfcVJGvxck201OKa8uSds82Ob+27hKJ3uAqGbG8UDErlRWsWo8veFblujUWlK
PysJa5lQ+VyDcddfCk/WjLX8MfPWgEIngGswpVLJ162lEgiD46uHo/Gxxsc7AZWLS3QlVHLY
mksYJJ5n4ku9Kbu7u722DKwD4wOKuR5eGiqXJZVAGBBxw532cK2D7oMrikyH2RvjdVdefBJv
pdwL2LwnKBMb1/L9Wvm2/Pp1wZz3cXHb9MMwNsCUu8oHlNqjR2LeaTne5OxZSVUvC/9smOuw
H2pgTcHnpIL22WNE6SnterW+Qd99AK83gY7TZzZJDYCt6v/WSLAPG6DYMHpQrl2T1HR7GSxH
8TpAlMQA137zZLUH2O0OMzjzaUXup5tyu9HNRqtrbZ45/u38uqwve/L5c7dzvLUlJc/zB3Lq
lGS6dTKM2sWtsN3j3c5w3FjYqKN4rBp35XlHULwgIJcvTy+QfllaUDvd7zfOfPc4xiEAhcKx
4TtjBVzWwtyaOffVwxWzb71Q6p7XdWOXLn0BRRYXpxNImFWErWscdN1M+WO1l2UxNsBVIS5w
YyVP98VPuLegx49azSMrLBf/exZY7t8XuXhR5MoV5MKS+W6vnwQF77DVO+NeurP2/Z+eyYj+
+uld72lEbmyjM5b0e66Lq5nj/v9TAySoqg/rDHNFjy/grP29ZZRY3jjKhthux764ylX5XFaY
0vluR5Cl0MUws8Pn6j+b4i2XpbRa6a3V229NRZ4cN27I4fXrh1MNZHN5V6IEb3c1z8626H5s
IGHFnZ2BpfH1tYkCwcwNK9oIwg2qcD1UvF2lR7km64xRNQIzDYQK+f2HZcEikq0gGwQh0Pcz
EMeNASzwJhULUg+EyrFfK2Naiu98zgo1ACAkfR7KPt9e79APxFK8vT7OzGhnZ8d8ujXAMOuY
Yb3ROzVA2NLGBgtA6xpuaVQKClodzIL7GjkQOXnStBgAot+TG/W9phTyRRlVlc+4ohvI6dMi
uZxEjTPDsMYw15n2OJKq1klSZUVJBNLycmcmgCTx8VF7T+07d0RmZ0U/kITuZhjWYcCN8cHp
TANJEj+y0hbJFJBWgvXorFXj2bCQmzdFO4zUxZDYEB8/Frl6VT8Q/aIfiH4g+kU/EP2iH4h+
IPpFPxD9QPSLfiD6gegX/UD0A9Ev+oHoF/1A9APRL/qB6AeiX/QD0Q9Ev+gHoh+Ifhm3/AvD
zwneDyP69wAAAABJRU5ErkJggg=='
]

{ #category : #sources }
RTRoassalExample >> exampleComposedLayout [

| view es1 es2 es3 |
view := RTView new.

es1 := (RTEllipse new color: Color lightRed; size: 20) elementsOn: (1 to: 20).
RTForceBasedLayout on: es1.
view addAll: es1.

es2 := (RTEllipse new color: Color lightGreen; size: 20) elementsOn: (1 to: 20).
RTForceBasedLayout on: es2.
view addAll: es2.

es3 := (RTEllipse new color: Color lightBlue; size: 20) elementsOn: (1 to: 20).
RTForceBasedLayout on: es3.
view addAll: es3.

RTForceBasedLayout new 
	charge: -800;
	on: (Array with: es1 with: es2 with: es3).

^ view
]

{ #category : #icons }
RTRoassalExample >> exampleComposedLayoutIcon [
	^ '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'
]

{ #category : #icons }
RTRoassalExample >> exampleCoolIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABeCAYAAADVA7GfAAAB2ElEQVR4XuXasW3CQBiGYTcZ
gqwAa2SSVFClSEPlkgUyAUoZiQKJkpqUmYDUFHYHDfocg9JGSoGSk5/39C9wj3z2Iaqu8yup
yt8CH8TPB/FB/HwQH8TPB/FB/HwQH8TPB/HzQXwQPx/EB/HzQXwQPx/EB/HzQfx8EB/Ezwfx
Qfx8EB/EzwfxQfx8ED8fxAfx80F8ED8fxAfx80FMkP1+391q2rYlN/GWe+iD+CDDaLvd5nw+
p2iQw+GQ4/E4+KnrOlVVdaPRKJvNJsWCrNfrLBaLwc9kMrmCXGY2m8U/sgpoPp9nt9vFf4f4
L/Xfz2rVdnXdceM/IQXUpIn/2VtIyyxT9eu+X5/9KvfIalddDaxxxum/sa5rmqn/lfXfpe+5
eczlSSn6yGr6S1I+PpLvG+xgQV5fk7u75OEh+Sz4yGpeXq4Q6X9WGPJnVcbj9LfC7jKZFn5k
5e0teX/P0I+sPD0ly6V/MfQvhj6ID+KD+CA+iA/yA8hlE281p9OJBLnlHvr/OiksH8QH8fNB
fBA/H8QH8fNBfBA/H8QH8fNB/HwQH8TPB/FB/HwQH8TPB/FB/HwQPx/EB/HzQXwQPx/EB/Hz
QXwQPx/EzwfxQfx8EB/EzwfxQfz+qC9z7PTjhlg+LgAAAABJRU5ErkJggg=='
]

{ #category : #sources }
RTRoassalExample >> exampleCreatingBitmap [

	| v  s trachelShape |
	v := RTView new.

	s := RTBitmap element.
	v add: s.

	trachelShape := s trachelShape.
	trachelShape extent: 180 @ 100.
	trachelShape fillColor: Color blue.

	1 to: 80 do: [ :i |
		trachelShape at: i @ i put: Color green ].

	^ v
]

{ #category : #icons }
RTRoassalExample >> exampleCreatingBitmapIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAABTElEQVR4XuXZQQqDMABE0blZ
b2Z6sx4t1W0XBdHWkfch+zAPQUjm9Gsq/gQ+iJ8P4oP4+SA+iJ8P4oP4+SA+iJ8P4ueD+CB+
PogP4ueD+CB+PogP4ueD+PkgPoifD+KD+PkgPoifD+KD+Pkgfj6ID+Lng/ggfj6ID+Lng/gg
fj6Inw/ig3y/wOM1s96i5fgg2xDL0wepAilC8UHSheKDfI6yDB+kCmQ7Y/ggVSAXovgg6ULx
QdKF4oOkC8UHSReKD7JnsD/8Evsge0f78Zfig6QLxQdJF4oPki4UH+ToiCe/p/ggmf4DlQ/i
g/ggdwHx80F8ED8fxAfx80F8ED8fxAfx80H8fBAfxM8H8UH8fBAfxM8H8UH8fBA/H8QH8fNB
fBA/H8QH8fNBfBA/H8TPB/FB/HwQH8TPB/FB/HwQH8TPB/HzQXwQPx/kVr0B+TcSGNGBj4kA
AAAASUVORK5CYII='
]

{ #category : #sources }
RTRoassalExample >> exampleCrosses [

| v nbOfCrosses n s es |
v := RTView new.

nbOfCrosses := 300. 
n := RTMultiLinearColorForIdentity new objects: (1 to: nbOfCrosses).

s := RTShapeBuilder new cross; current.
s color: n.
es := s elementsOn: (1 to: nbOfCrosses).

"The code above is equivalent to

s := RTMultiCompositeShape new.
s add: (RTBox new height: 10; width: 3). 
s add: (RTBox new height: 3; width: 10).
s color: n.
es := s elementsOn: (1 to: nbOfCrosses).
"

v addAll: es.
RTGridLayout on: es.

	^ v
]

{ #category : #icons }
RTRoassalExample >> exampleCrossesIcon [
	^ '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
IebHF+Lfm8wwF8kmVgIAAAAASUVORK5CYII='
]

{ #category : #sources }
RTRoassalExample >> exampleDependenciesWithCurve [
	| v classesRoassal classesTrachel shape1 shape2 helpBar1 helpBar2 |
	v := RTView new.
	v @ RTDraggableView.
	shape1 := RTEllipse new
		size: #numberOfMethods;
		color: (Color gray alpha: 0.3).
	shape2 := RTEllipse new
		size: #numberOfMethods;
		color: (Color pink alpha: 0.3).
	classesRoassal := shape1 elementsOn: RTObject withAllSubclasses.
	classesTrachel := shape2 elementsOn: TRObject withAllSubclasses.
	classesRoassal @ RTPopup.
	classesTrachel @ RTPopup.
	v addAll: classesRoassal.
	v addAll: classesTrachel.
	RTEdgeBuilder new
		view: v;
		objects: RTObject withAllSubclasses;
		shape: (RTDirectedLine new color: (Color blue alpha: 0.5));
		connectFrom: #yourself
			toAll:
				[ :c | c dependentClasses copyWithoutAll: RTObject withAllSubclasses ].
	RTHorizontalLineLayout new
		gapSize: 1;
		on: classesRoassal , classesTrachel.
	helpBar1 := TRLabelShape new
		text: 'Dependencies between Roassal and Trachel'.
	helpBar2 := TRLabelShape new
		text: 'down links = Roassal depends on Trachel'.
	v canvas addFixedShape: helpBar1.
	v canvas addFixedShape: helpBar2.
	TRConstraint stick: helpBar1 above: helpBar2.
	TRConstraint stickAtTheBottomOfTheWindow: helpBar2.
	^ v
]

{ #category : #icons }
RTRoassalExample >> exampleDependenciesWithCurveIcon [
	^ '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
/wLZleMnuj1bsAAAAABJRU5ErkJggg=='
]

{ #category : #sources }
RTRoassalExample >> exampleDistinctColors [

| b |
b := RTMondrian new.
b shape circle.
b nodes: Collection withAllSubclasses.
b edges connectFrom: #superclass.
b layout tree.
b normalizer
	normalizeSize: #numberOfMethods;
	distinctColorUsing: #package.
b build.
^ b view
]

{ #category : #icons }
RTRoassalExample >> exampleDistinctColorsIcon [
	^ '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
dwKZbROAAAAAAElFTkSuQmCC'
]

{ #category : #sources }
RTRoassalExample >> exampleDotIndex [

| v values resolutionVertical groups maxValue g c el |

values := #(15 8 2 5 11).

resolutionVertical := 10.
v := RTView new.

maxValue := values max.
groups := RTGroup new.

values do: [ :aValue |
	g := RTGroup new.
	resolutionVertical to: 1 by: -1 do: [ :y | 
		c := (aValue / maxValue >= (y / resolutionVertical)) ifTrue: [ Color orange ] ifFalse: [ Color gray ].
		el := (RTEllipse new size: 20; color: c) element.
		g add: el.
		v add: el
	].
	RTVerticalLineLayout on: g.
	g last  @ (RTLabeled new 
					below; 
					text: aValue;
					color: Color orange).
	groups add: g. 
].

RTHorizontalLineLayout on: groups.
groups do: [ :aGroup | v addAll: aGroup ].

v canvas color: Color black.

	^ v
]

{ #category : #icons }
RTRoassalExample >> exampleDotIndexIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABfCAYAAAAeX2I6AAAFhklEQVR4XuWc72tbVRzGT+PA
V75ouw37M03bORlO2k4YNMlSakU0QbQV6WrapqkDrSBtHFLaLi0TZvtO9sM5fKGI/gH6xjfT
wf4S3eZ7QcQ382T3ST33nHtybpNmob+ewcNyn5tlcJ6c7/dzzz25wvtT4teBEv8g8AfCL/5A
+APhF38g/IHwiz8Q/kD4xR8IfyD84g+EX/yB8AfCL/5A+APhF0Egl5JCfpAQ0vZjsZgcGhqq
8Lu7u2UikZCRSCRwrrW1VaZSqVC/paVF8gdSRb8VhCzdESXo5491KBjwjY2NEjQ7O+v7fX19
vj83N+cPfjQa9f2VlZWAj2N1Dsf8gewgFYaS8tfW1vxBhML8eDxeHuCRkZFSLT6O+QPZQX98
oWfI79f0DMlms/7ALy4uOn2os7OzfG5wcLAmf2BggH+G7KTUC6L0aFPIB14wr0R1IO3t7RIl
qVAoyJ6eHv/9TU1Ncnp6Wq6urkqUL/OzxsfH5fr6erm/mH4mk5HFYlHiPH8P4Rd/IPyBPIV+
nNc95Pb7umQNDw/7td8sNUBhk7JMtDUpy/RNyjqA6MtPWfyB7KD/vtYzBK+Vj8atBhGN2uVD
XV1d5XO48KvFxzF/IPyUxd/U+Zs6v45GIFvjuofMx3XJQplC+UHdHxsbc/rmGhdoamlpyenn
crly/0D546esOikLg+eiLNvH0oiLpsJ8fsqqk7K8b7WTskwf8maMk6bCfH7K2gVl4bVZmlyU
1dbW5lMWLh5dlDU6Olrh81MWv/gD4Q+kAQJZqR5ilyxFU+Zt3I6ODqn8qampQAlyURZ0r7D9
+Q82BX/Jqpey1ODalGX71ShrPRP8fBzzB8IfyNEtWaAs5U9OTvKXLH7xB8IfyF5fGP65JeTD
zdouDEFZMzMzEjeqkslkoARNTEw4LwxxV/KxtwqAv/kDqSJpLJ1IY+kkn887l05MH8ItXdcS
ifKLGf35EI75A9nHxUV+ytqlrr2tv8G5Yffyu1mCwpbfm5ubncvvvceFNCkrdpx/hvCLPxD+
QBpOWXh9/7KQj7aCPj9l7RNl3V10+wjDbN74rYiLspTPT1kNoqx/bwYHst6NcvyUtUt9P6cH
/uZF/e399DXtf5cTVbeSgrJcW0lBWX9f15/FT1n84g+EP5AGUZa5lRSvXZSFraSKsuytpIqy
7K2kd7L8lMVPWfyUxU9ZDdGvS3rgf1rQ397PXtc+3uNTU29vgLJQwlw/i1b+hVNBysIxfyBV
hIcG5OOVAzV62v1AAfz2AzPAfkAA9u26HhzQf0LItTeF7D/J30P4dRgpC3UdsilL+TZloV9A
6iaUkno/LipNH8fqHH8gVQSsVfX9obEr5JdP3H7YgwMuJYIQcD4mnP58nL+H1EVZ5q5401c3
p+zd7DZNXUkLfsp6WsoyaerqW27f/Ln08vJygKbMgY80CafPT1l7SFmgKcyMZyKCn7L4dUQC
6TsRTkDF9PY5vCdAZl7fAGXZz75Cw8b77bKkSO4ANvTDQ1k/5N0+fgVlNnXcB3HRlAqRn7L4
KetwB6L2TEF47Zohpp9OpwOUpWYIypJrhti+eZHJHwh/D+GnLH7K2oMZonx7JvDPkH3oId9M
a/+fG0KG9Qr+HtJgynp8201Zto8rcBdNhfn8lNXgGfLVlPb/+pJ/hjRcp58P7yGfewuMkKuH
bL4jZK095NUXt/2PUvw9pKquT24P0rezQh6zFgVf7ghuDVKKtgi58kalnz0v5IcXKn38H93e
v7l1kT+QqlrwvrXPHhPyrDf4NgW95Hknn6scRAz6mbZKP9kv5LtDlf7C/zPjvXP8gfCLPxD+
QPjFHwh/IPziD4Q/EH7xB8Iv/kD4A+EXfyD8gfCLPxD+QPjFHwh/IPziD4RcTwAORhKa195Q
OgAAAABJRU5ErkJggg=='
]

{ #category : #sources }
RTRoassalExample >> exampleDoubleArrow [

| v edges es |
v := RTView new.
edges := OrderedCollection new.

es := RTBox elementsOn: (1 to: 300).
RTGridLayout new gapSize: 30; on: es.

es do: [ :e |
	| te |
	te := RTBox element.
	te translateTo: e position + (0 @ 10).
	edges add: ((RTDoubleArrowedLine new color: Color black) edgeFrom: e to: te).
].

v addAll: edges.

v when: TRMouseMove do: [ :evt |  
	edges do: [ :edge |
		edge to translateTo: (evt positionFromCamera - edge from position) / 5 + edge from position.
	].
	v signalUpdate.
].

	^ v
]

{ #category : #icons }
RTRoassalExample >> exampleDoubleArrowIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAACb0lEQVR4XuXcS27CMBhF4a6P
92IA8doHsCneQ9iKW7kSkyaOwA0pzXcnSFwUyxxF/xlY/vj89PNO+fD/Ah+In0eB7Ha7cLvd
wuFwCD9/+Ipuv99/d/Hz2e56vWZ1ueuluriv2MV91tEV3pB+vx82m00oo1fV9Xq9sF6vS7tu
t5vVdTqdf989u/cCkNlsFlKvU1U3n89b3S0Wi2S3XC6zutVqFfwZ4g91Pz4QH4gfX3t97fW1
19deX3v9+EPdjw/EB+LH115fe33t9bXX114//lD3gfjxgfjxtdfXXl97fe31tdePP9R9IH58
IC6Qu4qdTqekppV1x+Ox8S6qbfx8povPis9suitT/lRXeENGo1HYbrelZjAcDpPdYDBIdlGX
c7qo0nV3UTWbXO/Zvfva+6Da+trrzxA/PhA/PhBfe33t9bXX115fe33t9Ye6Hx+ID8RPO7T3
L5Q4R3vvz/xX2lultq/Q3qbVNrdrSolr0942KHGu9uYqsa+9/lD34wPxgfjxtdfXXl97fe31
tdePP9T9+EB8IH6a117/kIN/yME/5NAWtfUPOfjxh7oPxI8PxNdeX3t97fW119deX3v9+EB8
IH58IO0Aclexy+WS1LRXdOfzudDF76q6qLY5Xe56KQWP+6qzK9Xe1CVlUXtTXdTenIvPYpe6
4KvqUrTcrupCsd+sl7v3n10ByHg8TmradDpNdpPJpPauar136uo8GOLPEH+o+/GB+ED8+Nrr
a6+vvb72+trrxx/qPhA/PhA/vvb62utrr6+9vvb68Ye6D8SPD8QH4mtvZfenb4ivvev3AuJr
rz9D/PhAfCB+HswXjenj9eANteIAAAAASUVORK5CYII='
]

{ #category : #sources }
RTRoassalExample >> exampleDoubleClick [

| v es |
v := RTView new.
es := (RTBox new color: Color purple; size: 25) elementsOn: (1 to: 100).
es when: TRMouseDoubleClick do: [ :e | e element trachelShape color: Color red. v signalUpdate ].
v addAll: es.
RTGridLayout on: v elements.

	^ v
]

{ #category : #icons }
RTRoassalExample >> exampleDoubleClickIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAABNElEQVR4XuXWsQ0AIQwEQVdL
T1RrCiBAIuHErPSJQ+ZBrm6/pMo/Ah/EzwfxQfx8EB/EzwfxQfx8EB/Ezwfx80F8ED8fxAfx
80F8ED8fxAfx80H8fBAfxM8H8UH8fBAfxC8XZNTcPn9+nvsgPog/90F8EP+A40D8/C3LvyE+
iA/ig/ggPogP4m9Z/pblz/0nywfxD9gH8UF8EH/L8vNviP9k+SA+iA/iz30Qf8vy87cs/4b4
ID6ID+KD+CA+iL9l+VuWP/efLB/EP3gfxAfxQfwty9+y/BviP1k+iA/ig/hzH8Tfsvz8Lev5
H+yD+CA+iA/ig/gg34D4+SA+iJ8P4ueD+CB+PogP4ueD+CB+PogP4ueD+PkgPoifD+KD+Pkg
PoifD+KD+Pkgfj6ID+Lng/ggftct4d43QXzhOT8AAAAASUVORK5CYII='
]

{ #category : #sources }
RTRoassalExample >> exampleDynamicBezierEdges [

	| v es |
	v := RTView new.
	es := ((RTEllipse new size: 30) + RTLabel) elementsOn: (1 to: 20).
	v addAll: es.
	RTCircleLayout new initialRadius: 150; on: es.

	es @ (RTShowEdge new 
				connectToAll: [ :value | value - 5 to: value + 5]; 
				shape: [ :el | RTBezierLine new 
									centerOfObjects: (el model - 5 to: el model + 5) inView: v; 
									color: (Color blue alpha: 0.4) ] ).


	^ v
]

{ #category : #icons }
RTRoassalExample >> exampleDynamicBezierEdgesIcon [
	^ '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
OQlQqimsUAAAAABJRU5ErkJggg=='
]

{ #category : #sources }
RTRoassalExample >> exampleDynamicEdges [
	| v es |
	v := RTView new.
	es := ((RTEllipse new size: 40) + RTLabel) elementsOn: (1 to: 20).
	v addAll: es.
	RTCircleLayout new initialRadius: 150; on: es.

	es @ (RTShowEdge new connectToAll: [ :value | value - 5 to: value + 5]; shape: (RTLine new color: (Color blue alpha: 0.4))).

	^ v
]

{ #category : #icons }
RTRoassalExample >> exampleDynamicEdgesIcon [
	^ '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'
]

{ #category : #sources }
RTRoassalExample >> exampleDynamicLabelsAndEdges [

	| view elements |
	view := RTView new.
	elements := RTEllipse new size: 30; elementsOn: (1 to: 20).
	view addAll: elements.
	RTCircleLayout new initialRadius: 150; on: elements.
	elements @ (RTShowLabel new highlight: [ :value | value - 5 to: value + 5]; center; yourself).
	elements @ (RTShowEdge new 
						connectToAll: [ :value | value - 5 to: value + 5]; 
						shape: (RTLine new color: (Color blue alpha: 0.4))).
	^ view
]

{ #category : #icons }
RTRoassalExample >> exampleDynamicLabelsAndEdgesIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAEXUlEQVR4XuWca1PyMBCF+/9/
JHgFQQGvgArhneO8cUrcSKnZZpNzZvpFO06Tx+wtmzSHA78sqeGfAn4g/OIHwg+EX/xA+IHw
ix8IPxB+8QPhB8IvfiD84gfCD4Rf/ED4gfCLHwg/ENvabDZuMpm4i4sLt1qtHD+QASb8/f3d
xX43Ho8P7Wc6nYrv7vd79/b25iB+ID0ECO2JxgoIJxMrIwSCJ9RsNjt6b7FYOH4gZ+ry8vLH
ZN/d3R1NJCCdAiKtIjwfHx+OH8gZkiYxnGz4DOEdF7wj/h38nB/IH4Fg1YTvwWe0YYT+5unp
SVwhLy8v/CtEMCXfk7Ver48mCBMWTmL4Tl/zd3Nzc/R34JvwM//7+/t7RwUEE9DFrgPaw8OD
gxP+q82HeZvP52JofH19/eN7Hh8fHQ0QDNaSXZe+BQEDDZCYXbcERPJXVfuQtv/wD5K3HN8i
5TOvr69cQHa7nbu9vf2aiKurK7fdbrNGPfAvPlLLBWMwIPAZMFOl1pcQSsOcDpFMNgOEtt9m
YDQaOayMkmCE5ixWKysCiOQnYKZKgYFipOTwY8XOEoAcuhT/rCpH2WVwIHDgpQB5fn4WV0jf
ikF2IPjwcDC5o6lz5SNB/8CnFB1lfX5+fkUoeHLlGSkSWXz/EAVJ/j11Y+IHUjMQhIPtUjec
Ym0TBhOMwKQVcTmzQJD4DRmR5JCUW6UstTRaWbl/sJ9RCwxUGaQxpszem5TmSvpYyx0e5wpR
ojRGdLWYNFlSp4jV7o6+knYXYR1MAsHWrG86AJyUH2pJaEfyu4qpfSR/2Mufh/CLHwgjkNq6
0HONt9HKQbR31nLD0BpvEiBdu9BrkeZ4kwDp0oVekzTHmwRIly70mqQ53mRO/VQXem3SGi9/
2Mufh/CLHwgzEMToaAgouXX0lNA5gzFqnCFJCiQ87ZqrpV9Ty+Xy5OlgE0BimzcYQE1AtDfh
kgHBvrL0sWjzrwVGbFc0PLNoAkjs3GBthUZtK9Bo2teU/zlWFPb7pu5VTh5l+dZRq+fAU45R
o++MPw/hTwz5lQ0IHH27bUa7lV9DYfSo3YmpCiQ8W1FaGIyeMimq0jxWwX+k7RdRHGkraeMq
shGlWqdTBYJGays3JPSV0NFf9pE2VERRgEOhsTQYEDrefdEU/k/7zsasYS/OgWslWH0c+P+z
kI4yDwlbaXKWWcLQNueNE1mAxKqmuTa1tM98mAdi7WJKS+F5YynhknwJTEeqRCx2eMjSPk42
H+IPvcTKKqiotg9YogTTN8IJtwVC8MKNE9luwM4aZfl7qKT6UPvo8W92/VQXesxfAXj7PaxC
C80ZRV+k3KULnf8iZUUg4U2hXbrQYzegWr3UwCwQ6ebS0LR17UIP37N8RZTpDSokbDBB8B3S
id6uXehw0GjVwXaA9bak4ncMa+u659/C5QfCL34g/ED4xQ+EHwi/+IHwA+EXPxB+IPziB8Iv
fiD8QPjFD4QfCL/4gfAD4deg+gdk9tXngy6lfAAAAABJRU5ErkJggg=='
]

{ #category : #sources }
RTRoassalExample >> exampleDynamicallyAdding [

	| c v |
	c := OrderedCollection new.

	v := RTView new.
	v canvas addMenu: '+1' callback: [ c add: 42 ].

	RTActiveAnimation new
		blockToExecute: [ 
			(v numberOfElements ~~ c size) ifTrue: 
				[ v clean. 
				  v addAll: ((RTBox new size: 8; color: Color blue) elementsOn: c).
				  RTGridLayout on: v elements.
				   ] ];
		inView: v.

	^ v


]

{ #category : #icons }
RTRoassalExample >> exampleDynamicallyAddingIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABeCAYAAADVA7GfAAABVklEQVR4XuXXMQrDIBSAYW+e
3UPpXXKFLC55acUGOrTNFizfD4FH3PzQNuk4/GYq+Vvgg/hdgazrGqWU8LdjEpCOkXP2QWYB
2bYtaq3RWvNR/N8QPx/EB/HzQXwQPx/EB/HzQXwQPx/EzwfxQfx8EB/EzwfxQfx8EB/Ezwfx
80F8ED8fxAfx80F8ED8fxAfx80H8fBAfxM8H8UH8fBAfxM8H8UH8fBA/H8QH8fNBfBA/HiSl
8Zzzsoynz/Hs1/q+R/ggPoh/ZflXln9CXJBzg8+51vH0uYNcrfsgPoh/ZflX1o3Fq0/zt/X3
dz7ILSdknIxxQsbsnxD/yvK/Q/zvEP+E+CD+314/H8QH8fNB/HwQH8TPB/FB/HwQH8TPB/FB
/HwQPx/EB/HzQXwQPx/EB/HzQXwQPx/EzwfxQfx8EB/EzwfxQfx8EB/Ezwfx80F8ED8f5N96
AGxOp0bY2FZoAAAAAElFTkSuQmCC'
]

{ #category : #sources }
RTRoassalExample >> exampleEdgeTransparency [
	| v es |
	v := RTView new.
	es := RTEllipse new elementsOn: RTShape withAllSubclasses.
	v addAll: es.
	RTWeightedCircleLayout new
		initialRadius: 200;
		on: es.
	RTMetricNormalizer new
		elements: es;
		normalizeSize: #numberOfMethods
			min: 10
			max: 35
			using: #sqrt;
		normalizeColor: #numberOfLinesOfCode.
	RTEdgeBuilder new
		view: v;
		objects: RTShape withAllSubclasses;
		shape: (RTLine new color: Color blue);
		connectFrom: #yourself toAll: #dependentClasses.
	es @ RTPopup @ RTSetEdgeAlpha.
	^ v
]

{ #category : #icons }
RTRoassalExample >> exampleEdgeTransparencyIcon [
	^ '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
LG82MO+SAAAAAElFTkSuQmCC'
]

{ #category : #sources }
RTRoassalExample >> exampleEdgedWorm [
| v es |
v := RTView new.

es := RTBox elementsOn: (1 to: 50).
v addAll: es.
es @ RTDraggable.

"RTEdge buildEdgesFromObjects: (1 to: 50) from: #yourself toAll:  [:value | (Array with: value -1  with: value + 1 with: value + 2) ] inView: v."
RTEdgeBuilder new
	view: v;
	objects: (1 to: 50);
	connectToAll: [ :value | (Array with: value -1  with: value + 1 with: value + 2) ].

RTForceBasedLayout on: es.
v addAnimation: (RTForceLayoutStepping new view: v).

v @ RTDraggableView.

	^ v
]

{ #category : #icons }
RTRoassalExample >> exampleEdgedWormIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABjCAYAAABt56XsAAAGQElEQVR4XuWbWUxdVRSGC4IM
Zaot02We53meKZd5pszzJJfKKEgFrQNlSJX2gUghWoIyBBJb0xhrYhojD9TgCw8kPEmIJL75
YuKj8UH337DNCaktXIFT/b/kZu97zmEfstbZa+/1r3PP8cMPP/zwww8//PDDDz/88MMPP/zw
ww8//PDDDz/88MMPP/zwww8//PDDDz/88MMPP/zwww8//PDDDz9nyfnz5y2mpqY+DQwMDOe3
hgrcuHFj5sGDBz9otdpCeWx2dvZeREREPPpDQ0MT+/v7fwYFBUXwW+sU6Orqeis3N7c8OTk5
y9jY+OX29vYBzIrMzMwi5XU2Njav1NXVdaLf09PzDlpxTXFWVlYx/+w5IVJTU7NHR0dnhFFL
5LHo6OgkhbPebmlp6RPX5ZiYmJgaCjBT8F1eU1NT07G+vv5jWlpaLr9Fj4mlpaU1nuqEhIQM
9OUMQdvU1NSNtq2trV86xsnJyQ3h6fBMETPkellZWaMMWzqd7hpaMe5lfsccg+bm5t7l5eVH
mBnymLOzs7vs371798uVlZVvMRueNc7MzMzn8fHx6RYWFlaHz0knviTgt/g/gDAjQ5G7u7sv
2itXrjRmZ2eXIfxERkYmYN3QZ+yUlJRsLy8v/4qKilbMGsy8zs7ON2NjY1P4nXII4YTkra2t
X552LikpSSvC0+twxknca3x8fC44ODgK/by8vHI4eGRk5MP+/v73+T1xMCvw6e3tfbe8vLzF
0dHRpaCgoEr0m8XTm3qa93Zzc/NCW1hYWHXz5s15fmcIR2g0Ghf0+/r63pPHBwcHx+GQ076/
gQAhEhsAmb/QggUVsRxbVLl1DQ0NjQkPD489q/9B7Nh67ty5c09+x3pCP0syMjIKscAuLi5+
c9ZZNe6LsIidGPIULPz8i8gBai2qWK9kH8knnMPvDRXx9PT0OwhXqbdu3fosLi4ujd8qKiJE
yEmpAmD7zW8RlSktLa2HMoC+SEBL+S2iBzExMSmJiYkZJxWupDrg6+sbxG/dIyz2kNNtbW0d
8D0/P78SYUYswB8JgTAP8geecn9//9C9vb0/kFg+b0xzc3MLyPdYxOX14h5X+SWUZ4BFFuLh
6urqd8qFFk8xZBSR0xnCCcrQgxYy/OEkD6EIeY8414utLRLCgYGBMQ8Pjyd6WWVlZdv9+/e/
F7pZE7/lFQhB0RuFpICAgDBRhDIW331QjMI5GBJ5A5JJZaaP+K+se8BZQhLxRk4jdLBM5DlC
u4p0cXHxRHErKirqSXiSfyMS0biT0sn+d+zu7v5eXV39qpWVlY3yqccTXVxcXDs9Pb2KzFpo
T9XYEQkje+CYyPCjGxoaXhNPequYQcGYDSK0VWCsg3Ea5D2g+GLGIURJkZGfp4eov2ULzA6I
jQg/RUVFNfqO6erq6vXw4cMtFLUQnuAIOHNhYeFrfnX3OVRVVbWjHR4e/gAxH8bjT9JUQtQj
phDLEeexjvBbRGVQi6itrdU1NjZ2iUW4gN8iLwYGMu/gj+8vAKLW3YIWuYByG8uPSuAlNiF9
X1bmE/xWURFsR6XIB1CnQM7AbxmVwFuJkDOUDqqvr7+KrPuoY1y8eNHWyMjIGJsDOHdnZ+c3
jGFnZ6fht7Ce4JWfw8dycnLKwsLCYk1NTc3kMSR60LXgOI1G44o85vHjx/tIJiGP4BzKsspx
BgcHxzY3N3/mt/IxaW1tffKa6KVLl+xl+FpaWnqkVHKFynttbGxsVvl3cBgyfmtr6wsH22cD
uY2WL2vzF6H0RKvVFk1OTn5SUlJSJ4/pdLohtJgtISEh0ehDdExPT8/DzBIzI1E5htDELkxM
THy8tra2LsKWozwPWYbfwsfE3t5eg1qHg4ODk5+fXwje30KLopIsKGEGYZuM14c2NjZ+eto4
WFPw8fb2DoDMbmZmZg4FuLu7+zq/lf8FqI2gOLW9vf2rj49PEJRcQ0PDIxeU5ubmvkDb0dHx
BhRhfoecEPpU9fDmPLJ/6UD+nyKoDHZpaOXrqvwqsopgAyD7KHTJn7nxoxLz8/NfocXPDrBj
u3379iK/VVRElnH54Ycffvjhhx9++OGHH3744Ycffvjhhx9++OGHH3744Ycffvjhhx9++OGH
H3744Ycffvjhhx9++PmP8heS8r9YwwsVmwAAAABJRU5ErkJggg=='
]

{ #category : #sources }
RTRoassalExample >> exampleEdgesInTooltip [
	"
	self new exampleEdgesInTooltip
	"

	| v shapeBuilder elementClasses edges background label methods methodElements eb |
	v := RTView new.

	"We use the bounded shape builder to:
	  - have no element smaller than 5 x 5 "

	shapeBuilder := RTBoundedShapeBuilder new.
	shapeBuilder 
		rectangle;
		width: [ :c | c numberOfVariables * 7 ]; height: #numberOfMethods.
	elementClasses := shapeBuilder elementsOn: RTShape withAllSubclasses.

	"For each class, we add a popup that will show the method invocations and the class name"
	"The popup uses #group: to specify what is the group of elements to use
	#group: takes as argument a two-arg block. The first argument is a RTGroup, to which elements have to be added.
	the second argument, aClassElement, is the class element on which the popup is being triggered."
	elementClasses @ (RTPopup new group: 
	[ :group :aClassElement |
		methods := aClassElement model rtmethods.

		methodElements := (RTBox new color: Color red) elementsOn: methods.

		"We do not want to directly add the edges to the view. We instead need to add the edges to the group"
		eb := RTEdgeBuilder new
						elements: methodElements.
		edges := eb connectToAll: #dependentMethods.

		RTTreeLayout on: methodElements edges: edges.
		
		
		background := (RTBox new color: (Color blue alpha: 0.4)) element. 
		RTNest new centerOn: background elements: methodElements.

		label := (RTLabel new text: aClassElement model name asString) element.
		TRConstraint move: label above: background.
		
		group add: label.
		group add: background.	
		group addAll: edges.
		group addAll: methodElements.

	]).
	v addAll: elementClasses.
	RTFlowLayout on: elementClasses.

	^ v
]

{ #category : #icons }
RTRoassalExample >> exampleEdgesInTooltipIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABjCAYAAABt56XsAAADnklEQVR4XuWdTYvDIBBA+///
ZG+9FnpooYfdJQtCGBydGTXRvAEhJEbTvETny/T2+xuT5/P5X9L2/X6vlkj7qXw+H/O53+/3
ZyvyOvf7LXXOkFv0xO0GpZv0er1+Ho9HtZzxA/c3u6XO9EBWET4QPhA+ED4QPhA+ED4QPhA+
ED4QPhA+kFWh8YHwgfCB8IHwgfCB8IHwhQ8ECcQSoEpS2u8Jclna07b3/XgDa72Db0OAbEGp
rViAlKCmIFcPIJpswbF0rbL/ywCRcFojhCOBtPS5JJBemg4fCB8IHwgfyCJAttSb9/tdLFLD
azXoLH1aC98O4dshNs0qp2W17i+VpM6WrkerI/dH+tf6OsUwtI6r3qHHM3ZbjDytTtq/2ULR
/rW+pgbilVFA5JyhpYwuCSQ9VaVyJBDLkDWi/2mAjJQjbwAfyAJAlpzUrwxkSbV3pHgMsjPX
cmCA8A3DoGG4N6xyxldtTN4ft4zfuTrR83oYpSMWJ3WJGMrlYTVnoDy+/wEWuyb3wyNOSW+d
I5yNXd4QzWC0ArFO6FFFAAHEYjBGgJylLFwWiOfpXV3l5gPhA+EDuSSQ3s5Hvh3Cl/mByKCO
/ASGdly+HblzrMXSdqkfrV5ue3ogyd6QY68MGGljc+5GebNAam1r/ViBnPE5kG5viDcsWoLs
BVIKBWPnkJo7fCQQ/hxS0KS0zyhZNCw+kMm0LD6QyYBEtSw+EL7MB8ST7ZdTIy3ZhbW25fFc
G5bMRm825FJ2SC2DUaufS3iz+sJKbUSWr1mX6i0PZC9askJrgAsLJKVlRoHMrMEtCWQ1iQBZ
ag4hAOGrvQPFs1pqyQ8p82VSO8SyGilnT3iOW84r2Q5eW8na3lRApJsjORWl9iW3ZdqNpqlp
2pvWbk5tbsnLKmla/CGrcfJuUc1z/jU+kEYH5R7W7I5K/qR+lUldm0O8T2g0waF3koPnuqb2
ZXkmwegq2miSg4yvWxMwlpzUI29I6Ye3vCGtN+wSQCIyyiputRM8a9t7fteEP6kf/KDwgfBd
J+WwpzUU6nV11NwuPcPIo9cUHqpl9fhqaTQkbDlHA9Ki8V0CiNeytk7MLf+huORnYnNP1159
rSVR9xQ8kFb/Um+Llw9kMuED4QPhA+ED4QPhA+ED4QPhA5kdSOSL13wgA4Es6VzkA+ED4QPh
A+ED4QPhA+ED4QPhA+ED4QPhA+ED4QPhA+ED4QPhA+ED4QPhA+ED4QNZRP4AizmlcvoLni4A
AAAASUVORK5CYII='
]

{ #category : #sources }
RTRoassalExample >> exampleEdgesWithBezier [

| b |
b := RTMondrian new.

b shape circle.
b nodes: Collection withAllSubclasses.
b edges moveBehind; connectFrom: #superclass.	

b shape bezierLineFollowing: #superclass; color: (Color blue alpha: 0.4).
b edges 
	notUseInLayout; 
	objects: [ :cls | '*Array*' match: cls name ];
	connectToAll: #dependentClasses.

b layout cluster.

b normalizer 
	normalizeSize: #numberOfMethods min: 5 max: 35 using: #sqrt;
	normalizeColor: #numberOfLinesOfCode using: (Array with: Color blue with: Color red ).

^ b
]

{ #category : #icons }
RTRoassalExample >> exampleEdgesWithBezierIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAgr0lEQVR4Xt1dC3RdVZk+RVBE
wAFHrYC6xHGN1GFkFMdxVpeMS12MrnEURVYBR1zOgDymKIpULDSFPoBiKYWWvmltS2lLH4S2
KW3SJmnSNk2TNO8XzfvZpmmeN8lN7v3v7G9f/nv32Xefc8/Noymz1zor9+aex97/97/3v/ex
QqHJaWtXB+jDlj8042d+umKKjwYHibq7uwm/1dbWyr/V1dXyb29vL6nX+v1+2/fTp8n2/ezZ
wcj3iopWcutHfn5Z5HcS7TJrOPRsUiA0f+4wnTgepAtNF+tCPuyuu0D0KPEwcLSBgQEbEOfP
n5d/q6qq5N/29nYbYerr623f9+0bsn3Pza2g6OciV6L299vBfXr2IC1/ZYQutwZDl1sD/78B
+e9fB6i/387NDMJpwebMpZWVlfLz4OCgDShuhYWFGgAttu/Hj0cBO3y40/Zba2tUevr6hmII
3tbWJv8342eNdCg1ID+n7h+may/tofeqAvSBBmTWLKLsbDsALS0tRkBYCioqKoCJ7X+lpaUa
Ue1q6LXXim3fOzujqmbvXtLAaiCTuuJWVlZGIyMjtv/fe4ePrrZ6Qtdd2U3XXtJF7W0Tp8om
XEIaGxttndfVD1pXVxexNHR2hjna5/NRUVFY3eTn57vakFWryowEArC7d9sBOXHiVOT7mTN9
Mdfh3iwl3KBSd2/3099YXSEcS54f/OAAcvOXhyn1YJSD+oWOCgaj33ViqhwPtaVKhSo16vkz
Zw5EpCgrfSR0zZQuOpY1ohn6M7TitX56+207IMXFTZHveXlmINmGRYE7I78fSe+hF54Jg/HG
G0Tz5xNd9ID889eGafeuLltHa2pqXL+zimBghoeHCUAy0RsaGmznz54d1eVznhiQnPtc0mDI
LgnF9NEPj9DyZUHt2VG74fPZf4Nk1NXVxRCZGePcuXOR39LSThO060UJyMK5fiEF9s7pA2NV
ZAKEiT40FCYWjLpqNzo6Omznl5TYr1+2uJcOHLA//+DBbjpx4gzt22f/f2bmOTqePSxB/N43
7e407Ife7+bm5himqK2NVbvPLwjQ2bNjB2jMgJQWB+hjVn9oQZI/ZDKQTsacia8P/L333iN8
ZlcY9oU/R55Z2hwz8Ndft0vlgQNnhJQFKDlZN+pltGH1kATk0x+JXrPgT710x7+dpRNZfqPN
Y4bq7x8R/bOrtFMFQRm/3PmTkckF5Aqrn+YnDYeyMkZI93winT11ygiKybgjvgAYPT09ERe4
uLiYAgG7uyk0Wsy1y5ef01zhsOe1c6f93IKCsEudkdYXkeo1S330aas9xIfOOKp0FBS0G8eJ
mOrWW4YlMNveHL0XNmYJYSB0tWKSFNV7MQECdcFGH14WVBeIoUbqHR29xuekp1cLdzVK/PT0
cNSve1nM3fn5UZX44tw+IyAcG0FKw3apxvhszig89lufBCT3xAUEZNWqWO7kQI4ja1MD9x86
RHSJFQyxrm1qaoo5HxwJtYX4BN4Ovqvg5eWVOD4jJSWqMvbsCT8jOblXMeLRvre1+Wz3ufO7
nRKU9ANRVQpAWDqam9uMz+W+6QyZepDo+PHEbUrCgGzaRKR6G9H80Vly4nzVfVy7Jhjx801q
Dr8hdmFQAKQaqRcX+xzvv2HDexS1M0Q+n5/S0qJcnZnpTiC1P+z5Ib8G1dbcbB4XrmG3WG3/
fnuAlr58AQBh3a6DAsML1eJkS7jhOnA+VJMeEXMiEf9HoAhwS0pK5BE13mWO99+/v5pUO1NY
WEU5OacUNRZ+XlmZWfX09fXZ7B1LR25unfF8SLhpvHDZMb433ySyrAkApLU5SPDzhW2NPBzB
HkuFLr563GCSJpYS1tN6OgUSAuDAoWqknpZ2zvHemZlB4ZGRIiV1wh2OqsWiopb33Woz06gM
AskEcxw7ZlZViJXQR6fxhZ9XRMLDp6QkgO1NWjwBAjDgJr44354ygPejiysIjM7qbq1JNZ08
eZKcAAFBADDOUyN1oc1c75uREZWSnp5BWrcu2udly8LSUldnVj/s2uIvmKqh4ZwYS2xC8duf
qaJ//IhZUnk8bB9Bo69+lUjY/fEB5JprwjdaNL/Fkat0uwFvSc9hORlEdFyPM/g3OAsAhyWu
oQGS5T6wJ56IMkhGRpVIb3QpgNS8z7lmzuagEBze29snnmuWjpuscnnEi+ihulgT3HrreTnn
MyZAnn2WIukLNcgzia8OCjoSz55w5zmJqAeKAARqi6P2vLwKEqo9joRE7cDGjbW0cGG14ln1
U1jdxt4DIf3Zhx+mkNAvlWlpQlWVOz5HnzBTx4wD6hyaA2NTtQhUPuK2UQMyc2Z7xJ2Np4Ke
eILoT7OinA7f3YuUoF0yJUhzk+ynYlCQjkPCV87JyZE/lpf3S53sDgiMefv7Lu8IrVhRqBjq
HsH5hkztbbcJSli2A2lip2cgWNX/B7WKMQMsAMDuuur8AIyPWgMhN1Ass7dBdPVV4eAGnoea
h4rXoPs5uwvR56DJrcEjYu7S81uQEOawgwdLSAT+ce9XWBgO/t55h+j118OqVtBQOAfVpAaE
UjLeeot0MCKHi/3TVRVUN/4PWqGVl5fbpoZBl+HhkYiEZN23mjZY94W2TX2UWlKjfbKc3Nrs
7DAR4P5xOpoj1ngN56lpdJOf7qS+1GAR1+0VM0zMEMXF/RTPqKM9/XR4xvDYMYwjrDaFFhJg
Fot79dsB+cMfHAFxkhLYBlWS0T8EhlCzkAx1vGAq3Ubu/OIfJRjqwaBYsbknoqee8kWKDIA8
GkTRJKpuDVldNH3K1a0h/lDdSaisXbt2EQd7bNPcn0uCiQYFlxLl5RW/7zmRJNSpU3bbQE8+
6QyIiCRN91fjIo5F8D/cn+0L1LWJgbuFy62DgWPHFx6PBUTEMrTo+aDNU4DawUPxMH3ixksD
50CUkWSsLvd7uh5cx4MGqO8I3QNO41xVPG9FaCHKygKhSBjncJ/37yepSltb7eqXCgqMgIiI
zvEZnJmGFgCTQguw0wNauWUr6rbnGgERRywg2VlBuvbjw7LjaAABxAQ4MOxeVY+pff6SOvqc
1RBatrDb8z0KQCzRtm3bRlxpIsYqOd/tOuGcCUegWgaJmzZ1SJVx4oSzdJ2ZNS8GFDp6lNwy
FVBbAAOeIOgCiWCg9HNh8CE5HKOYAMl9bEssIHf9aIAe+OUgMVezpwDuhI+eqMpS242XNUhA
lj/XndA98vLy6IGf5dFv726j5vphGYeIrsS9h2BYmYOaP79I9l9oQSF1sW44HIr8fIEgfNJX
XyUS+Xov/QKRwaTwBFW7BzcXICHDoM8BRTIfh8ttUrLQejK0+dVOOyAb1vjpSqsvhINVA2wI
DBZUFTrAHDvaVlM5LNMt+vyGW3s5qZNutGpCOG66vEYSGZxviiXUJjxloUqqaPXqTlq58pQg
XIdQK7FZgdRU72MqyjhP/3NzNr302BHhnL0lgQDTAhjdxdUbpBQSAppyCPHorQfoa1Ze6MtW
hd3tbRO69lJrJPT5T/bTj28fkOIXVRHtxIm2RIyzW4OImxKLpvbSU1FAcITdTriR7oBs3Uq0
ZEkDITu9b18tbd9eKiSkx3bNxo1NCY3ne1Zq5HivqpbUZKTJDoKJYfBh3FlyMPmmZq///MBZ
+pRI+yfvDtgl5JmkYOQmuAEAwQMBBmddMzIyKT357LiAgnsiwo9v4Ilun9ZIN06poePpAxGj
KYJ7WxVkbKxAlJIyiDBDzEt0C7tjn6evqAiIsbV6HsuRI7U04/ojxIA4qTGoKk5MQs2DkblE
NhwSDBKmkZubB8TfcmpvG6JPXDVIR7ODUUBuvDGcTue8FIgPMYS6gvcAgI4KI/d1IV447vqH
0nEDJV4GwKlBinfsOO+oulCgB/c3K6ueDh4sFOPoijCAGKrIAJTFfW5395CMY2pro1PKf02q
odbagYhHBY4H54P4IDw+s/Q3NnaI608L+9UjiF9py0Q7Rurw7fWgBwjDXkC08BAMJC3tcAQQ
HOPV4Dxguna01+fmNghmik1ObthAtHw51FUnJScfEkSJqpdNm8rJPdKvFSFIDelz96AFVBCi
cEgbNAjHTBUVmBFtFwzQLDRJk6v0OsVOEpCZMynGyAJhiB+noeHO4eFzf1UnQTma0i0NPTrn
1RbEkxQ3fexlwqykpME2DsylP/QQHKczYqLopAAmRf62dm2r0amAuk5Jaab09GgMAemFEYaW
gNbAeOGUILgsKuoRebJKQfwu6cGNlQbPPtMu4yYr/TARPxgP5DQFpzG8RMYM2lgNPVebjLZ1
dAyLOZawM4Ik4w9/SLRlC9Hhw0cF4TJk7Zbez8bGFtq8uTESp0BVg/jgfASzOTkFwtb46LXX
yoQ6GiCkYBBAh8axsW17fU2ArNu+HYgpfjZV73lNLOpLBRKN6r3my9zFv09E6A30wANECxaQ
yIcdE+FFiVApURcXFfJLltQLO1RNiHVgI5OTk8XnHkIR9hpBHHBsejpNaMU7T77BCfjYZX6y
liwM628Q0lQFMpoGiYO0Oc0buDVIqJs/77XB3f3rXzsFwZvoqT810X33hp2UnJx8EZecoD17
9ksDnJ9fJ5iAZIWj4EVZGRO6QI2rdBCfoAkFQdbfWh2hvbt6J6wTkDh9fUd876ab3Oq8vLSV
K4nuuINkdhhzEDhefLFcSEuTiKdKhfdTLFRYgzDevQSvK3SBG3J0nElH0Ajn5mh2fRiQAd/E
dwjGEPpbrYR3azzRM9rnrVsXNurr17fRz3/qo3lJ4bQLquFXryZavJhk0IgZyNxckhUiK1YQ
vfJKkDZu7BISUyfUXqHwmirE3xbRlwGROhqgd99tFzapQtqW1NRa8XuXYB5vmYcdmwdpxg+6
KDPjpHQUoAl0ZrUuNGdANAGMF2LDBXfLnLq16dOJZs1qp8cf94vpBBKGm+iZZ4iwjACTVciH
7dgRBkWYj7hz9fEa0k2wOcIcCdB7hc1qEY5EqZDAEqEeGwgFe5+0zoZwPPhfXQLUbhkjoUo/
N7dUSG2ToEsPXXBAEnUgMD+iz9B5aTff3EHTpwcl14tksSdvcaLbQ7/ooakfOkslp5wzFBYK
DKDLvKqSiWiQBDgBpuoTdhISkZR77z0nJSL0AWyWKSsJ64+4hI0NQBuLPk/U2JmkxlTZYuTC
h9rGZZ3GpAGycl7ihEasgLkRXmQDlxnBlJpEG2uD1CJfpaoaZAXcGGPOnNNxq1IuekBSd4aJ
iOizsrKXsEo1J6eQsNa7qgqFbH4R/fYKA9UgDFCh8NsrxKDbRKpjwHVGTZUsVep4cafXhjSH
mkGAaoVL3HmyhkqS3grhQFu2rEQYyg82GGBAkVw8I4jeKzgdS7KQw+oVYJwRfnqdOCrE5wLC
4heU0FRUNIlzO0UAE150iUwr8jhISbz77oAAskUQpUQk9Uro5ZebRYLSJ9TMgEjEtQjvo1Sk
IkqFVLVIgMDtqmRB6gBgeO7cnB9jJ6Al5RS9ac0I8bFlygx6+mnylE29GBunnsBoY/KyAAhc
PZEYFoAQYU1GdvaIyIb2CjeuTXg3dfTCC+U0b14+bdhQJPz2ajpyBBWJ54Q7iPxQUCT/+sS1
jeK6EyIW2CWi6zdk6Q8mw+Cr4/NOMa2K9AakDP9/66pf2QDBkTt79wcGjEUL/LRu1bBkLuTL
1PrmSXN7UZaDaVYUs2EKQMSBhMVAv/99WOKWLsUEE4m5DGRyoU6j3C8AiAGEVdfF3CD5SCRi
TSaON0U0iqpMNcVkXcwDgApCbik1FXkpVCGGI+z0x/fEABIYGr6oJASZCUg0iA0Q1NnRpX/x
07Y37GoZ0w9wlCzob3xB1nE0RncymlC3dGLeAVp/+W9o9zfm07o5pyatz3A6oFoxdQDVM5og
1lPqBN4MXE/VU8IcAYAby2TS+HMiUiSNF6Q/MLrgeowfIHipCRg3QLzmpcIFB+FoH8u4YKgg
ouMZk3hpXpY+jIbr4dmNlesTAgSRMSw95onhekHnQTrQGcyPoGPwbNAxcMhouILXgOB+AA3+
NvTleMx7oKGasWjnSdp468u04oZ5VLjyOCXSN8yLIH2j6/pJCQyxfg9qCJwNbgcQIBpAQScB
AgjJLieKH3A+YggYLp67wPUgOgYFvxpxBbwK/I7v+D+ux3kI8vR5bZyHc3Bf3pEHoOnrGGNT
LSJzK9zpF63HQ+pxdO4B0lUwmA7PQR8mmusxBi6KADODsUFrjBG2hudC2GbDJOD7hHpZIAIe
BADQAdggEBkdQwfRUTABOo7z8BmgHRB+L+KPg8LnxVw4gAYxc8XExfbt20VcsltkDarE/+rl
/dZ/9S8xgOBANQtzPfcDWgDOC/cD92VmRD/ARF6IqW4pdUFsyIoFnZR/9MJscQeCgTtALEgi
pBARPNQpHAoY0fr6oIz6EVRCxQKYzSKlu0/MvS6bOtcIiO6MjIddg93My/KN6T4NYiwLnzGv
BLCYM9R9rOY8eIa+ZFWHcPR2B2SaBETBuSASuAtEA/FARHALiAqOARfCRoTnq8OSAA6E6vFS
f4V7AYzCwkYBEhb+F9DWrVvls3EfHGrCEd8PP7cvBpAN310q+wquhpRBKlTvEKqZXX30i5+L
a5yK9yoKB+nvrcoQjmmXVo4alI9N6acrLF/oz3+MlTKjhMy+vz0CSNe58dtnEERgOwEAw251
sUijNAuuLxFJzE5BkA4JYryKRr0oY/ejmyOgbP/PNZK4IDjsG6/ihd2A1ECq8NfLvD0YCSoT
z1v8ZGsEEBwvzamUgMr8mhgLzv27GwbkHD6ugdTjGVDD6tTBA78akoCcyo+lraPKeiXpXCgj
pd8zGBxcgsPYKKvzKH5/UOj900JqGmSdU04OuLGTElUXkD5d9eB5SEFAat8VSTWcA7UGKcUB
QoETASA7E7BvXAKK67gm1+35W1Z02QBpa4r1yH5x1xD907RBqT2w+gvMALC4smRc4hB90gpE
BrFBdP0hxcXtgvBlQnUNCY4/TSj1VHfpGU2DtGBQTi7psWPHCAcGj8U9UKPsWkMdgUthnMMZ
6qAERg9uARrUFsbIVeq8qY7a1i7qpEfvbKbsA96ZFUyKPvBmOtASvIBHX0NicdUiuJs7H29a
t7WVORwp8zYJQE+Pn8Y/AdkZt1YMnhCID+aApIBxQFiAgxiDJRTn8EIkNe1tmvDiCkbQAK4/
CAoJUndMHUuOC/3Ql4xjrADKUUJ8vhFBaCwjbhQd64sAMGGelpgg413pAEK8/VK48fYcvC6e
CccgMFj4zutb9KXavGzAjTHA3Xwd7AGICgkabfU+q3kwhLqtlVVSAhVTKojeL337goKmSYlU
f/gdn1zB9b/3e3dN4c5CQgAKvkOyEUfw4lTmQl6cyVKBv7x+UncUvJTR8oopVntQb7gWkjTa
PB/UMa63Ji+1PiA5DATF4HZuH5aAHDrorZoeROc5fbVAHMQB8bmoGtKGwUJn89IBcDfPSprs
BIDyKqGQTF4Uq9o83Bf3iZdpGNfkYmL5pnZJfHTUVO6TaLkp7gVC4L7qjBsAAFgsJapEMGhM
dAbStIsEGkDUCy3iNag1gKBW8sOzU1emTQog4Bh0CqkJLzVfiQACY8sD0zkZMQyIr27pxNIC
YqEvTHw4MWp8YJIWViecGE007oI0mrYX4cyBvkm0NV7pahAeHGDa/ypeSyQnFK4S75HeDwit
v1EB8QeCQpUJVI8GYOB6jmVwPzVAxO9O9V8cB41mAwVmCEioKYXDjonFxoy9Bt0oIYZoqAvE
TDfi5uCaRDamcVNniRhylg4Qj7mPjTYMI6doVB+f50tYOngbJf5d3SzG5InpjaPzcJAp5v73
JuZtQR1i3PrGoRZcQeSceKEnHoQBZ2ZmSp2P6ngcGWndUgrG4uY5Na9JP15CxwYZKoT1O4Ok
GlGVk1XVxsTW52N0UNi9jQcM0+gn3xl9WIA+5eb4Yr0sDBZ6GAPLzs6mL32iQT6wvmZi3p2R
qO1gt5QX4auejfqXk4fq9WoQyJ/15wMA1Yjjczw1zIB89opW4nxdIpsjRKQGC3autTpD+/ec
lw8Fp0LkcUCvZ2VlTVhMUlM2QM8/XE/rX/RmcwCEukE/+qtO2+prB6HCdGdCtSVQu2yk9R3t
IBl6ZhoAOqnnA3v9NOuRPsrKaJLXoV+87ySYG/3GXy8ryqxrpnRSeWmn1Ge8DxT0K3JDE+kG
f93KiyyzLjrWF3dJAlc6qk6A6j7rRGXi6bkiVU2ptks/D9frtg0Ax4tP1P1gYGOhaeYmBWPW
cQI0MBGPSWjX8LLoO++0+9i4iS7q49EAMkQZRISuVte8Z6e42xDdeeDNM3VVo+eMdDticpPV
7/o9wAQmG4Lnu3G7yhzYSgq7ea9d6z5lPHduQC6/kzYkPU3krY6F16aPBQwQG84BJ/XwWXUC
MJAjR47Q22+/TetfzaJffqOcls9u9rTbtKpucB8374438Wd/3xRdq+cy0Z2WPJgSnADLbSm4
6ZUcuI+nwBDvV8Lhtnc72vZtYhpVbo9UJ20OAxAvPYDzAQRsEuYIAFJKSoon4AGsaisYGLci
BXAvq19TUKpnWtV7gZlMmQTTzqnMHE4LjZLf7qb168m4LbuT6pOAzPixT0yqDMTV4wvmDVFJ
sbc0AjgIhIQxw+QRwOZBeQGRYw6dQ3FPdc9Dk9us2wPTvlX6JgWqywsim9IlkAhsYpl+KBAz
QWZikKmfCkh15ZbtxfSF+lomK5rGJtdN9L1mMXkzffwFQcEJUAmoGGGOTUtL87Sfr0ldmDZu
1t/ipi7GN9kRk5TokmJimOLCgJx6xeE0dj29gvpk0M9pMzM0EQZ6L7bWB+umlnCAkLwDHXQy
pEGNF6C2vKS4WU2pgLBeNs1nqN95ozU3O4KmSxoYR1Vxps2jISG7d3YSb/BpsqNO6hQSFq/C
0nIz0PHUChcqgBOhAgAEHoj/QcXx7s5SrIeISoujcxfxAkCTdDgRQc8esKrjZzslN01Sout2
JzA5LnLaLFqdvzc9w6kCxwZIc0OAPmO1hm64tNW1ZAdE546D8PAcoEqYU1lEVU653mqWRzw/
HsRj9ahyExtOU45JVweml6w4cabTvvNuLrVu6PF8JzvlxNQY57Rp5F51smOTTwKCw4kr2G0D
+iAuZ0CZSyHmAELfROb7t9TQLVObPOy5W0Mm7uVUhymNoXtATGQ1SHNyk00cDjug2kwuKjdd
r6q1381slS9cNtHN65xKjMpaubiPDu4ZJFUtqRvJ4Ma8DhCEZ87gFbK8Ab1u7CDCboZN52Kd
gMxpJjWgcyEzh0pUJ9WD8ZgSpvo9oTGcisO53xnpwdCPfjBsLJwwRf6ebQh2Urv37mBMEIPv
UFEgihr48OybKRhSX4UUb4KHB6Y/l9Wcl33knTwkt0kyJzugx2UYp9OCVJ2BnPpaUFBHP7jd
OfHoaNQX/yVoS12z3w5OV+0LP9gUODFHcfWHl6wvb1KseyemdLmXKFmVEic7ArCcCK17TE72
hDeejpfJrqok+pAVML76L67bi61jj2R2RThcHZA6FWoaqMoxsCduHhsAYFVkSi3wb6Z5E9Mu
dOq7E73YETcpMbmwTrVipi1A4uW9EgIEXibeNKYbUq6RhQrSCZ30dFDMo3Ta3uUUL+5Q7ZDO
qfxsJ+kwxQrq/1SOdsvTAXQntWZKKW3f2kozH/QbGVEHAAy3ZQvis3EoJV21koxv+wcQuojC
AVgwv4o4lQwxhsfjBogqXabzGBAn7japBZWDVSD/5evD9Olr/AlLickV/uwnw0XVLy0aNkb8
OmO9tBhb1o5TbW9qip8wkfXay82ROEMvTIA60Xe+BnjxVioxB6uTT6pn45Y9PfzuEM16+BzV
VI845rZUlXXLV/x09eV+11c3Obmn4Hq1trikOCjzWphVdRtXos0TIEueG5CAfP9bfVRZYZ4f
AAersQc6z7GK031VT8R0XrRy3kzEqVabPL54ZexEkkpIG3OlproSyk1KTMyFPjq9Pg/SiXfk
jjsg4UESXWX1hhYmDcV0CAQzuchOaWmV2G7qiNWN07z7VKuVAMgdt3lfPAqpcyM6JN8tiDMx
Dlft6P9/fW1Avht36ZIAjTsgknsa7EYPWVRTFMuuplsgqNoOk9eiAuzk0+P9tGterfW0VSB/
5hLP0UoJpE93MEADfu2RHriWlwUnvpS0uoronrv7I5Gz7o4yFzmpGnWmzSk2iLcMgYmK5+tx
S0zaXLEj6vIEp/OLTvVJ+3Cugzy7wsyU+O2nPx6RW89OmA0xRfLbt5HcDfr06WZyCgZN18L7
YFWWkU6UnNzlGKw5uZy8jt4pucg2zC1yd5OS7/zrgJz3eOT+obivJFdbRnoDncwNv/oDS0ku
GCDcrruOaN48MpbaOAWCqmv7xhvtcutut0jbNG/Nv7N6MNXkqmpFt1Es0U5Mk5keCF3zkV56
c3O9Jynl9q1vBujDHxqZmL1ORtOcclFOnKy7ydnpfrmV6nWXnSXMn5jS46qK4/uZjLD9ld/F
xhnGm6eN0Oeud06ZwHuCJDi5sGC68d48dNwAeeTBEbrlK8PkFOCZDLmujv5j+vnI3raLkvoN
xQhkM8gqoPq91Nyanl7h+ObB+wNC3/c5eng48DyoP6e9Hj97vd9YyDDpgBw+FITPTdO+HJB7
qDtF3G6qKHn7YASQxrqArdRn0fMBOdewd0/AaDumf8sfWVy6bk343HqHl4epBQ1OLjcAwHlc
E6Bfx233LopkJi4qQLjhnbZDQ/YO8oY2qp0xGWvTK03VOOj3v+2Iqfbgzy88F/3tufkjEpCq
yugzVU9MVUFucxzoNweWrOagpu78ycRtUDOhK6jamkfo/p92UMquzpgUtlMhmSltztfoNkeV
Mh1gPUJ3e+Wf6RUZqkplN/6+X5yhNasCdP+vP6CAzH2si26wmkI44sUougrTdba+jk+3IXom
V1/Trnt9KggmKVEdExS8Tf+mX77fY9qX/BNa8zyhgBzPGJKAzH4kXBd10w09tGBOr/H1FTog
OvEhITrhVBuixwU6AHptllreZMpFwebteSdIV18ZoLt/PixV4Fg37J90QGI8ko930+9+45O7
crpF5boryTpf/7+aplBfGGxKt+gqS3enVYnKOhKUOajMTJGRmBF43/2+MHsCT8qy6JMnAsrb
oIm2bj3jSkwvU7f6FLL+VlI9vaNL1D332PtQVDg5Lyf4PxBi8Pa80CmrAAAAAElFTkSuQmCC'
]

{ #category : #sources }
RTRoassalExample >> exampleEllipseBorder [

|v shape |
v := RTView new.
shape := RTEllipse new
	size: 50;
	color: Color white;
	borderWidth: [ :vv | vv / 30 ];
	borderColor: Color black.
	
v addAll: (shape elementsOn: (1 to: 10)).
RTGridLayout on: v elements.
^ v

]

{ #category : #icons }
RTRoassalExample >> exampleEllipseBorderIcon [
	^ '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
3YE/yavlAAAAAElFTkSuQmCC'
]

{ #category : #sources }
RTRoassalExample >> exampleExtensibleLabels [

| v e s |
v := RTView new.

s := RTExtensibleLabel new.
40 timesRepeat: [
	e := s elementOn: 'Hello World'.
	e extent: (50 atRandom + 10) @ (50 atRandom + 10).
	v add: e. ].
RTFlowLayout on: v elements.
^ v
]

{ #category : #icons }
RTRoassalExample >> exampleExtensibleLabelsIcon [
	^ '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'
]

{ #category : #sources }
RTRoassalExample >> exampleFadingLetter [

| data mousePosition shape v es |
data := (RTView rtmethods flatCollect: #sourceCode) copyFrom: 1 to: 1500.
data := data select: #isAlphaNumeric.
mousePosition := 250 @ 250.
shape := RTLabel new 
	colorElement: [ :anElement | 
		| d |
		d := (anElement position - mousePosition) r abs.
		d := d max: 1.
		d := (10000 / d) asInteger.
		d := d min: 256.
		Color grayScale256: d  ];
	text: [ :aChar | aChar asString ].
v := RTView new.
es := shape elementsOn: data.
v addAll: es.

RTGridLayout new gapSize: 0; on: es.

v when: TRMouseMove do: [ :evt |
	mousePosition := evt position.
	es updateShape.
	v signalUpdate
].

	^ v
]

{ #category : #icons }
RTRoassalExample >> exampleFadingLetterIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAXgUlEQVR4XuWdRa/kRheG8+si
ZZNFVskii2gWQSVSEoWZmZmZmZmZmZmZGep+31Oap3Xuid3t7nbP3LkuqeV2uVxoH3x9aqOl
pfHp9ttvLw899FC5/vrry7XXXls4f/3118tbb71Vrr766nLBBReUSy+9tDz44IPlhhtuKNxz
9tlnlzPOOKM8+eST9fy2224rv/32Wzn99NPLOeecUy677LLy888/l0MPPbS8+eab5f777y9/
//13vfbHH3+Uxx57rNx3333llFNOqfebf8UVV9R6Dj744NrWM888U37//fda33vvvVf7duWV
V5arrrrqP/3iP/dSx80331zznn/++ULyOm1y7ccffyyPPPJIifPw2muvjdq23htvvHFUhjH+
8ssv5eSTTy7HHnvsknU++uijtYz5k9JGS+shXX755eWdd94pk8o9/fTT5ZVXXinT1v/iiy+W
pQ00bbQ0/LRhLchLL71Uvvnmm0pG/vzzz/Lss88WnnCPu+66a7n11lvrEwk54HjLLbf85wk1
7+KLL67kB5IgiSNBvki288ILL5Sffvqp3HnnnbX8fvvtVy655JJKCiEfb7/9dtl3333L559/
Xt8ij19//XV54oknCm8J/eOcN+2iiy4qn376afnyyy+XkRrq9tzjXXfdVY+0F8dFos0ffvih
1v/ZZ59VkgupZA6++OKLUb8hnbGu3haEwf1/kpZoABrIj4F6hO4ysd99992IZ5iY4Hj+7bff
1vPHH3+8rFmzZtmCMCjobGinXtt6663rca+99qoTwQPCuTSeCWCyPUYeR//kgTfddFPlNSzI
hx9+WMvyMFEHk0n/zfeea6655j/jOu+88yq/4gfve/nll2t5y9hv8uCL1tXbgvz111+1Mhga
R5hoPMbEkx3PvScmnsi8WHTc+rzHdrukf//9t8TjpPTrr7829jPn21fHRT+b2ozjtN/T9H/4
PGS1M3VIg8cLL7ywvsrjyt99993LyMBXX331n/KZnDXVA3/heNZZZ1WyimgOKfnoo48quRnX
B8hmbMMEaeONgFTNMye77757aVIh5l4QmDET/dRTT1XazIDff//9yihPOOGE+uO6RxjjPffc
U77//vvK+NvIBboCDP7UU0+ti0N58j/55JNy+OGHL5ssZPyTTjppWZvkb7LJJvV40EEHVTFa
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
34tAr/wPT2b9vzS7zIsAAAAASUVORK5CYII='
]

{ #category : #sources }
RTRoassalExample >> exampleFontSize [

	| v label els |
	v := RTView new.
	label := RTLabel new height: #yourself.
	els := label elementsOn: (1 to: 30).
	v addAll: els.
	RTFlowLayout on: els.

	^ v
]

{ #category : #icons }
RTRoassalExample >> exampleFontSizeIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABjCAYAAABt56XsAAAEV0lEQVR4XuWaW4hWVRTHj7dQ
EVMfBm26SOiTUVEGEenkaF4yKhqbsuxm9WBFqTmllPNpOalY0AWMoAgKUYusl8gsK0vFy4NC
EVQPJRHUUw899CLo2sx/42q5z0BoM339fvBnr2/vffZ8317n7L3WPlPx4cOHDx8+fPjw4cOH
Dx8+fPjw4cOHDx8+fPjw4cOHDx8+fPjw4cOHDx8+fPjw4cOHDx8+fPjw4cOHD59/SKuzJzn7
whp7frj+cme/5exO0xz3+TxTi6knXH+L6TLTeFd3t8qNYYzUd5xprWmRq59s6pK9I4x/g2mE
qcN03//RgcP6aLvK2VeYrg3tF5vuqnHo+MJ4C02jQ11yyBjngEzDdKvp0cI4I01PmNbzn78z
I01yW6gbIafOKvSt+nBIt+lF/pTy4cOHz1nhWZUpilkW2p42DTFdYrpREUrlNt/3ZS82PR6u
Te1bZN+vawe59hWKltLesNw02zTRtV+pSG652/Rvd+0P6do8RtpL1oTvsNo0z3Sd69P4rzvk
GpVvmq4PbaNMQ2U/FtpS/fOyXzJtC+0XmPa4jTZFRXe69jRBw03PuIlshPYc8ua2FSHySvxm
WuC+h2eeyoOme2S/2ywOeU45Q51DnqyJfnI5Rf09H6pcpidxasgllhbG8Twc8gzvkBaNmx23
Sk+N51xFVW3OiU0V8raEz+eYBsueUOiff+hK0wOF9jtULig4e78LZ1/Q8nJpWC7XBSd5h3xk
ulpKT2e7bM92Z+cnmJ+D/Iu5SVa3s0t9HpHjV7mnkg8fPnz4nDmd1elnRXEtHhnW6LaaNbtd
dYtcblM6h2oN1/v9IPbtUv00fe7Q5/bCb0nBxVz3uUM5UlORI5GfVabk6YfQ5xWFtHOUS9Qd
zn2pcqfKT1V2FyKssUo273XRUk9wSDol3qB85SfVfaYE82gYc48clfKpGaablN80NEZTkb78
q1XvsfjNCilL7DZdZDqmH3qo0CdN1hFl3p8rF1ldM16XnFLJQesKT2bO7v9Q+bX+9lehb04U
J6p9n2s70UzO2Oni/xTn7zL9Xp16OVQpoftExygxrPTvRdJRxzuy57pkclchYTsQlp1tfdws
6YkarZsh3yxfFPreZjrslqvXlHf81UwOSZP/jZT5IPTZG9b4vTV36T7F+UvdpLVq8j3fF77H
x4W6mWEPSMvpU7J7wg2yu/r7W8Upzv6RHyr0Mrhm842b+KDCZh6Dh4ZzxHemJaFvuqFel9Iy
mA4iX9aSOZ3vCj58+PDhQyBFJn9Wp95dJN4z/VKd/u87fPqBnPFOd9FMfq9wnD89A0Onsur0
n4MHXf0O/tQMDOnN4IOmTaZvXf1W/tT0P3nvON/0ho4a8pL1K396+p90Evu2aXPVezA3VI7Z
WpM98+HDhw8fPnz48OHDhw8fPnz48OHDhw8fPnz48OHDhw8fPnz48OHDhw8fPnz48OHDhw8f
Pnz48OHDhw8fPnwGhpNYGq32Nn6+JQAAAABJRU5ErkJggg=='
]

{ #category : #sources }
RTRoassalExample >> exampleFontSizeWithRTLabelled [

| v  vv es shape |
v := RTView new.
vv := 10 to: 100 by: 10.

shape := RTEllipse new size: #yourself.
es := shape elementsOn: vv.

v addAll: es.
es @ (RTLabeled new fontSize: #yourself).
RTCircleLayout new radius: 250; on: es.
^ v
]

{ #category : #icons }
RTRoassalExample >> exampleFontSizeWithRTLabelledIcon [
	^ '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'
]

{ #category : #sources }
RTRoassalExample >> exampleFonts [

	"
	self new exampleFonts
	"
| v fontNames shape es |
v := RTView new.
fontNames := TRPlatform current fontListStrings allButFirst.

shape := RTLabel new fontName: #yourself; text: #yourself.

es := shape elementsOn: fontNames.
es @ RTPopup.

v addAll: es.
RTVerticalLineLayout on: v elements.

	^ v
]

{ #category : #icons }
RTRoassalExample >> exampleFontsIcon [
	^ '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
QmCC'
]

{ #category : #sources }
RTRoassalExample >> exampleForceBasedLayout [
	| v classes edges |
	v := RTView new.
	classes := (RTEllipse new
		color: (Color purple alpha: 0.3);
		size: 10) elementsOn: Collection withAllSubclasses.
	(classes elementFromModel: Collection) trachelShape color: Color red.
	classes @ RTDraggable.
	v addAll: classes.
	edges := RTEdgeBuilder new
		view: v;
		objects: Collection withAllSubclasses;
		shape: (RTLine new color: (Color purple alpha: 0.2));
		connectFrom: #superclass to: #yourself.
	edges do: [ :e | e trachelShape pushBack ].
	RTForceBasedLayout on: v elements edges: v edges.
	"v addAnimation: (RTSpringLayoutStepping new view: v)."
	v @ RTDraggableView.
	^ v
]

{ #category : #sources }
RTRoassalExample >> exampleForceBasedLayoutAnimated [
	| v classes edges |
	v := RTView new.
	classes := (RTEllipse new
		color: (Color purple alpha: 0.3);
		size: 10) elementsOn: Collection withAllSubclasses.
	(classes elementFromModel: Collection) trachelShape color: Color red.
	classes @ RTDraggable.
	v addAll: classes.
	edges := RTEdgeBuilder new
		view: v;
		objects: Collection withAllSubclasses;
		shape: (RTLine new color: (Color purple alpha: 0.2));
		connectFrom: #superclass to: #yourself.
	edges do: [ :e | e trachelShape pushBack ].

	"RTForceBasedLayout on: v elements edges: v edges."
	v addAnimation: (RTForceLayoutStepping new view: v).
	v @ RTDraggableView.
	^ v
]

{ #category : #icons }
RTRoassalExample >> exampleForceBasedLayoutAnimatedIcon [
	^ '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
/s2/+bch7X+UezlxUQktfwAAAABJRU5ErkJggg=='
]

{ #category : #icons }
RTRoassalExample >> exampleForceBasedLayoutIcon [
	^ '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
/s2/+bch7X+UezlxUQktfwAAAABJRU5ErkJggg=='
]

{ #category : #sources }
RTRoassalExample >> exampleGrayScaling [
| v es n |
	v := RTView new.
	n := RTGrayLinearColor new 
				command: #asInteger; 
				scope: ($a to: $z).
				
	es := RTBox new
				size: 40;
				color: n;
				elementsOn: ($a to: $z).
				
	v addAll: es.
	es @ RTPopup.
	RTGridLayout on: es.


	^ v
]

{ #category : #icons }
RTRoassalExample >> exampleGrayScalingIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABfCAYAAAAeX2I6AAACt0lEQVR4XuWYP0ibQRiHu2Rx
yRIIggQkEBKFEBDxD8YDIWQRUQhkCYEsLi7SkAZcbnJ2dnbP0KE4Z3Z2d+hQ7NDF+e39oLrd
a1uQKM8DzxDeIwf3fN9w3yc+fPjw4cOHDx8+fPjw4cOHDx8+fPjw4cOHDx8+fPjw4cOHDx8+
fPjw4cOHz38SXyEk2u12uLi4iDk1393dDZPJJHpqv/Pz8+ipNWdnZ9Fzc3MzbGxshNPT05hT
8w8ZxF5BUXToT09PllNzHfjj46N5ar+Hhwfz1Jr7+3vzVBQd+t3dneXUnB+EH4QfhB+EH4Qf
hB+EH4QfhB+Efw95n4xGo+jZarVCs9kMg8Eg5tR8fX099Pv96Kn9Tk5OoqfWHB4eRs9arRaq
1Wrodrsxp+YfMsh8PjdPRdGh397eWk7NdeCz2cw8td/NzY15as319bV5KooO/erqynJqzg/C
D8IPwg/CD8IPwg/CD8IPwg/Cv4e8Tw4ODqLn6upqqFQquq3HnJqvrKyE7e3t6Kn90g06empN
Chw9y+VyKJVKoV6vx5yaf8ggl5eX5qkoOvT0icRyaq4DT58+zFP7pc8a5qk16a0zT0XRoac3
ynJqzg/CD8IPwg/CD8IPwg/CD8IPwg/CD8KHz1+QPjOYZ/oEoZu43hLLqfny8rJu2uap/RqN
hnlqTfo/8ywWi3FpaUm3ccupOT8IPwg/CD8IPwg/CD/IGwfZ29uz4+PjF7e2tvhBFhlEEabT
6YudTocfZNFBjo6O+EHeCzs7O5/39/d/DYfDH+Px+Hv6/ZV/Kn9IT5J5FgoFPWnSHOO/BlGI
Z/lBFhxkbW3tS6/X+/ls+v2NX2KBQfjwg/CD8OEH4QfhB+EH4cOHDx8+fPjw4cOHDx8+fPjw
4cOHDx8+fPjw4cOHDx8+fPjw4cOHDx8+fPi8Nb8Bjy8MaRHyChQAAAAASUVORK5CYII='
]

{ #category : #sources }
RTRoassalExample >> exampleGrid [

| v es |
v := RTView new.
v @ RTDraggableView.
v @ (RTGridView new gridSize: 10).
v @ RTZoomableView.

es := RTBox new
	color: Color green;
	size: 20;
	elementsOn: #(1 2).

v addAll: es.

es @ (RTDraggableSnapToGrid new gridSize: 40).
es @ RTResizable.

es first translateTo: 70 negated @ 90 negated.
es second translateTo: 70 @ 110.

^ v
]

{ #category : #icons }
RTRoassalExample >> exampleGridIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABeCAYAAADVA7GfAAABwUlEQVR4XuXbTQqCQACAUc9t
RNeKpJ3HEG/gvnFo+tlEY5vBwIleIkMLFfl8+IM2McYUQkixYFzOpcutXf+W29piX0qWbW6P
3/NPybj8lS63dv1bbmuLfSlZ1g/iB/GD+EH8IH6Q1UGif5XlX2X5QnwhvhBfiC/EF+IL8YX4
QnwhvhBfiC/EF+IL8YX4QnwhvhBfiC/EF+IL8YX4Qnwh1Y+qOc7Z7AupeFQ9AzS3fPKFVDyq
LuHyEcQX4gvxhWRCFpMvxL/K8l+U84P4QfwgfhA/iB/ED+IH8YP4QfzH7/6NoS/EF+IL8YX4
QnwhvhBfiC/EF5KPwzD4Qn5FyDiOqe/7NE2TL8Q/h/hC/HOIL8QX4gvxhfhCfCG+EF+IL8QX
4gvxhfhCfCG+EF+I/xqQH8QP4gfxg/hB/CB+ED+IH8S/D/lyPF/P6fA2neaTfx9SU8jhMb1/
hr2LO19ITSH76z77Nr6dW1+IL8QX8hq72KU2tq/5GI6+EP8qyxfiP+31hfhCfCG+EF+IL8QX
4gvxhfhCfCG+EF+IL8QX4gvxhfhCfCG+EF+IL8QX4gvxhfhC/Bfl/CB+ED+IH8QP4gf5wyB3
CTnGiKMrhLsAAAAASUVORK5CYII='
]

{ #category : #sources }
RTRoassalExample >> exampleGroupOfGroups [
	"
	self new exampleGroupOfGroups
	"

| objects groups edgesBlock1 edgesBlock2 colorNormalizer groupsOfElements v predicate layoutClass filteredObjects shape elements edges |
objects := Collection withAllSubclasses.
groups := Array with:  
([ :c | c name endsWith: 'List' ] -> RTGridLayout new) with:
([ :c | '*Set*' match: c name ] ->  RTForceBasedLayout new) with:
([ :c | '*Dictionary*' match: c name ] ->  RTTreeLayout new) with:
([ :c | c name endsWith: 'Array' ] ->  (RTWeightedCircleLayout new initialRadius: 60)).

edgesBlock1 := [ :c | c dependentClasses ].
edgesBlock2 := [ :c | Array with: c superclass ].


colorNormalizer := RTMultiLinearColorForIdentity new numberOfColors: groups size.
groupsOfElements := RTGroup new.
v := RTView new.
groups doWithIndex: [ :assoc :index |
	predicate := assoc key.
	layoutClass := assoc value.
	filteredObjects := objects select: predicate.
	shape := RTEllipse new size: 20; color: (colorNormalizer rtValue: index).
	elements := shape elementsOn: filteredObjects.
	elements @ RTPopup.
	v add: elements.
	groupsOfElements add: elements.
"	edges := RTEdge 
		buildEdgesFromObjects: filteredObjects from: #yourself toAll: edgesBlock1 using: (RTLine new color: Color red) scope: elements.
"	
	edges := RTEdgeBuilder new
					elements: elements;
					connectToAll: edgesBlock1.
							
	v addAll: edges.	

	layoutClass  on: elements edges: edges.

	RTEdgeBuilder new
		elements: elements;
		connectToAll: edgesBlock2.
"	v addAll: (RTEdge 
		buildEdgesFromObjects: filteredObjects from: #yourself toAll: edgesBlock2 using: (RTLine new color: Color green) scope: elements)."		
].

RTFlowLayout on: groupsOfElements.

	^ v
]

{ #category : #icons }
RTRoassalExample >> exampleGroupOfGroupsIcon [
	^ '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'
]

{ #category : #sources }
RTRoassalExample >> exampleGroupedLayout [

	| view group1 group2 host1 host2 edgesGroup1 edgesGroup2 |
	view := RTView new.
	group1 := (RTBox new color: (Color blue alpha: 0.3); size: 30) elementsOn: (1 to: 10).
	group2 := (RTBox new color: (Color blue alpha: 0.3); size: 30) elementsOn: (1 to: 10).
	
	host1 := (RTBox new color: (Color green alpha: 0.3)) element.
	host2 := (RTBox new color: (Color green alpha: 0.3)) element.
	
	view addAll: group1; addAll: group2; add: host1; add: host2.
	
	edgesGroup1 := RTEdgeBuilder new
		view: view;
		elements: group1;
		connectFrom: [ :v | v //2 ].	
	edgesGroup2 := RTEdgeBuilder new
		view: view;
		elements: group2;
		connectFrom: [ :v | v //2 ].

	
	RTTreeLayout on: group1 edges: edgesGroup1.
	RTTreeLayout on: group2 edges: edgesGroup2.
	
	RTNest new on: host1 nest: group1.
	RTNest new on: host2 nest: group2.
	
	RTHorizontalLineLayout on: (Array with: host1 with: host2).
	
	host1 @ RTDraggable.
	host2 @ RTDraggable.
	
	view canvas addMenu: 'In' callback: [ RTZoomInMove on: view ].
	view canvas addMenu: 'Out' callback: [ RTZoomOutMove on: view ].

	view @ RTDraggableView.
	
	^ view
]

{ #category : #icons }
RTRoassalExample >> exampleGroupedLayoutIcon [
	^ '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
DO2Li2xss+0AAAAASUVORK5CYII='
]

{ #category : #sources }
RTRoassalExample >> exampleHappyNewYear2018 [

| x y z da toBeTrans shape f v e |
z := 20.
x := 960/z.
y := 500/z.
toBeTrans := #(241 194 147 100 241 193 146 99 52 53 54 55 104 153 202 250 298 346 394 441 488 535 582 629 676 723 770 817 865 913 961 1009 1057 1058 1059 1060 1061 1062 1063 1064 1065 1066 205 158 111 64 65 66 67 116 165 214 1072 1073 1074 1075 1028 981 934 886 838 790 742 694 646 598 550 502 454 406 358 310 262 253 301 1023 974 349 397 445 493 541 589 637 685 733 781 829 877 925 237 188 139 90 89 88 87 134 181 228 276 567 568 518 469 420 372 324 569 570 523 476 429 381 333 285 619 668 717 614 661 708 756 804 852 900 948 997 1046 1095 1096 1097 1098 1051 1004 957 909 861 813 765 81 129 177 225 273 321 369 417 465 513 561 609 657 705 753 801 849 897 945 993 1089 1041 128 175 222 269 316 363 410 457).
da := 0.
shape := RTShapeBuilder new.
f := 1.
shape box.
shape
	size: z;
	color: [ :dd| | d |
		d := dd + (da degreesToRadians sin * 100).
		Color 
			h: (d % x) / x * 360
			s: 1
			l: (d / x) floor / y ].
shape if: [ :d | toBeTrans includes: d ] color: Color transparent.
v := RTView new.
0 to: (x*y)-1 do: [ :d | 
	e := shape elementOn: d.
	e translateTo: ((d % x) * z) @ ((d / x ) floor * z).
	e attributes at: #p put: e position.
	v add: e.
	].
v elements when: TRMouseEnter do: [ :ev | | p el a |
	el := ev element.
	p := el attributes at: #p.
	 RTLinearMove to: p during: 2 on: el.
	a:= RTLinearMove 
		to: (400 atRandom @ 400 atRandom)- 200 asPoint + p 
		during: 2 on: el.
	a after: [ v addAnimation: (RTLinearMove to: p during: 2 on: el)].
	v addAnimation: a.
	v addAnimation: (RTRotationMove angle: 360* 2 during: 4 on: el).
	 ].
v addAnimation: (RTActiveAnimation new 
	intervalInMilliseconds: 20;
	blockToExecute: [
		da := da - 1.
		v elements updateShape.
		v signalUpdate.
		]).
^ v
]

{ #category : #icons }
RTRoassalExample >> exampleHappyNewYear2018Icon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAMF0lEQVR4XuXcbWyW5RnG8ft+
oJR3gQKi8qYgUiRLGZJZFqyRQHGTIcqIyToYG6sxstHFYEYNumyUFz+savlAFaasJvgKxBes
BEWIsg2raKAFeSm2CFL6wktpeenT69px3fd1Pb2v42ENCV/2eN3ml/M67wdC+/x5eGhJ9HBJ
R4nr2X3fv649Fov9r939IO4HcT+I+0FSJkj/gZ5U+pLepAdJJ9d7eQPTSHfSi/Qh/cgAW8ZA
W/+BAmRCX+x9gxnqjb13MEM9sPcIZsDvPkh46Thrfhr2rjhr8XhcRD8/38fjHh7T0mKDRRdM
Ix17mjfQ/SDuB3E/iPtBUirIbZmeVIaRISSD8NUD96K6EC/TJ90sSYEy+5FB5BYyktxuuyPT
dlumAJkwDPuwYIaGYB8SzFAG9oxgBvwbxiEgzlo83i46+w0X88cJ38PP07rHxolumEYf7L28
TPeDuB/E/SDuB0mpIBOneFIZT0YTvgbhXlQfkka8KTHSg/S3JAWaMpKMJVnkJ7afTrFNnCJA
JozHPj6YodHYRwczNBT70GAGOIDfF4/3wWMav6l38e8RMW+KNHrF7hE9MI0M7P29Ke4HcT+I
+0HcD5JSQabN9qQymfA1BveihpL+JJ14s2OkN7mR3GpJCjR7ErmX/Mw2a7Zt2mwBMmEy9snB
DGVhzwpmoL2dAgzD40PxmOYPwN4fZ42DdfEfQpDZ0ugbe0j0xjTa2sKA7gdxP4j7QdwPkkpB
5uZ7Urmf8JWFe1GjyGDSg3j5XUg/MpRkWpKC5E8lD5I82+/ybXPzBciE+7HfH8wAB/Cy8HhW
vjT80dhH4az5N2IfjLPGQbr6+fhmYr40BsQeFf0wDfeDuB/E/SDuB0nFII8WelJ5hPCVjXtR
48jNpBfxCruSDHIb+bElKUjhg+Q3ZLHtyULbo4UCpNEuhB1gBh6fUSgTsrFnBzPg34l9HM6a
fwv2m3HWOEiaXyi6eoXSGBR7SmRgGm1t7e4HcT+I+0HcD5JyQf5c7Ekln/A1FfeiJpARpA/x
iruSwWQsmWxJClI8jxSQv9qeLbYkBcj/u/Dy8Zjxy2IBMmEq9qnBDPgTsE/AWfNHYh+Bs5Yc
pBhBiqUxJFYsBmMacfeDuB/E/SDuB0nBIM+WeVJZQvh6APei7iajyA3EK0sjN5EfkfssSUHK
Hid/IWssggOs/qfAJy8TlmBfoqa2oEyATHgA+wPBDPh3Y78bZ80fjX0UzhoH6eaXiTSvTBq3
xMrETZiG+0HcD+J+EPeDpGKQl8o9qSwnfM3FvagcMpb0J155GhlG7iI/tyQFKV9KnrMkBXin
3PbiBwKfvEz4G/blmMYfygXIhLnY5wYz4Odgz8FZ8zOxj8VZi8cFBSlHkHJpDI+Vi2GYxiTs
d3nl7gdxP4j7QdwPklJB3qrwpFJC+JqPe1HTyXiSQbyKbmQkySYPW5KCVKwgr5APbbsrbG9+
LvDJy4QXsJdgGkuxL1VTm499vpohf3qF8KbjrPnjsY/HWeMg6X6F6OZVSOPWWIUYiWlMxp7t
VbgfxP0g7gdxP0hKBfmoxpPKBsLXY7gXNZNMIIOIV5NORpEc8itLUpCaErKFVNgO1di2fyvw
ycuEV7BvwDSKsBepqT2G/TE1Q/5M7DNx1vwJ2CfgrHGQ7v63It2rkcboWI0YhWnciz3Hq3E/
iPtB3A/ifpCUCrK3xZPKFsLXE7gXNYdMIoOJ15JOxpBpZKElKUjLBvIJqbY1tti+vCDwycuE
zdi3YBrPY39eTe0J7E+oGfLnYJ+Ds+ZPwj4JZy05yAUEaZHGHbELYgymMR37NK/F/SDuB3E/
iPtBUirIN7KnVLYRvpbhXtQ8kkNuJT3lAJJFZpE/WvjqKd8ke0id7ZK0HRSi5zeYxofYt2Ea
L2F/SU1tGfZlaoZ6zcM+D2etVw72HJw1DpLRS4gBeFqNCb2FyMI0HsQ+C9P9IO4HcT+I+0FS
KcgROVwqnxC+VuFe1CIyi0wkw+Xt5D4yjxRa+Bou3yFf2kSdGC5Py4SLQgxHiITD2I9gGjuw
f4JpvIr9VTW1VdhXqRkasQj7Ipy1EbOwz8JZi7fbQcaMEOJ2PK3GVOz3YRrxNhFcP9wg0RhK
NMb/YxD9inI/iPtB3A/SaZBjeLqU3YSvEtyLWkrmk+lkoswmD5NFZIWFr4nyQ7LPJurFRNkg
Ey4JMfEyfp5Rjf0YpvEZ9t2YxlvY31JTK8Feoqa2FPtSNbX52OerGeIgk+8SIhtPqzEH+8OY
xg8/SDSGEo3hfhD3g7gfJFWD1Ihcoewh/ASsw72oIrKYPEJyxUyykDxFnrfwx5MrdghbFWm0
XRa2GrKHvEvWw7oOM1ZgFnWYsRgzgoP8YoYQM3M7/B77wtwOiSC1MlcqnxO+1uNe1AqymDxC
cuVMspA8RV6wJAXB3wVtB0iT7Yq0qQi1mIaK8Dmm8R7299TUVJD1amoqyAo1tSCEmqGrB5HS
CINIabgfxP0g7ge5piAnRJ5QviL8BGzEvagS8jR5nOSJBWQJWU3WW/jjyRO7he0wOWPD+4bl
BPmKbCcbyRooiXgGnu7QTkF++2shFuR1eBL7krwO7SbISZknla8JX6/hXtQa8gx5nOTJBWQJ
eZb8w5IURP6LHCFnbXhVWFSEk5iGivA1pvER9o/U1F7D/pqamgqyRk1NBXlGzRAHWRAEwdTC
IFIa7gdxP4j7Qa4pyClRIJQqwk/Au7gXtYEUk2WkAO8TtpWklLxh4Y+nQHwhbMfIOdsVYTtF
qsin5F2ygRTbOMiTf0KAgg6rsK8s6GB+vFcnC6RygCQFwb2oDaSYLCMFeBXYVpJS8oYlKQi+
o2v7lpy3tUmbilCHaagIBzANFeEzTCMIoaYWhFBTC0KoGeIgYQg1QyuDIJia+0HcD+J+kGsK
Uo/vRClHCD8BH+Ne1GbyMnmOFOFrC9taspF8YOGPp0jsF7bvSLMN7xuWenKEVJCPyWbyso2D
rMb3u6LW4gvLtUUdEkEaZJFUjpKkILgXtZm8TJ4jRXI1WUs2kg8sSUFkJTlBLtjwqohariI0
4KwtVxGO4myoCF9gGkEINbUghJpaEELN0NWDqBkKQ6gZcj+I+0HcD3JNQZrwd36lllQS/Cln
2Y57UZtJGSnFv6LYXidbLe30K5aKveQwOUVabG3C1kRqSSX5N/wnYjvZbOMg6/AURr3+IpR2
2Ip9K6Z3Bn+jUY6TKsLXdtyL2kzKSKlcR14nWy18lcq95AipI622uLSsVRHO4KytVRGO42yo
CFWYRhAE0whCqKkFIdQMXT2ImqEwhJohFWMrpvtB3A/ifpBOg5wXm4TyPTlK9hN+T9mBe1Hv
k01iC9lm4feMTXifsB0ktaSRXLThm3eW8+R7cpTsg/0Re8gOG/9PNrfgKYvaRj7TvGa5SSqn
SDXZT/jagXtR75NNcgvZZuFrE14Ftm/IcdJELtnapeVtFaEZZ+1tFeEUzoaKUI1pBEEwjSCE
mloQQs3Q1YOoGQpDqBkKg+AV4n4Q94O4H6SzIC1il1AayQlSTQ4QkfQuYEv+z/4Ru8Q+cpjU
kjpyjly24X0jamcLZsTORsyoE6Sa4JuRuw5E7LXx/0DtUzxFURVkn+a1yl1SaSInyTFygFzv
tUvuI4fJcXKanCdXbHhVRAVBWnHWgiBNOGs7VQT8S6KxU0U4hrMRBME0ghBqhq4eRM1QGELN
UBgErxD3g7gfxP0gnQW5hH9BV5pJE6kjx0k1OUSq8LWD7SipISdJPTlLWkibDW9UUZWXMCMq
mzEjKvGFY1VEZR1mROVxzIhKBKuKOmQ7WGU7Smo07zK+DlcukDPkNPmOHCOHSJU8SI6SWvI9
aSDnSCuJ2/D7NSoIchlnLQhyAWctCIKv4I0gyGmctSDIdzhrQRC8chKCEGqGwhBqhsIQaoZq
sddiuh/E/SDuB+k0SJs4LZTLpJU0k3OkiTSQ0/hz39ZIzpLzpIVcJFdInAhbG7lMWkkzOUea
SIOt/rStkZzVvLisl8oVcpFcIOfJGdJI6vG72tZEzpFm0koukTbSTqRFRajHd30NFaH+Cs6a
ilB/EWdNRajHK8dQEerP46ypCPV4JRlBhEacDTzZDfiFDRWhCdNQMc5huh/E/SDuB+ksyH8B
IKTo7T9crVEAAAAASUVORK5CYII='
]

{ #category : #icons }
RTRoassalExample >> exampleHappyNewYearIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABjCAYAAABt56XsAAACGElEQVR4XuXZW08CQQyG4aII
iMhBMCYeY/TCCy9M/P//TTDZRMZDt9uuXfZ9Ei4G2H5dDNMhCh8fHx8fHx8fHx8fHx8fHx8f
Hx8fHx8fHx8fHx8fHx8fHx8fHx8fHx8fHx8fHx8fHx8fHx8fHx8fX2cMjo5lOK6/jq7nzcu+
38B+TmQ828j9++4xl8tnba2Vttbz5lll52v9yEquX6sndg9trQVY63nzrLLztX5kLpunr09o
ay3AWs+bZ5Wdr/Ujg+3+NZXlzbmsH0cyWfy0PpPV3UKuXnZrdTcs3l+nvifPukfn5Nfvx77H
Bb8/+vrs/luv750hbed1rf/W63tnSNt5Xeu/pfrN9zjvHhyzh+f136yfP373ZM+AQ7/eWk/N
y54Bh369tZ6alz0DDv16a71fXnecizs2Q7L7r1dv//Pee30kp4vqr7PcPultwFsvup/s/LKe
tpa13L5FfkW99aL7yc4v62lrmcnFQ2QD3nrR/WTnl/W09edF1Z47lNE04qaqPbFpPe/12f2X
ys+3XLd6v/wZ0rE8/gzpWB5/hoTkxf6P+fueaKvftxliyjOfk4PP3d683s0Q8zk5+Nztzevd
DGl0Tg48d3vzejlDtHOy9XeKtZ43L9p/52ffLx8fHx8fHx8fHx8fHx8fHx8fHx8fHx8fHx8f
Hx8fHx8fHx8fHx8fHx8fHx8fHx8fHx8fHx8fHx8fX+EDGUbckNrlS/AAAAAASUVORK5CYII='
]

{ #category : #sources }
RTRoassalExample >> exampleHighlightingNeighbourg [

		
	| v es |
	v := RTView new.
	es := ((RTBox new size: 30)" + RTLabel") elementsOn: (1 to: 16).

	es @ (RTHighlightable highlight: [ :vv | Array with: vv - 1 with: vv with: vv + 1 with: vv - 4 with: vv + 4 ]).

	RTGridLayout on: es.
	v addAll: es.
	^ v
]

{ #category : #icons }
RTRoassalExample >> exampleHighlightingNeighbourgIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABjCAYAAABt56XsAAABGklEQVR4XuXXwQnEIBBA0SnL
YzpKCZZjGZZiKdkGJgqGLLu8B3MSPOSDTMLn8/l8Pp/P5/P5fD6fz+fz+Xw+n8/n8/l8Pp/P
5/P5fD6fz+fz+Xw+n8/n8/l8Pp/vV5znWbN5chZRaz6+pTHGlc2Ts4jrysfnB/GD+EH8IH4Q
P4i/ZflBnnx0P8jXn6z5s+Q/WX4QP4gfxA/iB/GD+FuWr/d8IlprPZvV2exO39L98+L/qftB
fH4QP4jPD/JXjiOfiFLKkc3qbHanb2F3td1fiX2v/KnvP2c+P4gfxA/iB/GD+EFesbva7q/E
Pp/P5/P5fD6fz+fz+Xw+n8/n8/l8Pp/P5/P5fD6fz+fz+Xw+n8/n8/l8Pp/P5/NxPvWi+6f+
K4KdAAAAAElFTkSuQmCC'
]

{ #category : #sources }
RTRoassalExample >> exampleLabelAndCircle [

| v s es |
v := RTView new.

s := RTEllipse new + (RTLabel new text: #name).
s allOfSameSize.
es := s elementsOn: Collection withAllSubclasses.
es @ RTDraggable.

RTEdgeBuilder new
	view: v;
	elements: es;
	connectFrom: #superclass.
	
v addAll: es.

RTClusterLayout on: es.
^ v 
]

{ #category : #icons }
RTRoassalExample >> exampleLabelAndCircleIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAlqklEQVR4Xt3d5a8sWdUG8P4X
+MpHwidICARJCAmSMASXYdDBBhkGGNzd3d3d3d0Z3G1wmcHdXare+u2cp7PuvlV9us89d+77
vp3U6T6ley95luy1d63GcffPa17zmuHcc88dvv71r48//OEPx69+9avjN77xjfZ7afvgBz84
vulNbxrf/va3jy9/+cvH6173uuMTn/jE8cwzzxw/8IEPjJ///OfHpzzlKePLXvay8alPfer4
kpe8ZLzb3e42Pu1pT2vbc5/73HbdKaecMn7yk59s93nAAx7Q9r3uda8bX/GKV4z3uMc92v1e
+cpXjr/73e+G8f/gZ7XNSZ/61KeGX//618OTnvSkRlydf9e73jX+4Ac/GL/97W9vZMRJJ500
vvWtbz1i35vf/OYj/v/Wt741fu5znxuf/vSnjx/96EePOOYZvj3ne9/73viqV71q9jkY8+lP
f5qwjK9//evbvnPOOWf485//PPy/YMi///3v4fvf//7wi1/8Ykin3/KWt4zvfOc7jyDEe97z
niP+f9vb3rb+/ZnPfOYIwt773vduvx/84AePH/rQh8ZLXOIS6+Pf/e53B1L9xz/+sRHwX//6
1zAxafjVr341PPrRj25a5Fk044EPfGC75g1veMP6+vve977j1N4jnr/N9qMf/ag94/e///3o
2T7/6xjyj3/8Y3jxi188vvrVr24SBwJoxAte8IIGJQ972MPGO93pTuOLXvSiBicf/vCHm4Se
ccYZ4/Oe97zxWte6VmPGwx/+8PEWt7hFI+Id7nCH8eY3v3n7xtQnPOEJA5j629/+1gjwhz/8
4ShC/Oc//1nv+/GPfzxMsLgWjne84x3t+7Of/WzTCO2kRZj0nOc8p2nh85///HbO4x//+Pb9
xje+cXzoQx9K48f3vve942Uuc5kGla6lebaPfexj49e+9rXhr3/963BCGTIRfZjgYqDmGg+X
NfqmN73peOc733l897vf3YgJyzEBvtuPcc94xjMaw3Ls6le/+njb2952fOxjH9sIgKE3uclN
1tfQvtoI2tA37C9/+csR+yqBHPvlL3853O9+92vPvOc979mI7jswyq4tacWXv/zl9e9PfOIT
TWAw5UpXulKza09+8pNHEH3CGEISJ8K2Dj7qUY8a73Of+4zvf//7x9vc5jbtN6LSjI9//OPj
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'
]

{ #category : #sources }
RTRoassalExample >> exampleLabelledEncapsulating [
| classes allClassElements v es enclosing label g1 back |
classes := RTShape withAllSubclasses.
allClassElements := OrderedCollection new.

v := RTView new.

classes do: [ :cls | 
	es := RTBox elementsOn: cls rtmethods.
	es @ RTPopup.
	
	back := (RTBox new color: Color blue) element.
	RTNest new 
		layout: RTGridLayout new;
		on: back nest: es.

	enclosing := (RTBox new color: Color transparent) element.
	label := (RTLabel new text: #name) elementOn: cls.
	g1 := RTGroup withAll: (Array with: label with: back).
	RTNest new 
		layout: RTVerticalLineLayout new alignCenter;
		on: enclosing nest: g1.

	enclosing @ RTDraggable.

	v add: enclosing.
	v add: back.
	v addAll: es.
	v add: label.
	
	allClassElements add: enclosing.
].
RTFlowLayout on: allClassElements.

	^ v
]

{ #category : #icons }
RTRoassalExample >> exampleLabelledEncapsulatingIcon [
	^ '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'
]

{ #category : #sources }
RTRoassalExample >> exampleLabellingNodes [

"La parte superior entre barras define las variables"
| vista e1 e2 e3 e4 line |

"Se crea un objeto tipo vista"
vista := RTView new.

"Definimo los elementos, que denominamos simplemente e1, e2, etc, con
su color y su tamaño"
e1 := (RTEllipse new color: (Color blue alpha: 0.4); size: 20) elementOn: 'hello'.
e2 := (RTEllipse new color: (Color red alpha: 0.4); size: 20) elementOn: 'Bonjour'.
e3 := (RTEllipse new color: (Color yellow alpha: 0.4); size: 20) elementOn: 'Gutten Tag'.
e4 := (RTEllipse new color: (Color green alpha: 0.4); size: 20) elementOn: 'BuenGiorno'.

"Adicionamos los elementos a la vista"
vista add: e1; add: e2; add: e3; add: e4.

"Decimos que los elementos antes definidos se podrán arrastrar"
e1 @ RTDraggable @ RTLabeled.
e2 @ RTDraggable @ RTLabeled.
e3 @ RTDraggable @ RTLabeled.
e4 @ RTDraggable @ RTLabeled.


"Decimos qué propiedades va a tener la línea que los conecta los elementos"
line := RTArrowedLine new color: Color red.
line withOffsetIfMultiple.

"Decimos de dónde a dónde van las líneas que unen los elementos en la vista"
vista add: (line edgeFrom: e1 to: e2).
vista add: (line edgeFrom: e2 to: e1).
vista add: (line edgeFrom: e1 to: e2).
vista add: (line edgeFrom: e2 to: e2).
vista add: (line edgeFrom: e3 to: e4).


"Decimos que dispocisión van a tener los elementos en la vista. 
En este caso se van a disponer de manera circular"
RTCircleLayout on: (Array with: e1 with: e2 with: e3 with: e4 ).

"Abrimos la vista"
vista canvas.

^ vista
]

{ #category : #icons }
RTRoassalExample >> exampleLabellingNodesIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAADX0lEQVR4XuXaW0sbQRjGcT+q
X8AboXjhByioeKtXDaUgXil4IUIEY42IRBM8RGMUNWliJFJajaI5PXbegdWNVKypp+T/LMuy
2exC5sfszjubnttbfj5SevhNwAfhhw/CB+GHD8IH4YcPwgfhhw/CB+GHD8IPH4QPwg8fhA/C
Dx+ED8IPH4QPwg8fhB8+CB+EHz4IH4QfPggfhB8+CB+EHz4IP3wQPgg/fBA+CD98ED4IP3wQ
Pgg/fJBnZ2trS2dnZ/rbsUKhoHK5rGKxKD7IGyUajSqZTCqRSGhpaUmZTEarq6t+jcVi/vPN
zU2Ptr6+LoudZ8d2dnbEB3nhWCOXSiVls1m/TaVSOj099b3C9nd3d/2+fS98XrPZVDqd5oO8
ZfLKK+GWulv4t6x3zp72NB5a+CDvnFnNtoCU3cIH4fcQPkjLM+TbZ/4z5KPEFSDSwID4heEL
x2qL4+NjnZ+f6+TkxA9jbUhrtUelUlE+n9fl5aWWl5d1c3Ojw8ND/XBrcXpaurh4FCQY8tr3
rU6xmmRtbU18kCdihZ4h7O/v31XcV1dXHska8eDgwH9mx46OjjQ5MaHs5KSv0J+69sLCgsew
9WGdwgd5JI1GQ+FtrVaTrcF+y23KsrGhubk5X6H/y/XtWlYk2rZer/N7SNvPCGVc68/Ktnef
tVF5x+OS6yh2d+P3kPYxcg5iPLS6/e3tZzfo1JQ7e/x+5YO0DZJoBfk131ZjhjH4IP8FUn/Q
Q55/73czj0p/WdH0p7jHmJnhg7wATHvTIYahlRVpdFTX13LDZ4lfh7wXYgjDjaXlXpxIg4N8
kNeI1SU2HLZ3I0HRmMvlFLxV/O1qmsr8vJojI/cjMzdMlqtd+CCvEKsnIpGIf2sYFI2G8dNV
41+HhvR9eFil0HSKYfCnTt4g1Wr1rqHtVW7VYchNpTQe9IxO+C1d9QyRFRpjY1Jvr9TXJy0u
qpMwugpEVoIHBUZ/v1QodBxGd4HEYq1Vn41t3Qxxp/2O7gGxyakAw1V9nfo7+P9c5IPwwwfh
g/DDB+GD8MMH4YPwwwfhg/DDB+GHD8IH4YcPwgfhhw/CB+GHD8IH4YcPwg8fhA/CDx+ED8IP
H4QPwg8fhA/CDx+EHz4IH4QfPggfhB8+CB+EHz4IH4SfD5A/mYBKdt936qgAAAAASUVORK5C
YII='
]

{ #category : #sources }
RTRoassalExample >> exampleLabels [

| v es |
v := RTView new.
v @ RTDraggableView.
es := (RTEllipse new size: #numberOfMethods) elementsOn: RTObject withAllSubclasses.
v addAll: es.

es @ RTPopup @ RTLabeled @ RTDraggable.
RTFlowLayout new maxWidth: 900; gapSize: 50; on: es.


	^ v
]

{ #category : #icons }
RTRoassalExample >> exampleLabelsIcon [
	^ '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
RK5CYII='
]

{ #category : #sources }
RTRoassalExample >> exampleLazyFormLoading [
	"
	self new exampleLazyFormLoading
	"
"This example shows how to do lazy form loading. It is used to make Roassal use OpenStreetMap by loading tiles"

| forms v emptyForm s elements visibleInteraction |

forms := TRPlatform current colorFormClass allInstances select: [:f | f extent = (16 @ 16) ].

v := RTView new.
v @ RTDraggableView.

"We first create elements on an empty form"
emptyForm := TRPlatform current colorFormClass extent: 16 @ 16 depth: 32.
emptyForm fillColor: Color blue.
s := RTBitmap new
			form: emptyForm.
elements := s elementsOn: (1 to: forms size).

"We add all the elements to the view"
v addAll: elements.

"We define an interaction to capture the exact moment an element is visible or invisible"
visibleInteraction := RTVisible new.
visibleInteraction
	visibleBlock: [ :el | 
		Transcript show: 'refresh'; cr.
		el trachelShape form: (forms at: el model).
		el signalUpdate ].
elements @ visibleInteraction.
"We do the layout with a gap, for the purpose of the demo"
RTGridLayout new gapSize: 90; on: elements.

"To make sure if we drag and drop a form, the view get translated"
elements @ RTEventForwarder.


	^ v
]

{ #category : #icons }
RTRoassalExample >> exampleLazyFormLoadingIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAADI0lEQVR4XuXc30tTYRzHca/6
T/oTugmioDtvErqrLgJBCrqOCiq0MuwXmJUkGok/oUCl6XRuTedJmdqmc5ubbnNT25xTR4M0
UPaJuoguu3iio+83jHP35TnPazvPzWEVEj87VcHfAj4IPz4IH4QfH4QPwo8Pwgfhxwfhg/Dj
g/Djg/BB+PFB+CD8+CB8kL8rNnTf+OKS44+0s2IZm+fxDOlb8o2CkwNG1zlttehdZ5N9QApx
h4qOShUyC8ZuMjpQo4PtYW0Em8zt3KZXHZ6o/OmiltN5Y2NnAkE1DvVofT1tD5B8fEQqBVTa
TBv95uWXJv7JYyEUiRqdl9stq67NxT9D+GcIPz4IH4QfH4QfH4QPwo8Pwgfhxwfhg/Djg/BB
+PFB+PFB+CD8+CB8EH52ADn9ZFx1z1t/XU3lT0e1Gu7RTGTd6A0HZzqUW08amzc3O6jaVy26
XX9P87Mf7AHyE+PY8ZNGN67d16yY+5paHXPGZi4nltTr6lNhLWxspvXJrcfXr6rFGZJlue3z
C/nzaqKxcFDJQJd8n82+OFHfMaitvbKxeU6PpXw8pXAkKqfb4p8h/DOEHx+ED8KPD8KPD8IH
4ccH4YPw44PwQfjxQfgg/Pgg/PggfBB+fBA+CL//DfJ1zFJy+4tGol7jC9xKLBub5fH51d/d
oGAgZGxmJptVuXyg/YN9+4DsOEcVy2fkCI0au9GXLo8WVtOa6HtmTrc4ralJh7IbIWP/5OCe
mlNi0VIiGbcPyPk775VNWMqO3zS2d9bHNlnBmEr75l5ImF/MaXGtJH8kZ2zm1HxKt154dKNx
+GifIV7X29+fw1Bnv0/BcIJ/qPMPdX58ED4IPz4IPz4IH4QfH4QPwo8Pwgfhxwfhg/Djg/Dj
g/BB+PFB+CD8jiJIcWpae13dKjQ1G5vpcLtV9WBYF556ja41U3NFK9WXtbuRswdIe+eEzlY+
NHqT39Oryl+sVq62wdjMMZ9Xl+726kT1a6NrTZ06p9SZKu1l8/xHFv+RxY8Pwgfhxwfhxwfh
g/Djg/BB+PFB+CD8+CB8EH58EH58ED4IPz7I4eoHSM9N3guI5iUAAAAASUVORK5CYII='
]

{ #category : #sources }
RTRoassalExample >> exampleLinkingObjects [
	| associations v labels |
	associations := OrderedCollection new.
	associations
		add: 'bonjour' -> 'hello';
		add: 'homme' -> 'man';
		add: 'femme' -> 'women';
		add: 'hello' -> 'goodbye';
		add: 'people' -> 'homme';
		add: 'people' -> 'women'.

	"We create the nodes"
	v := RTView new.
	v @ RTDraggableView.
	labels := Set new.
	associations
		do: [ :assoc | 
			labels
				add: assoc key;
				add: assoc value ].
	labels
		do:
			[ :aLabel | 
			| n |
			n := v elementFromModel: aLabel.
			n
				ifNil:
					[ 
					n := RTBox new + RTLabel elementOn: aLabel.
					n @ RTDraggable ].
			v add: n ].

	"We add the links"
	RTEdgeBuilder new
		view: v;
		objects: associations;
		shape: (RTLine new color: (Color blue alpha: 0.4));
		connectFrom: #key to: #value.


	"We do a layout"
	RTForceBasedLayout new
		charge: -500;
		on: v elements.
	^ v
]

{ #category : #icons }
RTRoassalExample >> exampleLinkingObjectsIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAEl0lEQVR4XuWb2y9jURSH/XFe
PXrAQ0UmPHjoqJgIIxWRIC4JIploXBqXMm0xTFJSSpEIEYJoRlQMKlqXMGlaNdhrztqmTVXH
PPWcw+9LVtJzeOn52HuttdfJIsJHT2ThPwJ8IfjgC8EXgg++EHwh+OALwReCD74QfCH44AvB
B18IvhB88IXgC8EHXwi+EHzwheALwQdfCD74QvCF4IMvBF8IPvhC8IXggy/kf9ze3tL19XXa
wBeiAaFQiJaWlmhlZYUODw+fBb4QDfB4PAkBbreXcnI+UFNTE3V3d+ML0QKfz5cQsr6+TmNj
Y/T164oSy/hCtCASiYiLi4u0cXwsZOAL0RE2m03ZX45lpO4xyXF1dSXwhaiAwWAgq9VKnZ2d
tLZ2RA0NA2SxWGhkZISam5uprq6OBgYGyOVyibu7O4EvJMMYjUYpYHFxkerr62lnZ4eqq7/I
+xy1tbXU399PhYWFQsnW8IVkmviSlLz5c8zOBp5dK+kz/pKlBvf39+JfEQr9Tnx+eHjAF6I1
igNFij6zMDghsVhMcJycxEQk8vQ5XeALUXlv4djcPHqRBsf3HHwhKtHa2koFBQXkdDqVDX5W
ybZsNDg4SOXl5bIvxtmYw+HAF6IWNTU1VFJSQo2NjTQ/P0/Dw8NUXPyZ6xGZInOPjO/hC1GJ
oaGhF8uU0/ldWap+6qJjjH9A9Zfzc31kXfhCktjb014KvpAUzs60lYIvRCEYDIp4bG+HRPJ1
coTDYYEvROXahMPl8tPy8rLMupLvq3Fejy9EgWuSlpYWys3NlW157gYXFZllCsyd4o6ODpku
syB8ISrAx7+jo6NSQG9vrzzcslq/0dbWFo2Pj9P+/r4sIvkaX4gKpBsl8vl+idR7PHqEL0RD
lB6jwM+ydMTBAb4Q+EIRX0gSj4+PIhqNJiIcjj67jkcmz0uy1N4s9TyPyw96ZmbmWe3h9Z68
qFMCgcDbFMLpZOqXSddt1cs8LgupqKiQ5yF8PpKdnU15eSXye5hMJlmTcOo7MTHxNoVUVVXJ
cRvO8bm44oKrtPQjVVZWykKM56Kmpqb4C+pGCIvg85D4qBAPdCf/YXFdYrfb36YQHkrjU7i5
uTmanp6WD99o7KTJyUn5M47V1VVd/Ye8NuX45pesy8tLkRoWi02ku4+fUmiYZfEYDv6j15EQ
nw9fiK6EKMcK+EK0FnJzcyPiM09ud0C+7cShx1cCYIS0tbXJiXO73ZGYQueU2Ov14gvRQggP
ofFM1FOe30D5+Sb5TmB7ezu+EC2EpMvpPZ4T/CVL6009FZ70UHp2+FJIR93eSESIYBBfiuZC
uNObuoTFP/O7gKlL3Huv6jUXwu+Yc8ubm3accfX19dHCwg8yGD5RWVmZ7LzyfW5AcqcYX0iG
4UYjT56bzWb5qgBnYD09PVIQC+Hm5O7uLnV1dcnfOT09xReSSVgG1yavdVc3NjbI7/fjL1n4
4AvBF4L/CPCF4IMvBF8IPvhC8IXggy8EXwg++ELwheCDLwQffCH4QvDBF4IvBB98IfhC8MEX
gi8EH3wh+OALwReCD74QfCH44At5z/wBWVep7TxiFq0AAAAASUVORK5CYII='
]

{ #category : #sources }
RTRoassalExample >> exampleMakingVisualizationFit [
	| view |
	view := RTView new.
	view
		addAll:
			(RTBox elementsOn: Collection withAllSubclasses) @ RTDraggable.
	RTEdgeBuilder new
		view: view;
		objects: Collection withAllSubclasses;
		connectFrom: #superclass to: #yourself.
	RTTreeLayout on: view elements edges: view edges.
	view @ RTDraggableView.
	view edges do: [ :e | e trachelShape pushBack ].
	(RTGroup withAll: view elements) translateTo: 0 @ 0.

	"Removing this line will make the visualization larger than the window"
	view canvas camera focusOnCenterScaled: 500 @ 500.
	^ view
]

{ #category : #icons }
RTRoassalExample >> exampleMakingVisualizationFitIcon [
	^ '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'
]

{ #category : #sources }
RTRoassalExample >> exampleMenu [

| classes v n shape es |
classes := RTObject withAllSubclasses.
v := RTView new.
v @ RTDraggableView.
n := RTMultiLinearColorForIdentity new objects: classes.
shape := RTEllipse new size: #numberOfMethods; color: n.
es := shape elementsOn: classes.
es @ (RTMenuActivable new action: #inspect; item: 'browse class' action: [ :e | e model browse ]).
v addAll: es.
RTFlowLayout on: es.
^ v
]

{ #category : #icons }
RTRoassalExample >> exampleMenuIcon [
	^ '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
dTJs+3921Y0yRVF0kwAAAABJRU5ErkJggg=='
]

{ #category : #sources }
RTRoassalExample >> exampleMetricNormalizer [
| v es |
v := RTView new.

es := RTEllipse elementsOn: RTObject withAllSubclasses.
es @ RTPopup.
v addAll: es.

RTMetricNormalizer new
	elements: es;
	normalizeColor: #numberOfLinesOfCode;
	alphaColor: 0.4;
	normalizeSize: #numberOfMethods min: 5 max: 15;
	normalizeX: #numberOfMethods min: 0 max: 300;
	normalizeY: #numberOfVariables min: 0 max: 300.

	^ v
]

{ #category : #sources }
RTRoassalExample >> exampleMetricNormalizer2 [

| v es |
v := RTView new.

es := RTEllipse new color: Color blue; elementsOn: (Collection withAllSubclasses).
es @ RTPopup.
v addAll: es.
RTMetricNormalizer new
	elements: es;
	alphaColor: 0.3;
	normalizeSize: #numberOfVariables min: 5 max: 20;
	normalizePosition: [ :aClass | aClass numberOfLinesOfCode @ aClass numberOfMethods ] min: 0 @ 0  max: 300 @ -300.

	^ v
]

{ #category : #icons }
RTRoassalExample >> exampleMetricNormalizer2Icon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABeCAYAAADVA7GfAAACnUlEQVR4XuXcSyt1URyA8eMy
lJm5r2BqwMhMJjLyAZSBKRNjU0ouKQaUAQYMRCkTYiIjUSi55BYmpFweb//W4JR6Ry97n/0+
T606J7P1a6299znLKX19+aukSv4p8IP484P4Qfz5Qfwg/vwgfhB/fhA/iD8/iD8/iB/Enx/E
D+Iv+vgAP0gFdXDgB/FvWf78IH4Qf34Qf34QP4g/P4gfxJ8fxA/izw/iB/HnB/HnB/GD+POD
fOvkBF5ff+6LJD/IP1YEDP+W5Qf5/S4vi7E1aUDu7uDz0w/izw/iB/HnB/GD+PODZNPLC+zv
+5/U/flB/CD+/CB+EH9+ED+IPz+IPz+IH8SfH8QP4s8P4gfx5wfxg/jzg/jLDyS+tbu4KO6Z
qf8OZGUFFhfh6sqPUjEgIyOwtgbX136UXEDiWOfxcZr8OHcbBw0CJoZ/+nMAiYPP3097xPut
LdjchLk5ODz042S6ZZ2eQox4HRf1hYW0Qvr70xa2upr+Fhd9P8gvFpO/t1feomJMTsLgYHo9
OwvT03B7myCKcG6qsCDLyzA1BcPDZYy4w1paKoPEODryI2QKMjQEo6MwPg5nZ3B+DnFxDwj/
7W/GW9bGBszPQ18fdHcnnJsbP0LmIG9vaUV0dEBbG7S2QktL2qr8W1TGIA8PsL2dMJqaEkRP
D/T2wswMvL9D/M7tT/74sB/kLz09pZXR3Az19dDQkFDiTsr/MJgDSPzDZayIqiqorU0onZ2w
u5u2Kv/HJRmDTExATQ2USlBXl1ZHfG7ln+acQNrbE0aMxkYYG4PHRz9IbiADA1BdDV1d6Sn8
/t6PkStIAKyvw84OPD/7MSruwdCfH8QP4s8P4gfx5wfxg/jzg/jzg/hB/PlB/CD+/CB+EH9+
EGd/ACi98fSb7A31AAAAAElFTkSuQmCC'
]

{ #category : #icons }
RTRoassalExample >> exampleMetricNormalizerIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAADQ0lEQVR4XuXcbUuaYRjG8b5y
HyAc9aoFgdiLoBas9SC55osg2ohYjKLSIJNasZ6gNEer1O5yVh7tOm9SGuyBJPO2/wEXdyJC
XL/u83q4L2u7u+MnSGnjdwEfhB8+CB+EHz4IH4QfPggfhB8+CB+EHz4IP3wQPgg/fBA+CD98
ED4IP3wQPgg/fBB+WgtEt7fyZmZUz2e92VkVRkdV8TyhQaamphQKhfSqo0NvBwY06zr03eBg
fZ3qPvu9vV3lo6NHf74wMiJrP1Mp8e+QJ0z58LCuDi1vb+tqcVH8ksVPsEAKhYLGx8bU09Oj
97GY7HV0eFjp9fVa43f5M4LIJZPJKJFI6Pj42F7q29aWisVirfG7nF+y+CD/S6VS0c3NjezK
J2gwSDweV1dnp153dysSDivixpNxG0fcFPTHyYkPsLezoy/z89rd3eWD8EsWH4SfZoO8cav0
2MSEJqJR9ff1aXhoyC9Z5XJZq0tLfpk62NvTwf6+ttNpv/EpGgiy48aIXC6nI7ftYRBbm5u1
8SN7vxVSdGsUmwYXzs78xqfglyw+SDWlUknVlT2f4BlBbBsl3Nurj9PT6o9E9MldDSO5suJf
426cqeLwwy9ZfBB+mgjiXVwo4UrTqttoTK2tyWZXV5eXslU6v9v5IHyQlx7PPa/PuD+y6+tr
tTyIrdhbHcPu/mprCZBsNitrn+fmFJ+c/O2Xtmlv1j3IalUQuzMegnhPeLqFX7LqiJWpKsZq
Min+GBKg0vUiBvWz01NZs5/z5+f66jYf+bxBAtnY4IPwSxYfhJ8ggDw83GCxLfcPsZi/Yl9a
WPB3fvkMTb5D7GmhfxTITR/z+TwfhF+ygCAXbnPRNhj/9J4dbvjXsdKUHUWt42sIfJBGgbjV
Lx+EHz4IP00CeTi1rR5y4Hd9gO4Q/kkTfsnig/wtWejsKZAg9ug2ubzMB+GXLD4IP3wQPgg/
fBA+SMOmvvzpb0BA/O8ZuqmvtVY/wcgvWXwQfvggfBB++CD88EH4IPzwQfgg/LyQlfr9fwTi
JyB3CH8fi1+y+CD88EH4IPzwQfgg/PBB+CD88EH44YPwQfjhg/BB+OGD8EH44YPwQfjhg/DD
B+GD8PPY/AJeDlpBtqIlvwAAAABJRU5ErkJggg=='
]

{ #category : #sources }
RTRoassalExample >> exampleMidPointCenterUsingBezier [

| v es startingElement shape |
v := RTView new.

es := (RTEllipse new color: (Color blue alpha: 0.4); size: 15) elementsOn: (1 to: 20).
v addAll: es.
es @ RTDraggable.

"we are properly locating the nodes"
startingElement :=  (RTEllipse new color: (Color red alpha: 0.4); size: 20) element.
v add:  startingElement.
startingElement @ RTDraggable.

RTCircleLayout new initialRadius: 80; on: es.
es translateTo: 0 @ 0.

startingElement translateBy: -150 @ 0.

"Building the bezier lines"
shape := RTBezierLine new
				midPointInCenterOfObjects: (1 to: 20) inView: v.
v addAll: (shape edgesFrom: startingElement toAll: es).		


	^ v
]

{ #category : #icons }
RTRoassalExample >> exampleMidPointCenterUsingBezierIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABjCAYAAABt56XsAAAHeklEQVR4XuWaaUxUVxTHHyAM
yyDUYR2QRQRhlG1mZGAQGJYWhh0GZVFhxDCKbRmh1hbXIKZWC0kjtR9MTAyJSROjsXYx9nPT
pBhr08TEJsZvTT80/dwmTZrev4/beYwjIGoX/r/wct9yl+Gee8+559yr8MMPP/zwww8//PDD
Dz/88MMPP/zwww8//PDDDz/88MMPP/zwww8//PDDDz/88MMPP/zwww8//PDDDz/88MPPf5vw
cEWxWNSUn3+Y5GRFaWpSlJQU37uhIUXxeNRUkpqq5kN+fl4i6Hh5qWRkHD6anX3k5EKBPJmP
nxeC0agoubm+544Oi+XUWUXZvRtPBoMhvrDQVumvsjo7z19ShdHe7iuLelAfPyskPt43youK
8Gb79u17FCUmBvcRERGRFovFri2h0+nCt2zZYlGf1HwqKC/rQr38rIDExPj40UOhocMHFMVk
SkxM/Ht05+XlFQpKtLnz8/Ot2dnZpkA1bd3a76moOPOhKpCEBP6+XSHt7UOjimI2R0dHx5jN
5jLVXKdm5uTkbJF5ggSbN28uDlR+27Ztr1ZVVTWoT2bzQvXHzzKwWtVR7HCgo9PS0jbgbW1t
bQvS2NhYQ3p6epbMXVxcXJabm5vvXwuE4BNEIBwOtR2Lhb/Pl1hFrV07chBpWVlZNd4kJCQk
S/uQkpKSrlFRFn8VBSHY7fbapVqpqzv3kU4HVci/CluC4uKamnMzilJZabVay5OSklKFkTZj
tmRmZuZobEiBn2qqE7OldLGanU6na42gtbW1F/VrFwv8LILo+GwYbdxv2rQpPzg4OESkj20G
VlV4J/PabLYqzBKRJzhQXc3Nzd34pgqBn2cgKwvdbTAYU/GETm5ra+sTNiRL8NgQY6bgGfdY
YUGVRUVFRfvXJDsfwli63bAw1Y5s2MAvgwAeuNN55jwEUFFR8VpRUZENM6K0tNSBmYBcuBfO
YAKuQEJobGzc/mztOp38Hv1TBFJaenqqo+PEuZ07d+5PTk5Ora6ubiooKNiKrzU1Nc2wKbAl
soSYQTuRtrS09CynBcwo1B0XF5co7VB399H3dboDr/MLJECI5MiRyzcxwsfGxk6Jzt8mR31d
XV0rUggnIyMjG7NDzphAYGZ1dnbuDg0NDZPlF18CQ2Wt0pBK3OO/5RMSErJmeHj43WvXrn0z
Ojo6MT09PQsjDvuxY8eOQYxqvV4f7XK5BrTlEDbp6upyS8EIW6Lv7e31SHtDT6z4G1SUQShj
Ec1rXywvnLyRkZETk5OTH09NTV2+fv3Tb69c+eyOwWDKx6ju6+vb19TUtGPPnj1eqK3w8PAI
NbIVnwSVU15eXgdBvrhfjxA9ZskqCtWL/8YCYZy22aZmvd6bx7zeKa/Xe1JeGP337t379dGj
R38+fPjwj7m5uZ+RzszMfDIz88Xc7dtzP92//+PvV69e/Xp8fPyctuzLv2Zv2mynpxaG7//n
5Ik/zQaER68oeu13+AIY8eiAW7du/XD37t1fHjx48BuctQsXvrxz8eJX37vdUxdFTMosVNRa
h8PRuHfv3jERFil4+b++p0f92T09q0ptCW8tv15R6oUjkbqc/OvXr8+E/Zidnb1948bn30GV
QVUJtTQsPPQU2ITIyEi9JlRihVBRDn7Irl27hiG8F/Pr+UPyCxCdP3T27NlLDQ0NLrEqasHK
SC5njUZjmrAljTD0MTExrwQqL+JeNXAERfBxXX9//xsQGn+vPp8VspSXv33i+PGJ8xAGBIBL
bkJhGSxz4h6rqcrKyvqlasVmFTa1ICgsCISg/DzydeuwC6mG5vmZB86ex5OXd+xUevqBEXQc
nD4EC0tKSirgnUvnUIbhNc6eEapsuc6hNjjZ3d29Ny5uaL/JdHxStSE+p5Of+ZMjbW0T09gD
EbuDKRjdAwMDb86HTKrxbr4zC7H0fcIHEh44ZpNYKHQtv127/ckTK/zMExrq6yZ7LTxzhMsR
MsE77IdoVRdmxtM8dghHlLcuTzi+dvkJGO7rGkAIXgYTkWqXv9j70OZHnkAzRhvDMplMxTIE
s9B+8LMEnZ1paYePKEp/P1ZbMjaFVLsBha1b/w0pCEUK8GlgOY39d4dj4gNVVcGg87MIvgNu
wjl0SvWDWBXu4af4lgJBQTD6/jVAME879BCoHf4+VxYfw8K3rJdHRWWUVms73G73iLaE8F06
A9WEssKHWR+4HdSPdtAeP8umtnb4LbXjgoKk6gKDg4MHtflwREhu+/ojlssiQBkRqdZTVcXf
qyuPkOX51IrFAudOK5SOjo7d2txhYWE6/8Nzvm8lNqPx0DtqXaiXnxWg1/tOtquhcYTotRtK
Wpvi8/ktdoMhv0jNJ1USykt/IyqKv2+fC+2JErcbHr3WGJeXN7lgSXA0Qr4rLDz53saN4yeR
P3A9/LwgXC5VGNqO9niCg/ftX7hiwnc8Iz8/LxF5bGetJuze3Kx2PlIJviMfvxf+L8G/n8EP
P/zwww8//PDDDz/88MMPP/zwww8//PDDDz/88MMPP/zwww8//PDDDz/88MMPP/zwww8//PDD
Dz/8rFr+AnBX68ww1MTcAAAAAElFTkSuQmCC'
]

{ #category : #sources }
RTRoassalExample >> exampleMovingCamera [
	
	| v menu |
	v := RTView new.
	v add: (RTEllipse new size: 50) element.

	menu := RTMenuBuilder new view: v.
	menu menu: '<-' callback: [ v canvas camera translateBy: -10 @ 0. v signalUpdate ].
	menu menu: '->' callback: [ v canvas camera translateBy: 10 @ 0. v signalUpdate ].
	menu menu: 'V' callback: [ v canvas camera translateBy: 0 @ 10. v signalUpdate ].
	menu menu: '^' callback: [ v canvas camera translateBy: 0 @ -10. v signalUpdate ].
	 

	^ v
]

{ #category : #icons }
RTRoassalExample >> exampleMovingCameraIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABjCAYAAABt56XsAAABj0lEQVR4XuXVIU+CURgFYJOF
TzY3JsFNNzc3i2wEA6MatJMcweAcFIk6ihuFgNViwPEfDCT+AM0RIJGtGrTpNbB9YwiFfeCe
ZzvhvvGccDd8Pt8S7YdEU7c9v5blu55xOww5mrqVQyqx907IuV/fcl2EXIUcxG7bIYWQs5B0
7H4ccuNX5vP5fD6fz+fz+Xw+n8/n8/l8Pp/P5/P5fD6fz+fz+Xw+n8/n8/l8Pp/P5/P5fD6f
z+fz+Xy+/yybze7mcrkTv4kVq1Qqt/1+/208Hn9PUq/XH6IoSvvtJKzRaDzGh4in1+uNNgO/
pYTk8/nCX2NM0ul0un5TCWm1Ws+LBvmN31RCBoPBuz/IGul2u6/+IGukWq3eLRpjOBx++k0l
aDQafc0bpFgsnvotJSiTyWTDX/Ixa4xSqXTpN7Qi5XK52mw2n9rt9kutVrtPpVJbfis+n8/n
8/l8Pp/P5/P5fD6fz+fz+Xw+n8/n8/l8Pp/P5/P5fD6fz+fz+Xw+n8/n8/l8Pp/P5/P5fD6f
zzffDyz/G9+Gw2cAAAAAAElFTkSuQmCC'
]

{ #category : #sources }
RTRoassalExample >> exampleMovingEdges [

| v edges es |
v := RTView new.
edges := OrderedCollection new.

es := RTBox elementsOn: (1 to: 300).
RTGridLayout new gapSize: 30; on: es.

es do: [ :e |
	| te |
	te := RTBox element.
	te translateTo: e position + (0 @ 10).
	edges add: ((RTArrowedLine new color: Color black) edgeFrom: e to: te).
].

v addAll: edges.

v when: TRMouseMove do: [ :evt |  
	edges do: [ :edge |
		edge to translateTo: (evt position - edge from position) / 10 + edge from position.
	].
	v signalUpdate.
].

	^ v
]

{ #category : #icons }
RTRoassalExample >> exampleMovingEdgesIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABeCAYAAADVA7GfAAAUlUlEQVR4XuXd1a5uRbMG4Hkh
3ACcwDEh4RI4AYIeQIDgEIK7u7u7u7u7u7u7u47172fs1EyvmtUfPwvZrD06+TLXGj3aqqq7
3n5bxtyiRYuHL774YljUCQ8++GA37r777uvGffLJJ924H374oRt37733duPeeuutbtyrr746
/Pjjj2X8L7/8Msxqx0MPPdSNe/TRR7txn376aTfuuuuu+6/lNvffFvjKK68M3333XRn/7LPP
DkIV98033wzSVnEff/zx0BP6448/3hXcAw880I177733ho8++mjoCfT+++8v4+6+++5u3Btv
vDG8/PLLZdytt946EOpvv/02VIroGerTTz895kk+XYXMspzHHnts6Fl4ryEq88gjj5RxKkOw
VdxLL700vPjii0Ov1+gBPaEyjvycsKTROypjevvtt4fvv/9+qMq65557SkO88847h55MKKIn
E4og56xA/1fWXCvwSstff/318PDDDy94/vPPP4/PzjvvvLLg999/f2aP6gmVIqru/9NPPw0n
nnhiN03PEjW+p3j10BMXFcO2Xlalk+bdd98t26YeVX5GD8p98sknF8S9/vrrgyH9+uuvH+Z7
yJdffjk89dRTpTUfeeSR5fPzzz9/MDxUDSW8atx87bXXBsOGsnKcOoiTNguAIii4ssQnnnhi
wbBHObfccss4VGZfcvnll4/Wm4dnCiBkcXpa9g/e97c1pBB+pQgjgNHj+eefH6655pr5uOg5
OgBFUEjbI0eFXHHFFcM+++xTCnfZZZctLUWXvfjii0sfsPzyyw/GXb2rfb7ffvsNBx988IKe
aChZZpllBgrLee2+++7DQQcdNHzwwQdDtjp1ZjDVuH7ppZcu6DUMgSBOPfXUBWkOPPDA4bbb
bltQN8Z45plnlj3wnHPOGW644Yah6pWM4fbbbx8yECE38szlXH311aNBzMWw1PMdLHfRHww9
pxrDXIV8qvE9HGovTS+/ngOeBUwoq0J8hPjcc88NWQ7KN+b75V6txxBwHlnkY2Q54IADFpRz
ySWXDIcddtgw90cE3YOSvxe3pGGWofyZ8NVXX/2lBvh7YRbszz1lMYWEY6kCS+hZcQ9RCMbQ
XoU4uR6yMxRK2yuv58RZZYW0Ypi94447us7fUNeLg/yquJtuumnozV0MgXpKD4Eqb6ZCqvGw
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'
]

{ #category : #sources }
RTRoassalExample >> exampleMovingGrid [
	| v es size initialLayout layout step |
	v := RTView new.
	v @ RTDraggableView.
	size := 10.
	es := (RTEllipse new
		size: 20;
		color: (Color red alpha: 0.4)) elementsOn: (1 to: size * size).
	v addAll: es.
	es @ RTDraggable @ RTPopup.
	"es when: TRMouseEnter do: [ :evt | evt element translateBy: (20 atRandom @ 20 atRandom) - (10 @ 10) ]."
	RTEdgeBuilder new
		view: v;
		elements: es;
		connectFrom: #yourself
			toAll:
				[ :value | 
			value \\ size = 0
				ifTrue: [ Array with: value + size ]
				ifFalse: [ Array with: value + 1 with: value + size ] ].
	initialLayout := RTGridLayout new
		lineItemsCount: size;
		on: es.
	layout := RTForceBasedLayout new initialLayout: initialLayout.
	step := RTForceLayoutStepping new
		view: v;
		layout: layout.
	v addAnimation: step.
	^ v
]

{ #category : #icons }
RTRoassalExample >> exampleMovingGridIcon [
	^ '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
foMMNP4E5gU0YnvlseEAAAAASUVORK5CYII='
]

{ #category : #sources }
RTRoassalExample >> exampleNamedPopup [

| v es |
v := RTView new.

es := RTLabel elementsOn: (1 to: 10).

v addAll: es.

es @ (RTPopup new 
	named: #yourself
	background: Color blue
	group: [ :group :el |  
 
		group addAll: (RTEllipse elementsOn: (1 to: el model)).
		RTWeightedCircleLayout new
			initialRadius: 50;
			on: group.
		]).

RTHorizontalLineLayout on: es.

	^ v
]

{ #category : #icons }
RTRoassalExample >> exampleNamedPopupIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABeCAYAAADVA7GfAAAB4UlEQVR4XuXVu4oiQRSA4Xlk
IwMTcx/AVF/B1MBLoHiJVAwEUQRBDARFBDU47tTCFt0PsMPA94Pgae0W6+uivz4fv9/Ul78E
PoifD+KD+PkgPoifD+KD+PkgPoifD+Lng/ggfj6ID+Lng/ggfj6ID+Lng/j5ID6Inw/ig/j5
ID6Inw/ig/j5IH4+iA/i54P4IH4+iA/i54P4IH4+iJ8P4oP4+SA+iJ8P4oP4+SA+yI81n8+j
OO92uxiNRvnY5XKJ6XRa+s54PM7zer2O8/mc5+PxGJvNJs+32y0Gg0Hp/MlkkufX6xWdTqf0
eavVisViEf1+PziQ2WxW+tNpIXq9Xj52Op1KIM1mM9rtdp5Xq1XUarU81+v1T6VSKV1zOBzm
+fF4RLVazfP7/Y4EcL/f87FGoxHf10kvb4dst9t4Pp95Ma7Xa2lxDofD37u1eE5a1H/vl8tl
FHfZfr+PIkDq+07P79NvpV1U/Lzb7ZbmdEOkXVbcaf4zxH+G+Pkgfj6ID+Lng/ggfj6ID+Ln
g/ggfj6Inw/ig/j5ID6Inw/ig/j5ID6Inw/i54P4IH4+iA/i54P4IH4+iA/i54P4+SA+iJ8P
4oP4+SA+iJ8P4oP4+SB+PogP4ueD+CB+PogP4vff+wMItDGYvnMiCAAAAABJRU5ErkJggg=='
]

{ #category : #sources }
RTRoassalExample >> exampleNestingAndEdges [

| v es |
v := RTView new.
es := (RTBox new color: (Color blue alpha: 0.4)) elementsOn: (RTShape withAllSubclasses).
v addAll: es.

RTNest new
	for: es add: [ :group :model | 
		group addAll: (RTBox new elementsOn: model rtmethods).
		RTGridLayout on: group ].
	
es @ (RTShowEdge new 
			connectToAll: #dependentClasses; 
			shape: (RTLine new color: Color red);
			yourself).
es @ (RTShowLabel new 
			color: Color red;
			highlight: #dependentClasses; top; yourself).
RTGridLayout on: es.

	^ v
]

{ #category : #icons }
RTRoassalExample >> exampleNestingAndEdgesIcon [
	^ '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'
]

{ #category : #sources }
RTRoassalExample >> exampleOrthoHorizontalLines [
| v eb |
v := RTView new.
v addAll: (RTBox elementsOn: Collection withAllSubclasses).

eb := RTEdgeBuilder new.
eb shape orthoHorizontalLine.
eb view: v.
eb	
	objects: Collection withAllSubclasses;
	connectFrom: #superclass
	to: #yourself;
	build.

v elements @ RTDraggable @ RTPopup.
RTHorizontalTreeLayout on: v elements.

	^ v
]

{ #category : #icons }
RTRoassalExample >> exampleOrthoHorizontalLinesIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAC+0lEQVR4XuXdW2sCMRCGYf//
n/RORfEsHmG3pLBlG9PdtNrkm3kDgsjWiz7OJpNMspO21WuHw6HJuW6z2Txddz6fm8vl8vma
Tqft8Xhsdrvd13Xb7bZVbpPWGUiqXa/XJkCFV0Dig7wB5HQ6ffvlB4zZbDb4y1ePBtMg4ded
+IfzQdRA+lHjobmJEC/NNEgYPfUjpHtvOWrMR0g3erLYX7gD6V/HBxEACUlfP7/o3lvJOdyB
pD4bG/byM/XCIP3P+CACIOE2xh9lCYHkzoPxQQqBxLkJH6QyiPXcRBJkv98/zewul8u3TDjy
Qf7Q+gtKXftpMWooQvi3rMIgj8fjKZLm8zk/QmqBjP0tH0QEhD/KEgLh5yHCIN0tK16P54MU
BEnNZQWQfm4Szwor9TWuQVJNfcLRHYilGizXIPwVQ7FMnQ9SAaQ/UgrzXev1ml+XVQskVYM1
1oHzQQqDxHNZ/LqsyiD3+51fl6V6y+KDCICEaRLLOYdLEH6ECIFYX/twB8LfHyIIws9DKoKk
1s/5ESIWIfw8hN+p80GGQPh5CD8P4YPwp04MgfBHWUIgHpsZEOsViS4jxFvOYRrE44jKNEi8
J50PUqClzsFKDXFzG387wpvaKxUm1nMTUyBjFSYearXMgOQ267Va7kCs12rJghByDpMRwgcR
ixDPOQc/QvggfBA3IN6q2rHDXj5IgQjhg/DzED4Iv1N30IdYP6PXJYi3SDINwi+UEwOJz2bk
gxQEifuLcM1iseDvD6kJwo8QAyD8/SFCIPxRlhiI9bOx3IFkfA8fpCRIfNZJyEv45/aK9SHW
94yYWFOPf/mv3Mb4IPw8hJ+H8EEqgfD3qYuBeKzfMgPi8VkhpkFSjX/LEgThj7KEQKw/K8Q1
yNBTD/jPDykEkvvc2/j5IXyQAiC/+G4+yH+B8NdDKoDwKxf5IHyQnFvW7Xbj7w+pCZKzHsIH
qRgh8VwWH0RwlMV/fohQHxKOa+JPLlYE4ddlVQaJT/lZrVb8E+VUI8QzyAdHik3+wPASdAAA
AABJRU5ErkJggg=='
]

{ #category : #sources }
RTRoassalExample >> exampleOrthoVerticalLines [

| v  eb |
v := RTView new.
v addAll: (RTBox elementsOn: Collection withAllSubclasses).

eb := RTEdgeBuilder new.
eb shape orthoVerticalLine.
eb view: v.
eb	
	objects: Collection withAllSubclasses;
	connectFrom: #superclass.

v elements @ RTDraggable @ RTPopup.
RTTreeLayout on: v elements.

	^ v
]

{ #category : #sources }
RTRoassalExample >> exampleOrthoVerticalLines2 [
	| v shape |
	v := RTView new.
	v
		addAll:
			((RTEllipse new
				size: 20;
				color: (Color red alpha: 0.3)) elementsOn: (1 to: 20)).
	shape := RTMultiLine new.
	shape orthoVertical.
	shape color: (Color blue alpha: 0.3).
	RTEdgeBuilder new
		view: v;
		objects: (1 to: 20);
		shape: shape;
		connectFrom: [ :n | n // 3 ] to: #yourself.
	v elements @ RTDraggable @ RTPopup.
	RTTreeLayout on: v elements.
	^ v
]

{ #category : #icons }
RTRoassalExample >> exampleOrthoVerticalLines2Icon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAACk0lEQVR4XuXYP0vkUBSH4fn+
zX6JLRa2E2HRBZnCSplCbERBReyChWihzdV740yyiWG5yTqTZJ8XLvMv50wmb2J+x8Xbm8+U
WPiHwBfi4wvxhfj4QnwhPr4QX4iPL8QX4uML8fGF+EJ8fCG+EB9fiC/ExxfiC/Hxhfj4Qnwh
Pr4QX4iPL8QX4uML8YX4+EJ8fCG+EB9fiC/ExxfiC/HxhfhCfHwhPr4QX0hvQlGEcHAQwslJ
SOz8+5+eQlguP9bzc/CF7O2Fap2e7l7I/n79/fG5LyQeiNW35ccBiVfKqCdEXL6Q4+NaSPzz
tfPvv7yshcTn/k09slrt/t7h39R9IeMIeXgIoe+6uupfk9bd3TCRqa7d6/q6uc7PP2+TAiFx
hQz9odus69pmVkKG5vl02hU/j3rPIeHmJhQ/fodwdtbrIKXty7rb25Dbu9yxuH/lfn5h8FhM
Mc+n7Yvvv3rNIeHxMTTqMtPRJlFVdbFPTu/yZPnjvXkIGZjnh8wh6Qxu1F1c5NXF7Rp1HVfJ
pne1Uk36T8IWZpXFFPP80DkkHB7Wda+veUJeXmohsf5vvavfEnuXd/PN67i/fuydSJ0/h/hC
/j3P58wK7bmjaw65v/9clzO/tKNpep1T918I+ao8PzTzb7P37IS083zXHJKT57vmkLF7z05I
V55vzyG5eb49h4zde55C1nm+WvFsa88huXm+sU36fOTe8xSyzvPlWuf5rjkkJ8+nx+q99PkE
evOxV8UX4gvx8YX4Qnx8Ib4QH1+IL8THF+IL8fGF+PhCfCE+vhBfiI8vxBfi4wvxhfj4Qnx8
Ib4QH1+IL8THF+IL8fGF+EJ8fCE+vhBfiI8vxBfi4wvxhfj4QnwhPr4QH1/IxHkHjKX55SNV
WJ0AAAAASUVORK5CYII='
]

{ #category : #icons }
RTRoassalExample >> exampleOrthoVerticalLinesIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAC40lEQVR4XuWZ267CIBBF+/8/
6Zsajfeo0Yd6zpiMQULplEJF106ItUIZuoTNtM3jwVdNavi3gA+ELz4QPhC++ED4QPjiA+ED
4YsPhA+ELz4QvvhA+ED44gPhA+GLD4QPhC8+ED4QvvhA+OID4QPhiw+ED4QvPhA+EL74QPhA
+OID4YsPhA+ELz4QPhC++ED4QGrXbDbjA6lJu92u/Qkgp9OpHVMOh0MVZT6ft9vt9uvL6Bly
uVyq/WdqbG6M7rnU2MeOOdRez/GB/BqQms3031eeRWJ0jzVuPTfFmN2+Qu313Gggsu59k2nm
mNHH47HN3X6/37/PkPP53F6v18FltVq1ssOxFgForStB9hXdXGg8fTfcAkTqxMYs/frn7ve7
CdLtdnu21/ryXdqv1+vnZzO1F1j7sdzYmEeMBVJ6XKHY32YIH0hlQKYyZ2s/ffVCRm1tV8K0
h47L/9SxNFNnumpepTLvHDM9ZaOSGq9v8I1miIvFImimvml2FYupSb3NZvOqL0WO3axf+9V4
NBPXGHIsSV0mrjEsl8tXv3JejFfqabxS3KcEEqe2Cd0zbe9Lrif13d+b2BrXtc7lWkOtiVtu
j4i1ifXv17PG1xVTqD0fSK1AYplsDiPsu/7Q33MbsmX8frYdi68vMw/dk2imPuRfmWJqpbbZ
1k3DJzJ00+P3vunkHrsG7Bp/iqmVAOJvGkrALp2vDQKSusYPWVdLPOGt7VkYH8g3AQmZkG9E
KaZrfdycS6H4Sl7fWn8wkCmM6hOq+cVZFIifKeaSPM6XQgWSOv6mVPBjXpH+ApDU8fOB1AbE
alRDTWrMO+sc+vS7/tTxN3xjrczU+UD4QPjiA+EDGZWt8oHwxQfCFx8IHwhffCB8IHzxgfCB
8MUHwgfCFx8IX3wgfCB88YHwgfDFB8IHwhcfCB8IX3wgfPGB8IHwxQfCB8IXHwgfCF98IHwg
fPGB8MUHwgfCFx8IHwhffCC/qD8BcE4ipo/6xQAAAABJRU5ErkJggg=='
]

{ #category : #sources }
RTRoassalExample >> exampleParallelCoordinate [
| maxValue spaceBetweenLine lineHeight numberOfColumns numberOfLines values setOfElements v e t line|
 
"Configuration"
maxValue := 40.
spaceBetweenLine := 50.
lineHeight := 150.
numberOfColumns := 10.
numberOfLines := 100.

"Script"
values := OrderedCollection new.
numberOfLines timesRepeat: [ 
	t := OrderedCollection new.
	numberOfColumns timesRepeat: [ t add: maxValue atRandom ].
	values add: t.
	 ].

v := RTView new.
setOfElements := OrderedCollection new.
1 to: numberOfColumns do: [ :i |
	t := OrderedCollection new.
	values do: [ :setOfValues |
		e := (RTEllipse new color: (Color red alpha: 0.3)) element.
		t add: e.
		e translateTo: 
				(i * (spaceBetweenLine - 1)) @ 
					((setOfValues at: i) * lineHeight / maxValue) asFloat.
		v add: e.
	].
	setOfElements add: t.
].

2 to: numberOfColumns do: [ :column |
	t := OrderedCollection new.
	values doWithIndex: [ :setOfValues :index |
		line := (RTLine new color: (Color red alpha: 0.3)) 
			edgeFrom: ((setOfElements at: (column - 1)) at: index) to: ((setOfElements at: column) at: index).
		v add: line.
	].
	
].
^ v
]

{ #category : #icons }
RTRoassalExample >> exampleParallelCoordinateIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAASD0lEQVR4XuXbVYxtRRMFYF54
4I03CAkhQUJIcAgElwDBLQSX4O7u7u7u7u7u7u7u7l7Q3+5TI9y5d87kf/mT3snJ3LOlq2qt
VVXdffad6J9/2j/+n46J2oegfULaP9onpH1C2j/aJ6R9Qto/2iekfULaP9onpH1C2j/aJ6T9
o31C2iek/aN9QtonpP2jfULaJ6T9o31C2iek/aN9Qto/2iekfULaP9onpH1C2j/aJ6R9Qto/
2iekfULaP9onpP2jfULaJ6T9o31C2iek/aN9QtoiJC6+OGLnnSOeeiriww8jvv8+HOPcd8wx
EZddFuMbPP76K+KDDyJmmini999jQo7EF19ETDllxJtvRrz9dsSXX0b88ceIz8Qii8RogcWL
L0Y8/fTo991+e8Qzz0zYt59+ith114h33gn/nuC9W20VYhnV7q23Rv+EAOS00yI++STi77/r
5+OPIz7/POLXXyNefjni0UcjVlwxYvfdI156qX5HHAKB+emn9X5/l1oq4uGHO0fju+/qeO+9
1wXXEYa4e++NWHzxzsn45ps6Vnl2GLnO33lnxCyzRFx+ecQPPwwLCunx2WcdwB14993XPTNB
YC66KOL++4ePIwa+8ZFd462zTvXp55+rj7/8Um2U7128nuHf2WcP+iy2HKfEPCA84y288BgI
KQ7GUUdVpSJgCOPxyit1QNlz4IERhx8e8eqrEffcE901xnvqjLvvjthvv4gppojYe++IO+6I
eP75+pEJAHTvtddGvP56xNJLRzz55LggI7YE1303Hps33xxx3XXV7mOPRTzxRABpGKgIQX4R
wYgZWQiN5ZePTtWXXlrFwRagieyNN6rQjHX++TVmz/Gfv67zDyF84Mtcc9X7fFwn6sx4/oj1
lFMill12DIRw7NBDIx58MOKhh6oKbrihc25AwQDZd9+IM8+MOOmkmkHffhvx2281gzzHKY5v
skl1Qha8++4gaLLmrbfqc67NO2/EscdGvP9+tVnIHebXjTdWv+abrwKIdHYeeWQ4AASinG60
UQUBoPn5+uvqI4VffXXELrtEnHtuxF13VaCJsQDb2etlaefPcst1oA/zB9nsEUOJq4tB5ir5
niFOovzooypG97z2WnRl8tRTx0DIc89F7L9/VQMjBgAc54CI7T326NIzzjor4pZbqtI5ARzq
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'
]

{ #category : #sources }
RTRoassalExample >> examplePlacingGroups [

	| v g1 g2 |
	v := RTView new.
	g1 := RTGroup new.
	g1 addAll: (RTBox new size: 10; elementsOn:( 1 to: 200)).

	g2 := RTGroup new.
	g2 addAll: ((RTEllipse new size: 15; color: Color red )elementsOn: (RTShape withAllSubclasses)).

	v addAll: g1; addAll: g2.

	RTEdgeBuilder new 
		view: v;
		objects: RTShape withAllSubclasses;
		connectFrom: #superclass to: #yourself.

	RTGridLayout on: g1.
	RTTreeLayout on: g2.

	RTConstraint move: g1 onTheRightOf: g2.
	^ v
]

{ #category : #icons }
RTRoassalExample >> examplePlacingGroupsIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABgCAYAAADrc9dCAAAFSUlEQVR4XuWZzWsTURTFsxB0
KVgU/NiJoNiqRUTBnehGQRSsbl2IC3HlqrjoQndCF36gC8GNIAoqCLq0gv4B6j/QjVShrW0n
H5N0kvt85yZv8jKZSSOkaZNzYMibmZP30vvLve9OkzOGX5tJOf4Q8APhFz8QfiD84gfCD4Rf
/ED4gfCLHwg/EH7xA+EXPxB+IPziB8IPhF/8QPiB8IsfCD8QfvED4Rc/EH4g/OIHwg+EX/xA
+IHwix8IPxB+8QPhFyGQpaUlPXo1DsNQj16O/TWGHsjs7KwevRq7APZy7K/BnyH8GcIPhL9k
8Zcs/gzZlBkiHz+KyeWMnDghED+QDQYS3LwphQsXzNKtW6b07Zvwl6w+l6zV1VWx1KVarcrC
woKEMzNSPHvWBNPTEvz6JfPz81IoFGRlZUXy+bzwZ8g6ZEgQBBJFkRSLRX2tVCoCMK5EAQ4g
4ToOeHBuF1cwpVJJIQHQepS1oQeCgLrgAUYyQxB0d14ul+Oxu4731mo1HQMGBJiAgvPFxUWd
A3M7H3/JSgiBcuUIr8n7uO6Cm7yeBOJA+fec12UXoAMIsmtubk7nBbC0tWkyBEFBkBGYTqUE
gUwG1y9n/jkywZ/fzyA/y+Dz72GMz4LswoHzfu1Bff/nouzcKXL1qriA4VuaFWBtZT9/Ftm1
S6qTkxqkVI+dR44ckdq1a61Avn8X2b1btB1uKA/g1ivnzqF2tQHEobKfUQ4fFvn6VbMFnxOv
gF6xzUNw44bUXr7U96vXfkZ4B65klU6fNsUzZ0z1+fOuvnGyY4eEp06Z6vbt2aapKROOjxt9
Bnn8uDmvPS8fPaqvvje4cqV+zY5T13z0SMpjYyY8frzNg30mmJgw1ZERnaP04YOUjx2rrz0y
MnhA/t65Y0I8uP350xWQaGpKVq5fN9GePdLpgbBy4EA9KN68eEB0D4pJb+H8eSOfPqVn3O/f
Uh4dlfzFi0bu32/z+PPCK1u21M9v3x64spbDxon2M62epwl+lKpioryk7R/JPaSTF/NmArZy
7XFWmRyqLgt/cFYHldxwcbigdPJjTr+z6lgGrTrN5eC7bm/ogbgAr5Ul7lvs/FlZ4u53821e
y4s9wnV5rrX+3ywZuJ9wAcL90cvLy6l/rN99uYBkZYHfpa319O17UZKS91FOk/C6La+D+2A4
M2MKL16I21SjJ08E3QzaRm1F7bjy4EF9bL2lp0/Fba6F9+/1Pq47r86FdhUtKsYpG7HrsHxv
dPdu7MVmX52eNpHtmvT83j3RdeH78kXK795ldmUDDUTevBE5eFBq27bF7ejqvn31DunQoXqw
0a6OjmoA4I327m22rvYVLafvrW3dGnsr+/fX57LrtOwbr1+L73Xvjb1uTZw3vLpuw+va3OS8
g/9g+POnyOXLLe1o3DbiAavxm4ae2wyKvfD4Xnu9zTsxIeHJk+rBOi1Afvxo9doMcPPqZ/Jb
WeuN17EZ5Lx6nph3aLosefZMe3jX98vDh819wP6WIY3fM9Rr77V48d7GXqHet2+bdR8Z2PC2
dVcItOeVV69icDohyqSbF5Ds/dhr36dQ+X8P+T8Nc0e0bl3WMAPhzxB+IJsXCNpZbVUz/kfF
rz6XLBkb0y5LuyE8r/BnyAZnyKVLzfa0i46IH0gf9hC/RebXJuiyNlr8GcIPhB8If8niz5Ce
jPmB8APhF3/J4gfCL34g/ED4xQ+EHwi/+IHwix8IPxB+8QPhB8IvfiD8QPjFD4QfCL/4gfCL
Hwg/EH7xA+EHwi9+IPxA+MUPhB8Iv/iB8IsfCD8QfvED4QfCrx7oH6mCLh8Lryj6AAAAAElF
TkSuQmCC'
]

{ #category : #sources }
RTRoassalExample >> examplePlatformPoup [

| view e |
view := RTView new.
e := RTBox new size: 20; elementOn: 'parangaricutirimicuaro'.
e @ RTDraggable@ (RTPlatformPopup text: [ :t| t, '





is a town in Mexico' ] color: (Color green alpha: 0.5)).
view add: e.
^ view

]

{ #category : #icons }
RTRoassalExample >> examplePlatformPoupIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAABDElEQVR4XuXVQQ0AQAgDQfyb
rBS4Lw4uzCYY6Dyobr+fKn8CH8TPB/FB/HwQH8TPB/FB/HwQH8TPB/HzQXwQPx/EB/HzQXwQ
Px/EB/HzQfx8EB/EzwfxQfx8EB/EzwfxQfx8ED8fxAfx80F8ED8fxAfx80F8ED8fxM8H8UH8
fBAfxM8H8UH8fBAfxM8H8TsFkmSdD+KD+CA+iA/ig/hP3c8H8fNBfBA/H8QH8fNBfBA/H8QH
8fNB/HwQH8TPB/FB/HwQH8TPB/FB/HwQPx/EB/HzQXwQPx/EB/HzQXwQPx/EzwfxQfx8EB/E
zwfxQfx8EB/Ezwfx80F8ED8fxAfx80F8ED8fxAfx80H8XgPtoabWrQOqsAAAAABJRU5ErkJg
gg=='
]

{ #category : #sources }
RTRoassalExample >> examplePolygons [

| clss v ver d composedShape e s |
clss := RTShape withAllSubclasses.

v := RTView new.
v @ RTDraggableView.
clss do: [ :cls | 
	s := RTPolygon new.
	ver := OrderedCollection new.
	d := 0.
	(cls rtmethods sortedAs: #numberOfLinesOfCode) do: [ :m |
		ver add: (Point r: m numberOfLinesOfCode * 5 degrees: d).
		d := d + (360 / cls rtmethods size).
	 ].
	s vertices: ver.
	
	composedShape := RTCompositeShape new.
	composedShape add: s.
	composedShape add: (RTEllipse new color: (Color red)).
	e := composedShape elementOn: cls.
	e @ RTPopup @ RTDraggable.
	v add: e ].
RTFlowLayout on: v elements.

	^ v
]

{ #category : #icons }
RTRoassalExample >> examplePolygonsIcon [
	^ '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'
]

{ #category : #sources }
RTRoassalExample >> exampleRectangleLayout [

| v |
v := RTView new.
v @ RTDraggableView.
v addAll: ((RTBox new size: [ :value | value / 2 ]; borderColor: Color black) elementsOn: (1 to: 100)).
RTRectanglePackLayout new on: v elements.

	^ v
]

{ #category : #icons }
RTRoassalExample >> exampleRectangleLayoutIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABjCAYAAABt56XsAAAEZElEQVR4XuWdzys9URTA3//h
31CytJC1rJAsFEtLUX6UIhQ2FhaKFEVRJEWRlJVslFJiZ2tpd+f7zvQdjfvuzFx3fryZ+Zw6
Pc2dH+/dz5x7zz333KvheXwpkzT4VcAHwhc+ED4QvvCB8IHwhQ+ED4QvfCB8IHzhA+ELHwgf
CF/4QPhA+MIHwgfCl8oDeX9/V19fX16SPj8/ezbnZXUv1+ddXl62HLu9va0OkJubG/Xx8eEl
6eHhoWdzXlb3cn3e5ORky7H5+Xk+ED4QPhA+ED4QPhAnIPIb+UD4QFhAokSaJz4QvoWUF4gM
zDY2NmJ1bGzMu76+jtWdnR3lCmR/f/+XyuC3MkCaFajkRyRpV1eXZ3OeDTjTW5ynhVQqdGJr
ITaVmKbS+ED4QPhAigKi9yF8IAUAierDuru7fddXVz6QlPeSStS9s/CxqOvW1taMcPlAcrAQ
m+v4QPhAyg3k7u6upVPVtb+/P3E809vbG1vOB2IJRKZMk8QUb7KpWBudnZ1tgTcwMFAdIFdX
Vyop1CHaaDQya45cmx4bNV0nz6udhZQNiOmlub+/V1tbW4oPpCQW8j82x7cQPhA+EKNKf7i7
u6tMXh0fSJs69bm5OeXi+eGBBB3x4uKiMTwik1hxXt/x8bFRFxYWPD6QFBaiW0JQ5hrtNV3H
B+IAJBjhB6N4PpAYbfr3iRUdVIRt/xCMol9eXn4le5+envrnbG9vOwPRk62/v7/rBeQv8+RZ
TT65dup5xa0qCUQ6ZD6QEgERKQpIVCR5ZmbGH4+E9e3tTfGBpLzf+Ph4bAhfr/RAR0ZG6j8O
KZuFxJWZns8HwgfCB8IHUjCQcKXGfedwWGZvb0+dn5+r19fXenXqZ2dnKmmefGVlxTs6OlLy
aSqfnp7++Xt1dTUVsLjy8AuRl2W0HYhteMX2jU9yaflAKggkLnOxs7PT18HBwXpmLmYBRCon
aNslMyQPC5HvaerDapcGlLWF2AYq+UD4QJhA+E0WxMvCAHl6ekoN5OLi4scVfXh4UOHJr79G
euOavL6+vpb596mpqfqtws1LXbLc48pNZScnJ3wgfCB8IHwgfCA1BaIHIkdHR52BNDvwlqwT
yWzBABEvyeQppbEQ2TXCFUhecavCgCRtrRGVyhlendTR0RG7/My0olZ0c3NTLS0tKT1xISkn
KwpI1PFaBBeDCaesd/nR23YXC+UD4QPhA+ED4QPhAykCSOV2to5aFj00NOTv7KZ7RZLFIWqq
EPGOwuOJ5eVlfyo1aqMAWe0kgUZbDy94tkzThs8bHh72raCnp6ewrZlKMQ4Jj3htUnd0i/nr
3odRlatbgiz0FDFtSIAFIhYxMTGh+EBKZCHr6+ttBSKDTL3ZqxyQz89PFd7oS7L9ZEeEQKOu
a7blv1REdv8MHzs4OEj13UzPEJG+Knz88fHRa4fw/6FLyYQPhA+EL3wgfCB84QPhA+ELHwgf
CF/4QPhA+MIHwhc+ED4QvvCB8IHwhQ+k7vIP3qBBe9TjobAAAAAASUVORK5CYII='
]

{ #category : #sources }
RTRoassalExample >> exampleResizingElements [
| v es resizeAnimation shape normalizer |
v := RTView new.
v @ RTDraggableView.
normalizer := RTMultiLinearColor new.
shape := RTBox new size: #yourself; color: [ :value | (normalizer level: (value / 100)) alpha: 0.4 ].
es := shape elementsOn: (1 to: 100 by: 10).
v addAll: es.

v canvas addMenu: 'Press me!' callback: [ 
	es do: [ :e | 
		resizeAnimation := 
			RTResizeMove new 
				toExtent: (100 - e model) @ (100 - e model) on: e.
		e model: (100 - e model).
		v addAnimation: resizeAnimation ] ].
v addAnimation: (RTLayoutAnimation new elements: es; yourself).


	^ v
]

{ #category : #icons }
RTRoassalExample >> exampleResizingElementsIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABjCAYAAABt56XsAAACBElEQVR4XuXYT0sqURjA4T6u
Oz+DfgmPdyeIi8ABcW0KbYS5biyajVxoIVFKhCWXC/UaUxAE0X8v0vODl8HhOAznEQZnb7Px
26X2/C3wQfxeA+l2u9HpdOK9X1gul+Fv2xZBUkrR6/Wi3W5HpVKJVqsV/X4/Go3Gw8aXWLVa
LarVaozH4yiKwgfZJshkMnnY4Ol0GoPBIMrPWZZFs9l8Oj8ajWI4HG7q9XrMZjMfxH+G+CB+
PoifD+KD+PkgPoifD+KD+PkgPoifD+Lng/ggfj6ID+Lng/ggfj6ID+Lng/ggfj6Inw/ig/j5
ID6Inw/ig/j5ID6Inw/i54P4IH4+iA/i54P4IH4+iA/i54P4+SA+iB8LEqtV3K5u4t/84vG4
+hs386tnU667nK/jpfFBttB1fhJnKYvyeJ6fxlE6fDblmoNUxEvjg/gg1jPEB/FBfJDP5IP4
ID6I/z9kB9pPi3htjvN15L/vIv26fXPKdfnJdaTs7ENT3kc6PIrPjA/ig/ggPogP4oP4ID6I
D+KD+CA/Mx/EB/FBvg3PB/FBfJAt5IP4IH7+6/f3/DKLg/jK5Is/ka+PIy32vzzldXwQH8QH
8UF8EB/EB/FBfBAfxAfxQXwQH8QH8UF8EB/EB/FBfBAfxAfxQXYxH8QH8UF2PR/EB/HzQXwQ
Px/EB/HzQXwQv//dPcyFUJ9iOehYAAAAAElFTkSuQmCC'
]

{ #category : #sources }
RTRoassalExample >> exampleResizingGroup [

| elements v handle callback |
elements := (RTEllipse new size: (30 atRandom)) elementsOn: (1 to: 30).
RTForceBasedLayout on: elements.

v := RTView new.
v addAll: elements.

handle := (RTBox new size: 20; color: Color red) element.
v add: handle.
handle @ RTDraggable.
TRConstraint move: handle onTheRightBelowOf: elements.

callback := TRTranslationCallback new block: [ :shape :step | 
	elements extent: (handle encompassingRectangle topLeft - elements encompassingRectangle topLeft). v signalUpdate ].
handle trachelShape addCallback: callback.


	^ v
]

{ #category : #icons }
RTRoassalExample >> exampleResizingGroupIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAC7UlEQVR4XuWa6Y6jMBAG8+bz
prnv+77TTL5RMjLE7Cbg7BKqJH4MBEbqwu5um0oU8SkSFX4I+EL48IXwhfDhC+EL4cMXwhfC
hy+EL4QPXwgfvhC+ED58IXwhfPhC+EL48IXwhfDhC+HDF8IXwocvhC+ED18IXwgfvhC+ED58
IXz4QvhC+PCF8IX8a9rtto3HY3PPdbtd6/f7xhfyZo7H40OQa7Va1Gq1LHnuejz89nw+G19I
IJbLpSnQs9ks0/2SpvvtCl9IAC6Xi/V6PdvtdpkCutlsbDAY8EcIn5II0WhI5oaQaOpSntFU
yBfyBM1m82fO/xvXnOJN3qvV6o+BPp1OP88fjUZ8IaGQDF+ibzQaH5fASyFEAZcMve3u+e12
a1mrMb6QJ1GQkw3gq/I0Pe33e37Z+woqa30NXL1efyqnpKGcovun0+nDsw+Hg/maTr6QW5et
4Pv6EAUu7yhL+595ZJdaiN7gtMC9i/l8Xsjy9+OSuvLBrcqKBbPT6VgR3/jSC9G8r8Cv1+uY
EC2R+KY9vpDAVVaetSgVClqW51dZGaYgXyWkYOqaknvWPJH2bO2p8JN6yltcrVZNK7Np1/NO
cb7zw+HQtFTDF8KHL4Qv5M1omd5dSFTF5SuF+UJylrK+gCq36JqbY5Ss3fn/dn+sudQamO7z
5aBbsWB8ISnc9ykUaF/pq2uvdvKTySS1QuML4cMXwhcSuEP/pOeWWoh2/TT3LxaLoMFTt67n
FvkDh0IK0VKKdvlC742/67nIHKK3+7qr+Pu3dhjd/fP7Prtb4mokhB5lfCHR77dUkdt33BcG
7yWt70uUou4IlmKEqCl0+wmNhGQuSDaV2vp9avv36yt+8IX87whU4gdfCF8IXwhfSIHh5xA+
fCF8IXz4QvhC+PCF8IXw4QvhC+HDF8KHL4QvhA9fCF8IH74QvhA+fCF8IXz4QvjwhfCF8OEL
4QvhwxfCF8KHL4QvhA9fCB++EL4QPnwhfCF8AvINhKVoOa9+wjYAAAAASUVORK5CYII='
]

{ #category : #sources }
RTRoassalExample >> exampleRotatingAnimatedLabels [


	| v shape timer |
	v := RTView new.
	timer := TRVITimer new cycleLength: 2.
	
	
	shape := RTRotatedLabel new.
	"shape angleInDegree: [ :cls | cls numberOfMethods negated / 1.5 ]."
	shape angleInDegree: [ :cls | 
		| valueEnd |
		valueEnd := cls numberOfMethods negated / 1.5.
		TRVIAnimatedValue new
					evaluator: [ :t | 0 interpolateTo: valueEnd at: t ];
					timer: timer;
					yourself. ].

	shape text: [ :cls | '                                                                                ', cls name ].
	shape color: (Color black alpha: 0.2).
	v addAll: (shape elementsOn: Collection withAllSubclasses).

	v canvas color: Color white.
	v addAnimation: RTResetAllShape new.
	timer start.

	^ v
]

{ #category : #icons }
RTRoassalExample >> exampleRotatingAnimatedLabelsIcon [
	^ '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'
]

{ #category : #sources }
RTRoassalExample >> exampleRotatingElements [
| v es |
v := RTView new.
es := (RTBox new color: (Color blue alpha: 0.4); size: 30) elementsOn: (1 to: 60).
v addAll: es.

es when: TRMouseEnter do: [ :evt |  evt element trachelShape rotateByDegrees: 5. evt signalUpdate ].
es @ RTDraggable.
RTGridLayout on: es.

	^ v
]

{ #category : #icons }
RTRoassalExample >> exampleRotatingElementsIcon [
	^ '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'
]

{ #category : #sources }
RTRoassalExample >> exampleRotatingLabels [


	| v shape |
	v := RTView new.
	shape := RTRotatedLabel new.
	shape angleInDegree: [ :cls | cls numberOfMethods negated / 1.5 ].
	shape text: [ :cls | '                                                                                ', cls name ].
	shape color: (Color black alpha: 0.2).
	v addAll: (shape elementsOn: Collection withAllSubclasses).

	v canvas color: Color white.

	^ v
]

{ #category : #icons }
RTRoassalExample >> exampleRotatingLabelsIcon [
	^ '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'
]

{ #category : #sources }
RTRoassalExample >> exampleSVGPath [

| paths v normalizer es |
"Icons have been obtained from http://iconmonstr.com"
paths := RTGroup new.

paths add: 'M50,50.002c48.046,20.595,149.05,16.396,142.596,109.369l-36.781,37.526
	C64.183,198.499,65.876,100.672,50,50.002z M236.836,314.404c46.488,35.155,202.98,145.061,202.98,145.061
	c12.942,8.801,28.532-7.157,19.496-19.948c0,0-113.425-153.879-149.669-199.452c-28.634-36.068-42.95-37.333-93.729-52.295
	l-33.528,34.274C198.463,272.378,200.123,286.61,236.836,314.404z M153.117,371.604l44.978-45.096
	c-4.459-4.19-8.398-8.315-11.852-12.423l-45.263,45.381L153.117,371.604z M294.64,179.983l82.462-82.647l36.982,36.999
	l-80.619,80.786c7.511,9.02,13.965,17.519,21.392,27.191l107.139-107.34l-84.96-84.969L261.664,165.591
	C273.768,169.513,284.464,173.88,294.64,179.983z M377.672,122.197l-68.18,68.348c4.124,3.42,8.315,7.267,12.573,11.692
	l67.743-67.903L377.672,122.197z M211.137,337.707l-61.792,61.927L98.214,413.8l14.149-51.147l63.117-63.268
	c-6.119-10.008-10.595-20.637-14.752-32.673l-79.412,79.562L50,461.996l116.276-30.745l72.555-72.688
	C221.665,346.056,221.145,345.721,211.137,337.707z'.

paths add: 'M410.5,101.5c0-28.449-23.051-51.5-51.5-51.5s-51.5,23.051-51.5,51.5
	c0,22.716,14.786,41.76,35.188,48.617c2.884,73.729-34.702,81.785-85.792,92.547c-29.346,6.186-62.514,13.311-86.73,35.801V149.848
	c19.958-7.091,34.333-25.951,34.333-48.348c0-28.449-23.051-51.5-51.5-51.5s-51.5,23.051-51.5,51.5
	c0,22.397,14.375,41.257,34.333,48.348v212.304c-19.958,7.091-34.333,25.951-34.333,48.348c0,28.449,23.051,51.5,51.5,51.5
	s51.5-23.051,51.5-51.5c0-22.229-14.149-40.988-33.864-48.215c4.635-67.324,44.124-75.656,93.334-86.033
	c52.146-10.981,116.287-24.745,112.934-126.638C396.484,142.321,410.5,123.621,410.5,101.5z M122.104,101.5
	c0-17.041,13.855-30.896,30.896-30.896s30.896,13.855,30.896,30.896S170.041,132.396,153,132.396S122.104,118.541,122.104,101.5z
	 M183.896,410.5c0,17.033-13.855,30.896-30.896,30.896s-30.896-13.863-30.896-30.896s13.855-30.896,30.896-30.896
	S183.896,393.467,183.896,410.5z'.
	
paths add: 'M209.965,376.166c-27.661,0-56.127-12.17-74.132-37.217c2.95,0.235,5.767,0.369,8.432,0.369
	c68.315,0,44.845-77.526,114.953-78.272l31.584,26.337C295.598,345.639,253.787,376.166,209.965,376.166z M377.307,216.813
	c20.352-31.97,65.783-117.074,83.15-150.175c1.074-1.869,1.543-3.747,1.543-5.541C462,55.038,456.635,50,450.734,50
	c-2.348,0-4.795,0.805-7.008,2.666c-28.666,24.258-101.256,86.177-128.951,112.019c-26.286,24.585-26.387,35.826-34.902,76.354
	l28.834,24.031C346.93,249.353,357.928,247.215,377.307,216.813z M393.334,252.966v174.7h-309V187.333h173.342
	c11.232-30.704,29.875-45.725,96.194-103H50V462h377.666V199.052C415.831,219.923,405.772,237.961,393.334,252.966z'.
	

paths add: 'M118.672,424.778c78.741,6.521,50.544-77.132,123.401-77.903l31.55,26.338
	C281.486,468.265,165.209,489.488,118.672,424.778z M360.125,302.636c24.493-38.44,100.367-167.347,100.367-167.347
	c6.035-10.687-7.377-21.852-16.748-13.965c0,0-112.821,98.095-146.099,129.184c-26.302,24.584-26.419,35.815-34.937,76.335
	l28.835,24.04C329.767,335.174,340.763,333.046,360.125,302.636z M154.146,369.189c11.433-19.48,30.008-51.114,76.343-56.009
	c7.444-35.825,10.428-56.646,43.721-87.76c23.57-22.011,84.776-75.689,120.533-106.921c-17.166-37.903-71.079-69.06-140.382-68.489
	C140.633,50.94,49.102,143.813,50.007,257.574c0.402,49.974,18.558,95.621,48.415,131.061
	C126.183,396.011,139.208,394.62,154.146,369.189z M273.473,97.352c18.909-0.109,34.416,15.121,34.601,34.04
	c0.066,18.935-15.139,34.483-34.099,34.609c-18.977,0.159-34.466-15.104-34.567-34.064
	C239.207,112.95,254.461,97.502,273.473,97.352z M170.541,131.693c18.91-0.176,34.467,15.062,34.534,34.039
	c0.201,18.994-15.105,34.425-33.998,34.601c-18.977,0.134-34.483-15.112-34.602-34.115
	C136.325,147.292,151.53,131.818,170.541,131.693z M136.141,234.666c18.994-0.125,34.5,15.146,34.601,34.072
	c0.167,18.952-15.104,34.468-34.098,34.601c-18.977,0.135-34.417-15.121-34.517-34.081
	C101.959,250.29,117.23,234.842,136.141,234.666z M308.341,381.125c0.369,38.423-15.138,63.838-28.866,78.74
	c-0.252,0.269-0.537,0.504-0.789,0.755c90.208-10.126,155.555-73.879,107.559-135.42C362.674,360.338,342.74,367.11,308.341,381.125
	z'.	

paths add: 'M179.997,83.572V272.42c-15.98-17.393-43.605-38.143-70.619-36.524
	c-32.408,1.941-38.563,36.646-10.562,62.864c47.141,44.139,94.575,109.268,105.167,163.24c0,0,140.646,0,184.41,0
	c0-108.793,35.16-131.914,41.555-188.706c4.786-42.488-6.636-75.721-41.023-80.612l4.742,13.429
	c1.827,6.01-1.573,12.363-7.588,14.185c-6.018,1.82-12.371-1.575-14.188-7.594l-4.521-12.506
	c-4.734-15.642-19.271-17.712-40.844-20.582l5.641,16.599c1.827,6.016-1.581,12.369-7.598,14.194
	c-6.01,1.813-12.363-1.582-14.183-7.597l-4.083-12.843c-4.896-16.162-18.077-17.917-41.978-21.556l5.349,17.832
	c5.002,16.528-26.534,24.509-26.534-21.546V83.572C243.141,65.03,230.11,50,211.569,50S179.997,65.03,179.997,83.572z'.

paths add: 'M236.105,181.743L419.02,325.125l-78.146,13.294l49.697,101.311L345.002,462l-49.983-102.275
	l-58.913,53.492V181.743z M209.991,275.845v-27.536l-27.961,12.44l5.284-54.958l-44.66-32.461l50.238-22.901l5.783-54.909
	l44.953,32.059l50.441-22.445l-5.286,54.955l44.662,32.465l-27.023,12.318l22.304,17.481l54.393-24.795l-67.916-49.369l8.038-83.573
	L246.533,98.75L178.172,50l-8.794,83.499L92.98,168.327l67.917,49.363l-8.036,83.573L209.991,275.845z'.

paths add: 'M50,121.974l214.373,168.043l-91.587,15.581l58.244,118.734l-53.405,26.101l-58.581-119.864
	L50,393.26V121.974z M350.522,61.567c-61.567,0-111.477,49.908-111.477,111.477c0,61.567,49.909,111.477,111.477,111.477
	c61.569,0,111.478-49.909,111.478-111.477C462,111.476,412.092,61.567,350.522,61.567z M351.741,247.129
	c-8.746,0-15.84-7.095-15.84-15.843c0-8.746,7.094-15.835,15.84-15.835c8.75,0,15.839,7.089,15.839,15.835
	C367.58,240.034,360.491,247.129,351.741,247.129z M364.193,200.31v2.851c0,0-23.747,0-26.108,0v-2.851
	c0-8.062,1.176-18.405,10.536-27.396c9.36-8.995,21.058-16.422,21.058-27.657c0-12.421-8.618-18.989-19.484-18.989
	c-18.108,0-19.293,18.78-19.739,22.916H305.06c0.677-19.583,8.953-46.976,45.287-46.976c31.484,0,45.639,21.086,45.639,40.861
	C395.985,174.543,364.193,180.011,364.193,200.31z'.


paths add: 'M149.201,462l-48.81-83.796c29.764-23.725,54.763-43.234,53.67-81.087h-49.181v-83.98h31.73
	C120.796,126.937,181.513,50,272.01,50c67.423,0,120.139,37.954,128.956,124.836l-96.363,14.023
	c-1.928-8.925-6.635-45.78-34.753-45.78c-19.901,0-33.456,24.244-15.27,70.058h78.943v83.98h-60.687
	c-1.319,18.151-9.282,33.163-19.438,46.447c24.343,1.238,45.975,13.569,68.383,13.569c19.778,0,25.201-3.376,58.65-20.264
	l31.177,90.997c-18.337,11.344-42.196,27.734-82.166,27.808C250.038,455.675,238.966,405.734,149.201,462z M329.444,425.651
	l0.346-0.001c16.368-0.104,30.496-3.509,45.497-11.163l-12.229-35.694c-15.21,6.548-25.454,8.364-41.277,8.364
	c-38.07,0-74.053-32.272-140.604-3.835c51.043-42.409,67.551-82.729,59.606-116.228H303.5V243.16h-69.433
	c-15.322-33.327-28.368-74.206-7.945-106.069c9.788-15.274,25.728-24.034,43.728-24.034c21.355,0,45.728,13.174,57.087,42.213
	l40.358-5.873c-11.964-50.885-57.479-69.374-95.285-69.374c-75.705,0-125.545,68.262-101.907,143.635l6.116,19.503h-41.315v23.935
	h45.909c0.616,1.001,23.514,59.864-41.573,118.153l20.498,35.189c16.166-8.858,34.12-15.76,55.276-15.76
	C247.36,404.829,300.137,425.651,329.444,425.651z'.
	
paths add: 'M299.715,461.13c-94.312,2.166-176.276-59.753-195.785-153.012H49.734l8.188-41.354h41.369
	c-0.218-9.804,0.165-19.596,0.938-29.292H63.047l7.938-41.354h35.533C132.739,82.586,230.829,17.764,383.484,66.522l-16.625,68.5
	c-77.396-24.258-139.529-17.381-159.892,61.098h150.1l-7.917,41.354H200.857c-0.529,9.121-0.69,19.461-0.295,29.292H344.15
	l-0.104,0.54c-23.77,7.239-43.852,21.902-58.121,40.813h-79.712c9.279,36.496,30.106,59.916,56.761,71.075
	C263.549,410.001,276.244,439.362,299.715,461.13z M292.947,377.225c0,46.756,37.903,84.66,84.659,84.66s84.659-37.904,84.659-84.66
	s-37.903-84.658-84.659-84.658S292.947,330.469,292.947,377.225z M420.312,367.84h-22.095v53.455H357.46V367.84h-22.096
	l42.475-42.549L420.312,367.84z'.	

normalizer := RTMultiLinearColorForIdentity new objects: paths.
es := paths collect: [ :p | (RTSVGPath new path: p; color: normalizer; scale: 0.1) elementOn: p ].


v := RTView new.
v addAll: es.
es when: TRMouseClick do: [ :e | e inspect ].
es @ RTHighlightable.
RTGridLayout on: es.

	^ v
]

{ #category : #icons }
RTRoassalExample >> exampleSVGPathIcon [
	^ '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'
]

{ #category : #sources }
RTRoassalExample >> exampleScaledNesting [

	| view inner host edges outter trachelCanvas resizable |
	outter := OrderedCollection new.
	view := RTView new.
	view @ RTDraggableView.
	
	1 to: 200 by: 10 do: [ :i |
		inner := (RTBox new color: (Color purple alpha: 0.2)) elementsOn: (1 to: i).
		host := (RTBox new color: (Color yellow alpha: 0.1)) element.
		outter add: host.

		view add: host.
		view addAll: inner.
		edges := 
			RTEdgeBuilder new
				view: view;
				elements: inner;
				connectFrom: [ :v | v // 2 ].

		RTGridLayout new on: inner.
		RTNest new		
			on: host nest: inner.
	].
	RTGridLayout on: outter.
	
	trachelCanvas := view setUpCanvas.
	TRFocusCenter on: trachelCanvas.
	
	"Zoom a specific element"
	resizable := outter at: (Random new nextInt: outter size).
	view addMenu: 'Smaller'
		callback: [ view addAnimation: (RTResizeMove new 
													toExtent: resizable extent * 0.6 
													during: 0.3 on: resizable) ].
	view addMenu: 'Bigger'
		callback: [ view addAnimation: (RTResizeMove new 
													toExtent: resizable extent * (1 / 0.6) 
													during: 0.3 on: resizable) ].
	
	^ view
]

{ #category : #icons }
RTRoassalExample >> exampleScaledNestingIcon [
	^ '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
VwAAAABJRU5ErkJggg=='
]

{ #category : #sources }
RTRoassalExample >> exampleScales [

| v scale width doLayout values dots |
v := RTView new.
v @ RTDraggableView.

"Linear per default"
scale := [ :x | x ].
width := 200.
doLayout := [
	RTHorizontalLineLayout new gapSize: 0; on: dots.
	RTMetricNormalizer new
		elements: dots;
		fastSmoothTranslation;
		normalizeY: #numberOfMethods min: 0 max: width negated using: scale.
		v signalUpdate ].

v addMenu: 'linear' callback: [ scale := [ :x | x ]. doLayout value ].
v addMenu: 'log' callback: [  scale := [ :x | (x + 1) log ] . doLayout value ].
v addMenu: 'square root' callback: [  scale := [ :x | x sqrt ] . doLayout value ].

values := RTObject withAllSubclasses.

dots := (RTEllipse new color: (Color blue alpha: 0.5)) elementsOn: values.
v addAll: dots.

doLayout value. 
^ v
]

{ #category : #icons }
RTRoassalExample >> exampleScalesIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAEJElEQVR4XuWbW09TQRSF+9v4
Z8ALkPAMhBAeRNLGeA1tTGMEAUvFYptqmtp4iY1GfKh3jVq71NVmpBzaniPe0G8lJz2XPXtm
9jezZ9r0pL584eskKcUPAR8IX6OArK6uqlQqKc7Qdr+68v39ffERDADiI5PJaGxsTLOzs9re
3tbk5KQ6nY76gezs7GhxcbFr0+9kbm5OhUJBuVxO8/PzmpqaUj6f18rKilqtlorFYtd+eXlZ
9Xpd09PT3evNzU0+kCiQvb09VatV1Wo1NRoNLS0tKZ1Oa319/ZBhs9nsBnNra0vj4+Pa2Nj4
HsyFhQXt7u5qZmZG2WxW5XK5e16pVLo2ExMT3U/XYaA+N/B2uy0+FP4awgfCFx8IHwhfyfX6
tcQHcoJgfNvE8oHwUxZffCB8IHzxgfCB8MUHwgfCFx8IX3wgfCB88YHwgfDFB8IHwhcfCB8I
X3wgfPGB8IHwxQfCB8IXHwgfCF98IHwgfPGB8MUHcoL08qV07lzvf77hnA/kf5sh+qaHD8V/
Le2YevVKOn/+IH4jgbRa0oULo4P98aPUaCQH8vx5vE/+DEkQxF9h4zx55QofRiIgnjo3bhwE
K1z7BZObN6VOR3rwYHAwg02SCj99Omz34kWyGfPhw/FBun3F4r8xEFLRETzsut2W7t2T3r2T
arXe/bj04/IXLx593n//0aNkM+vq1Z8LaLRvJ20dCXE81qL+5InkDubzx++ky589K9XrfyZQ
ru/SpT9X15kzUql0eMH+4RliUoVCz4FnQrj/+bN0//5Rx76ftKI3bwb7iPqLswntvH5dGmVv
Gw8Y2/1McJ3uLl8eHtjoO4OGYVvLKd6p/tat5GBSgyqw02vXjqarUY68FoQ05OC7vKeh7586
1Us5cT4c4FGjyikyPHM7bW+fw7bdtmk2D8q8fStVKkdtHbw4KKFfLu/6yuXeFzmfj3qrNrSx
/0vgD++ynj4dHhAH3Qvs3buDbZyCslnp2bPkIzPqz9feJNiPz+3THfJ1tJ3edoeytllbG11v
f7vs14MllxteJsTCvm33+LF0506vzv66PSMzmfj6h8U2+Ei5kz7CjPAoun07PpiDRmXSssP8
9Y80Xw+aAQ6MZ55TaqjLdg6Mbd0prxXDNhvheTotVauHy/vwyPds9qcBBJu4NSPJTtFttj+3
4fTpwZkg9f69FI6/vdOI5nvn3yRriu0MI9jG9SX6PJQPPhw4f/6NmPB/y/rffsviiw+ED4Qv
PhA+EL74QPjiA+ED4YsPhA+ELz4QPhC++ED4QPjiA+GLD4QPhC8+ED4QvvhA+ED44gPhA+GL
D4QvPhA+EL74QPhA+OID4QPhiw+ED4QvPhC++ED4QPjiA+ED4YsPhA+ELz4QPhC++ED44gPh
A+GLD4QPhC8+ED4Qvn6jvgLxBzfrDplOIQAAAABJRU5ErkJggg=='
]

{ #category : #sources }
RTRoassalExample >> exampleScrollZoom [

	| v |
	v := RTView new.
	v @ RTZoomableView.
	v @ RTDraggableView.
	v add: (RTLabel new elementOn:
'Scroll your mouse wheel
while hovering cursor
over the view to zoom it').

	^ v
]

{ #category : #icons }
RTRoassalExample >> exampleScrollZoomIcon [

	^'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'
]

{ #category : #sources }
RTRoassalExample >> exampleSeisms [
<noTest>
| b tab l|
tab := RTTabTable new input: 'http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/2.5_month.csv' asZnUrl retrieveContents usingDelimiter: $,.
tab removeFirstRow.
tab replaceEmptyValuesWith: '0' inColumns: #(2 3 4 5).
tab convertColumnsAsFloat: #(2 3 4 5).
b := RTMapLocationBuilder new.
b shape circle
size: [ :v | (2 raisedTo: v) / 2 ];
color: (Color red alpha: 0.3).
tab values do: [ :row | b addPoint: row second @ row third value: row fifth ].
b build.

l := RTLegendBuilder new.
l view: b view.
l addText: 'Seisms of a magniture of 2.5 or more, over the last 30 days'.
l build.
b view @ RTZoomableView.
^ b view
]

{ #category : #icons }
RTRoassalExample >> exampleSeismsIcon [
	^ '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
YII='
]

{ #category : #sources }
RTRoassalExample >> exampleSelfCalls [
	" The RTNest class offer simple methods to encapsulate some elements into a composing elements. Consider for example the following visualization that shows the shape hierarchy in Roassal. Each purple square is a class. Classes are linked with to represent class inheritance. Gray boxes are methods. Relation between methods indicates a possible invocation path between methods within the same class."
	<gtExamle>
	<noTest> " -> image crash "
	| v classes classElement classElements shapeBuilder methods methodElements |
	v := RTView new.
	v @ RTDraggableView.
	shapeBuilder := RTShapeBuilder new.
	shapeBuilder rectangle size: [ :m | m linesOfCode min: 60 max: 5 ].
	classElements := RTGroup new.
	classes := RTShape withAllSubclasses.
	classes
		do:
			[ :class | 
			classElement := (RTBox new color: (Color blue alpha: 0.4))
				elementOn: class.
			classElement @ RTPopup.
			v add: classElement.
			methods := class rtmethods.
			methodElements := shapeBuilder elementsOn: methods.
			v addAll: methodElements.
			RTEdgeBuilder new
				view: v;
				objects: methods;
				connectFrom: #yourself toAll: #dependentMethods.
			RTTreeLayout on: methodElements.
			methodElements @ RTDraggable @ RTPopup.
			RTNest new on: classElement nest: methodElements.
			classElement @ RTDraggable.
			classElements add: classElement ].
	RTEdgeBuilder new
		view: v;
		shape: (RTLine new attachPoint: RTVerticalAttachPoint instance);
		objects: classes;
		connectFrom: #superclass.
	RTTreeLayout on: classElements.
	^ v
]

{ #category : #icons }
RTRoassalExample >> exampleSelfCallsIcon [
	^ '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'
]

{ #category : #sources }
RTRoassalExample >> exampleSliderAndCubeHelix [
	| v helix shape elements slider |
	v := RTView new.
	helix := RTCubeHelix new.
	helix rotations: 2.
	helix gamma: 2.
	shape := (RTBox new height: 300; width: 1; color: [ :model | helix level: model ]).
	elements := shape elementsOn: (0.0 to: 1.0 by: 0.002).
	v addAll: elements.
	RTHorizontalLineLayout new gapSize: 0; on: elements.

	"Set the gamma value"
	slider := RTSlider new.
	slider view: v.
	slider labeled.
	slider callback: [ :aValue | helix gamma: 5 * aValue. elements updateShape ].
	slider move: #below.
	slider build.

	"Set the rotation value"
	slider := RTSlider new.
	slider view: v.
	slider labeled.
	slider callback: [ :aValue | helix rotations: 5 * aValue. elements updateShape ].
	slider move: #below.
	slider build.

	^ v
]

{ #category : #icons }
RTRoassalExample >> exampleSliderAndCubeHelixIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAADMUlEQVR4XuXd7UtTYRzGcf+y
szkTRVEyxLYzMzNFbFGKhYqOzfmYUSIZZEWPVioYEQRmoCAEkUTlA5UF0fZiZeUgadjYLjuz
GREEhQOX32tccHMGN4fzYefHXt1Z6+v8ZFKy+I+AD8IPH4QPwg8fhA/CDx+ED8IPH4QPwg8f
hB8+CB+EHz4IH4SftIMYhqFfa/utdpuh7FQdydqtZhvKcaSaYzU31Tzru3yrBVYLbcousste
7JBtd45se3JlK82XUVooo6xYxt4S2Zxlspmm7GaFHGaVdrlrlec+rAJ3vYrcx1TiblaZ2SrT
9KnSDKjG1SmPq0sNrh41WfVa7XB164R1vd/6ftDt11B5my5VtOjqgeMarm7QzdojGjlUp9Gj
NRptrNJI837d8pZrOGDqWo9TV047dfGMU+eGTA1e3qeBG5U6NVatvjt16r5Xr477TQpM+eSf
6ZX/4YD8j86rfXZYnU9uq+fphE4+m1H/88c6OzevC3OvdX0+pLGFD7q7ENHk4qpmFtc0+yKm
+ZdxLS0l9O6N9P6t9DkorYal6MeEvkXiin+NKxFLiA/CB+GD8EH4IHwQPggfhA/CB+GD8EH4
IHwQPggfhA/CB+GD8EH4IHwQPggfhA/CB+GD8EH4IHwQPggfhA/CB+GD8EH4IHwQPggfhA/C
B+GD8EH4IHwQPggfhA/CB+GD8EH4IHwQPggfhA/CB+GD8EH4IHwQPggfhA/CB+GD8EH4IHwQ
PggfhA/CB+GD8EH4IHwQPggfhA/CB+GD8EH4IHwQPsgOA+n0BNR3sJ0PkikgXZ529Xr8fJCM
eWWZO+iVlUgk9F93akoJn+9Hk+vUdf1Df+711x/9sVvNtpyOsLKyouXlZUWj0S13bWJC016v
XrW1bazTsWfy3pL3iDmuIhKJrIdCIYXD4S330/i4Jlta9MBqcp2OPYPBIAtk8+eZlr2mpxWz
XldK1lpn2v3hDnRJIijNILgTdtI9Q2KtrRvlz5AMmSFfGhs3yp8hGTJDxJ8hGTRDktn8T7FN
D5EPwj82jx8+CB+EHz4IP3wQPgg/fBA+CD98ED4IP3wQPgg/fBB++CAZne8rE5WE57/UxQAA
AABJRU5ErkJggg=='
]

{ #category : #sources }
RTRoassalExample >> exampleSmoothLayout [
	| v translator |
	translator := RTSmoothLayoutTranslator new.
	v := RTView new.
	v canvas
		addMenu: 'grid'
		callback:
			[ 
			RTGridLayout new
				translator: translator;
				on: v elements.
			v canvas signalUpdate ].
	v canvas
		addMenu: 'hori'
		callback:
			[ 
			RTHorizontalLineLayout new
				translator: translator;
				on: v elements.
			v canvas signalUpdate ].
	v canvas
		addMenu: 'treeV'
		callback:
			[ 
			RTTreeLayout new
				translator: translator;
				on: v elements edges: v edges.
			v canvas signalUpdate ].
	v canvas
		addMenu: 'treeH'
		callback:
			[ 
			RTHorizontalTreeLayout new
				translator: translator;
				on: v elements edges: v edges.
			v canvas signalUpdate ].
	v canvas
		addMenu: 'cluster'
		callback:
			[ 
			RTClusterLayout new
				translator: translator;
				on: v elements edges: v edges.
			v canvas signalUpdate ].
	v canvas
		addMenu: 'circle'
		callback:
			[ 
			RTCircleLayout new
				translator: translator;
				scaleBy: 0.8;
				on: v elements.
			v canvas signalUpdate ].
	v canvas
		addMenu: 'radial'
		callback:
			[ 
			RTRadialTreeLayout new
				translator: translator;
				on: v elements.
			v canvas signalUpdate ].
	v canvas
		addMenu: 'sugiyama'
		callback:
			[ 
			RTSugiyamaLayout new
				translator: translator;
				on: v elements.
			v canvas signalUpdate ].
	v addAll: (RTBox new elementsOn: (1 to: 100)).
	RTEdgeBuilder new
		view: v;
		objects: (1 to: 100);
		connectFrom: [ :value | value // 2 ] to: #yourself.
	RTTreeLayout new on: v elements edges: v edges.
	^ v
]

{ #category : #icons }
RTRoassalExample >> exampleSmoothLayoutIcon [
	^ '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'
]

{ #category : #sources }
RTRoassalExample >> exampleSparkline [

| v cls s es |
v := RTView new.

cls := RTLayout withAllSubclasses.

s := RTSparkline new
		width: 50; height: 30;
		values: [ :c | (c rtmethods collect: #numberOfLinesOfCode) sorted ].

es := s elementsOn: cls.
v addAll: es.
es @ RTPopup @ RTDraggable.
RTFlowLayout on: es.
^ v 
]

{ #category : #icons }
RTRoassalExample >> exampleSparklineIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAEn0lEQVR4XuWbW0sjQRCF/eci
PhjQJ1FBAlFjwEvwQUVR4yXeFRVEo/GOIsEooiBeo9ZsKmwvs2EyUx0ncabPgXlZzvZ26uvp
qq7pbbAsfAVJDfghwAeCL3wg+EDwhQ8EHwi+8IHgA8EXPhB8IPjCB4IvfCD4QPCFDwQfCL7w
geADwRc+EHwg+MIHgi98IPhA8IUPBB8IvvCB4APBl9lAqKiRkRGS+jOZjMi7vr5OOnNgSb06
Y4cKiArCxcWFOGjDw8Mk8W1tbZHOHLx42KG1t7ebBaR8NXZ2dpJ09X59fZFk3Lu7O9KZw9ra
Gkm9uVzODCBOW8P9/b31/PxMEu/k5CRJAub2FlXanvr7+0nqnZ2dDTcQ9cPe39+t19fXf8/t
7a21urpKbkE4ODgg5T87O3P09vb2UktLS+mZm5sjpxXslSfm5+fJyzs4OEj8hDqpFwqFUkDL
A+/mtT+Vkrjy2gMpGddrHuyV5h/8sjcAurq6IqOB8Dbk54/s6emhWnhZ/HY9PT2ZCUTt034l
SB5rZWWF/PYqP1d3j4+PZOSWpRLm4uIi+QlXkqd0vPa5crFgXA6xVy68Qr+/v8mvMfv6+shP
b/l8j46OzAFSXkZubGz4shfzmOPj47SzsyOCMTY2Jvba5zs6OkrGVFlcRhZbI3R9fS0tTz0f
9vF4JycnokDpeFWJfHp6SgsLC4Rf9v6SpM1FfCC2gEm3DvZOTU1pVVG7u7tVt3/ggHAAPj8/
ue8lTtzn5+dauaKrq4uCAiKwQOxB8Ooh6QTXaYtyq7zKvcvLy3hvCAeB+1ScYN1a48qbTCZL
zcVsNkvV5ApO4pK3IpFIcJMUBwgHgMtiSdNQeSUr1m3LiUQi/x0UK3lTqZT4QGkEkGI7Xtze
1vGq4HIeampqosbGRmt6etr12wqXyexTz9LSEuFXWQFVvTq+dQNyeXlJP8krUq9kVXM1Jp0P
j9nW1mbWllXNjQ21p6fTaa1c4dbR1Wky8oldt0McCiDcd6r2BF1pz6/mtM1v2c3Njag1wlXV
b53iawrE6RKBZKU/PDyULi1IVrv9z2KxmKN/b29PPI9KlypCD6Sjo0P70hpXRK2trdqn5+bm
5lJ15OTl7ak4ruhNm5iY8OXzQOCAeB3q7Do8PKSPjw/tbxVKxX6U49/l7Umau7gzLL0diV/2
BrQ8DTWQt7e3upx21QcpiU/SGWZfNBo1q8riHyX5YvfTf+NvO10UZKcelpNve3vbvJP6/v4+
1RqEykXHx8eiqszr7WAfNyydrruGGkgtW9YquJICwl4MdHd3e0Lj5qVOqRwKIPF4nGoF4uXl
pfTNng95+XzeNcA8D/ZxWTwwMODqzeVy1tDQkHllb60SOAdtZmZGNDZ3bqWX3LhE3tzcxC97
8YUP5Mc5Cx9IAEDU8zyCD0RQJrPqdc8XH4gHCHu3AR9IQPIE/xc7/KQOBgIfCH7Ziy98IPhA
8IUPBB8IvvCB4APBFz4QfOEDwQeCL3wg+EDwhQ8EHwi+8IHgA8EXPhB84QPBB4IvfCD4QPCF
DwQfCL7wgeADwRc+EHwg+CHAB4IvfCD4QPCFD8QM/QGnQh9WCjgVcwAAAABJRU5ErkJggg=='
]

{ #category : #sources }
RTRoassalExample >> exampleSpiralViz [
	"Simple visualization in which each class is a curve. How the curve varies indicates variations in the methods set"

	| classes v angle shape incr |
	classes := RTShape withAllSubclasses.
	classes := classes select: [ :c | c methods size > 1 ].
	v := RTView new.
	angle := 0.
	classes
		do: [ :c | 
			shape := TRBezierShape new.
			shape color: Color black.
			shape
				width: 2.5;
				strokePaint: Color random.
			incr := 0.
			angle := angle + (360 / classes size).
			shape
				points:
					(c methods
						collect: [ :m | 
							incr := incr + (angle cos @ angle sin * 10).
							(m numberOfLinesOfCode log * 25) @ (m sourceCode size log * 25)
								+ incr ]).
			v canvas addShape: shape ].
	^ v
]

{ #category : #icons }
RTRoassalExample >> exampleSpiralVizIcon [
	^ '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
RK5CYII='
]

{ #category : #sources }
RTRoassalExample >> exampleTimeLineOfRoassal [

| d popup v |
"Time line of code in Roassal"
"We compute the number of methods created for each day. We keep the information in a dictionary"
d := Dictionary new.
RTObject withAllSubclasses do: [ :c |
	c rtmethods do: [ :m |
		d at: m ageInDaysAsInteger ifAbsentPut: [ 0 ].
		d at: m ageInDaysAsInteger put: (d at: m ageInDaysAsInteger) + 1 ].
].


popup := RTPopup text: [:assoc | assoc value asString, ' methods added on day ', assoc key asString ].
v := RTView new.
v addAll: (RTEllipse elementsOn: d associations) @ popup.
RTMetricNormalizer new
	elements: v elements;
	normalizeX: #key min: 0 max: 500;
	normalizeSize: #value min: 5  max: 30;
	normalizeColor: #value;
	alphaColor: 0.3.

"We add a line from the left most element to the right most element"
v add: ((RTLine new color: Color lightGray) edgeFrom: v elements leftMostElement to: v elements rightMostElement).

"It make sense to only drag horizontally"
v @ RTHorizontalDraggableView.

"We add a small legend"
v canvas addFixedShape: (TRLabelShape new text: 'Each circle is a day. Size of the circle indicates the number of methods produced that day').
TRConstraint stickAtTheBottomOfTheWindow: v canvas fixedShapes last.

	^ v
]

{ #category : #icons }
RTRoassalExample >> exampleTimeLineOfRoassalIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAD9UlEQVR4XuXXW09TWRjGcT6X
V34BEw/xwmg0xpioMTExXnjhIWq88hCjUaPRBCeKBaMIRAQFbNpKdRCRCREoCKVyKi3CwLSU
lj7Os5sZ4iTjDBfGjPN/khW62+61V9/fendL1efP/PyXUsUvAR+EHz4IH4QfPggfhB8+CB+E
Hz4IH4QfPgg/fBA+CD98ED4IP3wQPgg/fBA+CD98EH74IHwQfvggfBB++CB8EH74IHwQfvgg
/PBB+CD88EH4IPzwQfgg/PBB+CD88EH44YPwQfjhg/BB+OGD8EH44YPwQfj5v4BoZETlxkYV
Tp5Ubtcu5U+c0Mr4uL7lYkvT0yoOD6u8uCgciJyF9+81++qVinNzqwUoLS0pPzPzl4LIhQow
8vv2Kbdz5+rI7t+v8bo6TTQ3a/mLOdaM7Cx9+qTyyormnz/Xby0tyoZCmvWcxdFR5aemlInH
tWikYP55rzc3OflDY1UNxmLq6ehQPpfT1MePmkmngzoo9fKl+mtrFbt+XeErV5T2bl/IZtXt
grT4+Bef0xMOq8sQifPnlTp1SqPr1imxfr3imzerbft2tW7cqIj/drhrolevVt4bq6lR5OFD
Tbij5l3EWc856esWi0WVSqXKtdMuatbr6PQ5jT634ehRxQ8fVnsw18GDCp8+rfi5c+q+eVOD
wfWfPtWHBw/0wfAzXnchk/muKMHa/21jBflq5/tzr4J0+UM8qq5Wd1eX2vy4/dkzJZNJhe/c
0ZOLF1Vz9qxCLni0rU3d0ageX7qkGh/fvXxZ9zxCPn5x7Jg69u7Vmw0bFN20SU/27FH9gQN6
tHu3mtwld48f109nzqj+xg3V+v3VFy4o5vl+9u6OGLbdO7+vr09DQ0Ma9c5/0dqqeCSiel/7
nqGrjdFw6JAeB/MeOaKQ56ozVJPX1+Q5m73+2K1blTUPuJOSvb1u2unvNgYGBv7x9bGxMaVS
qa++PuwOn/QmDB5X/eoHhb+5Jwe3qawBgjHh8efzcy5a+u1bFd1RwXFw7oKLV25o0NyWLZrf
ulXzO3Yo6TGybZt6XcjEtWvKvn6t5Xxec+60om97a9l52URCg94kmf5+pdyVk7dva8SYKXdt
vrNTaXd35o8x29NT6Y6Mr8P/UnfK3pkl79Ivv0OW7t//ZsVRoVBByLmDC+/eif8ra42/tNy/
Knu3anlZ/B+x/P9D+CD88EH4IPzwQfgg/PBB+OGD8EH44YPwQfjhg/BB+OGD8EH44YPwwwfh
g/DDB+GD8MMH4YPwwwfhg/DDB+GHD8IH4YcPwgfhhw/CB+GHD8IH4YcPwg8fhA/CDx+ED8IP
H4QPwg8fhA/CDx+EHz4IH4QfPsiPl98ByUwFby0fOIYAAAAASUVORK5CYII='
]

{ #category : #sources }
RTRoassalExample >> exampleTreeLayout [
	| view |
	view := RTView new.
	view
		addAll:
			(RTBox elementsOn: Collection withAllSubclasses) @ RTDraggable.
	RTEdgeBuilder new
		view: view;
		objects: Collection withAllSubclasses;
		connectFrom: #superclass to: #yourself.
	RTTreeLayout on: view elements edges: view edges.
	view @ RTDraggableView.
	view edges do: [ :e | e trachelShape pushBack ].
	^ view
]

{ #category : #icons }
RTRoassalExample >> exampleTreeLayoutIcon [
	^ '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
u5nePWZ+kW8AAAAASUVORK5CYII='
]

{ #category : #sources }
RTRoassalExample >> exampleTwoColumnFlow [

| firstColumn secondColumn associations firstElements secondElements v eb |
firstColumn := #( 'WP A.1'  'WP A.2' 'WP A.3'  ).
secondColumn := #('WP B.1'  'WP B.2'  'WP B.3' ).
associations := OrderedCollection new. 
associations 
	add: 'WP A.1' -> 'WP A.2';
	add: 'WP A.2' -> 'WP A.3' ;

	 add: 'WP B.1' -> 'WP B.2' ;
	add: 'WP B.2' -> 'WP B.3' ;
	
	 add: 'WP A.3' -> 'WP B.1' ;
	 add: 'WP B.1' -> 'WP A.1' ;
	 add: 'WP B.2' -> 'WP B.2' ;
	 add: 'WP B.3' -> 'WP A.2'.

v := RTView new.
firstElements := ((RTEllipse new extent: 70 @ 30; color: (Color r: 1.0 g: 1.0 b: 0.7020000000000001 alpha: 1.0)) + RTLabel) elementsOn: firstColumn.
secondElements := ((RTEllipse new extent: 70 @ 30; color: (Color r: 0.996 g: 0.851 b: 0.651 alpha: 1.0)) + RTLabel) elementsOn: secondColumn.
v addAll: firstElements.
v addAll: secondElements.

v elements @ RTDraggable.

RTVerticalLineLayout new gapSize: 15; on: firstElements.
RTVerticalLineLayout new gapSize: 15; on: secondElements.

secondElements translateBy: 100 @ 0.

eb := RTEdgeBuilder new.
eb view: v.
eb shape arrowedLine
	withBorderAttachPoint.
eb useAssociations: associations.

^ v
]

{ #category : #icons }
RTRoassalExample >> exampleTwoColumnFlowIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAER0lEQVR4XuXa/U9aVxzH8f7/
yZJlXetsa0XXobW2ndq6Ne2i01jb1SfEuUoi+BgY8rBBEUHu97tzTgeCwBXdrTN5f5KTq9x4
fjgv77n3fsItVX5uUm7xl4APwg8fhA/CDx+ED8IPH4QPwg8fhA/CDx+EHz4IH4QfPggfhB8+
CB+EHz4IH4QfPgg/fBA+CD98ED4IP3wQPgg/fBA+CD98EH74IHwQfvggfBB++CB8kOuKyL6I
fDRj3owXojplPntjfo6YsWXGqVxqvr/iIkcR8XZfibc1aqYIq7c9IZJ6L5JZF/EuNx8GRCTq
Fr+XITJrYMq+Cyl/LrnF72kkXhrnY+GDNDBWHcbc3D1dWRl04927AV1bCzmAWOyRO9Z/P4MR
OT4+toeWxZTkosP49dltXfmpT5en+3Q6/LX7OTZzX99O3HEQqz/3tcDwQRogvziQYvGZLi09
1IODUZ2d7dd8flwjkZAuLNx3AIeHoy0ghUJB8vm8lMvlluHFJx1IITKsH17e1f23D3V88Cs9
/eMHB1JYG3YAB+ZzPkhHkE/mf3zKd8vyvMlzV0es6xYjlYK5X4z4blk1g9PyWWaDv2W1w2xL
/WrpfO+YMuc3zaj0tHiS+9i4WjoNbysskl4VqZ0I/6beY+w94r/8falUkmQyKUHNxwcJAMQO
PsgNADk5+bwVVatVPsj/DVKpVMTzPAn6ikOD2K3GLmCtVrvc27l9bSy3vzhedT4+SNOWk8vl
5CpXR5Dz8busRpc1bbadafcofNZl+f9325fFrl1WbExqscfC77Kuqctqfprid1kBdFnr60O6
sTGsm5vD5jikqdSYA9jdHXHHeDzs6pQznPYnquYuK/LqO42+7tfNN/dcf5WYf2BqlAGNzz1w
ENvmmFsZ4lcn3bqsVOqxLi8P6tHRmEajQ67T2t8f0adPv9H6+UrlxzaQ809U9bfz5PtBVyym
P4R0/vm3rtOyXdbCv+WiPX/y+yM+iF+XVSo910QirNnsE7fo9mjOOZyZmX53rrnL6vRE1dxl
fVr/3l0Rh4ufi8TMUkgXJ+84nJnx242rhd9lBdRldXui4ndZ1/himM1mJZPJuHHdVQwfpMMC
2vtFsVh0gw9yA0Can6js+cssMh8kYJBuHZV9Bzk9vfgljw8SYJfVraNq7rD8tjF+lxVwl+X3
RHX+Kui21fG7rIC6LM9b66nLapvv74RPlxXld1lfsstqmY/fZX35Lsu+rafTTzp2WS3z9dhl
2bf19G8hfnVy1S5rb29Ed3bCF4L02mXtLQzozvwAH+SqXZb9RmO1OqG9fS8rfGGXZb/JWKmX
i5kof8sKosvynY/fZfHDB+GD8MMH4YPwwwfhhw/CB+GHD8IH4YcPwgfhhw/CB+GHD8IPH4QP
wg8fhA/CDx+ED8IPH4QPwg8fhA/CXwI+CD98ED4IP3wQPgg/fBA+CD98ED4IP3wQfrrlHzNd
3LoOQ52QAAAAAElFTkSuQmCC'
]

{ #category : #sources }
RTRoassalExample >> exampleTwoColumnsAsFlow [

| firstColumn secondColumn associations v eb firstElements secondElements |
firstColumn := #( 'WP A.1' 'WP A.2' 'WP A.3' ).
secondColumn := #( 'WP B.1' 'WP B.2' 'WP B.3' ).
associations := OrderedCollection new
	add: 'WP A.1' -> 'WP A.2';
	add: 'WP A.2' -> 'WP A.3';

	add: 'WP B.1' -> 'WP B.2';
	add: 'WP B.2' -> 'WP B.3';
	
	add: 'WP A.3' -> 'WP B.1';
	add: 'WP B.1' -> 'WP A.1';
	add: 'WP B.2' -> 'WP A.2';
	add: 'WP B.3' -> 'WP A.2';
	yourself.

v := RTView new.
firstElements := ((RTEllipse new extent: 70 @ 30; color: Color lightBlue) + RTLabel) elementsOn: firstColumn.
secondElements := ((RTEllipse new extent: 70 @ 30; color: Color yellow) + RTLabel) elementsOn: secondColumn.
v addAll: firstElements.
v addAll: secondElements.

v elements @ RTDraggable.

RTVerticalLineLayout new gapSize: 15; on: firstElements.
RTVerticalLineLayout new gapSize: 15; on: secondElements.

secondElements translateBy: 100 @ 0.

eb := RTEdgeBuilder new.
eb view: v.
eb shape arrowedLine
	withBorderAttachPoint.
eb useAssociations: associations.

^ v
]

{ #category : #icons }
RTRoassalExample >> exampleTwoColumnsAsFlowIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAEY0lEQVR4XuWazWtjVRiHhyoD
ogMig8ooWmQEkQGVWTgigkvX/gPuXLp058KvvXt3IopI5kPB0elga5h2qiahk4YKU0nSNmlD
mzS017RNmryv7zmmnSSTr3Zua+H5wctJensv3PNw33PuQ06p8nOScoo/BXwg/PCB8IHwwwfC
B8IPHwgfCD98IHwg/PCB8MMHwgfCDx8IHwg/fCB8IPzwgfCB8MMHwg8fCB8IP3wgfCD88IHw
gfDDB8IHwg8fCD98IHwg/PCB8IHwwwfCB3JcKYpIzuovq7hVzP6WtDFrlbeqWx3keiJf2Rkf
WV2yOi3ulkVG7fP7Vh9b/SN8IF2y0Jz8YSpl/1sbAEbkA/nv9gaXyAW72orwgTSTbsL4NhrV
K4mEXrb6fnpar87MeAA/3b3rxyvN73tlp8nW1pYbpB3Gex5GNPqWJhKv+rp+/R0/zs+f16mp
N/ytz8y80gGHD8RntglkMgg0EovpzVxOv5mY0Gi5rFfv3NHvJic9gJv5fBuQzc1NKZfLsr29
3VYiL3ogQfCoxmIXNZd7RiORd7VeH/FAguAxf+v5/Dk+kG5xUxgb0LL+aDTavi/3aVkif9vR
h/q2rEZjpKNtfc5vWZ0p2DTO9gNjx5asdodc2EW+2H9auq8dI3b8Q6ui8Bf1IePWiAc5v1Kp
yMrKvQX7Qa/HBxICEFd8ICcAyM7Ojj+3VqvxgfzfQKrVqjQaDQn7iUMDca3GTWC9Xj/g27n4
7W9Y1+MDaWk56+vrcpinI8zr8V1W02UlnM+yttPqshoDtrzuZbG3yzpjbeyMjS+0uKwK32Ud
lctq3U3xXVYILutaMqk/pFL649ycH38tFDyAGwsLfvw5nfY6pZvL2ttRtbqsZPKCplIv69zc
S+avLmk2+7zXKJnMqL/1dHpUy+XH+eqkM8kmEAfgcjyuE2trem12VsfMaY0tLemXkYjuHZ+u
Vu9zWRsbGx7MPZd13gMpFJ7SePw1XVs7q7duvWkwzrXJxULhSVtvTvOB9HNZU5WK/pLJ6G+l
kp90N/5p3ckLx/Fxf6zVZXXbUYnM77usSuUR/0QsLz/tb7dUekJv337dwxkff3v/aRH5jN+y
wnBZvXZUfJd1jC+GpVJJisWir+NWMXwgXSbQvYEHQeCLD+QEAGndUbnjB5lkPpCQgfRyVO4d
ZHd3V/hAjtFl9XJUrQ6rXxvju6yQXVa/HVXnU9Cr1fFdVkguK2Pj8hAu6/6n5us+LusTvss6
SpfVDoLvso7cZTmVMrG6ug+mN4zhXJb7vLp6lq9ODuuyxhYX9UY2OwSQ4VzW4uKzBuk5PpDD
uiz3i8bfa7UhfpflXNbIQJflfslYqz3cbFuf8ltWGC6r/zrCd1n88IHwgfDDB8IHwg8fCD98
IHwg/PCB8IHwwwfCB8IPHwgfCD98IPzwgfCB8MMHwgfCDx8IHwg/fCB8IPzwgfCB8MMHwg8f
CB8IP3wgfCD88IHwgfDDB8IHwg8fCD898i/yRZSg2d3sdAAAAABJRU5ErkJggg=='
]

{ #category : #sources }
RTRoassalExample >> exampleUseOfDecoration [

	| view element decoration |
	view := RTView new.
	element := RTBox new size: 50; color: Color blue; element.
	decoration := RTDecoration new 
						shape: (RTEllipse new color: Color red; borderColor: Color black; size: 10)
							tooltip: 'Set red color'
							action: [ :anElement | 
											anElement trachelShape color: Color red.
											anElement signalUpdate. ];
						shape: (RTEllipse new color: Color yellow; borderColor: Color black; size: 10)
							tooltip: 'Set yellow color'
							action: [ :anElement | 
											anElement trachelShape color: Color yellow.
											anElement signalUpdate. ];
						shape: (RTEllipse new color: Color green; borderColor: Color black; size: 10)
							tooltip: 'Set green color'
							action: [ :anElement | 
											anElement trachelShape color: Color green.
											anElement signalUpdate. ].
	element @ decoration @ RTDraggable.
	view add: element.
^ view
]

{ #category : #icons }
RTRoassalExample >> exampleUseOfDecorationIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAABFElEQVR4XuXYsQkAMAhFwb//
0JoMkIBNIHAP7MXrTLffT8U/gQ/i54P4IH4+iA/i54P4IH4+iA/i54P4+SA+iJ8P4oP4+SA+
iJ8P4oP4+SB+PogP4ueD+CB+PogP4ueD+CB+PoifD+KD+PkgPoifD+KD+PkgPoifD+Lng/gg
fj6ID+Lng/ggfj7IZenMpnY+iA/ig/ggPogP4oP4ID6ID+KD+CA+iA/ig7yuhvmvEz8fxAfx
80F8ED8fxM8H8UH8fBAfxM8H8UH8fBAfxM8H8fNBfBA/H8QH8fNBfBA/H8QH8fNB/HwQH8TP
B/FB/HwQH8TPB/FB/HwQH8TPB/HzQXwQPx/EB/HzQXwQPx/EB/HzQfzOLZ+d5T9+ROpBAAAA
AElFTkSuQmCC'
]

{ #category : #sources }
RTRoassalExample >> exampleUseOfMetrics [

| metrics classes view mb xAxis yAxis refresh elements |
refresh := nil.
metrics := Array with: 
	(Array with: 'LOC' with: #numberOfLinesOfCode) with: 
	(Array with: 'NOM' with: #numberOfMethods ) with:
	(Array with: 'NOA' with: #numberOfVariables).

classes := RTObject withAllSubclasses.

view := RTView new.
view @ RTDraggableView.
xAxis := metrics first second.
yAxis := metrics second second.

"Preparing the menu according to the provided metrics"
mb := RTMenuBuilder new.
mb view: view.

metrics do: [ :tupple |
	mb menu: 'X-axis' submenu: tupple first background: Color green callback: [ xAxis := tupple second. refresh value].
	mb menu: 'Y-axis' submenu: tupple first background: Color green callback: [ yAxis := tupple second. refresh value ].
].

elements := (RTEllipse new color: (Color red alpha: 0.3)) elementsOn: classes.

elements @ RTPopup.

view addAll: elements.

refresh := [
	RTMetricNormalizer new
		elements: elements;
		fastSmoothTranslation;
		normalizePosition: [:cls | (xAxis rtValue: cls) @ (yAxis rtValue: cls) negated ] min: 0@0 max: 200 @ 200.
	view signalUpdate.
].
refresh value. 

view canvas addShape: (TRLineShape new from: 0 @ 200 to: 200 @ 200).

view canvas addShape: (TRLineShape new from: 0 @ 0 to: 0 @ 200).

^ view

]

{ #category : #icons }
RTRoassalExample >> exampleUseOfMetricsIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABeCAYAAADVA7GfAAAC2klEQVR4XuXbvUojURjG8bkC
G+/AexHBxivwAqKdtkLYQtgiWG1nq52wTRZZhZVdkrCVFq4oKqKLRYyO4gdR8/HoeyYjJtEY
B42Z+H8OL4SYOYHzyznHSWa8uzt+4hTv4cGKtWTE1pyox7v35KcFiBsgL2J72lm09hwqH6Qe
JNNi6BQB5I/Vv9f1wQdpB/LThumH1YrVrNU3q69W362+hMOYskq8AJIOa85q3Oq3VdZq0moh
7KPf6j8fpD2IDZJXDAfNDeQvq5zVplXBqhz+LfsCyN+64x1sNexj0SrvPc4i/gzh7yE9BVJR
RaWIrbmzqMe79+QTtADhhw/CDx+ED8IPH4QPwg8fhA/CDx+ED8IPH4QfPggfhB8+CB+EHz4I
H4QfPggfhJ+H6PhYOj0VAkTlsrS9Hevf05XPy6FgZojOz/kXOPCXLD4IP3wQPgg/fBA+CD98
ED4IP3wQfvggfBB++CB8EH74IHwQfvggfBB++CDvEG1sSGdn4oPwwwfhg/DDB+GD8MMH4YcP
wgd507lFpSLlcm3PLbSzI21tiQ/y1gE/OZEymU9zQtf7IKWSND8vZbOf6hPe00uWLi8VzBT+
LInBDDk4kGZmgkv+u3HZPx+kHsPdHzIxIU1NSdWqXvN6PkgnQVxGR6VEQs33iejoSLq6anxu
d/fJc3yQ90YZHpbGxoJBrl+2gsc3N+IvWR+JcX0tDQzUliz75KtQ4O8jXQW5vZX6+qS1NQVL
1Pq6tLzMB+kaSDoteZ40PV1D8f0ARMVi495hG77298UH6TRIKlUDGRyUlpaCQXdpeI3huNuS
dXjIB+k4SDJZAxkZCU4K3X9aWl1tBHEYwH2layD+0JB8+2LQt+UqrsUBubiQ9vb4m3iczkP4
4YPwQfjhg/BB+OGD8EH44YPwQfjhg/DDB+GD8MMH4YPwwwfhg/DDB+GD8MMH4YcPwgfhhw/C
B+GHD8IH4ecjcg8nrAVd+NhQ9wAAAABJRU5ErkJggg=='
]

{ #category : #sources }
RTRoassalExample >> exampleVectorEditing [
	| view selected statusBar |
	view := RTView new.
	selected := nil.
	statusBar := nil.
	
	view when: TRMouseClick do: [ :evt |
		selected == #line ifTrue: [ 
			| ex1 ex2 line |
			ex1 := (RTBox new size: 10; color: (Color purple alpha: 0.2)) element. 
			ex2 := (RTBox new size: 10; color: (Color purple alpha: 0.2)) element.
			ex1 translateTo: evt position.
			ex2 translateTo: evt position + (100 @ 60).
			ex1 @ RTHighlightable.
			ex2 @ RTHighlightable.
			ex1 @ RTDraggable. 
			ex2 @ RTDraggable.
			line := (RTLine new "width: 3;" color: (Color blue alpha: 0.2)) edgeFrom: ex1 to: ex2.
			view addAll: (Array with: ex1 with: ex2 with: line ).
			line trachelShape pushBack.
		].

		selected == #circle ifTrue: [ 
			| ellipse |
			ellipse := (RTEllipse new size: 40; color: (Color yellow alpha: 0.2)) element. 
			ellipse translateTo: evt position.		
			ellipse @ RTDraggable. 
			view add: ellipse.		
		].

		
		selected == #rectangle ifTrue: [ 
			| box |
			box := (RTBox new width: 40; height: 30; color: (Color blue alpha: 0.2)) element. 
			box translateTo: evt position.		
			box @ RTDraggable. 
			view add: box.		
		].
		view canvas signalUpdate.
	].



	view @ RTDraggableView.

	view addMenu: '+ line' callback: [ selected := #line. statusBar text: 'line' ].
	view addMenu: '+ circle' callback: [ selected := #circle. statusBar text: 'circle' ].
	view addMenu: '+ rectangle' callback: [ selected := #rectangle. statusBar text: 'rectangle' ].
	view addMenu: 'Info' callback: [ TRPlatform current inform: 'Vectorial editing is hyper cool' ].

	statusBar := TRLabelShape new.
	statusBar text: 'Please, select an option'.
	view canvas addShape: statusBar.
	statusBar setAsFixed.
	TRConstraint stickAtTheBottomOfTheWindow: statusBar.

	view canvas color: Color white.
	^ view
]

{ #category : #icons }
RTRoassalExample >> exampleVectorEditingIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABjCAYAAABt56XsAAADFUlEQVR4XuXVS0tqURyH4b5w
gd+gUeUgCCIowYGTDBRxEIGoYYSRN8QLEhlWWpQpmVkNtH51/ou2FOcyOJwD0fuCqPuy9nY9
e+HM6yu/r9QMfwq+MMhgMNDfDtRut/UvbuhX4wyHw+m2RqOhbw/SbDbdj8xkMkokEopGo4pE
Isrlcp9+vHdcKBTS7u6udnZ2lE6ntbGxocXFRWWz2d9O1tramra2tnR4eKhkMqmFhQXFYjHZ
NQOBgAqFgvL5vJaWltx14/H4dCw7x7uv1dVVhcPhn+7t24CUy2X5/f4pyMHBgVZWVuTz+T5N
ysfj5ufn3UTay7YZytzcnAOZTCbTc7a3t91EemMb5Obmpur1ukOYnZ3V8vKyu6adb9cwkPX1
dXfcRxDvvuyeSqWSgsGg+P8h/7Gnp6c/rjD+nzo/Pgg/PggfhB8fhA/Cjw/CB+HHB+GD8OOD
8EH4U8AH4ccH4YPw44PwQfjxQfgg/PggfBB+fBB+fBA+CD8+CB+EHx+ED8KPD8IH4ccH4ccH
4YPw44PwQfjxQfgg/PggfBB+fBB+fBA+CD8+CB+EHx+ED8KPD8IH4ccH4ccH4YPw44PwQfjx
Qfgg/PggfBB+fBB+fBA+CD8+CB+EHx+ED8KPD8IH4ccH4ccH4YPw44PwQfjxQfgg/PggfBB+
fBB+fBA+CD8+CB+EHx+ED8KPD8IH4ccH4ccH4YPw44PwQfjxQb4RSKVS0cXFharVqobDoV5e
XnR9fS3badufn591f38v74ROp+M+93o9XV1dyd7t+/n5uY6Pj93nwWCgyWSim5ub6Xndblfj
8Vi27+joSJeXlzo7O9NoNHLj8CneQfb3992E2HsikVCz2VQ+n1e9XlexWFSpVFKtVptOWLvd
VjqddvtPT08dZKFQcJNdLpfdcalUyo3h7dvb29PJyYkbx65j22OxmMNPJpOyh4JP8Q5iT7b3
hNsTaxN+e3srWwkPDw9u9djLWxm2WlqtljvOnnbbZyvBVoB9tmN+QNlLd3d37jw71sa2ibfr
2OqwMR4fHx1qv9/ng7z3Bl50tq2EUZhJAAAAAElFTkSuQmCC'
]

{ #category : #sources }
RTRoassalExample >> exampleVisualizingSoftwareWithBeziers [
	"
	self new exampleVisualizingSoftwareWithBeziers
	"
	| v inheritanceEdges shape helpBar1 helpBar2 elements eb classes |
	
	"The variable classes contains the Pharo classes that will be represented"
	classes := Collection withAllSubclasses.
	
	v := RTView new.
	shape := RTEllipse new
		color: (Color red alpha: 0.4);
		size: [ :e | e numberOfMethods / 5 max: 5 ].
	elements := shape elementsOn: classes.
	elements @ RTPopup @ RTDraggable.
	v addAll: elements.

	"Defining edges from inheritance"
	inheritanceEdges := RTEdgeBuilder new
		view: v;
		objects: Collection withAllSubclasses;
		connectFrom: #superclass to: #yourself.

	"Layout the whole thing"
	RTForceBasedLayout new on: v elements edges: inheritanceEdges.

	"Defining edges from dependencies"
	eb := RTEdgeBuilder new.
	eb view: v.
	eb objects: classes.
	eb shape
		bezierLineFollowing: #superclass;
		color: (Color blue alpha: 0.1).
	eb connectFrom: #yourself toAll: #dependentClasses.
										
	helpBar1 := TRLabelShape new
		text:
			'Circle = classes, size = number of methods; gray links = inheritance;'.
	helpBar2 := TRLabelShape new
		text:
			'blue links = dependencies; layout = force based layout on the inheritance links'.
	v canvas addFixedShape: helpBar1.
	v canvas addFixedShape: helpBar2.
	TRConstraint stick: helpBar1 above: helpBar2.
	TRConstraint stickAtTheBottomOfTheWindow: helpBar2.
	^ v
]

{ #category : #icons }
RTRoassalExample >> exampleVisualizingSoftwareWithBeziersIcon [
	^ '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
t5T/yz92IvXRDqRfGUPpU6OIOwPMqMf2TPpTPwVw4MCom9xXXKzWxfBMkUqVGpercxAIvrq6
+vJHb779Cw+/oN6E0tbFV3k5toYUWhGn2orsu8CsArbdVJMHmQGqvB//PsAYe5U89yD5IvwC
U4QoTUx/DmxgEyIrq0pOebiiorMvkZien5rae3RiYvnCq5c//O2ZvpPfjjA7roN3nNIx+BpF
vN0jfO3KZuViWacZyKt9sVj05/+1oaX3+lHhQcKUdlR1HE+x0rWUYHC8b3QcVev30J4pQBHs
AdKCRRfLqXgsFutsamrqkclUWp+oIoEJuOJlRk+mpU1Mcjizc2AwbEG5o/VSz5RCURfdaNUl
QRnKTO6NWxrG0p1OpD22plMqj/oQ8hUgjgxmWUor0r3ehtY1oZjJrxOKY9gpz6P1Jg98IQYm
0+B21zYm+y7ue+jY7DSk1BTwhmfT0p6/AM4mTLvsqiqw7ioUoNGxvb13FGXMJNLrL+Vy/vhn
G+Jgn0pr6/2aIhHYDK4tFvLuLavBKIn1FLO8XGustVS30V92JemUbYs71tIygxGPp6V1dNQY
eg/0ZvsvgGhqR6aTcu4//bYk7Uf/AswJoZKB+7mAEUYjNhV7a1FhP0IiUUGBtMzp9EfOnbv0
GqSIytXtkI4YIbe0pcXjg3qE9LRhEOgXE/a0poq4ZD94drbXa2Mc/2Ch79ZPJrRz7ygzvvu7
ZvHuL5ejj37ejLznJxBjMh+xij2e5i6NZmq2oODM+fHIu5/M9n/nDyH5c7dfPPOtX1ssjW1s
dlGRxdLau7Bw4429e1++6y8LjW/UJlgJworQ5/NRq7RnVrTB0revr28SDsGVlpaWC4VC0fGx
sYun2mffstt7h8XiSh04WjmIJ3RmljY2NOw5nEisPG+375h4sX//V25N7Xv/pYPf+M+L+7/2
7xfm7vzsrRdu/axdf/37EeH8OwrufmyOTyTWlshicR4y1spQmkKKmGVxS+041CmRSMqg3srK
SkM5YihguS2XW109PSN7o9HukbBIFF06snLFZvOH3e7qmk8toad37VoA1yico8JOuXsOnwiH
EwUlDiNuSiSaAaIAEyBOrw9FbDY4p5uXtx3hNYJXXaC4fZkrXx1H+Yve9GPvjSH2FBZfJyD8
4ZMlspRTiDk5KpXRDgodFhdxg2EDPSIQwLIcjhHBvkitNjvr6yOtUH+byTnM5/M/HWeGVdS1
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
QmCC'
]

{ #category : #sources }
RTRoassalExample >> exampleWorm [

| v s e last lineLength callback nbOfElements head |
v := RTView new.
s := RTEllipse new 
				size: [ :m | m * 10 ]; 
				color: (Color blue alpha: 0.4).
nbOfElements := 10.
last := nil.
1 to: nbOfElements do: [ :i | 
	e := (s elementOn: i).
	v add: e.		
	last ifNotNil: [ v add: (RTLine new edgeFrom: e to: last) ].
	last := e.		
].

lineLength := 40.

callback := TRTranslationCallback 
	block: [ :shape :step | 
			| diff alpha dist |
			(shape element outgoingEdges collect: #to) do: [ :el | 
				diff := shape position - el position.
				alpha := diff theta.
				dist := ((diff x * diff x) + (diff y * diff y)) sqrt. 
				el translateBy: (alpha cos * (dist - lineLength)) @ (alpha sin * (dist - lineLength)) ] ].
 
v elements do: [ :el | el trachelShape addCallback: callback ].

head := v elements last.
v when: TRMouseMove do: [ :evt | 
	head translateBy: (evt positionFromCamera - head position) / 10.
	v canvas signalUpdate ].

head translateBy: -150 @ -150.

	^ v
]

{ #category : #icons }
RTRoassalExample >> exampleWormIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABjCAYAAABt56XsAAAE30lEQVR4XuWb7UsUURTGj1pg
EL2gtBYo0rC4gS6xrtpWhNALSAYRqR+CNMQ3FHxBwxeULBPLD64vVFaIbUUJuuJLiiSSRmQv
CPUX1eEyzMzOzDq7zqwfnh9cdJmZ/fA8e+8595w7hA8++OCDDz744IMPPvjggw8++OCDDz74
4IMPPvjggw8++OCDDz744IMPPvjggw8++OCDRFISkc9HdPMmUW2tMq5eJcrNxdcnoVy5ojXB
bPj9+Fo5yvHjRDU11syQR1kZvm6OcPhwbEaox927+PrZTlVV/IbwKC3F19A2zp7dmxnycLnw
tbSFeA2orydqaFA+37qFr+WeOXIkNhMePyZ6+9Z4DA2JdBmfPZCfb82I+/fNjVCP5mYiScLX
1VFDenqsmcHjwQPxzPnz+No6Ykh7Owt95kx4OSnJiiH9/cqzmZn4+tpuyPS0LLbHE17KyZlb
im5Ia6v2efyYEiPp6eZmdHVFCr67KZHfwSk1PjalvcGgkejmpoTDRAMD2sFpMT4xEggYG2K+
NGlN+fSJ6Pt3otlZ4/u5WJmWhq9zTFRWxmKIbIrL9fW/EdvbRBsb0ZcxLlqePImvs2VYrNgM
YRMyMnb+uFy/dojev7cWV44dw9faMqdOacvvk5PmIvPyxDNja8vjWV4zD/ShkNaQGzfwdY6J
o0eVBtXDh+aGbG4SrazsHuiHh/Uzj8s1+MQxWwoKiJ490wo8MiKyp48frWVfLS16Q3jvg0+c
nDunF7Sx0Vr2NT4uzItMn/l5txtf27jh5pPaEN6N75Z9hRf0s0sebBR/z+XL+NrGTUmJtg8S
LfuanPR45hbNA/2TJ/idRlvgMsidO+YpMde9eIniGRAt0Pf1aWcc/vK1Rw4eFD14dYmE4wKL
29SkFl+SZhf0phhVBfBxqAbG5mhnhNYUdXlePVJT8fV0ZHc/OGi0nAlTpt7pkwN5hhUW4uvp
iClmPfdgUJK6+nJyevpFO5h38Orr3d3i+awsfE1tgX/hLOijR1qhJyaI2tpkwyRpOGgc6Ovq
FFPz8vD1tBW1uPoNpT7Qv3mjv5dLOPjYhNlhba5rGQX6zk79vdeu4etoKxUVu5XzhSmvQ+Yd
S3wcLrlExo3BQQ70p0939uIbkjC4dctntKqrhQlTUyLN5fKLHOjl7Es+kMcVZb6XZxn+IQkH
KS42W56EKVOq2TM2plxnMw8dwtfPdqK9gzI0pAT61VWimRmi0VGln3LvHr5+jpCdHe2EiyR9
++l2f/6ijTV8epLv8Xjw9XMEPmJaXq6YwbNA3o/Mz0vS/LLb/WOH/9eW6y9exNfO8dnC7Vxu
VPGBbtmYDx/c7t9/fb7NbfH56VNhCMcgfBKE/iyx17u05vMtrxN1dIhrly6J3smBA/h6JWzP
wvFCbv2GQl7vxCufb/ylqImpSzLc68fHQfhXf/u2UcDPy5tfCQReTItzwnJVmMf16/i6OUpy
sogpvO9Qm9LR4fePvwwEltbFzHn+XLmWkoKvW0LhzErsU/z+xTUlFZbjCn7/JMEUFQnhufWr
3ptw7x7/FOQ+cOKEtl/Pb/r29uLv3vcVo9OTPPBfb9hH+FVrDvgXLoi/+K814IMPPvjggw8+
+OCDDz744IMPPvjggw8++OCDDz744IMPPvjggw8++OCDDz744IOPbfwDrvFXiiOUZrIAAAAA
SUVORK5CYII='
]

{ #category : #sources }
RTRoassalExample >> exampleWrappingText [
| v el str t block lb |
v := RTView new.
el := RTBox new
	width: 200;
	height: 300;
	borderColor: Color black;
	element.

v add: el.

str := String loremIpsum.

t := (Smalltalk at: #RTText) new "This line is for compatibility with VisualWorks"
	width: 180;
	text: str;
	wrapText;
	element.

v add: t.

(RTConstraint on: t background: el)
	stick.

block := [ :aShape :step |
	t shape width: aShape width - 20.
	t update.
].

el addCallback: (TRTranslationCallback block: block).
el addCallback: (TRExtentCallback block: block).

el @ RTDraggable @ RTResizable.

lb := RTLegendBuilder new.
lb view: v.

lb addText: 'Try resizing the rectangle by clicking near the border.'.
lb build.

^ v
]

{ #category : #icons }
RTRoassalExample >> exampleWrappingTextIcon [
	^ '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
rkJggg=='
]

{ #category : #sources }
RTRoassalExample >> exampleforAddWithEdges [

| v es elements edges |
v := RTView new.
es := (RTBox new color: Color white; borderColor: Color lightGray) elementsOn: (Array with: RTLayout with: RTShape with: RTBuilder ).
v addAll: es.
es @ RTDraggable.

RTNest new
	for: es add: [ :group :model |
		elements := (RTBox new color: Color red) elementsOn: model withAllSubclasses.
		group addAll: elements.
		edges := RTEdgeBuilder new
			view: group;
			objects: model withAllSubclasses;
			connectFrom: #superclass.
		RTTreeLayout on: elements edges: edges .
	].

RTGridLayout on: es.

	^ v
]

{ #category : #icons }
RTRoassalExample >> exampleforAddWithEdgesIcon [
	^ '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
cAAAAABJRU5ErkJggg=='
]

{ #category : #sources }
RTRoassalExample >> exampletimeLines [

| classes oldestAge v elements |
classes := RTShape withAllSubclasses.

oldestAge := (classes collect: #ageInDays) max.

v := RTView new.
v @ RTDraggableView.
classes doWithIndex: [ :c :index |
	elements := RTEllipse new elementsOn: c rtmethods.
	v addAll: elements.
	RTMetricNormalizer new
		elements: elements;
		normalizeX: #ageInDaysAsInteger min: 0 max: 200 minValue: 0 maxValue: oldestAge.
	elements translateBy: 0 @ (index * 10).
	RTEdgeBuilder new
		view: v;
		linkElements: elements.
].
^ v
]

{ #category : #icons }
RTRoassalExample >> exampletimeLinesIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAADtUlEQVR4XuWcB27jMBQFff9T
uvfeK7N4wnKhFUKr2iQ1DyBkIbaiePgb+ZXOzw9fIanD/wr4QPjiA+ED4YsPhA+ELz4QPhC+
+ED4QPjiA+GLD4QPhC8+ED4QvvhA+ED44gPhA+ELD+R+v5u613i9XubxeJgm72u73Zrdbmdw
QObzuTkcDrXGZrMxi8XCrNfrxka32zW9Xs9cLheDAnI6nUr9wS5LKGJp6fekr2P+Sq8F4Pl8
GqzLGo1GpWauyxJkaXmfTb8ne53VapUcJ5NJ8vp2uxl+UPcsWYcs53w+G36WFYCm02liOePx
mA/EFSvSvj4bJ9IzOfuz6/WanPt2Pa0Bopm63+8Tvy5XoqEYoFRUQ5mVZrIrhmi2KwObzWZB
BOlWuqwqNYug2s9lwbgyNmV+sjCbefGBNFiz9Pv9f9azXC4LZWbK/GRhPoN7dEFds1cVepnP
CNC7c77LqiHNXsWRMtYyGAz+swSd84FEIMUaxR0dfcURPpBMImDji6840gmh7rC1Q1OqUoPo
PnwtKAYDRG5BdYcyG1tn1B1aPlcNojhTZug+tJ7FjyENStlXkQxMcaJspsYHUkEq7OT/86xI
caLs8j8fSEGX10Q2ZGsb9H5IUzWJMiO75lV16Bp2nQy7H2L9uM91I76FZNanbFZUd2+97tA9
yDr4O4YVpS+wrcVplEDUGcIH8uXqPW/N6ZNVOx9IRrbnylVHyNfrWCQ+qGpvoikPBeSTVXMI
nSTRAVHVrNlct574bYTQSRIdkKKrvfZ9rhjjqmt89upGCaRof65Whd91MdouxOxQry4fyAcs
hKBgLCS24IsvDG3qWqXrJF2/SK6dQf0O32tr0QCxvVlaNlFc0LHssDHGtUMZgqXimhxCLxJx
QGRpfCAVsq4izw42/XwhH4hD8vfy53nrVHpPCBtcOJeV9ft5/VPH49HwgXwhw7JD/VPveqyG
wyEfSNPSPoaaD/iFYSBSXaBnPGJ8Coqf9vLrEH4dwgfyBYUQs/hAUlLM4gPxoJArfCQQVfh8
IPzMig8klsyKbyF8IHwLiQoIv+skMCDa427bvgbfZRWsN+x/j+MD8VRvpPt81VGivRT9d6BQ
V5GDBJLuu3o3m9vYXBckkHQ3vHqpdN6GzvZWuaxP1hJKKLRDKYuTdSrr8+XSoutc/NRTuHrS
ShYni1TW56tRgr/8zndZfPGB8IHwxQfCB8IXHwgfCF98IHwgfPGB8MUHwgfCFx8IHwhffCB8
IHzxgfCB8MUHwtfv+gNX61dLNkTxDQAAAABJRU5ErkJggg=='
]

{ #category : #accessing }
RTRoassalExample >> label [
	^ 'Plain Roassal'
]
