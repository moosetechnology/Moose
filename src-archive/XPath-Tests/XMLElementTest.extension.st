Extension { #name : #XMLElementTest }

{ #category : #'*XPath-Tests' }
XMLElementTest >> testAttributeAxis [
	| element list |

	super testAttributeAxis.

	element := self newElementWithAttributes.
	list := element @ '*'.
	self
		assert: list = (self nodeSetClass newFrom: element attributeNodes);
		assertNodeSet: list hasSortOrder: XPathLevelDocumentSortOrder.

	element := self newNode.
	self assert: (element @ 'node()') isEmpty.
]

{ #category : #'*XPath-Tests' }
XMLElementTest >> testHasExpandedName [
	self assert: self newNode hasExpandedName
]

{ #category : #'*XPath-Tests' }
XMLElementTest >> testHasNamespaceNodes [
	| element |

	element := self newNode.
	self assert: element hasNamespaceNodes.

	element declareNamespaces: self namespaces.
	self assert: element hasNamespaceNodes.

	element configuration usesNamespaces: false.
	self deny: element hasNamespaceNodes.
]

{ #category : #'*XPath-Tests' }
XMLElementTest >> testNamespaceAxis [
	| element list |

	element := self newNode.
	element declareNamespaces: self namespaces.
	list := element namespaceAxis: '*'.
	self
		assert: list = (self nodeSetClass newFrom: element namespaceNodes);
		assertNodeSet: list hasSortOrder: XPathLevelDocumentSortOrder.

	element := self newNode.
	element configuration usesNamespaces: false.
	self assert: (element namespaceAxis: 'node()') isEmpty.
]

{ #category : #'*XPath-Tests' }
XMLElementTest >> testNamespaceNodes [
	| element nodes |

	element := self newNode.
	nodes :=
		XMLNodeList with:
			(XPathNamespaceNode withXMLNamespaceOnElement: element).
	self assert: element namespaceNodes = nodes.

	element configuration usesNamespaces: false.
	self assert: element namespaceNodes isEmpty.

	element configuration usesNamespaces: true.
	element declareNamespaces: self namespaces.
	self namespaces keysAndValuesDo: [:prefix :uri |
		nodes addLast:
			(XPathNamespaceNode
				element: element
				name: prefix
				uri: uri)].
	self assert: element namespaceNodes = nodes.

	element declarePrefix: 'xml' uri: XMLNamespaceScope xmlNamespaceURI.
	nodes addLast: nodes removeFirst.
	self assert: element namespaceNodes = nodes.
]

{ #category : #'*XPath-Tests' }
XMLElementTest >> testNamespaceNodesDo [
	| element |

	element := self newNode.
	self
		xmlShould: [:block | element namespaceNodesDo: block]
		enumerate: element namespaceNodes.

	element configuration usesNamespaces: false.
	self
		xmlShould: [:block | element namespaceNodesDo: block]
		enumerate: #().

	element configuration usesNamespaces: true.
	element declareNamespaces: self namespaces.
	self
		xmlShould: [:block | element namespaceNodesDo: block]
		enumerate: element namespaceNodes.

	element declarePrefix: 'xml' uri: XMLNamespaceScope xmlNamespaceURI.
	self
		xmlShould: [:block | element namespaceNodesDo: block]
		enumerate: element namespaceNodes.
]

{ #category : #'*XPath-Tests' }
XMLElementTest >> testStringValue [
	super testStringValue.

	self assert:
		(self newNode
			addString: 'before';
			addNode:
				((self nodeClass named: 'element')
					addString: 'content';
					yourself);
			addString: 'after';
			yourself) stringValue = 'beforecontentafter'.
]
