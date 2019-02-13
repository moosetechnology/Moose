"
A RTSimpleArrowHead is a line decorartion.

-=-=-=-=-=-=-=-=-=-=-=-=
| v e1 e2 l |
v := RTView new.
e1 := (RTEllipse new size: 20) element.
e2 := (RTEllipse new size: 20) element.
e1 @ RTDraggable.
e2 @ RTDraggable.
e2 translateBy: 50 @ 50.
l := ((RTLine new color: Color red) + (RTSimpleArrowHead new color: Color red)) edgeFrom: e1 to: e2. 
v add: e1; add: e2; add: l.
v open
-=-=-=-=-=-=-=-=-=-=-=-=

"
Class {
	#name : #RTSimpleArrowHead,
	#superclass : #RTLineDecoration,
	#category : #'Roassal2-LineDecorations'
}

{ #category : #hooks }
RTSimpleArrowHead >> trachelShapeClass [
	^ TRSimpleArrowShape
]
