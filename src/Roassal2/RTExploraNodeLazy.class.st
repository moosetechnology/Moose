Class {
	#name : #RTExploraNodeLazy,
	#superclass : #RTExploraNode,
	#instVars : [
		'block'
	],
	#category : #'Roassal2-Builder-Explora'
}

{ #category : #'as yet unclassified' }
RTExploraNodeLazy >> addListenerFor: anEvent onDirection: aDirection withBlock: aBlock [
	| listener |
	
	listener := element.
	iconOpen ifNotNil: [ listener := (Array with: iconOpen with: iconClose) asGroup ].
		
	self addExpansionDirection: aDirection.
	
	block := aBlock.
	
	listener when: anEvent do: [ :event |
		RTPopup removeLastPopup.
		(self isExpandedOnDirection: aDirection)
			ifTrue: [ self collapseOnDirection: aDirection ]
			ifFalse: [ self exploreOnDirection: aDirection ].
			((builder layout rtValue: self)
				translator: (RTSmoothLayoutTranslator new nbCycles: 0.25))
				on: ((builder nodes collect: [ :n | n element ]) asGroup).	
		element view canvas signalUpdate].
	

]

{ #category : #'as yet unclassified' }
RTExploraNodeLazy >> exploreOnDirection: aDirection [
	| objs objectsToAdd newNodes nodesAlreadyIn objsAlreadyIn |
	
	self expandWithBlock: block onDirection: aDirection.
	
	objs := ((builder nodes collect: [ :n | n element ]) asGroup) collect: [ :el | el model ].
	objectsToAdd := self expansionOnDirection: aDirection.
	objsAlreadyIn := objectsToAdd select: [ :obj | objs includes: obj ].
	objectsToAdd := objectsToAdd reject: [ :obj | objs includes: obj ].
	
	nodesAlreadyIn := (builder view elements select: [ :el | objsAlreadyIn includes: el model ])
		collect: [ :elem | elem attributes at: #node ].
	newNodes := objectsToAdd collect: [ :obj | builder node: obj parent: self ].
	
	builder lastAddedNodes: newNodes.
	
	newNodes do: [ :node |
		builder view add: node element.
		node element translateTo: self element position ].
	(builder icons) ifNotNil: [
		newNodes do: [ :node |
			builder view add: node iconOpen].
		iconOpen remove.
		builder view add: iconClose.
		].
	
	(newNodes, nodesAlreadyIn) do: [ :el |
		(aDirection value = #From)
			ifTrue: [ self connectTo: el with: builder lineShape ]
			ifFalse: [ el connectTo: self with: builder lineShape ] ].

]
