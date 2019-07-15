Extension { #name : #XMLNode }

{ #category : #'*XPath-Core-enumerating - axis' }
XMLNode >> % aStringOrBlockOrNodeTestWithPredicates [
	^ aStringOrBlockOrNodeTestWithPredicates isXPathNodeTestWithPredicates
		ifTrue: [
			self
				parentAxis: aStringOrBlockOrNodeTestWithPredicates nodeTest
				predicates: aStringOrBlockOrNodeTestWithPredicates predicates]
		ifFalse: [
			self parentAxis: aStringOrBlockOrNodeTestWithPredicates]
]

{ #category : #'*XPath-Core-enumerating - axis' }
XMLNode >> %% aStringOrBlockOrNodeTestWithPredicates [
	"reverse axis, requires sorting"
	^ (aStringOrBlockOrNodeTestWithPredicates isXPathNodeTestWithPredicates
		ifTrue: [
			self
				ancestorAxis: aStringOrBlockOrNodeTestWithPredicates nodeTest
				predicates: aStringOrBlockOrNodeTestWithPredicates predicates]
		ifFalse: [
			self ancestorAxis: aStringOrBlockOrNodeTestWithPredicates]) sort
]

{ #category : #'*XPath-Core-enumerating - axis' }
XMLNode >> %%~ aStringOrBlockOrNodeTestWithPredicates [
	"reverse axis, requires sorting"
	^ (aStringOrBlockOrNodeTestWithPredicates isXPathNodeTestWithPredicates
		ifTrue: [
			self
				ancestorOrSelfAxis: aStringOrBlockOrNodeTestWithPredicates nodeTest
				predicates: aStringOrBlockOrNodeTestWithPredicates predicates]
		ifFalse: [
			self ancestorOrSelfAxis: aStringOrBlockOrNodeTestWithPredicates]) sort
]

{ #category : #'*XPath-Core-enumerating - axis' }
XMLNode >> / aStringOrBlockOrNodeTestWithPredicates [
	^ aStringOrBlockOrNodeTestWithPredicates isXPathNodeTestWithPredicates
		ifTrue: [
			self
				childAxis: aStringOrBlockOrNodeTestWithPredicates nodeTest
				predicates: aStringOrBlockOrNodeTestWithPredicates predicates]
		ifFalse: [
			self childAxis: aStringOrBlockOrNodeTestWithPredicates]
]

{ #category : #'*XPath-Core-enumerating - axis' }
XMLNode >> // aStringOrBlockOrNodeTestWithPredicates [
	^ aStringOrBlockOrNodeTestWithPredicates isXPathNodeTestWithPredicates
		ifTrue: [
			self
				descendantAxis: aStringOrBlockOrNodeTestWithPredicates nodeTest
				predicates: aStringOrBlockOrNodeTestWithPredicates predicates]
		ifFalse: [
			self descendantAxis: aStringOrBlockOrNodeTestWithPredicates]
]

{ #category : #'*XPath-Core-enumerating - axis' }
XMLNode >> //~ aStringOrBlockOrNodeTestWithPredicates [
	^ aStringOrBlockOrNodeTestWithPredicates isXPathNodeTestWithPredicates
		ifTrue: [
			self
				descendantOrSelfAxis: aStringOrBlockOrNodeTestWithPredicates nodeTest
				predicates: aStringOrBlockOrNodeTestWithPredicates predicates]
		ifFalse: [
			self descendantOrSelfAxis: aStringOrBlockOrNodeTestWithPredicates]
]

{ #category : #'*XPath-Core-enumerating - axis' }
XMLNode >> << aStringOrBlockOrNodeTestWithPredicates [
	"reverse axis, requires sorting"
	^ (aStringOrBlockOrNodeTestWithPredicates isXPathNodeTestWithPredicates
		ifTrue: [
			self
				precedingAxis: aStringOrBlockOrNodeTestWithPredicates nodeTest
				predicates: aStringOrBlockOrNodeTestWithPredicates predicates]
		ifFalse: [
			self precedingAxis: aStringOrBlockOrNodeTestWithPredicates]) sort
]

{ #category : #'*XPath-Core-enumerating - axis' }
XMLNode >> <<< aStringOrBlockOrNodeTestWithPredicates [
	"reverse axis, requires sorting"
	^ (aStringOrBlockOrNodeTestWithPredicates isXPathNodeTestWithPredicates
		ifTrue: [
			self
				precedingSiblingAxis: aStringOrBlockOrNodeTestWithPredicates nodeTest
				predicates: aStringOrBlockOrNodeTestWithPredicates predicates]
		ifFalse: [
			self precedingSiblingAxis: aStringOrBlockOrNodeTestWithPredicates]) sort
]

{ #category : #'*XPath-Core-enumerating - axis' }
XMLNode >> >> aStringOrBlockOrNodeTestWithPredicates [
	^ aStringOrBlockOrNodeTestWithPredicates isXPathNodeTestWithPredicates
		ifTrue: [
			self
				followingAxis: aStringOrBlockOrNodeTestWithPredicates nodeTest
				predicates: aStringOrBlockOrNodeTestWithPredicates predicates]
		ifFalse: [
			self followingAxis: aStringOrBlockOrNodeTestWithPredicates]
]

{ #category : #'*XPath-Core-enumerating - axis' }
XMLNode >> >>> aStringOrBlockOrNodeTestWithPredicates [
	^ aStringOrBlockOrNodeTestWithPredicates isXPathNodeTestWithPredicates
		ifTrue: [
			self
				followingSiblingAxis: aStringOrBlockOrNodeTestWithPredicates nodeTest
				predicates: aStringOrBlockOrNodeTestWithPredicates predicates]
		ifFalse: [
			self followingSiblingAxis: aStringOrBlockOrNodeTestWithPredicates]
]

{ #category : #'*XPath-Core-enumerating - axis' }
XMLNode >> @ aStringOrBlockOrNodeTestWithPredicates [
	^ aStringOrBlockOrNodeTestWithPredicates isXPathNodeTestWithPredicates
		ifTrue: [
			self
				attributeAxis: aStringOrBlockOrNodeTestWithPredicates nodeTest
				predicates: aStringOrBlockOrNodeTestWithPredicates predicates]
		ifFalse: [
			self attributeAxis: aStringOrBlockOrNodeTestWithPredicates]
]

{ #category : #'*XPath-Core-enumerating - axis' }
XMLNode >> @@ aStringOrBlockOrNodeTestWithPredicates [
	"Returns the attribute value string of the first matching attribute of the
	receiver or an empty string if there isn't one."

	^ (self @ aStringOrBlockOrNodeTestWithPredicates) stringValue
]

{ #category : #'*XPath-Core-enumerating' }
XMLNode >> allNodesReverseDo: aBlock [
	aBlock value: self
]

{ #category : #'*XPath-Core-private' }
XMLNode >> ancestorAxis: aNodeTestStringOrBlock [
	^ (self
		ancestorAxisSelect: aNodeTestStringOrBlock asXPathNodeTest
		into: self nodeSetClass new)
			sortOrder: XPathReverseDocumentSortOrder new
]

{ #category : #'*XPath-Core-private' }
XMLNode >> ancestorAxis: aNodeTestStringOrBlock predicates: aPredicateCollection [
	(aPredicateCollection notEmpty
		and: [aPredicateCollection first isNumber])
		ifTrue: [
			^ (self
				ancestorAxisSelect: aNodeTestStringOrBlock asXPathNodeTest
				at: aPredicateCollection first asXPathNodeSetPosition
				into: self nodeSetClass new)
					sortOrder: XPathReverseDocumentSortOrder new;
					filterWithAll: aPredicateCollection startingAt: 2]
		ifFalse: [
			^ (self ancestorAxis: aNodeTestStringOrBlock)
				filterWithAll: aPredicateCollection]
]

{ #category : #'*XPath-Core-private' }
XMLNode >> ancestorAxisAnySatisfy: aNodeTest [
	self ancestorNodesDo: [:each |
		(aNodeTest value: each)
			ifTrue: [^ true]].
	^ false.
]

{ #category : #'*XPath-Core-private' }
XMLNode >> ancestorAxisSelect: aNodeTest at: aPosition into: aNodeSet [
	| totalMatched |

	aPosition > 0
		ifFalse: [^ aNodeSet].
	totalMatched := 0.
	self ancestorNodesDo: [:each |
		((aNodeTest value: each)
			and: [(totalMatched := totalMatched + 1) = aPosition])
			ifTrue: [
				aNodeSet addLast: each.
				^ aNodeSet]].
	^ aNodeSet.
]

{ #category : #'*XPath-Core-private' }
XMLNode >> ancestorAxisSelect: aNodeTest ifNotPresentInto: aNodeSet [
	self ancestorNodesDo: [:each |
		((aNodeSet includes: each) not
			and: [aNodeTest value: each])
			ifTrue: [aNodeSet addLast: each]].
	^ aNodeSet.
]

{ #category : #'*XPath-Core-private' }
XMLNode >> ancestorAxisSelect: aNodeTest into: aNodeSet [
	self ancestorNodesDo: [:each |
		(aNodeTest value: each)
			ifTrue: [aNodeSet addLast: each]].
	^ aNodeSet.
]

{ #category : #'*XPath-Core-private' }
XMLNode >> ancestorOrSelfAxis: aNodeTestStringOrBlock [
	^ (self
		ancestorOrSelfAxisSelect: aNodeTestStringOrBlock asXPathNodeTest
		into: self nodeSetClass new)
			sortOrder: XPathReverseDocumentSortOrder new
]

{ #category : #'*XPath-Core-private' }
XMLNode >> ancestorOrSelfAxis: aNodeTestStringOrBlock predicates: aPredicateCollection [
	(aPredicateCollection notEmpty
		and: [aPredicateCollection first isNumber])
		ifTrue: [
			^ (self
				ancestorOrSelfAxisSelect: aNodeTestStringOrBlock asXPathNodeTest
				at: aPredicateCollection first asXPathNodeSetPosition
				into: self nodeSetClass new)
					sortOrder: XPathReverseDocumentSortOrder new;
					filterWithAll: aPredicateCollection startingAt: 2]
		ifFalse: [
			^ (self ancestorOrSelfAxis: aNodeTestStringOrBlock)
				filterWithAll: aPredicateCollection]
]

{ #category : #'*XPath-Core-private' }
XMLNode >> ancestorOrSelfAxisAnySatisfy: aNodeTest [
	self withAncestorNodesDo: [:each |
		(aNodeTest value: each)
			ifTrue: [^ true]].
	^ false.
]

{ #category : #'*XPath-Core-private' }
XMLNode >> ancestorOrSelfAxisSelect: aNodeTest at: aPosition into: aNodeSet [
	| totalMatched |

	aPosition > 0
		ifFalse: [^ aNodeSet].
	totalMatched := 0.
	self withAncestorNodesDo: [:each |
		((aNodeTest value: each)
			and: [(totalMatched := totalMatched + 1) = aPosition])
			ifTrue: [
				aNodeSet addLast: each.
				^ aNodeSet]].
	^ aNodeSet.
]

{ #category : #'*XPath-Core-private' }
XMLNode >> ancestorOrSelfAxisSelect: aNodeTest ifNotPresentInto: aNodeSet [
	self withAncestorNodesDo: [:each|
		((aNodeSet includes: each) not
			and: [aNodeTest value: each])
			ifTrue: [aNodeSet addLast: each]].
	^ aNodeSet.
]

{ #category : #'*XPath-Core-private' }
XMLNode >> ancestorOrSelfAxisSelect: aNodeTest into: aNodeSet [
	self withAncestorNodesDo: [:each |
		(aNodeTest value: each)
			ifTrue: [aNodeSet addLast: each]].
	^ aNodeSet.
]

{ #category : #'*XPath-Core-converting' }
XMLNode >> asXPathBoolean [
	XPathTypeException signal: 'Cannot convert nodes to booleans'
]

{ #category : #'*XPath-Core-converting' }
XMLNode >> asXPathComparable [
	XPathTypeException signal: 'Cannot compare nodes'
]

{ #category : #'*XPath-Core-converting' }
XMLNode >> asXPathFilterExpressionLocationPathRoot [
	^ self
]

{ #category : #'*XPath-Core-converting' }
XMLNode >> asXPathFilterExpressionPredicateRoot [
	XPathTypeException signal: 'Cannot filter nodes'
]

{ #category : #'*XPath-Core-converting' }
XMLNode >> asXPathNodeSet [
	XPathTypeException signal: 'Cannot convert nodes to node sets'
]

{ #category : #'*XPath-Core-converting' }
XMLNode >> asXPathNumber [
	XPathTypeException signal: 'Cannot convert nodes to numbers'
]

{ #category : #'*XPath-Core-converting' }
XMLNode >> asXPathString [
	XPathTypeException signal: 'Cannot convert nodes to strings'
]

{ #category : #'*XPath-Core-converting' }
XMLNode >> asXPathUnionable [
	XPathTypeException signal: 'Cannot union nodes'
]

{ #category : #'*XPath-Core-private' }
XMLNode >> attributeAxis: aNodeTestStringOrBlock [
	^ (self
		attributeAxisSelect: aNodeTestStringOrBlock asXPathAttributeAxisNodeTest
		into: self nodeSetClass new)
			sortOrder: XPathLevelDocumentSortOrder new
]

{ #category : #'*XPath-Core-private' }
XMLNode >> attributeAxis: aNodeTestStringOrBlock predicates: aPredicateCollection [
	(aPredicateCollection notEmpty
		and: [aPredicateCollection first isNumber])
		ifTrue: [
			^ (self
				attributeAxisSelect:
					aNodeTestStringOrBlock asXPathAttributeAxisNodeTest
				at: aPredicateCollection first asXPathNodeSetPosition
				into: self nodeSetClass new)
					sortOrder: XPathLevelDocumentSortOrder new;
					filterWithAll: aPredicateCollection startingAt: 2]
		ifFalse: [
			^ (self attributeAxis: aNodeTestStringOrBlock)
				filterWithAll: aPredicateCollection]
]

{ #category : #'*XPath-Core-private' }
XMLNode >> attributeAxisAnySatisfy: anAttributeNodeTest [
	^ false
]

{ #category : #'*XPath-Core-private' }
XMLNode >> attributeAxisSelect: anAttributeNodeTest at: aPosition into: aNodeSet [
	^ aNodeSet
]

{ #category : #'*XPath-Core-private' }
XMLNode >> attributeAxisSelect: anAttributeNodeTest into: aNodeSet [
	^ aNodeSet
]

{ #category : #'*XPath-Core-private' }
XMLNode >> childAxis: aNodeTestStringOrBlock [
	^ (self
		childAxisSelect: aNodeTestStringOrBlock asXPathNodeTest
		into: self nodeSetClass new)
			sortOrder: XPathLevelDocumentSortOrder new
]

{ #category : #'*XPath-Core-private' }
XMLNode >> childAxis: aNodeTestStringOrBlock predicates: aPredicateCollection [
	(aPredicateCollection notEmpty
		and: [aPredicateCollection first isNumber])
		ifTrue: [
			^ (self
				childAxisSelect: aNodeTestStringOrBlock asXPathNodeTest
				at: aPredicateCollection first asXPathNodeSetPosition
				into: self nodeSetClass new)
					sortOrder: XPathLevelDocumentSortOrder new;
					filterWithAll: aPredicateCollection startingAt: 2]
		ifFalse: [
			^ (self childAxis: aNodeTestStringOrBlock)
				filterWithAll: aPredicateCollection]
]

{ #category : #'*XPath-Core-private' }
XMLNode >> childAxisAnySatisfy: aNodeTest [
	^ false
]

{ #category : #'*XPath-Core-private' }
XMLNode >> childAxisSelect: aNodeTest at: aPosition into: aNodeSet [
	^ aNodeSet
]

{ #category : #'*XPath-Core-private' }
XMLNode >> childAxisSelect: aNodeTest into: aNodeSet [
	^ aNodeSet
]

{ #category : #'*XPath-Core-private' }
XMLNode >> descendantAxis: aNodeTestStringOrBlock [
	^ (self
		descendantAxisSelect: aNodeTestStringOrBlock asXPathNodeTest
		into: self nodeSetClass new)
			sortOrder: XPathDocumentSortOrder new
]

{ #category : #'*XPath-Core-private' }
XMLNode >> descendantAxis: aNodeTestStringOrBlock predicates: aPredicateCollection [
	(aPredicateCollection notEmpty
		and: [aPredicateCollection first isNumber])
		ifTrue: [
			^ (self
				descendantAxisSelect: aNodeTestStringOrBlock asXPathNodeTest
				at: aPredicateCollection first asXPathNodeSetPosition
				into: self nodeSetClass new)
					sortOrder: XPathDocumentSortOrder new;
					filterWithAll: aPredicateCollection startingAt: 2]
		ifFalse: [
			^ (self descendantAxis: aNodeTestStringOrBlock)
				filterWithAll: aPredicateCollection]
]

{ #category : #'*XPath-Core-private' }
XMLNode >> descendantAxisAnySatisfy: aNodeTest [
	^ false
]

{ #category : #'*XPath-Core-private' }
XMLNode >> descendantAxisSelect: aNodeTest at: aPosition into: aNodeSet [
	^ aNodeSet
]

{ #category : #'*XPath-Core-private' }
XMLNode >> descendantAxisSelect: aNodeTest ifNotPresentInto: aNodeSet [
	^ aNodeSet
]

{ #category : #'*XPath-Core-private' }
XMLNode >> descendantAxisSelect: aNodeTest into: aNodeSet [
	^ aNodeSet
]

{ #category : #'*XPath-Core-private' }
XMLNode >> descendantOrSelfAxis: aNodeTestStringOrBlock [
	^ (self
		descendantOrSelfAxisSelect: aNodeTestStringOrBlock asXPathNodeTest
		into: self nodeSetClass new)
			sortOrder: XPathDocumentSortOrder new
]

{ #category : #'*XPath-Core-private' }
XMLNode >> descendantOrSelfAxis: aNodeTestStringOrBlock predicates: aPredicateCollection [
	(aPredicateCollection notEmpty
		and: [aPredicateCollection first isNumber])
		ifTrue: [
			^ (self
				descendantOrSelfAxisSelect: aNodeTestStringOrBlock asXPathNodeTest
				at: aPredicateCollection first asXPathNodeSetPosition
				into: self nodeSetClass new)
					sortOrder: XPathDocumentSortOrder new;
					filterWithAll: aPredicateCollection startingAt: 2]
		ifFalse: [
			^ (self descendantOrSelfAxis: aNodeTestStringOrBlock)
				filterWithAll: aPredicateCollection]
]

{ #category : #'*XPath-Core-private' }
XMLNode >> descendantOrSelfAxisAnySatisfy: aNodeTest [
	^ aNodeTest value: self
]

{ #category : #'*XPath-Core-private' }
XMLNode >> descendantOrSelfAxisSelect: aNodeTest at: aPosition into: aNodeSet [
	(aPosition = 1
		and: [aNodeTest value: self])
		ifTrue: [aNodeSet addLast: self].
	^ aNodeSet.
]

{ #category : #'*XPath-Core-private' }
XMLNode >> descendantOrSelfAxisSelect: aNodeTest ifNotPresentInto: aNodeSet [
	((aNodeSet includes: self) not
		and: [aNodeTest value: self])
		ifTrue: [aNodeSet addLast: self].
	^ aNodeSet.
]

{ #category : #'*XPath-Core-private' }
XMLNode >> descendantOrSelfAxisSelect: aNodeTest into: aNodeSet [
	(aNodeTest value: self)
		ifTrue: [aNodeSet addLast: self].
	^ aNodeSet.
]

{ #category : #'*XPath-Core-private' }
XMLNode >> followingAxis: aNodeTestStringOrBlock [
	^ (self
		followingAxisSelect: aNodeTestStringOrBlock asXPathNodeTest
		into: self nodeSetClass new)
			sortOrder: XPathDocumentSortOrder new
]

{ #category : #'*XPath-Core-private' }
XMLNode >> followingAxis: aNodeTestStringOrBlock predicates: aPredicateCollection [
	(aPredicateCollection notEmpty
		and: [aPredicateCollection first isNumber])
		ifTrue: [
			^ (self
				followingAxisSelect: aNodeTestStringOrBlock asXPathNodeTest
				at: aPredicateCollection first asXPathNodeSetPosition
				into: self nodeSetClass new)
					sortOrder: XPathDocumentSortOrder new;
					filterWithAll: aPredicateCollection startingAt: 2]
		ifFalse: [
			^ (self followingAxis: aNodeTestStringOrBlock)
				filterWithAll: aPredicateCollection]
]

{ #category : #'*XPath-Core-private' }
XMLNode >> followingAxisAnySatisfy: aNodeTest [
	self followingNodesDo: [:each |
		(aNodeTest value: each)
			ifTrue: [^ true]].
	^ false.
]

{ #category : #'*XPath-Core-private' }
XMLNode >> followingAxisSelect: aNodeTest at: aPosition into: aNodeSet [
	| totalMatched |

	aPosition > 0
		ifFalse: [^ aNodeSet].
	totalMatched := 0.
	self followingNodesDo: [:each |
		((aNodeTest value: each)
			and: [(totalMatched := totalMatched + 1) = aPosition])
			ifTrue: [
				aNodeSet addLast: each.
				^ aNodeSet]].
	^ aNodeSet.
]

{ #category : #'*XPath-Core-private' }
XMLNode >> followingAxisSelect: aNodeTest ifNotPresentInto: aNodeSet [
	self followingNodesDo: [:each |
		((aNodeSet includes: each) not
			and: [aNodeTest value: each])
			ifTrue: [aNodeSet addLast: each]].
	^ aNodeSet.
]

{ #category : #'*XPath-Core-private' }
XMLNode >> followingAxisSelect: aNodeTest into: aNodeSet [
	self followingNodesDo: [:each |
		(aNodeTest value: each)
			ifTrue: [aNodeSet addLast: each]].
	^ aNodeSet.
]

{ #category : #'*XPath-Core-accessing' }
XMLNode >> followingNodes [
	"returns a node list with all following sibling or descendant nodes
	of the receiver"
	| following |

	following := self newListForSelect.
	self followingNodesDo: [:each |
		following addLast: each].
	^ following.
]

{ #category : #'*XPath-Core-enumerating' }
XMLNode >> followingNodesDo: aBlock [
	self hasParent
		ifTrue: [| visitedSelf |
			visitedSelf := false.
			self parent nodesDo: [:each |
				visitedSelf
					ifTrue: [each allNodesDo: aBlock]
					ifFalse: [
						each = self
							ifTrue: [visitedSelf := true]]]]
]

{ #category : #'*XPath-Core-private' }
XMLNode >> followingSiblingAxis: aNodeTestStringOrBlock [
	^ (self
		followingSiblingAxisSelect: aNodeTestStringOrBlock asXPathNodeTest
		into: self nodeSetClass new)
			sortOrder: XPathLevelDocumentSortOrder new
]

{ #category : #'*XPath-Core-private' }
XMLNode >> followingSiblingAxis: aNodeTestStringOrBlock predicates: aPredicateCollection [
	(aPredicateCollection notEmpty
		and: [aPredicateCollection first isNumber])
		ifTrue: [
			^ (self
				followingSiblingAxisSelect: aNodeTestStringOrBlock asXPathNodeTest
				at: aPredicateCollection first asXPathNodeSetPosition
				into: self nodeSetClass new)
					sortOrder: XPathLevelDocumentSortOrder new;
					filterWithAll: aPredicateCollection startingAt: 2]
		ifFalse: [
			^ (self followingSiblingAxis: aNodeTestStringOrBlock)
				filterWithAll: aPredicateCollection]
]

{ #category : #'*XPath-Core-private' }
XMLNode >> followingSiblingAxisAnySatisfy: aNodeTest [
	self followingSiblingNodesDo: [:each |
		(aNodeTest value: each)
			ifTrue: [^ true]].
	^ false.
]

{ #category : #'*XPath-Core-private' }
XMLNode >> followingSiblingAxisSelect: aNodeTest at: aPosition into: aNodeSet [
	| totalMatched |

	aPosition > 0
		ifFalse: [^ aNodeSet].
	totalMatched := 0.
	self followingSiblingNodesDo: [:each |
		((aNodeTest value: each)
			and: [(totalMatched := totalMatched + 1) = aPosition])
			ifTrue: [
				aNodeSet addLast: each.
				^ aNodeSet]].
	^ aNodeSet.
]

{ #category : #'*XPath-Core-private' }
XMLNode >> followingSiblingAxisSelect: aNodeTest ifNotPresentInto: aNodeSet [
	self followingSiblingNodesDo: [:each |
		((aNodeSet includes: each) not
			and: [aNodeTest value: each])
			ifTrue: [aNodeSet addLast: each]].
	^ aNodeSet.
]

{ #category : #'*XPath-Core-private' }
XMLNode >> followingSiblingAxisSelect: aNodeTest into: aNodeSet [
	self followingSiblingNodesDo: [:each |
		(aNodeTest value: each)
			ifTrue: [aNodeSet addLast: each]].
	^ aNodeSet.
]

{ #category : #'*XPath-Core-accessing' }
XMLNode >> followingSiblingNodes [
	"returns a node list with all following sibling nodes of the receiver"
	| followingSiblings |

	followingSiblings := self newListForSelect.
	self followingSiblingNodesDo: [:each |
		followingSiblings addLast: each].
	^ followingSiblings.
]

{ #category : #'*XPath-Core-enumerating' }
XMLNode >> followingSiblingNodesDo: aBlock [
	self hasParent
		ifTrue: [| visitedSelf |
			visitedSelf := false.
			self parent nodesDo: [:each |
				visitedSelf
					ifTrue: [aBlock value: each]
					ifFalse: [
						each = self
							ifTrue: [visitedSelf := true]]]]
]

{ #category : #'*XPath-Core-testing' }
XMLNode >> hasExpandedName [
	^ false
]

{ #category : #'*XPath-Core-testing' }
XMLNode >> isNamespace [
	^ false
]

{ #category : #'*XPath-Core-private' }
XMLNode >> namespaceAxis: aNodeTestStringOrBlock [
	^ (self
		namespaceAxisSelect: aNodeTestStringOrBlock asXPathNamespaceAxisNodeTest
		into: self nodeSetClass new)
			sortOrder: XPathLevelDocumentSortOrder new
]

{ #category : #'*XPath-Core-private' }
XMLNode >> namespaceAxis: aNodeTestStringOrBlock predicates: aPredicateCollection [
	(aPredicateCollection notEmpty
		and: [aPredicateCollection first isNumber])
		ifTrue: [
			^ (self
				namespaceAxisSelect:
					aNodeTestStringOrBlock asXPathNamespaceAxisNodeTest
				at: aPredicateCollection first asXPathNodeSetPosition
				into: self nodeSetClass new)
					sortOrder: XPathLevelDocumentSortOrder new;
					filterWithAll: aPredicateCollection startingAt: 2]
		ifFalse: [
			^ (self namespaceAxis: aNodeTestStringOrBlock)
				filterWithAll: aPredicateCollection]
]

{ #category : #'*XPath-Core-private' }
XMLNode >> namespaceAxisAnySatisfy: aNamespaceNodeTest [
	^ false
]

{ #category : #'*XPath-Core-private' }
XMLNode >> namespaceAxisSelect: aNamespaceNodeTest at: aPosition into: aNodeSet [
	^ aNodeSet
]

{ #category : #'*XPath-Core-private' }
XMLNode >> namespaceAxisSelect: aNamespaceNodeTest into: aNodeSet [
	^ aNodeSet
]

{ #category : #'*XPath-Core-private' }
XMLNode >> nodeSetClass [
	^ XPathNodeSet
]

{ #category : #'*XPath-Core-private' }
XMLNode >> parentAxis: aNodeTestStringOrBlock [
	^ (self
		parentAxisSelect: aNodeTestStringOrBlock asXPathNodeTest
		into: self nodeSetClass new)
			"the spec says this is a forawrd axis"
			sortOrder: XPathLevelDocumentSortOrder new
]

{ #category : #'*XPath-Core-private' }
XMLNode >> parentAxis: aNodeTestStringOrBlock predicates: aPredicateCollection [
	(aPredicateCollection notEmpty
		and: [aPredicateCollection first isNumber])
		ifTrue: [
			^ (self
				parentAxisSelect: aNodeTestStringOrBlock asXPathNodeTest
				at: aPredicateCollection first asXPathNodeSetPosition
				into: self nodeSetClass new)
					"the spec says this is a forawrd axis"
					sortOrder: XPathLevelDocumentSortOrder new;
					filterEachInSeparateContextWithAll: aPredicateCollection
						startingAt: 2]
		ifFalse: [
			^ (self parentAxis: aNodeTestStringOrBlock)
				filterEachInSeparateContextWithAll: aPredicateCollection]
]

{ #category : #'*XPath-Core-private' }
XMLNode >> parentAxisAnySatisfy: aNodeTest [
	^ self hasParent
		and: [aNodeTest value: self parent]
]

{ #category : #'*XPath-Core-private' }
XMLNode >> parentAxisSelect: aNodeTest at: aPosition into: aNodeSet [
	(aPosition = 1
		and: [self hasParent
			and: [aNodeTest value: self parent]])
		ifTrue: [aNodeSet addLast: self parent].
	^ aNodeSet.
]

{ #category : #'*XPath-Core-private' }
XMLNode >> parentAxisSelect: aNodeTest ifNotPresentInto: aNodeSet [
	(self hasParent
		and: [(aNodeSet includes: self parent) not
			and: [aNodeTest value: self parent]])
		ifTrue: [aNodeSet addLast: self parent].
	^ aNodeSet.
]

{ #category : #'*XPath-Core-private' }
XMLNode >> parentAxisSelect: aNodeTest into: aNodeSet [
	(self hasParent
		and: [aNodeTest value: self parent])
		ifTrue: [aNodeSet addLast: self parent].
	^ aNodeSet.
]

{ #category : #'*XPath-Core-private' }
XMLNode >> precedingAxis: aNodeTestStringOrBlock [
	^ (self
		precedingAxisSelect: aNodeTestStringOrBlock asXPathNodeTest
		into: self nodeSetClass new)
			sortOrder: XPathReverseDocumentSortOrder new
]

{ #category : #'*XPath-Core-private' }
XMLNode >> precedingAxis: aNodeTestStringOrBlock predicates: aPredicateCollection [
	(aPredicateCollection notEmpty
		and: [aPredicateCollection first isNumber])
		ifTrue: [
			^ (self
				precedingAxisSelect: aNodeTestStringOrBlock asXPathNodeTest
				at: aPredicateCollection first asXPathNodeSetPosition
				into: self nodeSetClass new)
					sortOrder: XPathReverseDocumentSortOrder new;
					filterWithAll: aPredicateCollection startingAt: 2]
		ifFalse: [
			^ (self precedingAxis: aNodeTestStringOrBlock)
				filterWithAll: aPredicateCollection]
]

{ #category : #'*XPath-Core-private' }
XMLNode >> precedingAxisAnySatisfy: aNodeTest [
	self precedingNodesDo: [:each |
		(aNodeTest value: each)
			ifTrue: [^ true]].
	^ false.
]

{ #category : #'*XPath-Core-private' }
XMLNode >> precedingAxisSelect: aNodeTest at: aPosition into: aNodeSet [
	| totalMatched |

	aPosition > 0
		ifFalse: [^ aNodeSet].
	totalMatched := 0.
	self precedingNodesDo: [:each |
		((aNodeTest value: each)
			and: [(totalMatched := totalMatched + 1) = aPosition])
			ifTrue: [
				aNodeSet addLast: each.
				^ aNodeSet]].
	^ aNodeSet.
]

{ #category : #'*XPath-Core-private' }
XMLNode >> precedingAxisSelect: aNodeTest ifNotPresentInto: aNodeSet [
	self precedingNodesDo: [:each |
		((aNodeSet includes: each) not
			and: [aNodeTest value: each])
			ifTrue: [aNodeSet addLast: each]].
	^ aNodeSet.
]

{ #category : #'*XPath-Core-private' }
XMLNode >> precedingAxisSelect: aNodeTest into: aNodeSet [
	self precedingNodesDo: [:each |
		(aNodeTest value: each)
			ifTrue: [aNodeSet addLast: each]].
	^ aNodeSet.
]

{ #category : #'*XPath-Core-accessing' }
XMLNode >> precedingNodes [
	"returns a node list with all preceding sibling or descendant nodes
	of the receiver"
	| preceding |

	preceding := self newListForSelect.
	self precedingNodesDo: [:each |
		preceding addLast: each].
	^ preceding.
]

{ #category : #'*XPath-Core-enumerating' }
XMLNode >> precedingNodesDo: aBlock [
	self hasParent
		ifTrue: [| visitedSelf |
			visitedSelf := false.
			self parent nodes reverseDo: [:each |
				visitedSelf
					ifTrue: [each allNodesReverseDo: aBlock]
					ifFalse: [
						each = self
							ifTrue: [visitedSelf := true]]]]
]

{ #category : #'*XPath-Core-private' }
XMLNode >> precedingSiblingAxis: aNodeTestStringOrBlock [
	^ (self
		precedingSiblingAxisSelect: aNodeTestStringOrBlock asXPathNodeTest
		into: self nodeSetClass new)
			sortOrder: XPathLevelReverseDocumentSortOrder new
]

{ #category : #'*XPath-Core-private' }
XMLNode >> precedingSiblingAxis: aNodeTestStringOrBlock predicates: aPredicateCollection [
	(aPredicateCollection notEmpty
		and: [aPredicateCollection first isNumber])
		ifTrue: [
			^ (self
				precedingSiblingAxisSelect: aNodeTestStringOrBlock asXPathNodeTest
				at: aPredicateCollection first asXPathNodeSetPosition
				into: self nodeSetClass new)
					sortOrder: XPathLevelReverseDocumentSortOrder new;
					filterWithAll: aPredicateCollection startingAt: 2]
		ifFalse: [
			^ (self precedingSiblingAxis: aNodeTestStringOrBlock)
				filterWithAll: aPredicateCollection]
]

{ #category : #'*XPath-Core-private' }
XMLNode >> precedingSiblingAxisAnySatisfy: aNodeTest [
	self precedingSiblingNodesDo: [:each |
		(aNodeTest value: each)
			ifTrue: [^ true]].
	^ false.
]

{ #category : #'*XPath-Core-private' }
XMLNode >> precedingSiblingAxisSelect: aNodeTest at: aPosition into: aNodeSet [
	| totalMatched |

	aPosition > 0
		ifFalse: [^ aNodeSet].
	totalMatched := 0.
	self precedingSiblingNodesDo: [:each |
		((aNodeTest value: each)
			and: [(totalMatched := totalMatched + 1) = aPosition])
			ifTrue: [
				aNodeSet addLast: each.
				^ aNodeSet]].
	^ aNodeSet.
]

{ #category : #'*XPath-Core-private' }
XMLNode >> precedingSiblingAxisSelect: aNodeTest ifNotPresentInto: aNodeSet [
	self precedingSiblingNodesDo: [:each |
		((aNodeSet includes: each) not
			and: [aNodeTest value: each])
			ifTrue: [aNodeSet addLast: each]].
	^ aNodeSet.
]

{ #category : #'*XPath-Core-private' }
XMLNode >> precedingSiblingAxisSelect: aNodeTest into: aNodeSet [
	self precedingSiblingNodesDo: [:each |
		(aNodeTest value: each)
			ifTrue: [aNodeSet addLast: each]].
	^ aNodeSet.
]

{ #category : #'*XPath-Core-accessing' }
XMLNode >> precedingSiblingNodes [
	"returns a node list with all preceding sibling nodes of the receiver"
	| precedingSiblings |

	precedingSiblings := self newListForSelect.
	self precedingSiblingNodesDo: [:each |
		precedingSiblings addLast: each].
	^ precedingSiblings.
]

{ #category : #'*XPath-Core-enumerating' }
XMLNode >> precedingSiblingNodesDo: aBlock [
	self hasParent
		ifTrue: [| visitedSelf |
			visitedSelf := false.
			self parent nodes reverseDo: [:each |
				visitedSelf
					ifTrue: [aBlock value: each]
					ifFalse: [
						each = self
							ifTrue: [visitedSelf := true]]]]
]

{ #category : #'*XPath-Core-private' }
XMLNode >> selfAxis: aNodeTestStringOrBlock [
	^ (self
		selfAxisSelect: aNodeTestStringOrBlock asXPathNodeTest
		into: self nodeSetClass new)
			sortOrder: XPathLevelDocumentSortOrder new
]

{ #category : #'*XPath-Core-private' }
XMLNode >> selfAxis: aNodeTestStringOrBlock predicates: aPredicateCollection [
	(aPredicateCollection notEmpty
		and: [aPredicateCollection first isNumber])
		ifTrue: [
			^ (self
				selfAxisSelect: aNodeTestStringOrBlock asXPathNodeTest
				at: aPredicateCollection first asXPathNodeSetPosition
				into: self nodeSetClass new)
					sortOrder: XPathLevelDocumentSortOrder new;
					filterEachInSeparateContextWithAll: aPredicateCollection
						startingAt: 2]
		ifFalse: [
			^ (self selfAxis: aNodeTestStringOrBlock)
				filterEachInSeparateContextWithAll: aPredicateCollection]
]

{ #category : #'*XPath-Core-private' }
XMLNode >> selfAxisAnySatisfy: aNodeTest [
	^ aNodeTest value: self
]

{ #category : #'*XPath-Core-private' }
XMLNode >> selfAxisSelect: aNodeTest at: aPosition into: aNodeSet [
	(aPosition = 1
		and: [aNodeTest value: self])
		ifTrue: [aNodeSet addLast: self].
	^ aNodeSet.
]

{ #category : #'*XPath-Core-private' }
XMLNode >> selfAxisSelect: aNodeTest into: aNodeSet [
	(aNodeTest value: self)
		ifTrue: [aNodeSet addLast: self].
	^ aNodeSet.
]

{ #category : #'*XPath-Core-accessing' }
XMLNode >> stringValue [
	"returns XPath node string-value"
	 ^ ''
]

{ #category : #'*XPath-Core-private' }
XMLNode >> withAncestorNodesDo: aBlock [
	aBlock value: self.
	self ancestorNodesDo: aBlock.
]

{ #category : #'*XPath-Core-deprecated' }
XMLNode >> xPath: anXPathOrXPathExpressionSourceString [
	"deprecated alternate spelling;
	will be supported indefinitely for backwards compatibility"

	^ self xpath: anXPathOrXPathExpressionSourceString
]

{ #category : #'*XPath-Core-deprecated' }
XMLNode >> xPath: anXPathOrXPathExpressionSourceString context: aContext [
	"deprecated alternate spelling;
	will be supported indefinitely for backwards compatibility"

	^ self
		xpath: anXPathOrXPathExpressionSourceString
		context: aContext
]

{ #category : #'*XPath-Core-evaluating' }
XMLNode >> xpath: anXPathOrXPathExpressionSourceString [
	^ anXPathOrXPathExpressionSourceString asXPath in: self
]

{ #category : #'*XPath-Core-evaluating' }
XMLNode >> xpath: anXPathOrXPathExpressionSourceString context: aContext [
	^ anXPathOrXPathExpressionSourceString asXPath
		in: self
		context: aContext
]

{ #category : #'*XPath-Core-enumerating - axis' }
XMLNode >> ~ aStringOrBlockOrNodeTestWithPredicates [
	^ aStringOrBlockOrNodeTestWithPredicates isXPathNodeTestWithPredicates
		ifTrue: [
			self
				selfAxis: aStringOrBlockOrNodeTestWithPredicates nodeTest
				predicates: aStringOrBlockOrNodeTestWithPredicates predicates]
		ifFalse: [
			self selfAxis: aStringOrBlockOrNodeTestWithPredicates]
]
