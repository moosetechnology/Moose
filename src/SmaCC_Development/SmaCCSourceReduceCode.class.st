"
SmaCCSourceReduceCode represents a reduce action that is specified in the grammar. In this case, it outputs the code directly into the parser.

Instance Variables
	source	<String>	the source to output


"
Class {
	#name : #SmaCCSourceReduceCode,
	#superclass : #SmaCCReduceCode,
	#instVars : [
		'source'
	],
	#category : #'SmaCC_Development'
}

{ #category : #'instance creation' }
SmaCCSourceReduceCode class >> onRHS: aSmaCCRHS source: aString [
	^ (self onRHS: aSmaCCRHS)
		source: aString;
		yourself
]

{ #category : #comparing }
SmaCCSourceReduceCode >> = anObject [
	^ super = anObject and: [ self source = anObject source ]
]

{ #category : #private }
SmaCCSourceReduceCode >> basicModelTypes: aSet [
	| index parseTree |
	index := self returnedNodeIndex.
	index notNil
		ifTrue: [ ^ self basicModelTypes: aSet forIndex: index ].
	parseTree := RBParser parseExpression: self source onError: [ :e :p | ^ Array with: (self model classFor: Object) ].
	^ self typesForTree: parseTree seen: aSet
]

{ #category : #accessing }
SmaCCSourceReduceCode >> source [
	^ source
]

{ #category : #'initialize-release' }
SmaCCSourceReduceCode >> source: aString [
	source := aString
]

{ #category : #private }
SmaCCSourceReduceCode >> typesForTree: aRBProgramNode seen: aSet [
	aRBProgramNode isReturn
		ifTrue: [ ^ self typesForTree: aRBProgramNode value seen: aSet ].
	(aRBProgramNode isSequence and: [ aRBProgramNode statements notEmpty ])
		ifTrue: [ | types |
			types := Set withAll: (self typesForTree: aRBProgramNode statements last seen: aSet).
			aRBProgramNode
				nodesDo: [ :each | 
					each isReturn
						ifTrue: [ types addAll: (self typesForTree: each value seen: aSet) ] ].
			^ types asArray ].
	(aRBProgramNode isLiteralNode or: [ aRBProgramNode isVariable ])
		ifTrue: [ (self returnedNodeIndexFor: aRBProgramNode)
				ifNil: [ aRBProgramNode isLiteralNode
						ifTrue: [ ^ Array with: (self model classFor: aRBProgramNode value class) ] ]
				ifNotNil: [ :index | ^ self basicModelTypes: aSet forIndex: index ] ].
	(aRBProgramNode isMessage and: [ aRBProgramNode receiver isVariable and: [ aRBProgramNode receiver name = 'SmaCCToken' ] ])
		ifTrue: [ ^ Array with: (self model classFor: SmaCCToken) ].
	^ Array with: (self model classFor: Object)
]
