"
RTConstraintExample new installTitle: 'AboveTopOnLabel' 
		code:
		'
| v b e |
v := RTView new.

e := RTLabel elementOn: ''Happiness''.
b := (RTBox new size: 80; color: (Color blue alpha: 0.3)) element.
v add: e; add: b.

b @ RTDraggable.
e @ RTDraggable.

(RTConstraint child: e parent: b)
	above;
	top;
	stick.
^ v'
	
"
Class {
	#name : #RTConstraintExample,
	#superclass : #RTAbstractExample,
	#category : #'Roassal2-ExampleBrowser'
}

{ #category : #sources }
RTConstraintExample >> exampleAboveTopOnLabel [

| v b e |
v := RTView new.

e := RTLabel elementOn: 'Happiness'.
b := (RTBox new size: 80; color: (Color blue alpha: 0.3)) element.
v add: e; add: b.

b @ RTDraggable.
e @ RTDraggable.

(RTConstraint on: e background: b)
	above;
	top;
	stick.
^ v
]

{ #category : #icons }
RTConstraintExample >> exampleAboveTopOnLabelIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAABnElEQVR4XuXRMYrCUBSGUXfu
MhQJpBC1EQs3YCEiIgTrmB1YWIki8isTmGqmM8Iw54MLl/e6e3rPp99fquefwAfx80F8ED8f
xAfx80F8ED8fxAfx80H8fBAfxM8H8UH8fBAfxM8H8UH8fBA/H8QH8fNBfBA/H8QH8fNBfBA/
H8TPB/FB/HwQH8TPB/FB/HwQH8TPB/HzQXwQv/8KUhRFDodDVqtVbrdbJpNJmqbJeDzOdrvN
er3O8XjMbDbL+XzOfr/PYrGID/KhBoNBqqpKWZbp9/vt2xfGbrdrDz+dTjMajTKfz1uguq4z
HA59kE93uVzaI9/v9xbher3mt//H45Hv3QfpuM0meWd8kI5bLpN3xgfxQXwQH8QH8UF8EB/E
B/FBfBAfxAfxQXwQH8QH8UF8EB/EB/FBfJAfnU7JO+OD+PkgPoifD+KD+PkgPoifD+Lng/gg
fj6ID+Lng/ggfj6ID+Lng/j5ID6Inw/ig/j5ID6Inw/ig/j5IH4+iA/i54P4IH4+iA/i54P4
IH4+iJ8P4oP4+SA+iF8nvQDq9/iZKK4j/gAAAABJRU5ErkJggg=='
]

{ #category : #sources }
RTConstraintExample >> exampleAnchorConstraint [
	| v lbls es e1 e2 a1 a2 |
	v := RTView new.
	lbls := RTLabel new elementsOn: #(#First #Second).
	es := RTEllipse new
		size: 30;
		borderColor: Color black;
		elementsOn: #(#source #dest).
	v
		addAll: lbls;
		addAll: es.
	es @ RTDraggable.
	es @ RTLabeled.
	e1 := RTArrowedLine new
		withBorderAttachPoint;
		color: Color black;
		edgeFrom: es first to: es second.
	v add: e1.
	e2 := RTArrowedLine new
		withBorderAttachPoint;
		color: Color black;
		edgeFrom: es second to: es first.
	v add: e2.
	a1 := RTAnchorConstraint new.
	a1 anchorShape size: 10.
	a1 guideLine color: Color red.
	a1
		element: lbls first;
		edge: e1;
		balance: 0.2;
		minDistance: 10;
		build.
	(a2 := RTAnchorConstraint new)
		element: lbls second;
		edge: e2;
		balance: 0.2;
		minDistance: 10;
		build.
	es second translateTo: 200 @ 150.
	^ v
]

{ #category : #sources }
RTConstraintExample >> exampleAnchorConstraintIcon [
	^ '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'
]

{ #category : #sources }
RTConstraintExample >> exampleBelowAndStick [

| v b e |
v := RTView new.

e := (RTEllipse new size: 20; color: (Color red alpha: 0.3)) element.
b := (RTBox new size: 80; color: (Color blue alpha: 0.3)) element.
v add: e; add: b.

b @ RTDraggable.
e @ RTDraggable.

(RTConstraint on: e background: b)
	below;
	stick.
^ v
]

{ #category : #icons }
RTConstraintExample >> exampleBelowAndStickIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABeCAYAAADVA7GfAAABR0lEQVR4XuXTIQ6DQBBAUe5/
nE0xXKAat2kQeFKDQg0NNQ0C1QR2eT8ZN2bnZZt19Supxj+BD+Lng/ggfj6ID+Lng/ggfj6I
D+Lng/j5ID6Inw/ig/j5ID6Inw/ig/j5IH4+iA/i54P4IH4+iA/i54P4IH4+iJ8P4oP4+SA+
iJ8P4oP4+SA+SMmlFPHP5Bzhg/ggPogP4oP4ID6ID+KD+CA+iA/ig/ggPogP4oP4ID6ID+KD
+CA+iA9ScttBD+fxipxy5Of7cGeafJBTir7ff4VliZrfUz9I2+5BhsEHuRRkHH8YXRdbPsjV
KPMcX5jKMW4Dcqd8EB/EzwfxQfx8EB/EzwfxQfx8EB/Ezwfx80F8ED8fxAfx80F8ED8fxAfx
80H8fBAfxM8H8UH8fBAfxM8H8UH8fBA/H8QH8fNBfBA/H8QH8TupD9ZNp2Sij7j1AAAAAElF
TkSuQmCC'
]

{ #category : #sources }
RTConstraintExample >> exampleBelowAndStickWithLabel [

| v b e |
v := RTView new.

e := RTLabel elementOn: 'Happiness'.
b := (RTBox new size: 80; color: (Color blue alpha: 0.3)) element.
v add: e; add: b.

b @ RTDraggable.
e @ RTDraggable.

(RTConstraint on: e background: b)
	below;
	stick.
^ v
]

{ #category : #icons }
RTConstraintExample >> exampleBelowAndStickWithLabelIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAABh0lEQVR4XuXUPYqDABCA0ZzQ
S6Wzt7LRRmySQhGCTZpUYoJYWNl7i3EX622W/WHZ98FcYN4wp333+0ud/BX4IH4+iA/i54P4
IH4+iA/i54P4IH4+iJ8P4oP4+SA+iJ8P4oP4+SA+iJ8P4ueD+CB+PogP4ueD+CB+PogP4ueD
+PkgPoifD+KD+PkgPoifD+KD+Pkgfj6ID/ItNU3EV8YH8UF8EB/EB/FBfBAfxAfxQXwQH8QH
8UF8EB/EB/FBfBAfxAfxQXwQH8TPB/l0XdfFuq4fXvvr9Qof5JdLkiTquo7H4xHn8/kAKMsy
hmGI6/UaVVVFlmXvL6qJy+USfd9H27bhg/xQz+cztm07UO73+56m6YGQ53ksyxLzPMc4jlEU
RUzTFLfb7YDyQfx8EB/EzwfxQfx8EB/Ezwfx80F8ED8fxAfx80F8ED8fxAfx80H8fBAfxM8H
8UH8fBAfxM8H8UH8fBA/H8QH8fNBfBA/H8QH8fNBfBA/H8TPB/FB/HwQH8TPB/mvvQEMgfXI
HXCtJwAAAABJRU5ErkJggg=='
]

{ #category : #accessing }
RTConstraintExample >> label [
	^ 'Constraint'
]
