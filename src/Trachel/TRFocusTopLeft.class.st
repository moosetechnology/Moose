Class {
	#name : #TRFocusTopLeft,
	#superclass : #TRFocusing,
	#category : #'Trachel-Core'
}

{ #category : #hooks }
TRFocusTopLeft >> on: canvas [
	| encompassingRectangle |
	encompassingRectangle := self encompassingRectangleOf: canvas shapes.
	canvas camera translateTo: encompassingRectangle topLeft
]
