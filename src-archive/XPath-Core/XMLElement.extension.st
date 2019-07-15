Extension { #name : #XMLElement }

{ #category : #'*XPath-Core-private' }
XMLElement >> attributeAxisAnySatisfy: anAttributeNodeTest [
	self hasAttributes
		ifTrue: [
			^ anAttributeNodeTest isAttributeNodeTestForName
				ifTrue: [self includesAttribute: anAttributeNodeTest name]
				ifFalse: [self attributeNodes anySatisfy: anAttributeNodeTest]]
		ifFalse: [^ false]
]

{ #category : #'*XPath-Core-private' }
XMLElement >> attributeAxisSelect: anAttributeNodeTest at: aPosition into: aNodeSet [
	(aPosition > 0
		and: [self hasAttributes
			and: [self attributeNodes size >= aPosition]])
		ifFalse: [^ aNodeSet].

	anAttributeNodeTest isAnyNodeTest
		ifTrue: [
			aNodeSet addLast:
				(self attributeNodes at: aPosition)]
		ifFalse: [
			anAttributeNodeTest isAttributeNodeTestForName
				ifTrue: [
					"since it's a test for a name, if the position
					is anything other than 1, it can't match"
					aPosition = 1
						ifTrue: [
							self attributeNodes
								attributeAxisSelectName: anAttributeNodeTest name
								into: aNodeSet]]
				ifFalse: [| totalMatched |
					totalMatched := 0.
					self attributeNodesDo: [:each |
						((anAttributeNodeTest value: each)
							and: [(totalMatched := totalMatched + 1) = aPosition])
							ifTrue: [
								aNodeSet addLast: each.
								^ aNodeSet]]]].
	^ aNodeSet.
]

{ #category : #'*XPath-Core-private' }
XMLElement >> attributeAxisSelect: anAttributeNodeTest into: aNodeSet [
	self hasAttributes
		ifTrue: [
			anAttributeNodeTest isAttributeNodeTestForName
				ifTrue: [
					self attributeNodes
						attributeAxisSelectName: anAttributeNodeTest name
						into: aNodeSet]
				ifFalse: [
					self attributeNodesDo: [:each |
						(anAttributeNodeTest value: each)
							ifTrue: [aNodeSet addLast: each]]]].
	^ aNodeSet.
]

{ #category : #'*XPath-Core-testing' }
XMLElement >> hasExpandedName [
	^ true
]

{ #category : #'*XPath-Core-testing' }
XMLElement >> hasNamespaceNodes [
	"elements have at least one node for the default xml namespace"
	^ self usesNamespaces
]

{ #category : #'*XPath-Core-private' }
XMLElement >> namespaceAxisAnySatisfy: aNamespaceNodeTest [
	^ self hasNamespaces
		and: [self namespaceNodes anySatisfy: aNamespaceNodeTest]
]

{ #category : #'*XPath-Core-private' }
XMLElement >> namespaceAxisSelect: aNamespaceNodeTest at: aPosition into: aNodeSet [
	| totalMatched |

	(self hasNamespaces
		and: [aPosition > 0])
		ifFalse: [^ aNodeSet].
	totalMatched := 0.
	self namespaceNodesDo: [:each |
		((aNamespaceNodeTest value: each)
			and: [(totalMatched := totalMatched + 1) = aPosition])
			ifTrue: [
				aNodeSet addLast: each.
				^ aNodeSet]].
	^ aNodeSet.
]

{ #category : #'*XPath-Core-private' }
XMLElement >> namespaceAxisSelect: aNamespaceNodeTest into: aNodeSet [
	self hasNamespaceNodes
		ifTrue: [
			self namespaceNodesDo: [:each |
				(aNamespaceNodeTest value: each)
					ifTrue: [aNodeSet addLast: each]]].
	^ aNodeSet.
]

{ #category : #'*XPath-Core-accessing' }
XMLElement >> namespaceNodes [
	| namespaceNodes |

	namespaceNodes := self newListForSelect.
	self namespaceNodesDo: [:each | namespaceNodes addLast: each].
	^ namespaceNodes.
]

{ #category : #'*XPath-Core-enumerating' }
XMLElement >> namespaceNodesDo: aBlock [
	"every element has a node for the default xml namespace.
	if it isn't explicitly defined, then it's first in order"
	self usesNamespaces
		ifFalse: [^ self].

	(self hasNamespaces
		and: [self namespaceScope includesPrefix: 'xml'])
		ifFalse: [aBlock value: (XPathNamespaceNode withXMLNamespaceOnElement: self)].

	self hasNamespaces
		ifTrue: [
			self namespaceScope prefixesAndURIsDo: [:prefix :uri |
				aBlock value:
					(XPathNamespaceNode
						element: self
						name: prefix
						uri: uri)]].
]
