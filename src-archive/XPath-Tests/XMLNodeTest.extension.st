Extension { #name : #XMLNodeTest }

{ #category : #'*XPath-Tests' }
XMLNodeTest >> assertNodeSet: aNodeSet hasNode: aNode [
	self
		assertNodeSet: aNodeSet
		hasNodes: (self nodeSetClass with: aNode)
]

{ #category : #'*XPath-Tests' }
XMLNodeTest >> assertNodeSet: aNodeSet hasNodes: aNodeCollection [
	self
		assert: aNodeSet size = aNodeCollection size;
		assert: aNodeSet = (XPathNodeSet newFrom: aNodeCollection) sort;
		assert: (aNodeSet sortOrder isKindOf: XPathDocumentSortOrder)
]

{ #category : #'*XPath-Tests' }
XMLNodeTest >> assertNodeSet: aNodeSet hasSortOrder: aSortOrder [
	self assert: aNodeSet sortOrder class == aSortOrder
]

{ #category : #'*XPath-Tests' }
XMLNodeTest >> contextClass [
	^ XPathContext
]

{ #category : #'*XPath-Tests' }
XMLNodeTest >> newContext [
	^ self contextClass new
]

{ #category : #'*XPath-Tests' }
XMLNodeTest >> newNodeSet [
	^ self nodeSetClass new
]

{ #category : #'*XPath-Tests' }
XMLNodeTest >> nodeSetClass [
	^ XPathNodeSet
]

{ #category : #'*XPath-Tests' }
XMLNodeTest >> testAllNodesReverseDo [
	| node |

	node := self newNode.
	self
		xmlShould: [:block | node allNodesReverseDo: block]
		enumerate: (Array with: node).
]

{ #category : #'*XPath-Tests' }
XMLNodeTest >> testAncestorAxis [
	self
		assert: (self newNode %% 'node()') isEmpty;
		assert: (self newNode %% '*') isEmpty
]

{ #category : #'*XPath-Tests' }
XMLNodeTest >> testAncestorOrSelfAxis [
	| node result |

	node := self newNode.
	result := node %%~ 'node()'.
	self
		assertNodeSet: result
		hasNode: node.

	result := node %%~ '*'.
	node isElement
		ifTrue: [
			self
				assertNodeSet: result
				hasNode: node]
		ifFalse: [self assert: result isEmpty].
]

{ #category : #'*XPath-Tests' }
XMLNodeTest >> testAsXPathFilterExpressionLocationPathRoot [
	| node |

	node := self newNode.
	self assert: node asXPathFilterExpressionLocationPathRoot == node.
]

{ #category : #'*XPath-Tests' }
XMLNodeTest >> testAsXPathNodeSet [
	self
		should: [self newNode asXPathNodeSet]
		raise: XPathTypeException
]

{ #category : #'*XPath-Tests' }
XMLNodeTest >> testAttributeAxis [
	self
		assert: (self newNode @ 'node()') isEmpty;
		assert: (self newNode @ '*') isEmpty
]

{ #category : #'*XPath-Tests' }
XMLNodeTest >> testChildAxis [
	self
		assert: (self newNode / 'node()') isEmpty;
		assert: (self newNode / '*') isEmpty
]

{ #category : #'*XPath-Tests' }
XMLNodeTest >> testDescendantAxis [
	self
		assert: (self newNode // 'node()') isEmpty;
		assert: (self newNode // '*') isEmpty
]

{ #category : #'*XPath-Tests' }
XMLNodeTest >> testDescendantOrSelfAxis [
	| node result |

	node := self newNode.
	result := node //~ 'node()'.
	self
		assertNodeSet: result
		hasNode: node.

	result := node //~ '*'.
	node isElement
		ifTrue: [
			self
				assertNodeSet: result
				hasNode: node]
		ifFalse: [self assert: result isEmpty].
]

{ #category : #'*XPath-Tests' }
XMLNodeTest >> testFollowingAxis [
	self
		assert: (self newNode >> 'node()') isEmpty;
		assert: (self newNode >> '*') isEmpty
]

{ #category : #'*XPath-Tests' }
XMLNodeTest >> testFollowingNodes [
	self assert: self newNode followingNodes isEmpty
]

{ #category : #'*XPath-Tests' }
XMLNodeTest >> testFollowingNodesDo [
	| node |

	node := self newNode.
	self
		xmlShould: [:block | node followingNodesDo: block]
		enumerate: #().
]

{ #category : #'*XPath-Tests' }
XMLNodeTest >> testFollowingSiblingAxis [
	self
		assert: (self newNode >>> 'node()') isEmpty;
		assert: (self newNode >>> '*') isEmpty
]

{ #category : #'*XPath-Tests' }
XMLNodeTest >> testFollowingSiblingNodes [
	self assert: self newNode followingSiblingNodes isEmpty
]

{ #category : #'*XPath-Tests' }
XMLNodeTest >> testFollowingSiblingNodesDo [
	| node |

	node := self newNode.
	self
		xmlShould: [:block | node followingSiblingNodesDo: block]
		enumerate: #().
]

{ #category : #'*XPath-Tests' }
XMLNodeTest >> testHasExpandedName [
	self deny: self newNode hasExpandedName
]

{ #category : #'*XPath-Tests' }
XMLNodeTest >> testIsNamespace [
	self deny: self newNode isNamespace
]

{ #category : #'*XPath-Tests' }
XMLNodeTest >> testNamespaceAxis [
	self
		assert: (self newNode namespaceAxis: 'node()') isEmpty;
		assert: (self newNode namespaceAxis: '*') isEmpty
]

{ #category : #'*XPath-Tests' }
XMLNodeTest >> testParentAxis [
	self
		assert: (self newNode % 'node()') isEmpty;
		assert: (self newNode % '*') isEmpty
]

{ #category : #'*XPath-Tests' }
XMLNodeTest >> testPrecedingAxis [
	self
		assert: (self newNode << 'node()') isEmpty;
		assert: (self newNode << '*') isEmpty
]

{ #category : #'*XPath-Tests' }
XMLNodeTest >> testPrecedingNodes [
	self assert: self newNode precedingNodes isEmpty
]

{ #category : #'*XPath-Tests' }
XMLNodeTest >> testPrecedingNodesDo [
	| node |

	node := self newNode.
	self
		xmlShould: [:block | node precedingNodesDo: block]
		enumerate: #().
]

{ #category : #'*XPath-Tests' }
XMLNodeTest >> testPrecedingSiblingAxis [
	self
		assert: (self newNode <<< 'node()') isEmpty;
		assert: (self newNode <<< '*') isEmpty
]

{ #category : #'*XPath-Tests' }
XMLNodeTest >> testPrecedingSiblingNodes [
	self assert: self newNode precedingSiblingNodes isEmpty
]

{ #category : #'*XPath-Tests' }
XMLNodeTest >> testPrecedingSiblingNodesDo [
	| node |

	node := self newNode.
	self
		xmlShould: [:block | node precedingSiblingNodesDo: block]
		enumerate: #().
]

{ #category : #'*XPath-Tests' }
XMLNodeTest >> testSelfAxis [
	| node result |

	node := self newNode.
	result := node ~ 'node()'.
	self
		assertNodeSet: result
		hasNode: node.
	self
		assertNodeSet: result
		hasSortOrder: XPathLevelDocumentSortOrder.

	result := node ~ '*'.
	node isElement
		ifTrue: [
			self
				assertNodeSet: result
				hasNode: node.
			self
				assertNodeSet: result
				hasSortOrder: XPathLevelDocumentSortOrder]
		ifFalse: [self assert: result isEmpty].
]

{ #category : #'*XPath-Tests' }
XMLNodeTest >> testStringValue [
	self assert: self newNode stringValue = ''
]

{ #category : #'*XPath-Tests' }
XMLNodeTest >> testWithAncestorNodesDo [
	| node |

	node := self newNode.
	self
		xmlShould: [:block | node withAncestorNodesDo: block]
		enumerate: (Array with: node)
]

{ #category : #'*XPath-Tests' }
XMLNodeTest >> testXPath [
	| node |

	node := self newNode.
	self
		assert: (node xpath: '.') = (self nodeSetClass with: node);
		assert: (node xpath: (XPath for: '.')) = (self nodeSetClass with: node).
]

{ #category : #'*XPath-Tests' }
XMLNodeTest >> testXPathContext [
	| node context |

	node := self newNode.
	context := self newContext.
	context
		variableAt: 'var'
		put: 'test'.
	self
		assert: (node xpath: '$var' context: context) = 'test';
		assert: (node xpath: (XPath for: '$var') context: context) = 'test'.
]
