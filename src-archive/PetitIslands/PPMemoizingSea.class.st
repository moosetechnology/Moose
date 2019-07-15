"
A PPMemoizingIsland is memoized version of PPIsland. Use this one, unless you don't mind really bad performance. If the memoized version is not working flawlessly, its a bug!

Please see help of the PPIsland for how to use...

Instance Variables
	memoizationDictionaries:		<Object>
	rootParser:		<Object>

memoizationDictionaries
	- memoization cache

rootParser
	- used for memoizing, once the root changes, flushes the caches

"
Class {
	#name : #PPMemoizingSea,
	#superclass : #PPSea,
	#instVars : [
		'dictionary'
	],
	#category : #'PetitIslands-Parsers'
}

{ #category : #'as yet unclassified' }
PPMemoizingSea class >> initialize [ 
	super initialize 

]

{ #category : #memoization }
PPMemoizingSea >> memoizeResult: result onContext: aPPContext memento: ctxMemento [
	| memento |
	memento := PPMemento new.
	memento contextMemento: aPPContext remember.
	memento result: result.
	
	dictionary at: ctxMemento put: memento.
	
"	memoizedPositions at: (ctxMemento position + 1) put: true."
]

{ #category : #converting }
PPMemoizingSea >> memoized [
	"We have our own implementation of memoization"
	^ self
]

{ #category : #memoization }
PPMemoizingSea >> memoizedResult: aPPContext [
"	(memoizedPositions at: aPPContext position + 1) isNil ifTrue: [ ^ nil ]."
	^ dictionary at: (aPPContext remember) ifAbsent: nil .
	
]

{ #category : #converting }
PPMemoizingSea >> nonMemoized [ 
	^ PPSea new
		island: island;
		yourself
]

{ #category : #parsing }
PPMemoizingSea >> parseOn: aPPContext [ 
	|  memoizedResult retval memento |
	self check: aPPContext.
	
	memoizedResult := self memoizedResult: aPPContext.
	memoizedResult ifNotNil: [ 
		aPPContext islandMemoHit.
		aPPContext restore: memoizedResult contextMemento.
		^ memoizedResult result 
	].
	memento := aPPContext remember.
	
	retval := super parseOn: aPPContext.

	(aPPContext waterPosition == aPPContext position) ifFalse: [ 
		aPPContext islandMemoized.
		self memoizeResult: retval onContext: aPPContext memento: memento.
	].

	^ retval.


]

{ #category : #initialization }
PPMemoizingSea >> reset: aPPContext [
	super reset: aPPContext.
	dictionary := Dictionary new.
	"memoizedPositions := Array new: aPPContext size + 1."
]
