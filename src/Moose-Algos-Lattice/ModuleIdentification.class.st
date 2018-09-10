"
The class serves the purpose of module identification. To see the definition of a module, see the following paper:
M. Habib, M. Huchard and J. Spinrad. A linear algorithm to decompose inheritance graphs into modules. Algorithmica, 13:573-591, Springer-Verlag, 1995.

The algorithm implemented by the class has been tested on simple and complex lattices (see tests) and it works. The algo has a start phase, a middle phase, and an en phase.
-> In the start phase, the algorithm is started on each node.
-> In the middle phase, it is seen if the descendants of the top node make up candidates to be included in the module.
-> In the end phase, it is seen that the descendants of the top node are converging to a bottom node.
If the three phases succeed, the module pattern is detected.
The class has some associated tests.

Instance Variables:
	moduleNodes	<Collection>
	lattice	<MalLattice>
	aCandidate	<Collection>
	nodesToConsider	<(Collection of: MalLatticeNode)>
		
To test module pattern run the following code in the workspace.

| data fca context lattice |
	data := #(#(#a #()) #(#b #(#1)) #(#c #(#1 #2)) #(#d #(#1 # 2 #3)) #(#e #(#1 #2 #4)) #(#f #(#1 #2 #3 #4)) #(#g #(#1 #2 #4 #5)) #(#h #(#1 #2 #4 #6)) #(#i #(#1 #2 #3 #4 #5 #6)) #(#j #(#1 #8)) #(#k #(#1 #9)) #(#l #(#1 #8 #9))).
	fca := MalFormalContext new.
	context := fca with: data using: #first using: #last.
	lattice := (MalLattice on: context).
	""(MalLattice new viewLattice: lattice).""
	(MalLatticePatterns on: lattice) reportPatterns.
	
"
Class {
	#name : #ModuleIdentification,
	#superclass : #Object,
	#instVars : [
		'moduleNodes',
		'lattice',
		'aCandidate',
		'nodesToConsider'
	],
	#category : #'Moose-Algos-Lattice'
}

{ #category : #'initialize-release' }
ModuleIdentification class >> on: lattice [
	
	| identifier |
	identifier := ModuleIdentification new.
	identifier lattice: lattice.
	^ identifier computeModules.
]

{ #category : #'middle-phase' }
ModuleIdentification >> allAncestors: aNode [

	"computes all the anscentors of a node in the lattice"
	
	^ self lattice nodes 
		select: [:each | each descendants includes: aNode].
]

{ #category : #'middle-phase' }
ModuleIdentification >> analyzeDescendantsOf: aTop [
	"aTop is a potential module top node. The method analyzes if the descendants of the aTop only have a single connection to the top and to the bottom. If it is not so, "

	| descNodes |
	descNodes := aTop descendants.
	self candidate: aTop.
	"(aTop labels first) isEmpty ifFalse:[ 
	self haltIf: [(aTop labels first) asArray first value = #last]]."
	descNodes do: [: each | 
		(self hasOneAncestor: each WhichIs: aTop) 
				ifFalse: [
					self flushCandidate.
					^ false ]
				ifTrue: 
					[self candidate: each].
		].
		(self isEndConditionWith: descNodes)
				ifTrue: [	^ true].
	^ self treatNextLevel: (self computeNextLevelNodes: descNodes).
]

{ #category : #accessing }
ModuleIdentification >> candidate [ 
	
	^ aCandidate
]

{ #category : #accessing }
ModuleIdentification >> candidate: anObject [
	
	aCandidate ifNil: [aCandidate := OrderedCollection new].
	(aCandidate includes: anObject)
		ifFalse: [aCandidate add: anObject].
]

{ #category : #'start-phase' }
ModuleIdentification >> computeModules [
	"computes the modules present inside a lattice. A module is a bunch of modes that are connected to the rest of the lattice through a unique top and a bottom node. The algo leaves the top node of the lattice. It then takes all nodes and analyzes its descendantes to see if the bunch forms a module.. This method triggers the detection algorithm to start on instanceVariable nodesToConsider. The algorithm is run until all nodes in the lattice are considered."

	[self startAlgo] whileTrue: [self startAlgo].
	^ self moduleNodes
]

{ #category : #'middle-phase' }
ModuleIdentification >> computeNextLevelNodes: aCollection [
	"next level nodes are all the nodes that are the descendants of the nodes in the collection and that have more than one descendants. If a node has a single descendant, it means that it is coverging to the bottom of the module, so we dont consider it."
	
	^ (aCollection select: [:each | (each descendants size > 1)]) flatCollect: [:each | each descendants]
]

{ #category : #flush }
ModuleIdentification >> flushCandidate [ 
	
	self candidate removeAll.
]

{ #category : #'middle-phase' }
ModuleIdentification >> hasOneAncestor: aNode WhichIs: aTop [	
		"Is ancestor of an aNode the top node and is this the only ancestor of this node"
		
		|myAncestors|
		myAncestors := self allAncestors: aNode.
		
		^ ((myAncestors size =1) and: [myAncestors includes: aTop]) 
]

{ #category : #'end-phase' }
ModuleIdentification >> hasSingleBottom: aNode [
	
	"does the node has a single bottom and no other"
	
	^ (aNode descendants size = 1)
]

{ #category : #initialization }
ModuleIdentification >> initializeNodes [

	nodesToConsider := (self lattice nodes ) reject: [:each | each = self lattice top].
	moduleNodes := OrderedCollection new.
	

]

{ #category : #'end-phase' }
ModuleIdentification >> isEndConditionWith: descNodes [
	"do the descendants converege to a bottom node. If, so how many of those?"

	| flag |
	flag := false.
	1 to: descNodes size - 1 do: [ :n | 
		n + 1 to: descNodes size do: [ :m | 
			((self hasSingleBottom: (descNodes at: n)) and: [ self hasSingleBottom: (descNodes at: m) ])
				ifTrue: [ ((descNodes at: n) descendants first = (descNodes at: m) descendants first and: [ (descNodes at: n) descendants first ~= self lattice bottom ])
						ifTrue: [ self candidate: (descNodes at: m).
							self candidate: (descNodes at: n).
							self candidate: (descNodes at: n) descendants first.
							flag := true ] ] ] ].
	flag
		ifTrue: [ self removeFalseCandidates: descNodes.
			^ true ].
	^ flag
]

{ #category : #accessing }
ModuleIdentification >> lattice [
	^ lattice
]

{ #category : #accessing }
ModuleIdentification >> lattice: anObject [

	lattice := anObject.
	self initializeNodes.
]

{ #category : #accessing }
ModuleIdentification >> moduleNodes [
	^ moduleNodes
]

{ #category : #accessing }
ModuleIdentification >> moduleNodes: aColectionOfNodes [
	(moduleNodes includesAll: aColectionOfNodes)
		ifFalse: [ moduleNodes add: aColectionOfNodes copy ]
]

{ #category : #'end-phase' }
ModuleIdentification >> removeFalseCandidates: descNodes [

	
	descNodes do: [:each | 
		(self hasSingleBottom: each)
			ifFalse: [self candidate remove:each]
		]
	
]

{ #category : #'start-phase' }
ModuleIdentification >> startAlgo [
	"The method takes each node and analyzes its descendants for possible module identification. It found, the module is added to the list moduleNodes of the class and the nodes in the module are removed from the list of nodes to be considered. The algorithm is then restarted on rest of the nodes."
	
	1 to: (nodesToConsider size) 
		do: [:n | 
				((nodesToConsider at:n) descendants size > 1)
				ifTrue: [
					
					(self analyzeDescendantsOf: (nodesToConsider at:n))
					ifTrue: [
							self moduleNodes: self candidate.
							nodesToConsider removeAllSuchThat: [:each | self candidate includes: each].
							self flushCandidate.
							^ true.			
						]	
				]   
		].
	^ false.
]

{ #category : #'middle-phase' }
ModuleIdentification >> treatNextLevel: aCollection [
	"the purpose of the method is to include the level 2 and beyond nodes in the module. The collection passed is the list of descendants nodes. See if the next level nodes' ancestors are in the list of candidates, if not flush the candidate list and stop the algo on this and the rest of the candidate nodes. Otherwise, check if the nodes converge to a single bottom. If not run the algorithm on the descendants of the collection nodes."

	aCollection ifEmpty: [ ^ false ].
	aCollection
		do: [ :each | 
			(self candidate includesAllOf: (self allAncestors: each))
				ifFalse: [ nodesToConsider addAll: self candidate.
					self flushCandidate.
					^ false ] ].
	(self isEndConditionWith: aCollection)
		ifTrue: [ ^ true ]
		ifFalse: [ ^ false ].
	self treatNextLevel: (self computeNextLevelNodes: aCollection)
]
