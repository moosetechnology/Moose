Class {
	#name : #TRFocusRightMost,
	#superclass : #TRFocusing,
	#category : #'Trachel-Core'
}

{ #category : #hooks }
TRFocusRightMost >> on: canvas [
	| encompassingRectangle |
	encompassingRectangle := self encompassingRectangleOf: canvas shapes. 
	canvas camera translateTo: encompassingRectangle rightCenter
]
