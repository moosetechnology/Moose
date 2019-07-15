Class {
	#name : #TRFocusTopRight,
	#superclass : #TRFocusing,
	#category : #'Trachel-Core'
}

{ #category : #hooks }
TRFocusTopRight >> on: canvas [
	| encompassingRectangle |
	encompassingRectangle := self encompassingRectangleOf: canvas shapes. 
	canvas camera translateTo: encompassingRectangle topRight
]
