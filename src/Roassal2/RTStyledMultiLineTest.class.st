"
A RTStyledMultiLineTest is a test class for testing the behavior of RTStyledMultiLine
"
Class {
	#name : #RTStyledMultiLineTest,
	#superclass : #RTTest,
	#category : #'Roassal2-Tests'
}

{ #category : #tests }
RTStyledMultiLineTest >> testBasic [
	| v es shape lines |
	v := RTView new.

	es := (RTEllipse new size: 20; color: (Color blue alpha: 0.3)) elementsOn: (1 to: 10).
	RTCircleLayout new on: es allButFirst.
	v addAll: es.
	es @ RTDraggable.
	TRConstraint move: es first onTheCenterOf: es allButFirst.

	shape := RTStyledMultiLine new.
	shape filledArrowHead; arrowTail; dashdotLine; orthoVertical.
	shape attachPoint: (RTBorderAttachPoint new).
	lines := shape edgesFrom: es first toAll: es allButFirst.
	v addAll: lines.

	v
]
