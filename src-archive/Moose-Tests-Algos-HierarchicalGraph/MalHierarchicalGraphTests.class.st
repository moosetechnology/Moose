Class {
	#name : #MalHierarchicalGraphTests,
	#superclass : #TestCase,
	#classInstVars : [
		'repository'
	],
	#category : #'Moose-Tests-Algos-HierarchicalGraph'
}

{ #category : #util }
MalHierarchicalGraphTests >> recursiveStringFactory: aString in: aSet to: aLevel. [
	aString size < aLevel
	ifTrue: [
		| childA childB childC |
		childA := aString , 'a'.
		aSet add: childA.
		self recursiveStringFactory: childA in: aSet to: aLevel. 
		childB := aString , 'b'.
		aSet add: childB.
		self recursiveStringFactory: childB in: aSet to: aLevel. 
		childC := aString , 'c'.
		aSet add: childC.
		self recursiveStringFactory: childC in: aSet to: aLevel. 
	].
	
	
]

{ #category : #setup }
MalHierarchicalGraphTests >> setupSimpleBottomUpModel [
	| hg result |
	result := OrderedCollection new.
	hg := MalHierarchicalGraph with: (self setupSimpleTopDownModel). 
	hg topDown: #children.
	(hg nodesOnLevel: 4) do: [ :e | result add: e model ].
	^ result.
]

{ #category : #setup }
MalHierarchicalGraphTests >> setupSimpleBottomUpModelHiGraph [
	| hg  |

	hg := MalHierarchicalGraph with: (self setupSimpleBottomUpModel).
	hg bottomUp: #parent.

	^ hg.
]

{ #category : #setup }
MalHierarchicalGraphTests >> setupSimpleNumbersHiGraph [
	| hg leafs relationships |

	"Creates a very simple hiGraph with intergers as nodes. 
	It has 3 root nodes (1,2 and 3), some children and various relationships between them."
	
	leafs := OrderedCollection new.
	leafs add: 12; add: 19; add:24; add: 25; add:27; add: 28; add: 31; add: 34; add: 36.

	hg := MalHierarchicalGraph with: leafs.

	hg bottomUp: [ :n |  
		(n / 10 < 1) ifTrue: [ nil ] ifFalse: [(n / (10 raisedTo: (n floorLog: 10))) floor asInteger. ]
	].
	
	relationships := OrderedCollection new.
	
	relationships add: (12->19).
	relationships add: (19->24).
	relationships add: (19->31).
	relationships add: (19->27).
	
	relationships add: (25->12).
	relationships add: (25->19).
	relationships add: (25->19).
	relationships add: (25->34).
	
	relationships add: (34->12).
	relationships add: (34->31).
	relationships add: (36->25).
	relationships add: (36->24).
	
	hg addEdges: relationships
			sourceBlock: [ :e | e key ] 
			destinationBlock: [ :e | e value ].
			
	hg propagateEdges.
	
	^ hg
]

{ #category : #setup }
MalHierarchicalGraphTests >> setupSimpleTopDownModel [
	| parent randomizer nodesToProcess numberOfChildrenAdded child root levelsToCreate childrenToCreate |
	
	"If these values get changed, tests have to be adapted."
	levelsToCreate := 4.
	childrenToCreate := 3.

	numberOfChildrenAdded := 0.
	randomizer := Random new.
	root := MalHgTestModelSimple new.
	root model: 0.
	root level: 0.
	nodesToProcess := FILOStack new.
	nodesToProcess add: root.

	[nodesToProcess notEmpty] whileTrue: [
		parent := nodesToProcess pop.
		(parent level < levelsToCreate ) ifTrue: [ 
			[ numberOfChildrenAdded < childrenToCreate ] whileTrue: [ 
				child := MalHgTestModelSimple new.
				child parent: parent.
				child level: (parent level + 1).
				child model: ((randomizer next * 10)  + (10 raisedTo: (child level))) asInteger.
				parent children add: child.
				numberOfChildrenAdded := numberOfChildrenAdded + 1.
				nodesToProcess add: child.
			].
			numberOfChildrenAdded := 0.
		].
	].

	^ root.
]

{ #category : #setup }
MalHierarchicalGraphTests >> setupSimpleTopDownModelHiGraph [
	| hg |

	hg := MalHierarchicalGraph with: (self setupSimpleTopDownModel).
	hg topDown: #children.

	^ hg.
]

{ #category : #setup }
MalHierarchicalGraphTests >> setupVerySimpleHierarchicalGraph [
	| hg |
	hg := MalHierarchicalGraph with: 'aBaseEntity'.
	self assert: hg nodes size equals: 1
]

{ #category : #tests }
MalHierarchicalGraphTests >> testBaseEntity [
	| hg |
	hg := MalHierarchicalGraph with: (OrderedCollection with: 2).
	self assert: hg nodes notEmpty.
	self assert: hg nodes size equals: 1.
	self assert: hg nodes first model equals: 2
]

{ #category : #tests }
MalHierarchicalGraphTests >> testBlockBasedApiBottomUp [
	| hg |
	hg := MalHierarchicalGraph with: self setupSimpleBottomUpModel.
	hg bottomUp: [ :e | e parent ].
	self assert: hg nodes size equals: 121.
	self assert: hg rootNodes size equals: 1.
	self assert: hg rootNodes anyOne level equals: 0.
	self assert: hg rootNodes anyOne children size equals: 3.
	self assert: hg rootNodes anyOne children anyOne level equals: 1.
	self assert: hg rootNodes anyOne children anyOne children size equals: 3.
	self assert: hg rootNodes anyOne children anyOne children anyOne level equals: 2.
	self assert: hg rootNodes anyOne children anyOne children anyOne children size equals: 3.
	self assert: hg rootNodes anyOne children anyOne children anyOne children anyOne level equals: 3.
	self assert: hg rootNodes anyOne children anyOne children anyOne children anyOne children size equals: 3.
	self assert: hg rootNodes anyOne children anyOne children anyOne children anyOne children anyOne level equals: 4.
	self assert: hg rootNodes anyOne children anyOne children anyOne children anyOne children anyOne isLeafNode
]

{ #category : #tests }
MalHierarchicalGraphTests >> testBottomUpDeepGraphBuilding [
	| hg rootNodes leafNodes |
	
	rootNodes := OrderedCollection new.
	leafNodes := OrderedCollection new.
	
	rootNodes add: 'a'; add: 'b'; add: 'c'.
	rootNodes do: [ :model | self recursiveStringFactory: model in: leafNodes to: 7 ].

	hg := MalHierarchicalGraph with: leafNodes.
	
	hg aggregation:  [ :model |  
		(model size > 1) 
		ifTrue: [ model truncateTo: (model size - 1). ]
		ifFalse: [ nil ].
	].
	
	self assert: (hg rootNodes size = 3) description: 'Should be exactly 3 root nodes in this graph'.
	self assert: (hg nodes size = 3279) description: 'Should be exactly 3279 nodes in total in this graph'.
	self assert: (hg rootNodes anyOne children size = 3) description: 'Any rootNode should have exactly 3 children'.
	self assert: ((hg nodesFor: (Set with: 'aa')) anyOne parent model = 'a') description: 'Parent of aa should be a'.
	self assert: ((hg nodesFor: (Set with: 'ca')) anyOne parent model = 'c') description: 'Parent of ca should be c'.
	self assert: ((hg nodesFor: (Set with: 'aca')) anyOne parent model = 'ac') description: 'Parent of ac should be aca'.
	self assert: ((hg nodesFor: (Set with: 'aaaaaa')) anyOne parent model = 'aaaaa') description: 'Parent of aaaaaa should be aaaaa'.
	self assert: ((hg nodesFor: (Set with: 'abacac')) anyOne parent model = 'abaca') description: 'Parent of abacac should be abaca'.
	self assert: ((hg nodesFor: (Set with: 'caabc')) anyOne parent model = 'caab') description: 'Parent of caabc should be caab'.
	self assert: ((hg nodesFor: (Set with: 'aaaaaaa')) anyOne isLeafNode) description: 'Node aaaaaaa should be a leaf node'.
	self assert: ((hg nodesFor: (Set with: 'aaaaaaa')) anyOne level = 6) description: 'Node aaaaaaa should be on level 6'.
	self assert: ((hg nodesFor: (Set with: 'c')) anyOne level = 0) description: 'Node c should be on level 0'.
	self assert: ((hg nodesFor: (Set with: 'c')) anyOne isRootNode) description: 'Node c should be a root node'.
	self assert: ((hg nodesFor: (Set with: 'bc')) anyOne level = 1) description: 'Node bc should be on level 1'.
	self assert: ((hg nodesFor: (Set with: 'acb')) anyOne level = 2) description: 'Node acb should be on level 2'.
	self assert: ((hg nodesFor: (Set with: 'caba')) anyOne level = 3) description: 'Node caba should be on level 3'.
	self assert: ((hg nodesFor: (Set with: 'bccab')) anyOne level = 4) description: 'Node bccab should be on level 4'.
	self assert: ((hg nodesFor: (Set with: 'bcabca')) anyOne level = 5) description: 'Node bcabca should be on level 5'.
	self assert: ((hg nodesFor: (Set with: 'caabccc')) anyOne level = 6) description: 'Node caabccc should be on level 6'.
]

{ #category : #tests }
MalHierarchicalGraphTests >> testBottomUpGraphBuilding [
	| hg rootNodes otherNodes |
	
	rootNodes := OrderedCollection new.
	otherNodes := OrderedCollection new.
	
	rootNodes add: 1; add: 2; add:3.
	otherNodes add: 11; add: 12; add: 13; add: 21; add:22; add: 23; add: 31; add: 32; add: 33.
	
	hg := MalHierarchicalGraph with: otherNodes.

	hg blockToGetParent: [ :n |  
		(n / 10 < 1) ifTrue: [ nil ] ifFalse: [(n / (10 raisedTo: (n floorLog: 10))) floor asInteger. ]
	].
	
	self assert: (hg rootNodes size = 3) description: 'Should be exactly 3 root nodes in this graph'.
	self assert: (hg nodes size = 12) description: 'Should be exactly 12 nodes in total in this graph'.
	self assert: (hg rootNodes anyOne children size = 3) description: 'Any rootNode should have exactly 3 children'.
	self assert: ((hg nodesFor: (Set with: 11)) anyOne parent model = 1) description: 'Parent of 11 should be 1'.
	self assert: ((hg nodesFor: (Set with: 12)) anyOne parent model = 1) description: 'Parent of 12 should be 1'.
	self assert: ((hg nodesFor: (Set with: 13)) anyOne parent model = 1) description: 'Parent of 13 should be 1'.
	self assert: ((hg nodesFor: (Set with: 21)) anyOne parent model = 2) description: 'Parent of 13 should be 2'.
	self assert: ((hg nodesFor: (Set with: 22)) anyOne parent model = 2) description: 'Parent of 13 should be 2'.
	self assert: ((hg nodesFor: (Set with: 23)) anyOne parent model = 2) description: 'Parent of 13 should be 2'.
	self assert: ((hg nodesFor: (Set with: 31)) anyOne parent model = 3) description: 'Parent of 13 should be 3'.
	self assert: ((hg nodesFor: (Set with: 32)) anyOne parent model = 3) description: 'Parent of 13 should be 3'.
	self assert: ((hg nodesFor: (Set with: 33)) anyOne parent model = 3) description: 'Parent of 13 should be 3'.

]

{ #category : #tests }
MalHierarchicalGraphTests >> testClassBasedApiBottomUp [
	| hg |
	hg := MalHierarchicalGraph with: self setupSimpleBottomUpModel.
	hg bottomUp: {(MalHgTestModelSimple -> #parent)}.
	self assert: hg nodes size equals: 121.
	self assert: hg rootNodes size equals: 1.
	self assert: hg rootNodes anyOne level equals: 0.
	self assert: hg rootNodes anyOne children size equals: 3.
	self assert: hg rootNodes anyOne children anyOne level equals: 1.
	self assert: hg rootNodes anyOne children anyOne children size equals: 3.
	self assert: hg rootNodes anyOne children anyOne children anyOne level equals: 2.
	self assert: hg rootNodes anyOne children anyOne children anyOne children size equals: 3.
	self assert: hg rootNodes anyOne children anyOne children anyOne children anyOne level equals: 3.
	self assert: hg rootNodes anyOne children anyOne children anyOne children anyOne children size equals: 3.
	self assert: hg rootNodes anyOne children anyOne children anyOne children anyOne children anyOne level equals: 4.
	self assert: hg rootNodes anyOne children anyOne children anyOne children anyOne children anyOne isLeafNode	"QsVisualizer show: hg withWeightBlock: [ :e | e entity ]."
]

{ #category : #tests }
MalHierarchicalGraphTests >> testClassBasedApiTopDown [
	| hg |
	hg := MalHierarchicalGraph with: self setupSimpleTopDownModel.
	hg topDown: {(MalHgTestModelSimple -> #children)}.
	self assert: hg nodes size equals: 121.
	self assert: hg rootNodes size equals: 1.
	self assert: hg rootNodes anyOne level equals: 0.
	self assert: hg rootNodes anyOne children size equals: 3.
	self assert: hg rootNodes anyOne children anyOne level equals: 1.
	self assert: hg rootNodes anyOne children anyOne children size equals: 3.
	self assert: hg rootNodes anyOne children anyOne children anyOne level equals: 2.
	self assert: hg rootNodes anyOne children anyOne children anyOne children size equals: 3.
	self assert: hg rootNodes anyOne children anyOne children anyOne children anyOne level equals: 3.
	self assert: hg rootNodes anyOne children anyOne children anyOne children anyOne children size equals: 3.
	self assert: hg rootNodes anyOne children anyOne children anyOne children anyOne children anyOne level equals: 4.
	self assert: hg rootNodes anyOne children anyOne children anyOne children anyOne children anyOne isLeafNode	"QsVisualizer show: hg withWeightBlock: [ :e | e entity ]."
]

{ #category : #tests }
MalHierarchicalGraphTests >> testClassBasedBlockApiBottomUp [
	| hg |
	hg := MalHierarchicalGraph with: self setupSimpleBottomUpModel.
	hg bottomUp: {(MalHgTestModelSimple -> [ :e | e parent ])}.
	self assert: hg nodes size equals: 121.
	self assert: hg rootNodes size equals: 1.
	self assert: hg rootNodes anyOne level equals: 0.
	self assert: hg rootNodes anyOne children size equals: 3.
	self assert: hg rootNodes anyOne children anyOne level equals: 1.
	self assert: hg rootNodes anyOne children anyOne children size equals: 3.
	self assert: hg rootNodes anyOne children anyOne children anyOne level equals: 2.
	self assert: hg rootNodes anyOne children anyOne children anyOne children size equals: 3.
	self assert: hg rootNodes anyOne children anyOne children anyOne children anyOne level equals: 3.
	self assert: hg rootNodes anyOne children anyOne children anyOne children anyOne children size equals: 3.
	self assert: hg rootNodes anyOne children anyOne children anyOne children anyOne children anyOne level equals: 4.
	self assert: hg rootNodes anyOne children anyOne children anyOne children anyOne children anyOne isLeafNode	"vis := QsVisualizer with: hg weightBlock: [ :e | e entity ].
	vis averageNodeSize: 100.
	vis relativeNodeSizeExtrema: 0.05@1.5.
	vis edgeThicknessRange: 0@10.
	vis layout: QsLayout.	
	vis showSplitOn: 2."
]

{ #category : #tests }
MalHierarchicalGraphTests >> testDeepestLevel [
	| hg rootNodes |
	rootNodes := OrderedCollection new.
	rootNodes add: 'a'.
	hg := MalHierarchicalGraph with: rootNodes.
	hg
		topDown: [ :entity | 
			entity size < 3
				ifTrue: [ 
					| result |
					result := Set new.
					result add: entity , 'a'.
					result add: entity , 'b'.
					result ] ].
	self assert: hg deepestLevel equals: 2
]

{ #category : #tests }
MalHierarchicalGraphTests >> testEdgePropagationAsymetrical [
	| hg rootNodes relationships |
	rootNodes := OrderedCollection new.
	rootNodes add: 'a'.
	hg := MalHierarchicalGraph with: rootNodes.
	hg
		blockToGetChildren: [ :entity | 
			entity size < 3
				ifTrue: [ 
					| result |
					result := Set new.
					result add: entity , 'a'.
					result add: entity , 'b'.
					result ] ].
	relationships := OrderedCollection new.
	relationships add: 'abb' -> 'aa'.
	hg addEdges: relationships from: [ :r | r key ] to: [ :r | r value ].
	hg propagateEdges.	"Testing relationships and their propagandation."
	self assert: (hg nodeWrapping: 'ab') outgoing size equals: 1.
	self assert: (hg nodeWrapping: 'abb') outgoing size equals: 1.
	self assert: (hg nodeWrapping: 'aa') incoming size equals: 2.
	self assert: hg edgesPropagated size equals: 1.
	self assert: hg edgesNotPropagated size equals: 1
]

{ #category : #tests }
MalHierarchicalGraphTests >> testEdgePropagationMultipleRootNodes [
	| hg rootNodes visualizer relationships |
	rootNodes := OrderedCollection new.
	rootNodes
		add: 'a';
		add: 'b';
		add: 'c'.
	hg := MalHierarchicalGraph with: rootNodes.
	hg
		blockToGetChildren: [ :entity | 
			entity size < 6
				ifTrue: [ 
					| result |
					result := Set new.
					result add: entity , 'a'.
					result add: entity , 'b'.
					result add: entity , 'c'.
					result ] ].
	relationships := OrderedCollection new.
	relationships add: 'ab' -> 'ba'.	"relationships add: ('ab'->'bb').
	relationships add: ('ab'->'bca')."
	hg addEdges: relationships sourceBlock: [ :r | r key ] destinationBlock: [ :r | r value ].
	hg propagateEdges.	"Testing relationships and their propagandation."
	self assert: (hg nodeWrapping: 'a') outgoing size equals: 2.
	self assert: (hg nodeWrapping: 'ab') outgoing size equals: 2.
	self assert: hg edgesPropagated size equals: 3.
	self assert: hg edgesNotPropagated size equals: 1.
	self assert: (hg nodeWrapping: 'b') incoming size equals: 2
]

{ #category : #tests }
MalHierarchicalGraphTests >> testEdgePropagationMultipleRootNodesAsymetric [
	| hg rootNodes relationships |
	rootNodes := OrderedCollection new.
	rootNodes
		add: 'a';
		add: 'b';
		add: 'c'.
	hg := MalHierarchicalGraph with: rootNodes.
	hg
		blockToGetChildren: [ :entity | 
			entity size < 6
				ifTrue: [ 
					| result |
					result := Set new.
					result add: entity , 'a'.
					result add: entity , 'b'.
					result add: entity , 'c'.
					result ] ].
	relationships := OrderedCollection new.
	relationships add: 'ab' -> 'baa'.
	hg addEdges: relationships sourceBlock: [ :r | r key ] destinationBlock: [ :r | r value ].
	hg propagateEdges.	"Testing relationships and their propagandation."
	self assert: (hg nodeWrapping: 'a') outgoing size equals: 3.
	self assert: (hg nodeWrapping: 'ab') outgoing size equals: 3.
	self assert: hg edgesPropagated size equals: 5.
	self assert: hg edgesNotPropagated size equals: 1.
	self assert: (hg nodeWrapping: 'b') incoming size equals: 2.
	self assert: (hg nodeWrapping: 'baa') incoming size equals: 2.
	self assert: (hg nodeWrapping: 'ba') incoming size equals: 2
]

{ #category : #tests }
MalHierarchicalGraphTests >> testEdgePropagationSimple [
	| hg rootNodes visualizer relationships |
	rootNodes := OrderedCollection new.
	rootNodes add: 'a'.
	hg := MalHierarchicalGraph with: rootNodes.
	hg
		blockToGetChildren: [ :entity | 
			entity size < 3
				ifTrue: [ 
					| result |
					result := Set new.
					result add: entity , 'a'.
					result add: entity , 'b'.
					result ] ].
	relationships := OrderedCollection new.
	relationships add: 'abb' -> 'aab'.
	hg addEdges: relationships sourceBlock: [ :r | r key ] destinationBlock: [ :r | r value ].
	hg propagateEdges.	"Testing relationships and their propagandation."
	self assert: (hg nodeWrapping: 'ab') outgoing size equals: 2.
	self assert: (hg nodeWrapping: 'abb') outgoing size equals: 2.
	self assert: (hg nodeWrapping: 'aa') incoming size equals: 2.
	self assert: hg edgesPropagated size equals: 3.
	self assert: hg edgesNotPropagated size equals: 1	"hg explore."	"visualizer := SnVisualizer show: hg withWeightBlock: [ :e | e size ]."	"visualizer := SnVisualizer with: hg weightBlock: [ :e | e size ]."	"visualizer showAsTree."	"visualizer showSplitOn: 2."	"visualizer show: (hg nodesFor: ((Set with: 'a') add: 'b'; add: 'ca'; add: 'cb'; add: 'cc'; yourself))."
]

{ #category : #tests }
MalHierarchicalGraphTests >> testEmptyHiGraph [
	| hg |
	hg := MalHierarchicalGraph with: OrderedCollection new.
	self assert: hg nodes isEmpty.
	self assert: hg rootNodes isEmpty.
	self assert: hg edges isEmpty.
]

{ #category : #tests }
MalHierarchicalGraphTests >> testGraphAsTuple [
	| hg rootNodes edges hierarchy |
	"leafs := #(1 2 3 4 5)."
	rootNodes := #(6 7).
	hg := MalHierarchicalGraph with: rootNodes.
	edges := OrderedCollection new.
	edges
		add: 1 -> 2;
		add: 1 -> 3;
		add: 3 -> 4;
		add: 2 -> 5.
	hierarchy := Dictionary new.
	hierarchy
		at: 6 put: #(1 2 3);
		at: 7 put: #(4 5).
	hg topDown: [ :m | hierarchy at: m ifAbsent: [ nil ] ].
	hg addEdges: edges from: [ :e | e key ] to: [ :e | e value ].
	self assert: (hg graph at: 1) size equals: 7.
	self assert: (hg graph at: 2) size equals: 4
]

{ #category : #tests }
MalHierarchicalGraphTests >> testLevels [
	| hg |
	hg := self setupSimpleNumbersHiGraph.
	self assert: (hg nodeWrapping: 1) level equals: 0.
	self assert: (hg nodeWrapping: 1) isRootNode.
	self assert: (hg nodeWrapping: 2) level equals: 0.
	self assert: (hg nodeWrapping: 3) level equals: 0.
	self assert: (hg nodeWrapping: 34) level equals: 1.
	self assert: (hg nodeWrapping: 25) level equals: 1.
	self assert: (hg nodeWrapping: 36) level equals: 1.
	self assert: (hg nodeWrapping: 12) level equals: 1
]

{ #category : #tests }
MalHierarchicalGraphTests >> testNodeWrapping [
	| hg |
	hg := self setupSimpleNumbersHiGraph.
	self assert: (hg nodeWrapping: 999) equals: nil.
	self assert: (hg nodesDict at: 1) equals: (hg nodeWrapping: 1).
	self assert: (hg nodesDict at: 24) equals: (hg nodeWrapping: 24)
]

{ #category : #tests }
MalHierarchicalGraphTests >> testNodesForEntities [
	| hg |
	hg := self setupSimpleNumbersHiGraph.
	self assert: (hg nodesFor: Set new) isEmpty.
	self assert: (hg nodesFor: (Set with: 1)) size equals: 1.
	self assert: (hg nodesFor: (Set with: 1)) anyOne model equals: 1.
	self
		assert:
			(hg
				nodesFor:
					(Set new
						add: 1;
						add: 2;
						yourself)) size
		equals: 2.
	self
		assert:
			(hg
				nodesFor:
					(Set new
						add: 1;
						add: 2;
						add: 999;
						yourself)) size
		equals: 2.
	self
		assert:
			(hg
				nodesFor:
					(Set new
						add: 1;
						add: 2;
						add: 34;
						yourself)) size
		equals: 3.
	self
		assert:
			(hg
				nodesFor:
					(Set new
						add: 1;
						add: 12;
						add: 34;
						add: 19;
						yourself)) size
		equals: 4
]

{ #category : #tests }
MalHierarchicalGraphTests >> testRecursiveChildren [
	| hg |
	hg := self setupSimpleTopDownModelHiGraph.	
	
	"Assert that there are more nodes in the highraph in total than some rootNodes sub graph."
	self assert: hg nodes size > hg rootNodes anyOne recursiveChildren size.
	
	"Assert that the total size of nodes in the higraph is equal to all rootNodes and their recursive children."
	self
		assert: hg nodes size
		equals: hg rootNodes size + (hg rootNodes inject: 0 into: [ :sum :each | sum + each recursiveChildren size ])
]

{ #category : #tests }
MalHierarchicalGraphTests >> testSimpleApiBottomUp [
	| hg |
	hg := MalHierarchicalGraph with: self setupSimpleBottomUpModel.
	hg bottomUp: #parent.
	self assert: hg nodes size equals: 121.
	self assert: hg rootNodes size equals: 1.
	self assert: hg rootNodes anyOne level equals: 0.
	self assert: hg rootNodes anyOne children size equals: 3.
	self assert: hg rootNodes anyOne children anyOne level equals: 1.
	self assert: hg rootNodes anyOne children anyOne children size equals: 3.
	self assert: hg rootNodes anyOne children anyOne children anyOne level equals: 2.
	self assert: hg rootNodes anyOne children anyOne children anyOne children size equals: 3.
	self assert: hg rootNodes anyOne children anyOne children anyOne children anyOne level equals: 3.
	self assert: hg rootNodes anyOne children anyOne children anyOne children anyOne children size equals: 3.
	self assert: hg rootNodes anyOne children anyOne children anyOne children anyOne children anyOne level equals: 4.
	self assert: hg rootNodes anyOne children anyOne children anyOne children anyOne children anyOne isLeafNode
]

{ #category : #tests }
MalHierarchicalGraphTests >> testSimpleApiTopDown [
	| hg |
	hg := MalHierarchicalGraph with: self setupSimpleTopDownModel.
	hg topDown: #children.
	self assert: hg nodes size equals: 121.
	self assert: hg rootNodes size equals: 1.
	self assert: hg rootNodes anyOne level equals: 0.
	self assert: hg rootNodes anyOne children size equals: 3.
	self assert: hg rootNodes anyOne children anyOne level equals: 1.
	self assert: hg rootNodes anyOne children anyOne children size equals: 3.
	self assert: hg rootNodes anyOne children anyOne children anyOne level equals: 2.
	self assert: hg rootNodes anyOne children anyOne children anyOne children size equals: 3.
	self assert: hg rootNodes anyOne children anyOne children anyOne children anyOne level equals: 3.
	self assert: hg rootNodes anyOne children anyOne children anyOne children anyOne children size equals: 3.
	self assert: hg rootNodes anyOne children anyOne children anyOne children anyOne children anyOne level equals: 4.
	self assert: hg rootNodes anyOne children anyOne children anyOne children anyOne children anyOne isLeafNode
]

{ #category : #tests }
MalHierarchicalGraphTests >> testSimpleEdgeApi [
	| hg rootNodes edges |
	rootNodes := OrderedCollection new.
	rootNodes
		add: 'a';
		add: 'b';
		add: 'c'.
	hg := MalHierarchicalGraph with: rootNodes.
	hg
		topDown: [ :entity | 
			entity size < 6
				ifTrue: [ 
					| result |
					result := Set new.
					result add: entity , 'a'.
					result add: entity , 'b'.
					result add: entity , 'c'.
					result ] ].
	edges := OrderedCollection new.
	edges add: 'ab' -> 'ba'.
	edges add: 'ab' -> 'bb'.
	edges add: 'a' -> 'b'.
	edges add: 'a' -> 'c'.
	edges add: 'a' -> 'ab'.
	hg addEdges: edges from: #key to: #value.
	self assert: (hg nodeWrapping: 'a') outgoing size equals: 3.
	self assert: (hg nodeWrapping: 'ab') outgoing size equals: 2.
	self assert: (hg nodeWrapping: 'ba') outgoing isEmpty.
	self assert: (hg nodeWrapping: 'ba') incoming size equals: 1.
	self assert: (hg nodeWrapping: 'b') incoming size equals: 1.
	self assert: (hg nodeWrapping: 'c') incoming size equals: 1.
	self assert: (hg nodeWrapping: 'ab') incoming size equals: 1.
	self assert: (hg nodeWrapping: 'cb') incoming isEmpty
]

{ #category : #tests }
MalHierarchicalGraphTests >> testSimpleEdgeApiWithModel [
	| hg rootNodes edges |
	rootNodes := OrderedCollection new.
	rootNodes
		add: 'a';
		add: 'b';
		add: 'c'.
	hg := MalHierarchicalGraph with: rootNodes.
	hg
		topDown: [ :entity | 
			entity size < 6
				ifTrue: [ 
					| result |
					result := Set new.
					result add: entity , 'a'.
					result add: entity , 'b'.
					result add: entity , 'c'.
					result ] ].
	edges := OrderedCollection new.
	edges add: (MalHgTestEdge from: 'ab' to: 'ba').
	edges add: (MalHgTestEdge from: 'ab' to: 'bb').
	edges add: (MalHgTestEdge from: 'a' to: 'b').
	edges add: (MalHgTestEdge from: 'a' to: 'c').
	edges add: (MalHgTestEdge from: 'a' to: 'ab').
	hg addEdges: edges from: {(MalHgTestEdge -> #from)} to: {(MalHgTestEdge -> #to)}.
	self assert: (hg nodeWrapping: 'a') outgoing size equals: 3.
	self assert: (hg nodeWrapping: 'ab') outgoing size equals: 2.
	self assert: (hg nodeWrapping: 'ba') outgoing isEmpty.
	self assert: (hg nodeWrapping: 'ba') incoming size equals: 1.
	self assert: (hg nodeWrapping: 'b') incoming size equals: 1.
	self assert: (hg nodeWrapping: 'c') incoming size equals: 1.
	self assert: (hg nodeWrapping: 'ab') incoming size equals: 1.
	self assert: (hg nodeWrapping: 'cb') incoming isEmpty.
	hg resetEdges.
	hg addEdges: edges from: {(MalHgTestEdge -> [ :e | e from ])} to: {(MalHgTestEdge -> [ :e | e to ])}.
	self assert: (hg nodeWrapping: 'a') outgoing size equals: 3.
	self assert: (hg nodeWrapping: 'ab') outgoing size equals: 2.
	self assert: (hg nodeWrapping: 'ba') outgoing isEmpty.
	self assert: (hg nodeWrapping: 'ba') incoming size equals: 1.
	self assert: (hg nodeWrapping: 'b') incoming size equals: 1.
	self assert: (hg nodeWrapping: 'c') incoming size equals: 1.
	self assert: (hg nodeWrapping: 'ab') incoming size equals: 1.
	self assert: (hg nodeWrapping: 'cb') incoming isEmpty.
	hg resetEdges.	"This is not elegant, but it has to work anyway."
	hg
		addEdges: edges
		from:
			{(MalHgTestEdge -> #from).
			(MalHgTestEdge -> #from)}
		to:
			{(MalHgTestEdge -> #to).
			(MalHgTestEdge -> #to)}.
	self assert: (hg nodeWrapping: 'a') outgoing size equals: 3.
	self assert: (hg nodeWrapping: 'ab') outgoing size equals: 2.
	self assert: (hg nodeWrapping: 'ba') outgoing isEmpty.
	self assert: (hg nodeWrapping: 'ba') incoming size equals: 1.
	self assert: (hg nodeWrapping: 'b') incoming size equals: 1.
	self assert: (hg nodeWrapping: 'c') incoming size equals: 1.
	self assert: (hg nodeWrapping: 'ab') incoming size equals: 1.
	self assert: (hg nodeWrapping: 'cb') incoming isEmpty
]

{ #category : #tests }
MalHierarchicalGraphTests >> testSimpleModel [
	| root |
	root := self setupSimpleTopDownModel.	"We have four levels"
	self assert: root children size equals: 3.
	self assert: root children anyOne children size equals: 3.
	self assert: root children anyOne children anyOne children size equals: 3.
	self assert: root children anyOne children anyOne children anyOne children size equals: 3.
	self assert: root children anyOne children anyOne children anyOne children anyOne children size equals: 0.	"We have a hierarchy chain"
	self assert: root children anyOne children anyOne children anyOne parent parent parent equals: root.	"root is root"
	self assert: root parent equals: nil
]

{ #category : #tests }
MalHierarchicalGraphTests >> testSingleNodeHiGraph [
	| hg |
	hg := MalHierarchicalGraph with: (OrderedCollection with: 'someBaseEntity').
	self assert: hg nodes size equals: 1
]

{ #category : #tests }
MalHierarchicalGraphTests >> testTopDownDeepGraphBuilding [
	| hg rootNodes |
	
	rootNodes := OrderedCollection new.
	rootNodes add: 'a'; add: 'b'; add: 'c'.
	
	hg := MalHierarchicalGraph with: rootNodes.

	hg topDown: [ :model |  
		(model size < 7) 
		ifTrue: [
			| result |
			result := OrderedCollection new.
			result add: (model, 'a').
			result add: (model, 'b').
			result add: (model, 'c').
			result.
		]
	].
	
	"Testing nodes and hierarchy."
	self assert: (hg rootNodes size = 3) description: 'Should be exactly 3 root nodes in this graph'.
	self assert: (hg nodes size = 3279) description: 'Should be exactly 3279 nodes in total in this graph'.
	self assert: (hg rootNodes anyOne children size = 3) description: 'Any rootNode should have exactly 3 children'.
	self assert: ((hg nodesFor: (Set with: 'aa')) anyOne parent model = 'a') description: 'Parent of aa should be a'.
	self assert: ((hg nodesFor: (Set with: 'ca')) anyOne parent model = 'c') description: 'Parent of ca should be c'.
	self assert: ((hg nodesFor: (Set with: 'aca')) anyOne parent model = 'ac') description: 'Parent of ac should be aca'.
	self assert: ((hg nodesFor: (Set with: 'aaaaaa')) anyOne parent model = 'aaaaa') description: 'Parent of aaaaaa should be aaaaa'.
	self assert: ((hg nodesFor: (Set with: 'abacac')) anyOne parent model = 'abaca') description: 'Parent of abacac should be abaca'.
	self assert: ((hg nodesFor: (Set with: 'caabc')) anyOne parent model = 'caab') description: 'Parent of caabc should be caab'.
	self assert: ((hg nodesFor: (Set with: 'aaaaaaa')) anyOne isLeafNode) description: 'Node aaaaaaa should be a leaf node'.
	self assert: ((hg nodesFor: (Set with: 'aaaaaaa')) anyOne level = 6) description: 'Node aaaaaaa should be on level 6'.
	self assert: ((hg nodesFor: (Set with: 'c')) anyOne level = 0) description: 'Node c should be on level 0'.
	self assert: ((hg nodesFor: (Set with: 'c')) anyOne isRootNode) description: 'Node c should be a root node'.
	self assert: ((hg nodesFor: (Set with: 'bc')) anyOne level = 1) description: 'Node bc should be on level 1'.
	self assert: ((hg nodesFor: (Set with: 'acb')) anyOne level = 2) description: 'Node acb should be on level 2'.
	self assert: ((hg nodesFor: (Set with: 'caba')) anyOne level = 3) description: 'Node caba should be on level 3'.
	self assert: ((hg nodesFor: (Set with: 'bccab')) anyOne level = 4) description: 'Node bccab should be on level 4'.
	self assert: ((hg nodesFor: (Set with: 'bcabca')) anyOne level = 5) description: 'Node bcabca should be on level 5'.
	self assert: ((hg nodesFor: (Set with: 'caabccc')) anyOne level = 6) description: 'Node caabccc should be on level 6'.
	
]

{ #category : #tests }
MalHierarchicalGraphTests >> testTopDownGraphBuilding [
	| hg rootNodes |
	
	rootNodes := OrderedCollection new.
	
	rootNodes add: 1; add: 2; add:3.
	
	hg := MalHierarchicalGraph with: rootNodes.

	hg topDown: [ :n |  
		(n = 1 or: (n = 2 or: n = 3)) 
		ifTrue: [
			| result |
			result := Set new.
			result add: ((n asString , '1') asInteger).
			result add: ((n asString , '2') asInteger).
			result add: ((n asString , '3') asInteger).
			result.
		]
	].
	
	self assert: (hg rootNodes size = 3) description: 'Should be exactly 3 root nodes in this graph'.
	self assert: (hg nodes size = 12) description: 'Should be exactly 12 nodes in total in this graph'.
	self assert: (hg rootNodes anyOne children size = 3) description: 'Any rootNode should have exactly 3 children'.
	self assert: ((hg nodesFor: (Set with: 11)) anyOne parent model = 1) description: 'Parent of 11 should be 1'.
	self assert: ((hg nodesFor: (Set with: 12)) anyOne parent model = 1) description: 'Parent of 12 should be 1'.
	self assert: ((hg nodesFor: (Set with: 13)) anyOne parent model = 1) description: 'Parent of 13 should be 1'.
	self assert: ((hg nodesFor: (Set with: 21)) anyOne parent model = 2) description: 'Parent of 13 should be 2'.
	self assert: ((hg nodesFor: (Set with: 22)) anyOne parent model = 2) description: 'Parent of 13 should be 2'.
	self assert: ((hg nodesFor: (Set with: 23)) anyOne parent model = 2) description: 'Parent of 13 should be 2'.
	self assert: ((hg nodesFor: (Set with: 31)) anyOne parent model = 3) description: 'Parent of 13 should be 3'.
	self assert: ((hg nodesFor: (Set with: 32)) anyOne parent model = 3) description: 'Parent of 13 should be 3'.
	self assert: ((hg nodesFor: (Set with: 33)) anyOne parent model = 3) description: 'Parent of 13 should be 3'.

]

{ #category : #tests }
MalHierarchicalGraphTests >> testVerySimpleHierarchicalGraph [
	| hg rootNodes edges hierarchy |
	"leafs := #(1 2 3 4 5)."
	rootNodes := #(6 7).
	hg := MalHierarchicalGraph with: rootNodes.
	edges := OrderedCollection new.
	edges
		add: 1 -> 2;
		add: 1 -> 3;
		add: 3 -> 4;
		add: 2 -> 5.
	hierarchy := Dictionary new.
	hierarchy
		at: 6 put: #(1 2 3);
		at: 7 put: #(4 5).
	hg topDown: [ :m | hierarchy at: m ifAbsent: [ nil ] ].
	hg addEdges: edges from: [ :e | e key ] to: [ :e | e value ].
	self assert: hg edges size equals: 4.
	hg propagateEdges.
	self assert: hg edges size > 0.
	self assert: hg edges size equals: 10.
	self assert: (hg edges contains: [ :rel | rel from model = 6 and: [ rel to model = 7 ] ])
]

{ #category : #tests }
MalHierarchicalGraphTests >> testfindEdge [
	| hg rootNodes edges hierarchy |
	
	"leafs := #(1 2 3 4 5)."
	rootNodes := #(6 7).
	
	hg := MalHierarchicalGraph with: rootNodes.
	
	edges := OrderedCollection new.
	edges 
		add: (1 -> 2);
		add: (1 -> 3);
		add: (3 -> 4);
		add: (2 -> 5).
		
	hierarchy := Dictionary new.
	hierarchy 
		at: 6 put: #(1 2 3);
		at: 7 put: #(4 5).
	
	hg topDown: [ :m |
		hierarchy at: m ifAbsent: [ nil ].
	].
	
	hg addEdges: edges 
		from:  [:e | e key]
		to: [:e | e value].

	hg propagateEdges.
	
	self assert: (hg edges contains: [ :e | e = (hg findEdge: (1 -> 2)) ]).


]

{ #category : #tests }
MalHierarchicalGraphTests >> testfindNode [
	| hg |
	hg := MalHierarchicalGraph with: self setupSimpleTopDownModel.
	hg topDown: {(MalHgTestModelSimple -> #children)}.
	self assert: hg rootNodes size equals: 1.
	self assert: (hg findNode: hg rootNodes anyOne model) equals: hg rootNodes anyOne
]
