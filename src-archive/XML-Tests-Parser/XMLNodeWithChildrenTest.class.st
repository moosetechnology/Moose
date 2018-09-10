"
Abstract, do not run.
"
Class {
	#name : #XMLNodeWithChildrenTest,
	#superclass : #XMLNodeTest,
	#category : #'XML-Tests-Parser-DOM'
}

{ #category : #testing }
XMLNodeWithChildrenTest class >> isAbstract [
	^ true
]

{ #category : #accessing }
XMLNodeWithChildrenTest >> copiedClasses [
	"an object that isKindOf: any of these should be copied if it's
	reachable from a copied node directly or through another copied object"

	^ #(OrderedCollection Dictionary
		XMLNode XMLNamespaceScope XMLOrderedList
		XMLConfiguration XMLNodeFactory)
]

{ #category : #'instance creation' }
XMLNodeWithChildrenTest >> newNodeWithNodes [
	^ self newNode
		addNode: (XMLComment string: 'one');
		addNode: (XMLPI target: 'two' data: 'three');
		addNode: (XMLComment string: 'four');
		addNode: (XMLPI target: 'five' data: 'six');
		yourself
]

{ #category : #accessing }
XMLNodeWithChildrenTest >> nodeClass [
	^ XMLNodeWithChildren
]

{ #category : #accessing }
XMLNodeWithChildrenTest >> nodeListClass [
	^ XMLNodeList
]

{ #category : #tests }
XMLNodeWithChildrenTest >> testAddComment [
	| nodeWithNodes comment |

	nodeWithNodes := self newNode.
	comment := nodeWithNodes addComment: 'test'.
	self
		assert: nodeWithNodes nodes size = 1;
		assert: nodeWithNodes firstNode == comment;
		assert: comment isComment;
		assert: comment string = 'test'.
]

{ #category : #tests }
XMLNodeWithChildrenTest >> testAddNode [
	| node nodesAdded nodeWithNodes |

	node := self newNode.
	nodesAdded := node nodes copyEmpty.
	nodeWithNodes := self newNodeWithNodes.

	"adding nodes from another node should remove them from the previous node"
	nodeWithNodes nodes copy do: [:each |
		nodesAdded addLast: each.
		self
			assert: (node addNode: each) == each;
			assert: node nodes = nodesAdded;
			assert: each parent == node;
			deny: (nodeWithNodes nodes includes: each)].
	self deny: nodeWithNodes hasChildren.

	"adding already present nodes should move them in-place"
	node nodes copy do: [:each |
		nodesAdded
			remove: each;
			addLast: each.
		self
			assert: (node addNode: each) == each;
			assert: node nodes = nodesAdded;
			assert: each parent == node].
]

{ #category : #tests }
XMLNodeWithChildrenTest >> testAddNodeAfter [
	| node nodesAdded nodeWithNodes nodeAfter |

	node := self newNode.
	nodesAdded := node nodes copyEmpty.
	nodeWithNodes := self newNodeWithNodes.

	"adding nodes from another node should remove them from the previous node"
	nodeAfter := nodeWithNodes firstNode.
	nodesAdded addLast: nodeAfter.
	node addNode: nodeAfter.
	nodeWithNodes nodes reversed do: [:each |
		nodesAdded
			add: each
			after: nodeAfter.
		self
			assert: (node addNode: each after: nodeAfter) == each;
			assert: node nodes = nodesAdded;
			assert: each parent == node;
			deny: (nodeWithNodes nodes includes: each)].
	self deny: nodeWithNodes hasChildren.

	"adding already present nodes should move them in-place"
	nodeAfter := nodesAdded last.
	node nodes allButLast reverseDo: [:each |
		nodesAdded
			remove: each;
			add: each after: nodeAfter.
		self
			assert: (node addNode: each after: nodeAfter) == each;
			assert: node nodes = nodesAdded;
			assert: each parent == node].
]

{ #category : #tests }
XMLNodeWithChildrenTest >> testAddNodeBefore [
	| node nodesAdded nodeWithNodes nodeBefore |

	node := self newNode.
	nodesAdded := node nodes copyEmpty.
	nodeWithNodes := self newNodeWithNodes.

	"adding nodes from another node should remove them from the previous node"
	nodeBefore := nodeWithNodes lastNode.
	nodesAdded addLast: nodeBefore.
	node addNode: nodeBefore.
	nodeWithNodes nodes copy do: [:each |
		nodesAdded
			add: each
			before: nodeBefore.
		self
			assert: (node addNode: each before: nodeBefore) == each;
			assert: node nodes = nodesAdded;
			assert: each parent == node;
			deny: (nodeWithNodes nodes includes: each)].
	self deny: nodeWithNodes hasChildren.

	"adding already present nodes should move them in-place"
	nodeBefore := nodesAdded first.
	node nodes allButFirst reverseDo: [:each |
		nodesAdded
			remove: each;
			add: each before: nodeBefore.
		self
			assert: (node addNode: each before: nodeBefore) == each;
			assert: node nodes = nodesAdded;
			assert: each parent == node].
]

{ #category : #tests }
XMLNodeWithChildrenTest >> testAddNodeFirst [
	| node nodesAdded nodeWithNodes |

	node := self newNode.
	nodesAdded := node nodes copyEmpty.
	nodeWithNodes := self newNodeWithNodes.

	"adding nodes from another node should remove them from the previous node"
	nodeWithNodes nodes copy do: [:each |
		nodesAdded addFirst: each.
		self
			assert: (node addNodeFirst: each) == each;
			assert: node nodes = nodesAdded;
			assert: each parent == node;
			deny: (nodeWithNodes nodes includes: each)].
	self deny: nodeWithNodes hasChildren.

	"adding already present nodes should move them in-place"
	node nodes reversed do: [:each |
		nodesAdded
			remove: each;
			addFirst: each.
		self
			assert: (node addNodeFirst: each) == each;
			assert: node nodes = nodesAdded;
			assert: each parent == node].
]

{ #category : #tests }
XMLNodeWithChildrenTest >> testAddNodes [
	| node nodesAdded nodeWithNodes |

	node := self newNode.
	nodeWithNodes := self newNodeWithNodes.

	"adding nodes from another node should remove them from the previous node"
	nodesAdded := nodeWithNodes nodes copy.
	self
		assert: (node addNodes: nodesAdded) = nodesAdded;
		assert: node nodes = nodesAdded;
		assert: (node nodes allSatisfy: [:each | each parent == node]);
		deny: nodeWithNodes hasChildren.

	"adding already present nodes should move them in-place"
	nodesAdded := nodesAdded reversed.
	self
		assert: (node addNodes: nodesAdded) = nodesAdded;
		assert: node nodes = nodesAdded;
		assert: (node nodes allSatisfy: [:each | each parent == node]).
]

{ #category : #tests }
XMLNodeWithChildrenTest >> testAddPITargetData [
	| nodeWithNodes pi |

	nodeWithNodes := self newNode.
	pi :=
		nodeWithNodes
			addPITarget: 'target'
			data: 'data'.
	self
		assert: nodeWithNodes nodes size = 1;
		assert: nodeWithNodes firstNode == pi;
		assert: pi isPI;
		assert: pi target = 'target';
		assert: pi data = 'data'.
]

{ #category : #tests }
XMLNodeWithChildrenTest >> testAllNodes [
	| nodeWithNodes allNodes |

	nodeWithNodes := self newNodeWithNodes.
	allNodes := nodeWithNodes allNodes.
	self
		assert: allNodes size = 5;
		assert: allNodes first == nodeWithNodes;
		assert: allNodes second isComment;
		assert: allNodes second string = 'one';
		assert: allNodes third isPI;
		assert: allNodes third target = 'two';
		assert: allNodes third data = 'three';
		assert: allNodes fourth isComment;
		assert: allNodes fourth string = 'four';
		assert: allNodes fifth isPI;
		assert: allNodes fifth target = 'five';
		assert: allNodes fifth data = 'six'.
]

{ #category : #tests }
XMLNodeWithChildrenTest >> testAllNodesCollect [
	| nodeWithNodes allNodes |

	nodeWithNodes := self newNodeWithNodes.
	allNodes := nodeWithNodes allNodes.
	self
		assertList: (nodeWithNodes allNodesCollect: [:each | each identityHash])
		collects: (allNodes collect: [:each | each identityHash]).

	allNodes do: [:node |
		node canHaveChildren
			ifTrue: [
				self
					assertList: (node allNodesCollect: [:each | each identityHash])
					collects: (node allNodes collect: [:each | each identityHash])]].
]

{ #category : #tests }
XMLNodeWithChildrenTest >> testAllNodesDetect [
	| nodeWithNodes allNodes detectedNode |

	nodeWithNodes := self newNodeWithNodes.
	allNodes := nodeWithNodes allNodes.
	detectedNode := nodeWithNodes allNodesDetect: [:each | each isPI].
	self
		assert: detectedNode notNil;
		assert: detectedNode isPI;
		assert: detectedNode = (allNodes detect: [:each | each isPI]);
		assert: (nodeWithNodes allNodesDetect: [:each | each isElementNamed: 'absent']) isNil.
]

{ #category : #tests }
XMLNodeWithChildrenTest >> testAllNodesDetectIfNone [
	| nodeWithNodes allNodes detectedNode |

	nodeWithNodes := self newNodeWithNodes.
	allNodes := nodeWithNodes allNodes.
	detectedNode :=
		nodeWithNodes
			allNodesDetect: [:each | each isPI]
			ifNone: [self fail].
	self
		assert: detectedNode isPI;
		assert: detectedNode = (allNodes detect: [:each | each isPI] ifNone: [#absent]);
		assert:
			(nodeWithNodes
				allNodesDetect: [:each | each isElementNamed: 'absent']
				ifNone: [#absent]) = #absent.
]

{ #category : #tests }
XMLNodeWithChildrenTest >> testAllNodesDo [
	| nodeWithNodes allNodes |

	nodeWithNodes := self newNodeWithNodes.
	allNodes := nodeWithNodes allNodes.
	self
		xmlShould: [:block | nodeWithNodes allNodesDo: block]
		enumerate: allNodes.

	allNodes do: [:node |
		node canHaveChildren
			ifTrue: [
				self
					xmlShould: [:block | node allNodesDo: block]
					enumerate: node allNodes]].
]

{ #category : #tests }
XMLNodeWithChildrenTest >> testAllNodesSelect [
	| nodeWithNodes allNodes |

	nodeWithNodes := self newNodeWithNodes.
	allNodes := nodeWithNodes allNodes.
	self
		assertList: (nodeWithNodes allNodesSelect: [:each | each isComment])
		selects: (allNodes select: [:each | each isComment]).

	allNodes do: [:node |
		node canHaveChildren
			ifTrue: [
				self
					assertList: (node allNodesSelect: [:each | each isComment])
					selects: (node allNodes select: [:each | each isComment])]].
]

{ #category : #tests }
XMLNodeWithChildrenTest >> testAncestorNodes [
	| nodeWithNodes ancestorStack |

	super testAncestorNodes.

	nodeWithNodes := self newNodeWithNodes.
	ancestorStack := OrderedCollection new.
	nodeWithNodes allNodesDo: [:each |
		[ancestorStack isEmpty
			or: [ancestorStack last == each parent]]
			whileFalse: [ancestorStack removeLast].
		self assert:
			each ancestorNodes asOrderedCollection =
				ancestorStack reversed.
		ancestorStack addLast: each].
]

{ #category : #tests }
XMLNodeWithChildrenTest >> testAncestorNodesDo [
	| nodeWithNodes |

	super testAncestorNodesDo.

	nodeWithNodes := self newNodeWithNodes.
	nodeWithNodes allNodesDo: [:each |
		self
			xmlShould: [:block | each ancestorNodesDo: block]
			enumerate: each ancestorNodes].
]

{ #category : #tests }
XMLNodeWithChildrenTest >> testCanHaveChildren [
	self assert: self newNode canHaveChildren
]

{ #category : #tests }
XMLNodeWithChildrenTest >> testCanonicallyEquals [
	super testCanonicallyEquals.
	self
		assert: (self newNodeWithNodes canonicallyEquals: self newNodeWithNodes);
		deny: (self newNodeWithNodes canonicallyEquals: self newNode).
]

{ #category : #tests }
XMLNodeWithChildrenTest >> testCopy [
	"this traverses the object graph of each node and compares it with
	its copy to make sure nodes and the inst vars that should be copied
	are copied. See #copiedClasses"
	| nodeWithNodes nodeWithNodesCopy unvisitedPairs visitedPairs copiedClasses |

	super testCopy.

	nodeWithNodes := self newNodeWithNodes.
	"initialize the configuration (if it can have one)"
	nodeWithNodes configuration
		ifNotNil: [:config | config nodeFactory: XMLPluggableNodeFactory new].

	nodeWithNodesCopy := nodeWithNodes copy.
	self
		assert: nodeWithNodes printString = nodeWithNodesCopy printString;
		assert: nodeWithNodes allNodes size = nodeWithNodesCopy allNodes size.

	unvisitedPairs := Set new.
	nodeWithNodes allNodes
		with: nodeWithNodesCopy allNodes
		do: [:node :nodeCopy | unvisitedPairs add: node -> nodeCopy].

	visitedPairs := Set new.
	copiedClasses :=
		self copiedClasses collect: [:each |
			XMLClassFinder classNamed: each].
	[unvisitedPairs isEmpty]
		whileFalse: [ | pair originalObject copyObject |
			pair := unvisitedPairs remove: unvisitedPairs anyOne.
			originalObject := pair key.
			copyObject := pair value.

			self deny: originalObject == copyObject.
			visitedPairs add: pair.
			1
				to: (originalObject class instSize min: copyObject class instSize)
				do: [:i | | newPair |
					newPair := (originalObject instVarAt: i) -> (copyObject instVarAt: i).
					((visitedPairs includes: newPair)
						or: [copiedClasses noneSatisfy: [:each | newPair key isKindOf: each]])
						ifFalse: [unvisitedPairs add: newPair]]].
]

{ #category : #tests }
XMLNodeWithChildrenTest >> testDescendantNodes [
	| nodeWithNodes descendantNodes |

	nodeWithNodes := self newNodeWithNodes.
	descendantNodes := nodeWithNodes descendantNodes.
	self
		assertList: descendantNodes
		selects: nodeWithNodes allNodes allButFirst.

	descendantNodes do: [:node |
		node canHaveChildren
			ifTrue: [
				self
					assertList: node descendantNodes
					selects: node allNodes allButFirst]].
]

{ #category : #tests }
XMLNodeWithChildrenTest >> testDescendantNodesCollect [
	| nodeWithNodes descendantNodes |

	nodeWithNodes := self newNodeWithNodes.
	descendantNodes := nodeWithNodes descendantNodes.
	self
		assertList: (nodeWithNodes descendantNodesCollect: [:each | each identityHash])
		collects: (descendantNodes collect: [:each | each identityHash]).

	descendantNodes do: [:node |
		node canHaveChildren
			ifTrue: [
				self
					assertList: (node descendantNodesCollect: [:each | each identityHash])
					collects: (node descendantNodes collect: [:each | each identityHash])]].
]

{ #category : #tests }
XMLNodeWithChildrenTest >> testDescendantNodesDetect [
	| nodeWithNodes descendantNodes detectedNode |

	nodeWithNodes := self newNodeWithNodes.
	descendantNodes := nodeWithNodes descendantNodes.
	detectedNode := nodeWithNodes descendantNodesDetect: [:each | each isPI].
	self
		assert: detectedNode notNil;
		assert: detectedNode isPI;
		assert: detectedNode = (descendantNodes detect: [:each | each isPI]);
		assert: (nodeWithNodes descendantNodesDetect: [:each | each isElementNamed: 'absent']) isNil.
]

{ #category : #tests }
XMLNodeWithChildrenTest >> testDescendantNodesDetectIfNone [
	| nodeWithNodes descendantNodes detectedNode |

	nodeWithNodes := self newNodeWithNodes.
	descendantNodes := nodeWithNodes descendantNodes.
	detectedNode :=
		nodeWithNodes
			descendantNodesDetect: [:each | each isPI]
			ifNone: [self fail].
	self
		assert: detectedNode isPI;
		assert: detectedNode = (descendantNodes detect: [:each | each isPI] ifNone: [#absent]);
		assert:
			(nodeWithNodes
				descendantNodesDetect: [:each | each isElementNamed: 'absent']
				ifNone: [#absent]) = #absent.
]

{ #category : #tests }
XMLNodeWithChildrenTest >> testDescendantNodesDo [
	| nodeWithNodes descendantNodes |

	nodeWithNodes := self newNodeWithNodes.
	descendantNodes := nodeWithNodes descendantNodes.
	self
		xmlShould: [:block | nodeWithNodes descendantNodesDo: block]
		enumerate: descendantNodes.

	descendantNodes do: [:node |
		node canHaveChildren
			ifTrue: [
				self
					xmlShould: [:block | node descendantNodesDo: block]
					enumerate: node descendantNodes]].
]

{ #category : #tests }
XMLNodeWithChildrenTest >> testDescendantNodesSelect [
	| nodeWithNodes descendantNodes |

	nodeWithNodes := self newNodeWithNodes.
	descendantNodes := nodeWithNodes descendantNodes.
	self
		assertList: (nodeWithNodes descendantNodesSelect: [:each | each isComment])
		selects: (descendantNodes select: [:each | each isComment]).

	descendantNodes do: [:node |
		node canHaveChildren
			ifTrue: [
				self
					assertList: (node descendantNodesSelect: [:each | each isComment])
					selects: (node descendantNodes select: [:each | each isComment])]].
]

{ #category : #tests }
XMLNodeWithChildrenTest >> testDocument [
	| nodeWithNodes document |

	nodeWithNodes := self newNodeWithNodes.
	document := nodeWithNodes document.
	nodeWithNodes allNodesDo: [:each |
		self assert: each document == document].

	document
		ifNotNil: [ | root |
			root := document root.
			document removeNodes.
			root allNodesDo: [:each |
				self assert: each document isNil]].
]

{ #category : #tests }
XMLNodeWithChildrenTest >> testDocumentRoot [
	| nodeWithNodes |

	super testDocumentRoot.

	nodeWithNodes := self newNodeWithNodes.
	nodeWithNodes allNodesDo: [:each |
		self assert: each documentRoot == nodeWithNodes].
]

{ #category : #tests }
XMLNodeWithChildrenTest >> testFirstNode [
	| nodeWithNodes |

	nodeWithNodes := self newNodeWithNodes.
	nodeWithNodes nodes copy do: [:each |
		self  assert: nodeWithNodes firstNode = each.
		nodeWithNodes removeNode: each].
	self assert: nodeWithNodes firstNode isNil.
]

{ #category : #tests }
XMLNodeWithChildrenTest >> testHasChildren [
	super testHasChildren.

	self assert: self newNodeWithNodes hasChildren.
]

{ #category : #tests }
XMLNodeWithChildrenTest >> testIncludesNode [
	| nodeWithNodes |

	nodeWithNodes := self newNodeWithNodes.
	nodeWithNodes nodes do: [:each |
		self assert: (nodeWithNodes includesNode: each)].
	self deny: (nodeWithNodes includesNode: self newNode).
]

{ #category : #tests }
XMLNodeWithChildrenTest >> testLastNode [
	| nodeWithNodes |

	nodeWithNodes := self newNodeWithNodes.
	nodeWithNodes nodes reversed do: [:each |
		self  assert: nodeWithNodes lastNode = each.
		nodeWithNodes removeNode: each].

	self assert: nodeWithNodes lastNode isNil.
]

{ #category : #tests }
XMLNodeWithChildrenTest >> testNextNode [
	| nodeWithNodes nextNode |

	super testNextNode.
	nodeWithNodes := self newNodeWithNodes.
	nextNode := nil.
	nodeWithNodes nodes reverseDo: [:each |
		self assert: each nextNode = nextNode.
		nextNode := each].
]

{ #category : #tests }
XMLNodeWithChildrenTest >> testNodeAfter [
	| nodeWithNodes nodeAfter |

	nodeWithNodes := self newNodeWithNodes.
	nodeAfter := nil.
	nodeWithNodes nodes reverseDo: [:each |
		self assert: (nodeWithNodes nodeAfter: each) = nodeAfter.
		nodeAfter := each].
	self assert: (nodeWithNodes nodeAfter: self newNode) isNil.
]

{ #category : #tests }
XMLNodeWithChildrenTest >> testNodeAt [
	| nodeWithNodes |

	nodeWithNodes := self newNodeWithNodes.
	self assert: (nodeWithNodes nodeAt: 0) isNil.
	1 to: nodeWithNodes nodes size do: [:i |
		self assert: (nodeWithNodes nodeAt: i) = (nodeWithNodes nodes at: i)].
	self assert: (nodeWithNodes nodeAt: nodeWithNodes nodes size + 1) isNil.
]

{ #category : #tests }
XMLNodeWithChildrenTest >> testNodeAtIfAbsent [
	| nodeWithNodes |

	nodeWithNodes := self newNodeWithNodes.
	1 to: nodeWithNodes nodes size do: [:i |
		self assert:
			(nodeWithNodes
				nodeAt: i
				ifAbsent: [self fail]) = (nodeWithNodes nodes at: i)].
	self assert:
		(nodeWithNodes
			nodeAt: 0
			ifAbsent: [#absent]) = #absent.
	self assert:
		(nodeWithNodes
			nodeAt: nodeWithNodes nodes size + 1
			ifAbsent: [#absent]) = #absent.
]

{ #category : #tests }
XMLNodeWithChildrenTest >> testNodeAtPut [
	| nodeWithNodes newNodeClass newNode |

	nodeWithNodes := self newNodeWithNodes.
	newNodeClass := nodeWithNodes firstNode class.
	self
		should: [nodeWithNodes nodeAt: 0 put: newNodeClass new]
		raise: Error.
	1 to: nodeWithNodes nodes size do: [:i |
		newNode := newNodeClass new.
		self
			assert: (nodeWithNodes nodeAt: i put: newNode) == newNode;
			assert: (nodeWithNodes nodeAt: i) == newNode].

	newNode := newNodeClass new.
	self assert:
		(nodeWithNodes
			nodeAt: nodeWithNodes nodes size + 1
			put: newNode) == newNode.
	self assert: (nodeWithNodes nodeAt: nodeWithNodes nodes size) == newNode.
	self
		should: [
			nodeWithNodes
				nodeAt: nodeWithNodes nodes size + 2
				put: newNodeClass new]
		raise: Error.
]

{ #category : #tests }
XMLNodeWithChildrenTest >> testNodeBefore [
	| nodeWithNodes nodeBefore |

	nodeWithNodes := self newNodeWithNodes.
	nodeBefore := nil.
	nodeWithNodes nodes do: [:each |
		self assert: (nodeWithNodes nodeBefore: each) = nodeBefore.
		nodeBefore := each].
	self assert: (nodeWithNodes nodeBefore: self newNode) isNil.
]

{ #category : #tests }
XMLNodeWithChildrenTest >> testNodeListCopying [
	| nodeWithNodes nodeListCopy |

	nodeWithNodes := self newNodeWithNodes.
	nodeListCopy := nodeWithNodes nodes copy.
	self
		assert: nodeListCopy = nodeWithNodes nodes;
		deny: nodeListCopy == nodeWithNodes nodes;
		assert: nodeWithNodes nodes observer == nodeWithNodes;
		assert: nodeListCopy observer isNil.
]

{ #category : #tests }
XMLNodeWithChildrenTest >> testNodes [
	self assert: self newNode nodes class == self nodeListClass
]

{ #category : #tests }
XMLNodeWithChildrenTest >> testNodesCollect [
	| node |

	node := self newNodeWithNodes.
	self
		assertList: (node nodesCollect: [:each | each identityHash])
		collects: (node nodes collect: [:each | each identityHash]).
]

{ #category : #tests }
XMLNodeWithChildrenTest >> testNodesDetect [
	| node detectedNode |

	node := self newNodeWithNodes.
	detectedNode := node nodesDetect: [:each | each isComment].
	self
		assert: detectedNode notNil;
		assert: detectedNode = (node nodes detect: [:each | each isComment]);
		assert: (node nodesDetect: [:each | each isElementNamed: 'absent']) isNil.
]

{ #category : #tests }
XMLNodeWithChildrenTest >> testNodesDetectIfNone [
	| node |

	node := self newNodeWithNodes.
	self assert:
		(node
			nodesDetect: [:each | each isComment]
			ifNone: [self fail]) =
				(node nodes detect: [:each | each isComment]).
	self assert:
		(node
			nodesDetect: [:each | each isElementNamed: 'absent']
			ifNone: [#absent]) = #absent.
]

{ #category : #tests }
XMLNodeWithChildrenTest >> testNodesDo [
	| node |

	node := self newNode.
	self
		xmlShould: [:block | node nodesDo: block]
		enumerate: #().

	node := self newNodeWithNodes.
	self
		xmlShould: [:block | node nodesDo: block]
		enumerate: node nodes.
]

{ #category : #tests }
XMLNodeWithChildrenTest >> testNodesSelect [
	| node |

	node := self newNodeWithNodes.
	self
		assertList: (node nodesSelect: [:each | each hasChildren])
		selects: (node nodes select: [:each | each hasChildren]).
]

{ #category : #tests }
XMLNodeWithChildrenTest >> testPreviousNode [
	| nodeWithNodes previousNode |

	super testPreviousNode.
	nodeWithNodes := self newNodeWithNodes.
	previousNode := nil.
	nodeWithNodes nodes do: [:each |
		self assert: each previousNode = previousNode.
		previousNode := each].
]

{ #category : #tests }
XMLNodeWithChildrenTest >> testRemoveNode [
	| nodeWithNodes |

	nodeWithNodes := self newNodeWithNodes.
	nodeWithNodes nodes copy do: [:each |
		self
			assert: (nodeWithNodes includesNode: each);
			assert: (nodeWithNodes removeNode: each) == each;
			deny: (nodeWithNodes includesNode: each)].
	self deny: nodeWithNodes hasChildren.
	self
		should: [nodeWithNodes removeNode: self newNode]
		raise: Error.
]

{ #category : #tests }
XMLNodeWithChildrenTest >> testRemoveNodeIfAbsent [
	| nodeWithNodes |

	nodeWithNodes := self newNodeWithNodes.
	nodeWithNodes nodes copy do: [:each |
		self assert: (nodeWithNodes includesNode: each).
		self assert:
			(nodeWithNodes
				removeNode: each
				ifAbsent: [self fail]) == each.
		self deny: (nodeWithNodes includesNode: each)].
	self deny: nodeWithNodes hasChildren.
	self assert:
		(nodeWithNodes
			removeNode: self newNode
			ifAbsent: [#absent]) == #absent.
]

{ #category : #tests }
XMLNodeWithChildrenTest >> testRemoveNodes [
	| nodeWithNodes |

	nodeWithNodes := self newNodeWithNodes.
	self
		assert: nodeWithNodes hasChildren;
		assert: nodeWithNodes removeNodes == nodeWithNodes;
		deny: nodeWithNodes hasChildren.
]

{ #category : #tests }
XMLNodeWithChildrenTest >> testRemoveNodesAll [
	| nodeWithNodes |

	nodeWithNodes := self newNodeWithNodes.
	1 to: nodeWithNodes nodes size do: [:i | | removed |
		removed := (nodeWithNodes nodes copyFrom: 1 to: i).
		self
			assert: (removed allSatisfy: [:each | nodeWithNodes includesNode: each]);
			assert: (nodeWithNodes removeNodes: removed) == removed;
			deny: (removed anySatisfy: [:each | nodeWithNodes includesNode: each]).
		nodeWithNodes := self newNodeWithNodes].
]

{ #category : #tests }
XMLNodeWithChildrenTest >> testReplaceNodeWith [
	| nodeWithNodes replacements nodes firstIndex secondIndex |

	nodeWithNodes := self newNodeWithNodes.
	replacements := OrderedCollection new.
	nodeWithNodes nodes copy do: [:each |
		self assert:
			(nodeWithNodes
				replaceNode: each
				with: (replacements add: self newNode)) == replacements last].
	self assert: nodeWithNodes nodes asOrderedCollection = replacements.

	nodeWithNodes := self newNodeWithNodes.
	nodes := nodeWithNodes nodes copy.
	nodes do: [:each |
		self assert:
			(nodeWithNodes
				replaceNode: each
				with: each) == each].
	self assert: nodeWithNodes nodes = nodes.

	firstIndex := 1.
	secondIndex := nodes size.
	[firstIndex < secondIndex]
		whileTrue: [
			nodeWithNodes
				replaceNode: (nodes at: firstIndex)
				with: (nodes at: secondIndex).
			firstIndex := firstIndex + 1.
			secondIndex := secondIndex - 1].
	self assert: nodeWithNodes nodes = nodes reversed.

	self
		should: [
			nodeWithNodes
				replaceNode: nodes anyOne copy
				with: self newNode]
		raise: Error.
]
