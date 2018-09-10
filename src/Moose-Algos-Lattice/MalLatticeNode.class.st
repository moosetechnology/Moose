Class {
	#name : #MalLatticeNode,
	#superclass : #MalGraphNode,
	#instVars : [
		'descendants',
		'labels',
		'anscentorLabel'
	],
	#category : #'Moose-Algos-Lattice'
}

{ #category : #'as yet unclassified' }
MalLatticeNode class >> withNew: concept [
	| latticeNode |
	latticeNode := MalLatticeNode with: concept .
	latticeNode concept: concept.
	^latticeNode
]

{ #category : #ancestorsLabel }
MalLatticeNode >> addAncestorLabel: aCollection [
	anscentorLabel ifNil: [ anscentorLabel := OrderedCollection new ].
	aCollection ifNotEmpty: [ :aNode | anscentorLabel add: aNode ]
]

{ #category : #accessing }
MalLatticeNode >> addDescendant: aNode [
	descendants ifNil: [ descendants := OrderedCollection new ].
	descendants add: aNode.
]

{ #category : #enumerating }
MalLatticeNode >> allDescendants: aNode [
	|myDescendants|
	myDescendants := OrderedCollection new.
	self descendantsDo: [:each | (each = aNode) ifFalse: [myDescendants add: each]].
	^myDescendants
]

{ #category : #ancestorsLabel }
MalLatticeNode >> anscentorLabel [
	anscentorLabel ifNil: [^OrderedCollection new].
	^ (anscentorLabel flatCollect: [:each | each]) asSet.
]

{ #category : #construction }
MalLatticeNode >> computeLabel [
	|desObjs desAttribs|
	desObjs := self descendants flatCollect: [:aDes | aDes concept objects].
	desAttribs := self descendants flatCollect: [:aDes | aDes concept attributes].
	self labels: (Array with: (self labelAttributes: desAttribs) with: (self labelObjects: desObjs)).
]

{ #category : #accessing }
MalLatticeNode >> concept [
	
	^model
]

{ #category : #accessing }
MalLatticeNode >> concept: anObject [
	
	model := anObject
]

{ #category : #enumerating }
MalLatticeNode >> descendants [
	^descendants ifNil: OrderedCollection new.
]

{ #category : #enumerating }
MalLatticeNode >> descendantsDo: aBlock [

	self descendants  do: aBlock.
	self descendants do: [ :each |
		each descendantsDo: aBlock ]
]

{ #category : #enumerating }
MalLatticeNode >> hasDescendant: aNode [
	self descendantsDo: [:each | each = aNode ifTrue: [^true]].
	^false
]

{ #category : #construction }
MalLatticeNode >> labelAttributes: aCollection [
	|attribs|
	"self concept objects size =1 ifTrue: [self halt]."
	attribs := (self myAttribLabel asSet) intersection: (aCollection asSet).
	self descendants do: [:aDes | aDes addAncestorLabel: (attribs union:self anscentorLabel)  ].
	^attribs 
]

{ #category : #construction }
MalLatticeNode >> labelObjects: aCollection [
	^self concept objects difference: (aCollection)
]

{ #category : #accessing }
MalLatticeNode >> labels [
	^labels ifNil: [^OrderedCollection new].
]

{ #category : #accessing }
MalLatticeNode >> labels: aLabel [
	labels := aLabel.
]

{ #category : #accessing }
MalLatticeNode >> layer [
	
	^self concept numAttributes
]

{ #category : #construction }
MalLatticeNode >> maybeAppendChild: aNode [

	"Creates layers of concepts for all concepts except top and bottom"
	[self layer < aNode layer] assert.
	(self hasDescendant: aNode)
		ifFalse:
			[(aNode concept intent allMask: self concept intent)
				ifTrue: [self addDescendant: aNode]]
]

{ #category : #ancestorsLabel }
MalLatticeNode >> myAttribLabel [
		(self anscentorLabel isEmpty) 
			ifFalse: [^(self concept attributes)asSet difference: (self anscentorLabel) asSet] 
			ifTrue: [^self concept attributes]
		
]

{ #category : #accessing }
MalLatticeNode >> printString [
	^self labels first printString, self labels last printString
]

{ #category : #construction }
MalLatticeNode >> removeDescendant: aCollection [
	descendants ifNotEmpty: [ aCollection do: [ :aNode | descendants remove: aNode ] ]
]
