"
This is an abstract class for nodes that can contain child nodes.

It has messages to access, add and remove child nodes. The nodes are stored in a kind of XMLObservableList returned by #nodes, which can be modified directly to add or remove nodes from the owner of #nodes (copy it first if that isn't what you want).

There are three types of ""enumerating"" messages: the #nodes* messages enumerate child nodes of the receiver, the #allNode* forms enumerate (using depth-first traversal) the receiver and all descendant nodes, and the #descendantNode* forms  enumerate only descendant nodes.
"
Class {
	#name : #XMLNodeWithChildren,
	#superclass : #XMLNode,
	#instVars : [
		'nodes'
	],
	#category : #'XML-Parser-DOM'
}

{ #category : #adding }
XMLNodeWithChildren >> addComment: aString [
	^ self addNode: (self newComment: aString)
]

{ #category : #adding }
XMLNodeWithChildren >> addNode: aNode [
	"Adds aNode to the end of the receiver's node list. Can be used for elements,
	comments, and other types of nodes."

	^ self nodes addLast: aNode
]

{ #category : #adding }
XMLNodeWithChildren >> addNode: aNode after: aPreviousNode [
	"Adds aNode to the receiver's node list after aPreviousNode raising an
	error if aPreviousNode is absent"

	^ self nodes
		add: aNode
		after: aPreviousNode
]

{ #category : #adding }
XMLNodeWithChildren >> addNode: aNode before: aNextNode [
	"Adds aNode to the receiver's node list before aNextNode raising an
	error if aNextNode is absent"

	^ self nodes
		add: aNode
		before: aNextNode
]

{ #category : #adding }
XMLNodeWithChildren >> addNodeFirst: aNode [
	"Adds aNode to the begining of the receiver's node list. Can be used for
	elements, comments, and other types of nodes."

	^ self nodes addFirst: aNode
]

{ #category : #adding }
XMLNodeWithChildren >> addNodes: aNodeCollection [
	^ self nodes addAll: aNodeCollection
]

{ #category : #adding }
XMLNodeWithChildren >> addPITarget: aTargetString data: aDataString [
	^ self addNode:
		(self
			newPITarget: aTargetString
			data: aDataString)
]

{ #category : #notifying }
XMLNodeWithChildren >> addedNode: aNode [
	aNode parent
		ifNotNil: [:nodeParent |
			nodeParent == self
				ifFalse: [nodeParent removeNode: aNode]].
	aNode parent: self.
]

{ #category : #accessing }
XMLNodeWithChildren >> allNodes [
	"returns a node list with the receiver and all of its descendant nodes"
	| allNodes |

	allNodes := self newListForSelect.
	self allNodesDo: [:each | allNodes addLast: each].
	^ allNodes.
]

{ #category : #enumerating }
XMLNodeWithChildren >> allNodesCollect: aBlock [
	"returns an ordered list of the receiver and all of its descendant nodes
	evaluated with aBlock"
	| collectedObjects |

	collectedObjects := self newListForCollect.
	self allNodesDo: [:each | collectedObjects addLast: (aBlock value: each)].
	^ collectedObjects.
]

{ #category : #enumerating }
XMLNodeWithChildren >> allNodesDetect: aBlock [
	^ self allNodesDetect: aBlock ifNone: [nil]
]

{ #category : #enumerating }
XMLNodeWithChildren >> allNodesDetect: aBlock ifNone: anExceptionBlock [
	self allNodesDo: [:each |
		(aBlock value: each)
			ifTrue: [^ each]].
	^ anExceptionBlock value.
]

{ #category : #enumerating }
XMLNodeWithChildren >> allNodesDo: aBlock [
	"evaluates aBlock for the receiver and all of its descendant nodes"

	aBlock value: self.
	self hasChildren
		ifTrue: [self nodesDo: [:each | each allNodesDo: aBlock]]
]

{ #category : #enumerating }
XMLNodeWithChildren >> allNodesSelect: aBlock [
	| selectedNodes |

	selectedNodes := self newListForSelect.
	self allNodesDo: [:each |
		(aBlock value: each)
			ifTrue: [selectedNodes addLast: each]].
	^ selectedNodes.
]

{ #category : #testing }
XMLNodeWithChildren >> canHaveChildren [
	^ true
]

{ #category : #accessing }
XMLNodeWithChildren >> descendantNodes [
	"returns a node list with all descendant nodes of the receiver"
	| descendentNodes |

	descendentNodes := self newListForSelect.
	self descendantNodesDo: [:each | descendentNodes addLast: each].
	^ descendentNodes.
]

{ #category : #enumerating }
XMLNodeWithChildren >> descendantNodesCollect: aBlock [
	"returns an ordered list of the values of all descendant nodes of the
	receiver evaluated with aBlock"
	| collectedObjects |

	collectedObjects := self newListForCollect.
	self descendantNodesDo: [:each |
		collectedObjects addLast: (aBlock value: each)].
	^ collectedObjects.
]

{ #category : #enumerating }
XMLNodeWithChildren >> descendantNodesDetect: aBlock [
	"returns the first descendant node of the receiver that aBlock evaluates
	true for or nil if there isn't one"

	^ self
		descendantNodesDetect: aBlock
		ifNone: [nil]
]

{ #category : #enumerating }
XMLNodeWithChildren >> descendantNodesDetect: aBlock ifNone: anExceptionBlock [
	"returns the first descendant node of the receiver that aBlock evaluates
	true for or the value of anExceptionBlock if there isn't one"

	self descendantNodesDo: [:each |
		(aBlock value: each)
			ifTrue: [^ each]].
	^ anExceptionBlock value.
]

{ #category : #enumerating }
XMLNodeWithChildren >> descendantNodesDo: aBlock [
	"evaluates aBlock for all descendant nodes of the receiver"

	self hasChildren
		ifTrue: [self nodesDo: [:each | each allNodesDo: aBlock]]
]

{ #category : #enumerating }
XMLNodeWithChildren >> descendantNodesSelect: aBlock [
	"returns a node list of all descendant nodes of the receiver that aBlock
	evaluates true for"
	| selectedNodes |

	selectedNodes := self newListForSelect.
	self descendantNodesDo: [:each |
		(aBlock value: each)
			ifTrue: [selectedNodes addLast: each]].
	^ selectedNodes.
]

{ #category : #deprecated }
XMLNodeWithChildren >> descendentNodes [
	self deprecated: 'use #descendantNodes instead'.
	^ self descendantNodes.
]

{ #category : #deprecated }
XMLNodeWithChildren >> descendentNodesCollect: aBlock [
	self deprecated: 'use #descendantNodesCollect: instead'.
	^ self descendantNodesCollect: aBlock.
]

{ #category : #deprecated }
XMLNodeWithChildren >> descendentNodesDetect: aBlock [
	self deprecated: 'use #descendantNodesDetect: instead'.
	^ self descendantNodesDetect: aBlock.
]

{ #category : #deprecated }
XMLNodeWithChildren >> descendentNodesDetect: aBlock ifNone: anExceptionBlock [
	self deprecated: 'use #descendantNodesDetect:ifNone: instead'.
	^ self
		descendantNodesDetect: aBlock
		ifNone: anExceptionBlock.
]

{ #category : #deprecated }
XMLNodeWithChildren >> descendentNodesSelect: aBlock [
	self deprecated: 'use #descendantNodesSelect: instead'.
	^ self descendantNodesSelect: aBlock.
]

{ #category : #accessing }
XMLNodeWithChildren >> firstNode [
	"returns the first child node of the receiver if it has one, nil otherwise"

	^ self nodes first
]

{ #category : #testing }
XMLNodeWithChildren >> hasChildren [
	"optimized with nil test and size check to avoid lazy initializing"
	nodes == nil
		ifTrue: [^ false].
	^ nodes size > 0.
]

{ #category : #private }
XMLNodeWithChildren >> hasNodeList: aNodeList [
	^ nodes == aNodeList
]

{ #category : #testing }
XMLNodeWithChildren >> includesNode: aNode [
	^ self nodes includes: aNode
]

{ #category : #accessing }
XMLNodeWithChildren >> innerXML [
	"Returns a string containing the XML source of all descendent nodes.
	
	See #innerXML:"

	^ String streamContents: [:stream | self printInnerXMLOn: stream]
]

{ #category : #accessing }
XMLNodeWithChildren >> innerXMLPrettyPrinted [
	"Pretty print version of #innerXML.
	
	See #innerXML:"

	^ String streamContents: [:stream |
		self
			printInnerXMLOn: stream
			beforeWritingDo: [:writer | writer enablePrettyPrinting]]
]

{ #category : #accessing }
XMLNodeWithChildren >> lastNode [
	"returns the last child node of the receiver if it has one, nil otherwise"

	^ self nodes last
]

{ #category : #accessing }
XMLNodeWithChildren >> nodeAfter: aNode [
	"returns the first child node of the receiver after aNode or nil if there
	isn't one"

	^ self nodes after: aNode
]

{ #category : #accessing }
XMLNodeWithChildren >> nodeAt: anIndex [
	"returns the child node at position anIndex or nil if there isn't one"

	^ self nodes at: anIndex
]

{ #category : #accessing }
XMLNodeWithChildren >> nodeAt: anIndex ifAbsent: aBlock [
	"returns the child node at position anIndex or the value of aBlock
	if there isn't one"

	^ self nodes
		at: anIndex
		ifAbsent: aBlock
]

{ #category : #accessing }
XMLNodeWithChildren >> nodeAt: anIndex put: aNode [
	"replaces the child node at anIndex with aNode, raising an error if
	anIndex is outside the current range of the node list"

	^ self nodes
		at: anIndex
		put: aNode
]

{ #category : #accessing }
XMLNodeWithChildren >> nodeBefore: aNode [
	"returns the first child node of the receiver before aNode or nil if there
	isn't one"

	^ self nodes before: aNode
]

{ #category : #defaults }
XMLNodeWithChildren >> nodeListClass [
	^ XMLNodeList
]

{ #category : #accessing }
XMLNodeWithChildren >> nodes [
	"returns the internal node list; safe to modify, but adding or removing nodes
	from it will have the effect of adding or removing them from the receiver"

	^ nodes ifNil: [nodes := self nodeListClass observer: self]
]

{ #category : #enumerating }
XMLNodeWithChildren >> nodesCollect: aBlock [
	"returns an ordered list of the values of all node children of the
	receiver evaluated with aBlock"

	^ self nodes collect: aBlock
]

{ #category : #enumerating }
XMLNodeWithChildren >> nodesDetect: aBlock [
	^ self nodes detect: aBlock
]

{ #category : #enumerating }
XMLNodeWithChildren >> nodesDetect: aBlock ifNone: anExceptionBlock [
	^ self nodes detect: aBlock ifNone: anExceptionBlock
]

{ #category : #enumerating }
XMLNodeWithChildren >> nodesDo: aBlock [
	"evaluates aBlock for all child nodes of the receiver"

	self nodes do: aBlock
]

{ #category : #enumerating }
XMLNodeWithChildren >> nodesSelect: aBlock [
	"returns a node list of all node children of the receiver that aBlock
	evaluates true for"

	^ self nodes select: aBlock
]

{ #category : #copying }
XMLNodeWithChildren >> postCopy [
	super postCopy.

	nodes
		ifNotNil: [| copiedNodes |
			copiedNodes := nodes copyEmpty observer: self.
			nodes do: [:each |
				"copySharingConfiguration is used so the config is only ever copied
				once when an element or doc is sent #copy and is done after all of the
				descendants have been copied"
				copiedNodes addLast: each copySharingConfiguration].
			nodes := copiedNodes].
]

{ #category : #printing }
XMLNodeWithChildren >> printInnerXMLOn: aStream [
	self hasChildren
		ifTrue: [
			self
				withNewXMLWriterOn: aStream
				do: [:writer |
					self writeInnerXMLOn: writer]]
]

{ #category : #printing }
XMLNodeWithChildren >> printInnerXMLOn: aStream beforeWritingDo: aBlock [
	self hasChildren
		ifTrue: [
			self
				withNewXMLWriterOn: aStream
				do: [:writer |
					aBlock value: writer.
					self writeInnerXMLOn: writer.
					writer write]]
]

{ #category : #removing }
XMLNodeWithChildren >> removeNode: aNode [
	^ self nodes remove: aNode
]

{ #category : #removing }
XMLNodeWithChildren >> removeNode: aNode ifAbsent: aBlock [
	^ self nodes remove: aNode ifAbsent: aBlock
]

{ #category : #removing }
XMLNodeWithChildren >> removeNodes [
	self nodes removeAll
]

{ #category : #removing }
XMLNodeWithChildren >> removeNodes: aNodeCollection [
	^ self nodes removeAll: aNodeCollection
]

{ #category : #notifying }
XMLNodeWithChildren >> removedNode: aNode [
	aNode parent: nil
]

{ #category : #accessing }
XMLNodeWithChildren >> replaceNode: aNode with: aReplacementNode [
	"replaces aNode in the receiver with aReplacementNode, or if aReplacementNode
	is already a child of the receiver, just swaps their locations"

	| firstIndex secondIndex |

	firstIndex := self nodes indexOf: aNode.
	(secondIndex := self nodes indexOf: aReplacementNode) > 0
		ifTrue: [
			self nodes
				swap: firstIndex
				with: secondIndex]
		ifFalse: [
			self nodes
				at: firstIndex
				put: aReplacementNode].
	^ aReplacementNode.
]

{ #category : #printing }
XMLNodeWithChildren >> writeInnerXMLOn: aWriter [
	self nodesDo: [:each | each writeXMLOn: aWriter]
]

{ #category : #printing }
XMLNodeWithChildren >> writeXMLOn: aWriter [
	self writeInnerXMLOn: aWriter
]
