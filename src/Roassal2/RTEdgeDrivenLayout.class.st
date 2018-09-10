"
A ROEdgeDrivenLayout is xxxxxxxxx.

Instance Variables
	edges:		<Object>
	fromPositions:		<Object>
	toPositions:		<Object>
	userDefinedEdges:		<Object>

edges
	- xxxxx

fromPositions
	- xxxxx

toPositions
	- xxxxx

userDefinedEdges
	- xxxxx

"
Class {
	#name : #RTEdgeDrivenLayout,
	#superclass : #RTLayout,
	#instVars : [
		'edges',
		'userDefinedEdges',
		'fromPositions',
		'toPositions',
		'shouldSetDefaultAttachPoint'
	],
	#category : #'Roassal2-Layouts'
}

{ #category : #'as yet unclassified' }
RTEdgeDrivenLayout class >> isAbstract [
	^ self = RTEdgeDrivenLayout
]

{ #category : #public }
RTEdgeDrivenLayout class >> on: elements edges: edges [
	^ self new on: elements edges: edges
]

{ #category : #'instance creation' }
RTEdgeDrivenLayout class >> withEdges: aCollection [
	
	^self new initialize userDefinedEdges: aCollection
]

{ #category : #'default attach points' }
RTEdgeDrivenLayout >> addDefaultAttachPointToEdges [
	| a |
	a := self defaultAttachPoint.
	edges do: [ :e | e shape attachPoint: a ]
]

{ #category : #accessing }
RTEdgeDrivenLayout >> affectedNodes [
	
	^affectedNodes
]

{ #category : #accessing }
RTEdgeDrivenLayout >> affectedNodes: anObject [
	
	affectedNodes := anObject
]

{ #category : #accessing }
RTEdgeDrivenLayout >> affectedNodesOf:  aNode [ 
	^ affectedNodes ifNil: [ aNode nodes ]
]

{ #category : #'default attach points' }
RTEdgeDrivenLayout >> defaultAttachPoint [
	^ RTCenteredAttachPoint new
]

{ #category : #'default values' }
RTEdgeDrivenLayout >> defaultFromPositions [
	^ #()
	
]

{ #category : #'default values' }
RTEdgeDrivenLayout >> defaultToPositions [
	^ #()

]

{ #category : #'default attach points' }
RTEdgeDrivenLayout >> doAttachPoint [
	"Change the attach point of edges when added"
	shouldSetDefaultAttachPoint := true
]

{ #category : #hook }
RTEdgeDrivenLayout >> doExecute: elements [
	
	self subclassResponsibility
]

{ #category : #hook }
RTEdgeDrivenLayout >> doIncrementallyExecute: anElementNode [
	"called by refreshLayoutEvery: ms. It is used to convey a feeling of incremental execution."
	
	self doExecute: anElementNode
]

{ #category : #'default attach points' }
RTEdgeDrivenLayout >> doNotAttachPoint [
	"Do not add an attach point to edges when doing the layout"
	shouldSetDefaultAttachPoint := false
]

{ #category : #private }
RTEdgeDrivenLayout >> edges [
	
	^ edges
]

{ #category : #accessing }
RTEdgeDrivenLayout >> edges: aCollection [
	"Set the list of edges that should be considered for the layout.
	If none is specified (i.e., if this method is not called), then the 
	edges are infered."
	edges := aCollection.
	self shouldSetDefaultAttachPoint
		ifTrue: [ self addDefaultAttachPointToEdges ]
]

{ #category : #iterator }
RTEdgeDrivenLayout >> edgesDo: aBlock [
	"Iterates over all the edges of the receiver."
	
	edges ifNil: [ ^ self ].
	edges do: aBlock

]

{ #category : #hook }
RTEdgeDrivenLayout >> executeOnElements: elements [ 
	"Execute the layout, myself, on the elements"

	self userDefinedEdges isNil 
		ifTrue: [ self setEdgesFromElements: elements ]
		ifFalse: 
			[ | flat |
			flat := OrderedCollection new.
			self userDefinedEdges do: 
				[ :each | 
				each isCollection 
					ifTrue: [ flat addAll: each ]
					ifFalse: [ flat add: each ] ].
			flat := flat select: #isUsedInLayout. 
			self edges: flat ].
		
	super executeOnElements: elements
]

{ #category : #accessing }
RTEdgeDrivenLayout >> fromPositions: anArray [
	
	fromPositions := anArray
]

{ #category : #'initialize-release' }
RTEdgeDrivenLayout >> initialize [
	"Initialization"
	super initialize.
	edges := nil.
	shouldSetDefaultAttachPoint := false
]

{ #category : #testing }
RTEdgeDrivenLayout >> isEdgeDrivenLayout [
	^ true
]

{ #category : #accessing }
RTEdgeDrivenLayout >> setEdgesFromElements: elements [ 
	| view |
	elements isEmpty ifTrue: [ ^ self ].
	
	^ self
		edges:
			((elements flatCollect: #incomingEdges)
				select: [ :anEdge | anEdge isUsedInLayout and: (elements includes: anEdge from) ])
"	view := elements anyOne view.
	view ifNil: [ ^ self ].
	self edges: (view edges select: [ :el | 
		(el isUsedInLayout and: [ elements includes: el from ]) and: [ elements includes: el to ] ]).
	"
]

{ #category : #'default attach points' }
RTEdgeDrivenLayout >> shouldSetDefaultAttachPoint [
	"Return true if an attach point has to be added to edges. False else"
	^ shouldSetDefaultAttachPoint
]

{ #category : #accessing }
RTEdgeDrivenLayout >> toPositions: anArray [
	
	toPositions := anArray
]

{ #category : #private }
RTEdgeDrivenLayout >> userDefinedEdges [
	
	^userDefinedEdges
]

{ #category : #'initialize-release' }
RTEdgeDrivenLayout >> userDefinedEdges: aCollectionOfEdges [
	"useful to tell to the layout which edges have to be used for the layout"

	userDefinedEdges := aCollectionOfEdges.
	
]
