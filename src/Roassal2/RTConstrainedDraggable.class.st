"
A RTConstrainedDraggable is like Draggable, but restraint the element to move within a provided rectangle
"
Class {
	#name : #RTConstrainedDraggable,
	#superclass : #RTAbstractDraggable,
	#instVars : [
		'rectangle',
		'after'
	],
	#category : #'Roassal2-Interactions'
}

{ #category : #accessing }
RTConstrainedDraggable >> afterBlock [
	^ after
]

{ #category : #accessing }
RTConstrainedDraggable >> afterBlock: aBlock [
	after := aBlock
]

{ #category : #hooks }
RTConstrainedDraggable >> constraintIfNecessary: anElement [
	| rec e deltaX deltaY |
	rec := rectangle rtValue: anElement.	
	e := anElement encompassingRectangle.
	
	(rec containsRect: e)
		ifFalse: [ 
			deltaX := 0.
			deltaY := 0.
			(e right > rec right) ifTrue: [ deltaX := rec right - e right ].
			(e left < rec left) ifTrue: [ deltaX := rec left - e left ].

			(e top < rec top) ifTrue: [ deltaY := rec top - e top].
			(e bottom > rec bottom) ifTrue: [ deltaY := rec bottom - e bottom ].

			anElement translateBy: deltaX @ deltaY
			].
		
	"In case the constraining rectangle is larger than the encompassing rectangle of the constrained element"
	(rec height <= e height) ifTrue: [ anElement translateTo: anElement position x @ rec center y ].
	(rec width <= e width) ifTrue: [ anElement translateTo: rec center x @ anElement position y].
	after ifNotNil: [ after rtValue: anElement ].
	

]

{ #category : #initialization }
RTConstrainedDraggable >> initialize [
	super initialize.
	rectangle := (-5 @ -5) extent: (10 @ 10)
]

{ #category : #accessing }
RTConstrainedDraggable >> rectangle [
	^ rectangle
]

{ #category : #accessing }
RTConstrainedDraggable >> rectangle: aRectangleOrOneArgBlock [
	rectangle := aRectangleOrOneArgBlock
]

{ #category : #hooks }
RTConstrainedDraggable >> transformDistance: distanceAsPoint forElement: anElement [
	^ distanceAsPoint
"Transcript show: distanceAsPoint printString; cr.
	^ (rectangle containsPoint: distanceAsPoint + anElement position)
		ifTrue: [ distanceAsPoint ]
		ifFalse: [ 0 @ 0 ]"
]

{ #category : #accessing }
RTConstrainedDraggable >> withinParent [
	^ self rectangle: [ :anElement | anElement parentElement encompassingRectangle ]
]
