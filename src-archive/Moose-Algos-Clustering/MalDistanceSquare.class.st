"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MalDistanceSquare,
	#superclass : #MalSymetricMatrix,
	#instVars : [
		'distanceBlock',
		'columnVector',
		'items',
		'dendrogram'
	],
	#category : #'Moose-Algos-Clustering'
}

{ #category : #constants }
MalDistanceSquare class >> defaultDistanceBlock [
	
	^[:a :b | a dist: b]
]

{ #category : #'instance creation' }
MalDistanceSquare class >> on: items [
	
	^self
		on: items
		using: self defaultDistanceBlock
]

{ #category : #'instance creation' }
MalDistanceSquare class >> on: vectorA and: vectorB using: distanceBlock [
	
	[vectorA size = vectorB size] assert.
	^(self new: vectorA size)
		initialize: vectorA and: vectorB using: distanceBlock;
		yourself
]

{ #category : #'instance creation' }
MalDistanceSquare class >> on: items using: distanceBlock [
	
	^(self new: items size)
		initialize: items using: distanceBlock;
		yourself
]

{ #category : #private }
MalDistanceSquare class >> vectorSpecies [
	
	^MalArrayVector	"FloatVector"
]

{ #category : #accessing }
MalDistanceSquare >> at: row and: column put: aNumber [
	
	^self noModificationError
]

{ #category : #private }
MalDistanceSquare >> checkInvariant [
	
	^super checkInvariant
		and:
			[(distanceBlock respondsTo: #value:value:) and: [items isCollection]]
]

{ #category : #private }
MalDistanceSquare >> copyClusteringData [
	
	^partialColumns collect: [:each | each copy]
]

{ #category : #accessing }
MalDistanceSquare >> dendrogram [
	dendrogram ifNil: [ self performSeriation ].
	^ dendrogram
]

{ #category : #accessing }
MalDistanceSquare >> distanceBlock [
	
	^distanceBlock
]

{ #category : #accessing }
MalDistanceSquare >> distanceBlock: anObject [
	
	distanceBlock := anObject
]

{ #category : #'initialize-release' }
MalDistanceSquare >> initialize: vectorA and: vectorB using: aDistanceBlock [
	
	items := nil.
	distanceBlock := aDistanceBlock.
	partialColumns
		doWithIndex:
			[:vector :column | 
			vector
				putWithIndex:
					[:row | 
					distanceBlock
						value: (vectorA at: column)
						value: (vectorB at: row)]]
]

{ #category : #'initialize-release' }
MalDistanceSquare >> initialize: someItems using: aDistanceBlock [
	
	items := someItems.
	distanceBlock := aDistanceBlock.
	partialColumns
		doWithIndex:
			[:vector :column | 
			vector
				putWithIndex:
					[:row | 
					distanceBlock
						value: (items at: column)
						value: (items at: row)]]
]

{ #category : #accessing }
MalDistanceSquare >> items [
	
	^items
]

{ #category : #actions }
MalDistanceSquare >> performSeriation [
	| newOrder |
	dendrogram := (MalClusterEngine withDistanceMatrix: self) averageLinkage.
	newOrder := self dendrogram orderLeafs asArray.
	self rearrange: newOrder
]

{ #category : #private }
MalDistanceSquare >> rearrange: newItems [
	
	| newColumns indices |
	[items equalsTo: newItems] assert.	"create new column vectors."
	newColumns := partialColumns collect: [:each | each copyEmpty: each size].	"get the new order of indices."
	indices := newItems collect: [:each | items indexOf: each].	"map the distances into to the new vectors."
	newColumns
		doWithIndex:
			[:vector :column | 
			vector
				putWithIndex:
					[:row | 
					self
						at: (indices at: column)
						and: (indices at: row)]].	"update state of object and check invariant"
	partialColumns := newColumns.
	items := newItems.	"items := newItems."
	[self checkInvariant] assert
]
