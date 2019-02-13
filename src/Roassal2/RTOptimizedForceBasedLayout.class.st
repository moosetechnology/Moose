Class {
	#name : #RTOptimizedForceBasedLayout,
	#superclass : #RTForceBasedLayout,
	#instVars : [
		'mockElements'
	],
	#category : #'Roassal2-Layouts'
}

{ #category : #updating }
RTOptimizedForceBasedLayout >> addEdges: someEdges [
	"Probably something has to be done here"
	super addEdges: someEdges
]

{ #category : #hook }
RTOptimizedForceBasedLayout >> executeOnElements: elements [
	"The argument is the set of Roassal elements"
	mockElements := elements collect: [ :e | RTMockElement new realElement: e ].
	super executeOnElements: mockElements.
	mockElements do: #applyToRealElement
]

{ #category : #accessing }
RTOptimizedForceBasedLayout >> prepareNodes: nodeElements [
	"Probably something has to be done here"
	super prepareNodes: nodeElements
]

{ #category : #accessing }
RTOptimizedForceBasedLayout >> setEdgesFromElements: elements [ 
	| view realElements realEdges mockEdges |
	elements isEmpty ifTrue: [ ^ self ].

	view := elements anyOne view.
	realElements := elements collect: #realElement.
	view ifNil: [ ^ self ].
	
	realEdges := view edges select: [ :el | 
		(el isUsedInLayout and: [ realElements includes: el from ]) and: [ realElements includes: el to ] ].
	mockEdges := realEdges collect: [ :e | 
							RTMockEdge new 
								from: (elements detect: [ :ee | ee realElement == e from ]);
								to: (elements detect: [ :ee | ee realElement == e to ]) ].
	self edges: mockEdges.
	
]
