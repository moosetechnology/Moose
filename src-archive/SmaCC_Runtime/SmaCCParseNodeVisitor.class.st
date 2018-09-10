"
SmaCCParseNodeVisitor is an abstract visitor for the SmaCC parse trees.


"
Class {
	#name : #SmaCCParseNodeVisitor,
	#superclass : #Object,
	#category : #'SmaCC_Runtime'
}

{ #category : #visiting }
SmaCCParseNodeVisitor >> accept: anObject [
	(anObject isKindOf: SmaCCParseNode)
		ifTrue: [ ^ self acceptNode: anObject ].
	(anObject isKindOf: Collection)
		ifTrue: [ ^ self acceptNodes: anObject ].
	^ anObject
]

{ #category : #visiting }
SmaCCParseNodeVisitor >> acceptNode: aSmaCCParseNode [
	aSmaCCParseNode isNil
		ifTrue: [ ^ nil ].
	^ aSmaCCParseNode acceptVisitor: self
]

{ #category : #visiting }
SmaCCParseNodeVisitor >> acceptNodes: aCollection [
	aCollection do: [ :each | self acceptNode: each ].
	^ aCollection
]

{ #category : #visiting }
SmaCCParseNodeVisitor >> visitSmaCCParseNode: aSmaCCParseNode [
	self acceptNodes: aSmaCCParseNode sortedChildren.
	^ aSmaCCParseNode
]
