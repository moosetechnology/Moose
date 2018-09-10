Class {
	#name : #TRMouseDraggingTest,
	#superclass : #TRTest,
	#category : #'Trachel-Tests'
}

{ #category : #tests }
TRMouseDraggingTest >> testPositionFromCamera [

	| evt |
	evt := TRMouseDragging new.
	self assert: (evt positionFromCamera closeTo: -250 @ -250)
]

{ #category : #tests }
TRMouseDraggingTest >> testPositionOnDefault [

	| evt |
	evt := TRMouseDragging new.
	self assert: evt position equals: 0 @ 0
]
