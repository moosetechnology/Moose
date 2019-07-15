"
A parser that accepts if a given predicate on an arbitrary number of elements of the input sequence holds.

Instance Variables:
	size	<Integer>	The number of elements to consume.

"
Class {
	#name : #PPPredicateSequenceParser,
	#superclass : #PPPredicateParser,
	#instVars : [
		'size'
	],
	#category : #'PetitParser-Parsers'
}

{ #category : #'instance creation' }
PPPredicateSequenceParser class >> on: aBlock message: aString negated: aNegatedBlock message: aNegatedString size: anInteger [ 
	^ self new initializeOn: aBlock message: aString negated: aNegatedBlock message: aNegatedString size: anInteger
]

{ #category : #'instance creation' }
PPPredicateSequenceParser class >> on: aBlock message: aString size: anInteger [
	^ self on: aBlock message: aString negated: [ :each | (aBlock value: each) not ] message: 'no ' , aString size: anInteger 
]

{ #category : #initialization }
PPPredicateSequenceParser >> initializeOn: aBlock message: aString negated: aNegatedBlock message: aNegatedString size: anInteger [
	predicate := aBlock.
	predicateMessage := aString.
	negated := aNegatedBlock.
	negatedMessage := aNegatedString.
	size := anInteger 
]

{ #category : #operators }
PPPredicateSequenceParser >> negate [
	"Answer a parser that is the negation of the receiving predicate parser."
	
	^ self class 
		on: negated message: negatedMessage
		negated: predicate message: predicateMessage
		size: size
]

{ #category : #parsing }
PPPredicateSequenceParser >> parseOn: aPPContext [
	| memento result |
	memento := aPPContext remember.
	result := aPPContext stream next: size.
	(result size = size and: [ predicate value: result ])
		ifTrue: [ ^ result ].
	aPPContext restore: memento.
	^ PPFailure message: predicateMessage context: aPPContext
]

{ #category : #accessing }
PPPredicateSequenceParser >> size [
	"Answer the sequence size of the receiver."

	^ size
]
