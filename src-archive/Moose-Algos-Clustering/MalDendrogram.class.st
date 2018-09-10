"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MalDendrogram,
	#superclass : #Collection,
	#instVars : [
		'parent'
	],
	#category : #'Moose-Algos-Clustering'
}

{ #category : #'instance creation' }
MalDendrogram class >> with: anElement [
	
	^MalDendrogramLeaf with: anElement
]

{ #category : #adding }
MalDendrogram >> add: newObject [
	
	self shouldNotImplement
]

{ #category : #'break into clusters' }
MalDendrogram >> breakAtThreshold: aNumber [
	
	| candidates |
	candidates := (self nodes select: [:each | each threshold < aNumber])
		, self leaves.
	^candidates reject: [:each | candidates includes: each parent]
]

{ #category : #'break into clusters' }
MalDendrogram >> breakInto: numberOfClusters [
	
	| all candidates |
	"all := self nodes reverseSort: #threshold."
	all := self nodes sort: [:a :b | b threshold <= a threshold].
	candidates := IdentitySet with: all first.
	all
		do:
			[:each | 
			candidates remove: each.
			candidates add: each left.
			candidates add: each right.
			candidates size >= numberOfClusters ifTrue: [^candidates asArray]]
]

{ #category : #seriation }
MalDendrogram >> dist: dendrogram [
	
	| sum |
	sum := MalAccumulator sum.
	self elements
		cross: dendrogram elements
		do: [:a :b | sum add: (a dist: b)].
	^sum average
]

{ #category : #enumerating }
MalDendrogram >> do: aBlock [
	
	self elementsDo: aBlock
]

{ #category : #accessing }
MalDendrogram >> elements [
	
	| stream |
	stream := Array new writeStream.
	self elementsDo: [:each | stream nextPut: each].
	^stream contents
]

{ #category : #enumerating }
MalDendrogram >> elementsDo: aBlock [
	
	^self subclassResponsibility
]

{ #category : #accessing }
MalDendrogram >> index [
	
	^self isRoot
		ifTrue: [1]
		ifFalse:
			[self isLeft
				ifTrue: [self parent index]
				ifFalse: [self parent index + self parent left size]]
]

{ #category : #testing }
MalDendrogram >> isLeft [
	
	^self parent left == self
]

{ #category : #testing }
MalDendrogram >> isRight [
	
	^self parent right == self
]

{ #category : #testing }
MalDendrogram >> isRoot [
	
	^parent == nil
]

{ #category : #accessing }
MalDendrogram >> leaves [
	
	| stream |
	stream := Array new writeStream.
	self leavesDo: [:each | stream nextPut: each].
	^stream contents
]

{ #category : #enumerating }
MalDendrogram >> leavesDo: aBlock [
	
	^self subclassResponsibility
]

{ #category : #accessing }
MalDendrogram >> left [
	
	^self subclassResponsibility
]

{ #category : #'instance creation' }
MalDendrogram >> merge: dendrogram at: threshold [
	
	^MalDendrogramNode with: self with: dendrogram at: threshold
]

{ #category : #accessing }
MalDendrogram >> nodes [
	
	| stream |
	stream := Array new writeStream.
	self nodesDo: [:each | stream nextPut: each].
	^stream contents
]

{ #category : #enumerating }
MalDendrogram >> nodesDo: aBlock [
	
	^self subclassResponsibility
]

{ #category : #seriation }
MalDendrogram >> orderLeafs [
	
	^self subclassResponsibility
]

{ #category : #accessing }
MalDendrogram >> parent [
	
	^parent
]

{ #category : #removing }
MalDendrogram >> remove: oldObject ifAbsent: anExceptionBlock [
	
	self shouldNotImplement
]

{ #category : #accessing }
MalDendrogram >> right [
	
	^self subclassResponsibility
]

{ #category : #accessing }
MalDendrogram >> size [
	
	^self subclassResponsibility
]

{ #category : #private }
MalDendrogram >> species [
	
	^OrderedCollection
]

{ #category : #seriation }
MalDendrogram >> swap [
	
	^self subclassResponsibility
]

{ #category : #accessing }
MalDendrogram >> threshold [
	
	^self subclassResponsibility
]
