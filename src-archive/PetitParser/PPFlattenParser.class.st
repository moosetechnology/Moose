"
A parser that answers a flat copy of the range my delegate parses.
"
Class {
	#name : #PPFlattenParser,
	#superclass : #PPDelegateParser,
	#category : #'PetitParser-Parsers'
}

{ #category : #private }
PPFlattenParser >> on: aCollection start: aStartInteger stop: aStopInteger value: anObject [
	^ aCollection copyFrom: aStartInteger to: aStopInteger
]

{ #category : #parsing }
PPFlattenParser >> parseOn: aPPContext [
	| start element |
	start := aPPContext position.
	element := parser parseOn: aPPContext.
	element isPetitFailure ifTrue: [ ^ element ].
	^ self on: aPPContext stream collection start: start + 1 stop: aPPContext position value: element
]
