Class {
	#name : #TRFocusCenter,
	#superclass : #TRFocusing,
	#category : #'Trachel-Core'
}

{ #category : #hooks }
TRFocusCenter >> on: canvas [
	| encompassingRectangle  |
	encompassingRectangle := self encompassingRectangleOf: canvas shapes.
	canvas camera translateTo: encompassingRectangle center.
]
