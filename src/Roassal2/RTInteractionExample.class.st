"
self new installTitle: 'GroupOfGroups' 
		code:
		'
^ v'
	
"
Class {
	#name : #RTInteractionExample,
	#superclass : #RTAbstractExample,
	#category : #'Roassal2-ExampleBrowser'
}

{ #category : #sources }
RTInteractionExample >> exampleDragAndDrop01 [

| v e1 e2 |
v := RTView new.

e1 := (RTBox new size: 10; color: Color gray) element. 
e2 := (RTEllipse new size: 30; color: Color blue) element.
e1 @ RTDraggable.

e1 translateTo: 50 @ 50.
v add: e1.
v add: e2.

e2 @ (RTDragAndDroppable new 
			host: e1;
			do: [ :fromElement :toElement | 
				| newElement alreadyNested |
				newElement := (RTBox new size: 20) element.
				v add: newElement.
				alreadyNested := toElement nestedElements.
				toElement unbindNestedElements.
				RTNest new
					layout: RTGridLayout new;
					on: toElement nest: alreadyNested, (Array with: newElement) ]).

	^ v
]

{ #category : #icons }
RTInteractionExample >> exampleDragAndDrop01Icon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAABU0lEQVR4XuXWwQmDMBiG4dz0
5kDiTVxLL26mE7jPZysUWtoB1D4v5B7ykD8p++53pYp/BD6Inw/ig/j5ID6Inw/ig/j5ID6I
nw/i54P4IH4+iA/i54P4IH4+iA/i54P4+SA+iJ8P4oP4+SA+iJ8P4oP4+SB+PogP4ueD+CB+
PogP4ueD+CB+PoifD+KD+PkgPoifCrKuSdclTZPMc+KDnNiyJOW548/V9/+FciuQtv0FKcW/
Iad1jCkf5EIdb8Y3Rl37I+vUhuGNUlXJtvkgfj6ID+Lng/j5ID6IHw0yjmOmadqT+3yN/xrk
wPBBLlRe+SPLzwfxQfx8EB/EzwfxQfx8ED8fxAfx80F8ED8fxAfx80F8ED8fxM8H8UH8fBAf
xM8H8UH8fBAfxM8H8fNBfBA/H8QH8fNBfBA/H8QH8fNB/HwQH8TPB/FB/HwQH8TPBxF7ALBq
biDM8YpuAAAAAElFTkSuQmCC'
]

{ #category : #sources }
RTInteractionExample >> exampleDraggingChildren [

| v es |
v := RTView new.
v @ RTDraggableView.

es := RTLabel elementsOn: (1 to: 40).
v addAll: es.
RTEdgeBuilder new
	view: v;
	elements: es;
	connectFrom: [ :aValue | aValue // 2 ].
RTClusterLayout on: es.
es @ RTDraggableChildren.
^ v
]

{ #category : #icons }
RTInteractionExample >> exampleDraggingChildrenIcon [
	^ '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
AAAASUVORK5CYII='
]

{ #category : #sources }
RTInteractionExample >> exampleExpandable [

| v s es expand methods |
v := RTView new.

s := RTShapeBuilder new
		rectangle;
		width: [ :c | c numberOfVariables * 5 ]; height: #numberOfMethods.
		
es := s elementsOn: RTShape withAllSubclasses.
v add: es.

es @ RTPopup @ (RTLabeled new setAsHighlightable).

expand := (RTExpandable new
				group: [ :group :element | 
					methods := (RTBox new color: Color red) 
										elementsOn: element model rtmethods.
					RTGridLayout on: methods.
					methods @ RTPopup.
					group addAll: methods];
				afterBlock: [ RTGridLayout on: es] ).
es @ expand. 

RTGridLayout on: es.
^ v

]

{ #category : #icons }
RTInteractionExample >> exampleExpandableIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAEi0lEQVR4XuWc6U7kMBAGef+H
HM7hvob7NFBWvshEmYUfu0tCtWT5iJ0MXU63Z0T3xtubX6YkG34V+IH4xQ/ED8QvfiB+IH7x
A/ED8YsfiB+IX/xA/OIH4gfiFz8QPxC/+IH4gfjFD8QPxC9+IH75GSCXl5fl+vq6XFxclIeH
h7K/v1/7FPop9/f35eDgoI4z5/DwsGxvb5fz8/PaPjk5Kbu7u+X09LTO29nZKavVquzt7dV5
jNFmDus3NzdrvVwu67P5HFdXV+Xo6Kjej3HuzT1ubm5qzee4u7ur5enpqf9cXHt5eantXwOE
P+719bU8Pj7WPn9cV/q5KBuFMrdV4vHxca1RYJSOwmkDinW0gUTZ2toqi8WiAgEUNSCouQeF
ezLGM1iP0il8Np718fz6mRijBhqgfq3JAg6SNnXbz1j67ND2WtunjSJzDXl+fq47P/1cy31Z
gwzXtZ9nWOt9CDuVXZ1CP2Nte+z6d+e0436n/oVgNj5MU1/oZ6xtj12nYJqGc8bGMq4HguNk
Z2KbMS/4lLSpO+fcKw27j0OmnZ3dXsdR41PSxzewxg/km3J7e1uVnz72HCWiVEB9OORPSsNB
47BpUwNgoNje4bMWGHH0UzNNk31DOHW1/ZxyeEPOzs4+2XlA5WTEKQyF52ibkxRrqJnLPO7T
PsP/xfAvQMt3g9ac5btCSjufOXOCMCsgY/a+deI5NQ3nT8Un6ICsm+8H4gfiB+IH4gfiB+IH
MnMg/HrM+P/4ZdYP5BtA5i5+IH4gfiB+IH4gfiB+IH4gfiB+IH4gfiB+IH4gfiB+IH4gfiB+
IH4gfiB+IH4gfiB+IH4gfiB+IH4gfiB+IH4gfiB+IH4gfiB+IH4gfiB+IH4gfiA/KYRDE6xJ
EGdyk1ATqkYE7TogzCewk8J67rUuypaIX55D2g4/kC+E0AGiaAFB6DNBm4Q9U/4EJIlkyHNC
YT1rSEbDOv4DPjlVAEIhyjeBo0Tq0vcDGRF2brIEoUAgoXBqIFFQYBf4X4P/83Z0GRxKgkBp
p04WIiAwRjIZInQT3Tu1aN3J5zoZlrGcJ5k7h8QAkweSmPLkrcoupk1Wh2R3SK6r+A7elDh2
3qg2B8pQki1o7K30AxkIqTCw9ygYxeMD8AvU7PgkKCNdRlfeyIXVtrt0G30OLe6HecPMxc9w
LQnJgEsNWD+QgXCaQmlJVIZy4+S5RmlynNTEZAGSMYClAIRx3pQcCrgva+LkOZHxBgJNCQST
gVnK6SaZf6jjXNm9SFLtxS/EITMn2eko9Nu5Ee6X5GZ+H7JGOG7GN6BMdij9JIpJtp602eW8
JTFbncnqj7sxczFlzMHcsYZdz/Pin9okNH4gDZCUHEdRILY9CStRchJdJrsP1zFX9AHQmaqa
hilAgJZjcXIwAppo3GQWAtRcktFM5ti7TmFtxp9h9p+5ZvyZ9W9Zw+8hSeP3W2V2iZT9QPxA
/ED8QGYkw5R+fiB+8QPxA/GLH4hf/ED8QPziB+IH4hc/ED8Qv/iB+IH4xQ/EL34gfiB+8QPx
A/GLH4gfiF/+kbwDIevKLIeDipEAAAAASUVORK5CYII='
]

{ #category : #sources }
RTInteractionExample >> exampleGhostDraggable [
	| v e e2 |
	v := RTView new.
	e := RTBox new
		color: Color blue muchDarker;
		width: 150;
		height: 200;
		elementOn: 'drag me'.
	e2 := RTBox new elementOn: 'I am here just so the view isnt zoomed too much'.
	e2 translateTo: 200 @ 300.
	v add: e.
	v add: e2.
	e @ RTGhostDraggable.
	e
		@
			(RTLabeled new
				center;
				color: Color white).
	v @ RTGridView.
	^ v
]

{ #category : #icons }
RTInteractionExample >> exampleGhostDraggableIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAADgAAABACAYAAABP97SyAAABm0lEQVR4XuVZu07DMBQ1qAu/
wtCJX2BKBz4AWFqQmPgCEjYWNiZmxMJUiQG1E3/QD4Ad9bUUV8iK40ud1CpSjBrTVFg+kY58
c61c6+ocHccyk1IqWj5yGUtLbt28LZdlWW11TC3XOixNU6VfNExsy62b32adn3Ctw2ToDEp8
iQYoUT05Hs9zDIefpbhqbjTi+ShEsbg3DE4mXDGWUIGYyrFbrtd784vB6XS+aPCaCiRUjt1y
/f678spkNm8w9qfB+iV6tcBl6BKNQ5doErJE8V0Un0F8BvFNBl+ivzPY2LsLm8Hz41c6bd7Q
0ckzdTpdujh8oYPols7aT4GYzM5qbO7fr+Z38U0G32Tw90F8BvH/ZPAlii9RfIn+R4OmgImL
BhOqC1qitnU2yVX9xsrgbPalWq3HHFH0UIqr5gwGgw+FfzeBf32Gf32GL9FwJVqnLftWB99k
8E0G32TwTWb7JoPvovgSxWcQfx90bVC/CyHC3Qd1c5xz/H0Q/08G32TwJYovUXwG8RnENxl8
ieIfl/BP9PjnQXyT+VudbwqnpsQOME32AAAAAElFTkSuQmCC'
]

{ #category : #sources }
RTInteractionExample >> exampleGridDraggable [
	| v es |
	v := RTView new.
	v @ RTDraggableView.
	v
		@
			(RTGridView new
				color: Color gray;
				gridSize: 20).
	v @ RTZoomableView.
	es := RTBox new
		borderColor: Color black;
		color: (Color green alpha: 0.6);
		size: 30;
		elementsOn: #(#topLeft #center).
	v addAll: es.
	es first @ (RTDraggableSnapToGrid new gridSize: 40).
	es second @ (RTDraggableSnapToGrid new center gridSize: 40).
	es @ RTResizable.
	es @ RTLabeled.
	es first translateTo: 70 negated @ 90 negated.
	es second translateTo: 70 @ 110.
	^ v
]

{ #category : #icons }
RTInteractionExample >> exampleGridDraggableIcon [
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
RTInteractionExample >> exampleResizable [

	| v g |
	v := RTView new.
	g := RTGroup new.
	g 
		add: (RTBox new
			size: 100;
			borderColor: Color black;
			borderWidth: 1;
			element);
		add: (	RTRoundedBox new
			size: 50;
			borderRadius: 20;
			borderColor: Color black;
			borderWidth: 1;
			element);
		add: (RTEllipse new
			width: 100;
			height: 30;
			borderColor: Color black;
			element).

	v addAll: g.

	RTGridLayout on: g.

	g @ RTDraggable.
	g @ RTResizable.

	v @ RTZoomableView.

^ v
]

{ #category : #icons }
RTInteractionExample >> exampleResizableIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABeCAYAAADVA7GfAAACDElEQVR4XuXaQYsBUQDA8f3G
voK7D6EcuKGUi6McjRSRwkEphNx5s/u2dtut1WyZJru/f70Lr3eYXzMPz0ua+j1TL/4l8EH8
fBAfxM8H8UH8fBAfxM8H8UH8fBA/H8QH8fNBfBA/H8QH8fNBfBA/H8TPB/FB/HwQH8TPB/FB
/HwQH8TPB/HzQXwQPx/EB8mjy+USttttbqPdboev6zebzbBer9OP92ezWdrv94MPcqfj8fh+
wfIapVLpc+1Op3N37VqtFnyQAkGq1WrmunGOD1IQSJIkmXPjHB+kIJDfzg9v+SBPBHK73XwQ
/w4BQZbLZebcOMffQwoCqdfrmes2Gg3/U1ZRIPv9PrRarbtrDwaDcDgcfJAivxjG/aHX64Vy
uRzi63FUKpXQ7XbDs+wdFIj/W5YP4oP4ID6ID+KD+CA+iA/ig/ggPogP4oP4/SOQ3W4Xzudz
Oh6Pw2q1yrwbRqNRiD8ibjab4IPk2Nu5RFgsFg8/uiLQs5wA/lmQ0+mU5rmHDIdDH+SR5vN5
rpt6vNt8kBweWfFx8wjEdDp9/2fi9Xr1QfIqnuDFTT2OyWQSkiQJP52Nx00/An7M9Td1Px/E
B/HzQXwQPx/EzwfxQfx8EB/EzwfxQfx8EB/Ezwfx80F8ED8fxAfx80F8ED8fxAfx80H8fBAf
xM8H8UH8fBAfxM8H8UH8fBC/b70C+18/bEtmoXgAAAAASUVORK5CYII='
]

{ #category : #sources }
RTInteractionExample >> exampleSelectableElements [

|  b label labelShape |
b := RTMondrian new.
b nodes: Collection withAllSubclasses.
b layout flow.
b normalizer 
	normalizeSize: #numberOfMethods.

b build.

"Adding a label"
labelShape := RTLabel new text: 'Nothing selected'.
label := labelShape element.
b view add: label.
TRConstraint move: label below: b view elements.

"Changing the label according to the selection"
b view elements @ (RTSelectable new selectionCallback: [ :es | label trachelShape text: es size asString, ' selected elements']).

^ b view
]

{ #category : #icons }
RTInteractionExample >> exampleSelectableElementsIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAD30lEQVR4XuWcW0tqQRTH+3B9
oF76HkpPEb4E+VAQBXZ9SC1CUImIhKAo6EJQESjaBXJ5zhpYMmfO3rnNLjt/fxiWe/ZsH+bn
zFprXDrR6/GVJk3wp4APhC8+ED4QvvhA+ED44gPhA+GLD4QPhC8+EL74QPhA+OID4QPhiw+E
D4QvPhA+EL74QPjiA+ED4YsPhA/kC9VoNKRarcrFxYUsLS2J9qm1pvfDMf44s1HvYVaf5wNJ
qJubm55O5P39vdTrddc3Ozvbb9qnY87Pz+Xk5ESsX+WP39nZ+ec9zG5tbcnZ2RkfyCgKgZhs
wv0+/pb1g0D4PoQvHhBdAeYTfGtbk9/XbDZlYWGhv22p3zC/Ej4fjk3TSks1kE6nIw8PDxJC
UkeubdBEPj8///c8f4WMGGWFkZFvfThxTSOwMMJ6eXmRo6MjSaMP+jVbVggkDH2j2unpqZv4
6+tr2dzclHDLsvfmA/nEaOujn/LHx0e3cvhA+BqfKKtYLA6MnKLuJbF8IAmjLNtW1AeoP4ga
p2Pe3t6kXC73fQV/hXyBdJ9P2u7u7qTVan3I8oEklEZJSZolghpNWVQ1jOUD4ev3OvWwRTl2
c+j+cYn/Oo1HJGO1QvRIJMwh1I+oT/CBWEKo2xp/hfA1vnlI2KJOe+PyEn9seBLsWz6QEYH4
OUrS9+H7kC8Ewt+y+ED4QPhA+ED4QPj6ZSvEMvPQRoWucUfzcZZf5PADGXycdJyGzvwVMoSs
dtev332vTndY2263ZX193Vk+kATST7A2q/HVFaDnVX4Via2IQTYcb9UnegamX27xgSTQoBKf
JM3KgKLKgXzLB/INQKwMyID4Tp8PhK/xCHvDFiaJFsLa6e4gG1f7ywfySZk7f4XwgfCB8IGk
OOoKfQofyA8A+Ix8ZFDjAxlii/oOKHwgQ64Qfh6Sskz9vV9S2S+i4o5Lklg+kCGARP2Syqrc
1eoBZKlU6tf6+sclfCB8MY5O/NxDvzXkA0lRQsgHwgfCB8IHwhcfSKjp6Wk5PDyUtbU1mZqa
kpWVFdnf35e9vT1ZXV11q2JmZsb+AECurq7k+PhYlpeXJZfLye3trXvm74py15eXl5LNZvl/
rfFR6SROTk66yc9kMm6it7e3JZ/P918XCgU3wfPz87KxsSEHBwcyNzcnu7u7UqlU3D39fxO9
rtVqrqqED2REaVmOKux/fX2VxcVF168VKGq73a5LDPWeXmsFydPTU/+av2XxxQfCB8IXHwgf
CF98IHzxgfCB8MUHwgfCFx8IHwhffCB8IHzxgfCB8KeAD4QvPhA+EL74QPhA+OID4QPhiw+E
rT/v5CT+ky0riwAAAABJRU5ErkJggg=='
]

{ #category : #accessing }
RTInteractionExample >> label [
	^ 'Interaction'
]
