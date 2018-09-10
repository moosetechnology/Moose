Class {
	#name : #TRFocusing,
	#superclass : #TRObject,
	#category : #'Trachel-Core'
}

{ #category : #public }
TRFocusing class >> on: canvas [
	^ self new on: canvas
]

{ #category : #utility }
TRFocusing >> encompassingRectangleOf: shapes [
	^ shapes asGroup encompassingRectangle 

]

{ #category : #hooks }
TRFocusing >> on: canvas [
	self subclassResponsibility
]
