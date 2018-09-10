"
This implements the Null Pattern for a Trachel shape.
"
Class {
	#name : #TRNoShape,
	#superclass : #TRShape,
	#classInstVars : [
		'instance'
	],
	#category : #'Trachel-Shapes'
}

{ #category : #accessing }
TRNoShape class >> instance [
	instance ifNil: [ instance := self new ].
	^ instance
]

{ #category : #visitor }
TRNoShape >> accept: aVisitor [
	aVisitor visitNoShape: self
]

{ #category : #actions }
TRNoShape >> addedIn: aCanvas [
	"Do nothing"
]

{ #category : #accessing }
TRNoShape >> center [
	0@0
]

{ #category : #hooks }
TRNoShape >> computePath [
	"do nothing"
]

{ #category : #drawing }
TRNoShape >> drawOn: athensCanvas [
	"do nothing"
]

{ #category : #accessing }
TRNoShape >> encompassingRectangle [
	^ 0@0 corner: 0@0
]

{ #category : #accessing }
TRNoShape >> height [
	^ 0
]

{ #category : #accessing }
TRNoShape >> position [
	^ 0 @ 0
]

{ #category : #actions }
TRNoShape >> setAsFixed [
	"Not much to do"
]

{ #category : #actions }
TRNoShape >> translateBy: aPoint [
	"do nothing"
]

{ #category : #actions }
TRNoShape >> translateTo: aPoint [
	"do nothing"
]

{ #category : #accessing }
TRNoShape >> width [
	^ 0
]
