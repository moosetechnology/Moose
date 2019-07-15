Class {
	#name : #RTSimpleArrowHeadTest,
	#superclass : #RTTest,
	#instVars : [
		'view'
	],
	#category : #'Roassal2-Core-Tests'
}

{ #category : #tests }
RTSimpleArrowHeadTest >> testDragAndDropNodes [

	"Initializing the view"
	| v e1 e2 l lineTrachel |
	v := RTView new.
	e1 := (RTEllipse new size: 10) element.
	e2 := (RTEllipse new size: 10) element.
	e2 translateBy: 100 @ 0.

	e1 @ RTDraggable.
	e2 @ RTDraggable.
	
	v add: e1.
	v add: e2.
	l := RTEdge from: e1 to: e2.
	
	l + (RTLine new color: Color red) + (RTSimpleArrowHead new color: Color red).
	v add: l.
	
	"Checking"
	lineTrachel := v canvas shapes detect: [ :s | s class == TRLineShape ].
	self assert: lineTrachel from equals: l from position.
	self assert: lineTrachel to equals: l to position.
	
	"Drag and Drop"
	e1 translateBy: 10 @ 20.
	self assert: lineTrachel from equals: l from position.

]
