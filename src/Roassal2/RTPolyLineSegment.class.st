"
I am an ordered collection of LineSegments. I provide some extra functions such as searching for specific segment given some position etc.
"
Class {
	#name : #RTPolyLineSegment,
	#superclass : #RTObject,
	#instVars : [
		'segments'
	],
	#category : #'Roassal2-AttachPoint'
}

{ #category : #'instance creation' }
RTPolyLineSegment class >> with: aSegment [
	^ self new
		segments: (Array with: aSegment);
		yourself
]

{ #category : #'instance creation' }
RTPolyLineSegment class >> with: first with: second [
	^ self new
		segments: (Array with: first with: second);
		yourself
]

{ #category : #'instance creation' }
RTPolyLineSegment class >> withAll: aCollection [
	^ self new
		segments: aCollection;
		yourself
]

{ #category : #accessing }
RTPolyLineSegment >> absoluteBalanceFor: aNumber [
	| balance |
	balance := aNumber.
	balance > 1
		ifTrue: [ ^ self length min: balance ].
	balance < 0
		ifTrue: [ ^ 0 max: self length - balance negated ].
	^ self length * balance
]

{ #category : #accessing }
RTPolyLineSegment >> first [
	^ self segments first
]

{ #category : #initialization }
RTPolyLineSegment >> initialize [
	segments := #()
]

{ #category : #accessing }
RTPolyLineSegment >> last [
	^ self segments last
]

{ #category : #accessing }
RTPolyLineSegment >> length [
	^ self segments inject: 0 into: [ :sum :next | sum + next length ]
]

{ #category : #accessing }
RTPolyLineSegment >> second [
	^ self segments second
]

{ #category : #accessing }
RTPolyLineSegment >> segmentWithPointFor: aNumber [
	| sum newSum balance |
	sum := 0.
	balance := self absoluteBalanceFor: aNumber.
	self segments
		do:
			[ :each | 
			newSum := sum + each length.
			(balance between: sum and: newSum)
				ifTrue: [ 
					^ Array with: each with:	(each pointForBalance: balance - sum) ].
			sum := newSum ].
	self error: 'failed to find a segment'
]

{ #category : #accessing }
RTPolyLineSegment >> segments [
	^ segments
]

{ #category : #accessing }
RTPolyLineSegment >> segments: aCollection [
	segments := aCollection
]
