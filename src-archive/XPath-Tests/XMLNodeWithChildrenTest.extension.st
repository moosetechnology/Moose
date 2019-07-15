Extension { #name : #XMLNodeWithChildrenTest }

{ #category : #'*XPath-Tests' }
XMLNodeWithChildrenTest >> testAllNodesReverseDo [
	| nodeWithNodes |

	super testAllNodesReverseDo.

	nodeWithNodes := self newNodeWithNodes.
	nodeWithNodes allNodesDo: [:each |
		self
			xmlShould: [:block | each allNodesReverseDo: block]
			enumerate:
				(each hasChildren
					ifTrue: [each allNodes reversed]
					ifFalse: [Array with: each])].
]

{ #category : #'*XPath-Tests' }
XMLNodeWithChildrenTest >> testFollowingNodes [
	| nodeWithNodes |

	super testFollowingNodes.

	nodeWithNodes := self newNodeWithNodes.
	nodeWithNodes allNodesDo: [:each | | following |
		following := each followingNodes.
		each hasParent
			ifTrue: [
				self assert:
					following =
						(each parent descendantNodes copyAfter:
							(each hasChildren
								ifTrue: [each descendantNodes last]
								ifFalse: [each]))]
			ifFalse: [
				self assert: following isEmpty]].
]

{ #category : #'*XPath-Tests' }
XMLNodeWithChildrenTest >> testFollowingNodesDo [
	| nodeWithNodes |

	super testFollowingNodesDo.

	nodeWithNodes := self newNodeWithNodes.
	nodeWithNodes allNodesDo: [:each |
		self
			xmlShould: [:block | each followingNodesDo: block]
			enumerate:
				(each hasParent
					ifTrue: [
						each parent descendantNodes copyAfter:
							(each hasChildren
								ifTrue: [each descendantNodes last]
								ifFalse: [each])]
					ifFalse: [#()])].
]

{ #category : #'*XPath-Tests' }
XMLNodeWithChildrenTest >> testFollowingSiblingNodes [
	| nodeWithNodes |

	super testFollowingSiblingNodes.

	nodeWithNodes := self newNodeWithNodes.
	nodeWithNodes allNodesDo: [:each | | followingSiblings |
		followingSiblings := each followingSiblingNodes.
		each hasParent
			ifTrue: [
				self assert:
					followingSiblings =
						(each parent nodes copyAfter: each)]
			ifFalse: [
				self assert: followingSiblings isEmpty]].
]

{ #category : #'*XPath-Tests' }
XMLNodeWithChildrenTest >> testFollowingSiblingNodesDo [
	| nodeWithNodes |

	super testFollowingSiblingNodesDo.

	nodeWithNodes := self newNodeWithNodes.
	nodeWithNodes allNodesDo: [:each |
		self
			xmlShould: [:block | each followingSiblingNodesDo: block]
			enumerate:
				(each hasParent
					ifTrue: [each parent nodes copyAfter: each]
					ifFalse: [#()])].
]

{ #category : #'*XPath-Tests' }
XMLNodeWithChildrenTest >> testPrecedingNodes [
	| nodeWithNodes |

	super testPrecedingNodes.

	nodeWithNodes := self newNodeWithNodes.
	nodeWithNodes allNodesDo: [:each | | preceding |
		preceding := each precedingNodes.
		each hasParent
			ifTrue: [
				self assert:
					preceding =
						(each parent descendantNodes copyUpTo: each) reversed]
			ifFalse: [
				self assert: preceding isEmpty]].
]

{ #category : #'*XPath-Tests' }
XMLNodeWithChildrenTest >> testPrecedingNodesDo [
	| nodeWithNodes |

	super testPrecedingNodesDo.

	nodeWithNodes := self newNodeWithNodes.
	nodeWithNodes allNodesDo: [:each |
		self
			xmlShould: [:block | each precedingNodesDo: block]
			enumerate:
				(each hasParent
					ifTrue: [(each parent descendantNodes copyUpTo: each) reversed]
					ifFalse: [#()])].
]

{ #category : #'*XPath-Tests' }
XMLNodeWithChildrenTest >> testPrecedingSiblingNodes [
	| nodeWithNodes |

	super testPrecedingSiblingNodes.

	nodeWithNodes := self newNodeWithNodes.
	nodeWithNodes allNodesDo: [:each | | precedingSiblings |
		precedingSiblings := each precedingSiblingNodes.
		each hasParent
			ifTrue: [
				self assert:
					precedingSiblings =
						(each parent nodes copyUpTo: each) reversed]
			ifFalse: [
				self assert: precedingSiblings isEmpty]].
]

{ #category : #'*XPath-Tests' }
XMLNodeWithChildrenTest >> testPrecedingSiblingNodesDo [
	| nodeWithNodes |

	super testPrecedingSiblingNodesDo.

	nodeWithNodes := self newNodeWithNodes.
	nodeWithNodes allNodesDo: [:each |
		self
			xmlShould: [:block | each precedingSiblingNodesDo: block]
			enumerate:
				(each hasParent
					ifTrue: [(each parent nodes copyUpTo: each) reversed]
					ifFalse: [#()])].
]

{ #category : #'*XPath-Tests' }
XMLNodeWithChildrenTest >> testWithAncestorNodesDo [
	| nodeWithNodes |

	super testWithAncestorNodesDo.

	nodeWithNodes := self newNodeWithNodes.
	nodeWithNodes allNodesDo: [:each |
		self
			xmlShould: [:block | each withAncestorNodesDo: block]
			enumerate: (each ancestorNodes copyWithFirst: each)].
]
