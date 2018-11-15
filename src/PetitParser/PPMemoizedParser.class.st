"
A memoized parser, for refraining redundant computations.

Instance Variables:
	stream	<PositionableStream>	The stream of the associated memento objects.
	buffer	<Array of: PPMemento>	The buffer of memento objects.

"
Class {
	#name : #PPMemoizedParser,
	#superclass : #PPDelegateParser,
	#instVars : [
		'buffer',
		'identifier'
	],
	#category : #'PetitParser-Parsers'
}

{ #category : #parsing }
PPMemoizedParser >> check: aPPContext [
	(identifier == aPPContext identifier)
		ifFalse: [ self reset: aPPContext ].
]

{ #category : #operators }
PPMemoizedParser >> memoized [
	"Ther is no point in memoizing more than once."

	^ self
]

{ #category : #operators }
PPMemoizedParser >> nonMemoized [
	^ parser
]

{ #category : #parsing }
PPMemoizedParser >> parseOn: aPPContext [
	| memento contextMemento  aStream |
	"TODO: JK memoizing needs review!"
	self check: aPPContext.
	contextMemento := aPPContext remember.
	memento := (buffer at: contextMemento ifAbsentPut: [ PPMemento new ]).
	
	memento contextMemento isNil
		ifTrue: [
			aStream := aPPContext stream.
			memento result: (aStream size - aStream position + 2 < memento count
				ifTrue: [ PPFailure message: 'overflow' context: aPPContext ]
				ifFalse: [ memento increment. parser parseOn: aPPContext ]).
			memento contextMemento: aPPContext remember ]
		ifFalse: [ aPPContext restore: memento contextMemento ].
	^ memento result.
]

{ #category : #parsing }
PPMemoizedParser >> reset: aPPContext [
	buffer := Dictionary new.
	identifier := aPPContext identifier.
]
