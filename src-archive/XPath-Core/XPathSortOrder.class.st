"
Abstract class for node sort orders to keep track of the order of nodes in a node set, and to implement node set-based axis selections on them.

Instances of subclasses are immutable and shared.
"
Class {
	#name : #XPathSortOrder,
	#superclass : #Object,
	#classInstVars : [
		'instance'
	],
	#category : #'XPath-Core-DOM'
}

{ #category : #accessing }
XPathSortOrder class >> instance [
	^ instance
		ifNil: [instance := self basicNew initialize]
]

{ #category : #'instance creation' }
XPathSortOrder class >> new [
	"these classes are immutable and shared, so they are only initialized once"
	^ self instance
]

{ #category : #converting }
XPathSortOrder >> asReversedSortOrder [
	self subclassResponsibility
]

{ #category : #sorting }
XPathSortOrder >> documentOrderSort: aNodeSet [
	self subclassResponsibility
]

{ #category : #sorting }
XPathSortOrder >> documentOrderSorted: aNodeSet [
	self subclassResponsibility
]

{ #category : #accessing }
XPathSortOrder >> firstInDocumentOrderFrom: aNodeSet [
	self subclassResponsibility
]

{ #category : #enumerating }
XPathSortOrder >> on: aNodeSet ancestorAxis: aNodeTestStringOrBlock [
	| copy nodeTest |

	aNodeSet isEmpty
		ifTrue: [^ aNodeSet copyEmpty].
	nodeTest := aNodeTestStringOrBlock asXPathNodeTest.
	copy := aNodeSet first ancestorAxis: nodeTest.
	aNodeSet allButFirstDo: [:each |
		each
			ancestorAxisSelect: nodeTest
			ifNotPresentInto: copy].
	^ copy.
]

{ #category : #enumerating }
XPathSortOrder >> on: aNodeSet ancestorAxis: aNodeTestStringOrBlock predicates: aPredicateCollection [
	| copy nodeTest |

	aNodeSet isEmpty
		ifTrue: [^ aNodeSet copyEmpty].
	nodeTest := aNodeTestStringOrBlock asXPathNodeTest.
	copy :=
		aNodeSet first
			ancestorAxis: nodeTest
			predicates: aPredicateCollection.
	aNodeSet allButFirstDo: [:each |
		(each
			ancestorAxis: nodeTest
			predicates: aPredicateCollection)
				addAllIfNotPresentTo: copy].
	^ copy.
]

{ #category : #enumerating }
XPathSortOrder >> on: aNodeSet ancestorOrSelfAxis: aNodeTestStringOrBlock [
	| copy nodeTest |

	aNodeSet isEmpty
		ifTrue: [^ aNodeSet copyEmpty].
	nodeTest := aNodeTestStringOrBlock asXPathNodeTest.
	copy := aNodeSet first ancestorOrSelfAxis: nodeTest.
	aNodeSet allButFirstDo: [:each |
		each
			ancestorOrSelfAxisSelect: nodeTest
			ifNotPresentInto: copy].
	^ copy.
]

{ #category : #enumerating }
XPathSortOrder >> on: aNodeSet ancestorOrSelfAxis: aNodeTestStringOrBlock predicates: aPredicateCollection [
	| copy nodeTest |

	aNodeSet isEmpty
		ifTrue: [^ aNodeSet copyEmpty].
	nodeTest := aNodeTestStringOrBlock asXPathNodeTest.
	copy :=
		aNodeSet first
			ancestorOrSelfAxis: nodeTest
			predicates: aPredicateCollection.
	aNodeSet allButFirstDo: [:each |
		(each
			ancestorOrSelfAxis: nodeTest
			predicates: aPredicateCollection)
				addAllIfNotPresentTo: copy].
	^ copy.
]

{ #category : #enumerating }
XPathSortOrder >> on: aNodeSet attributeAxis: aNodeTestStringOrBlock [
	| copy attributeAxisNodeTest |

	aNodeSet isEmpty
		ifTrue: [^ aNodeSet copyEmpty].
	attributeAxisNodeTest := aNodeTestStringOrBlock asXPathAttributeAxisNodeTest.
	copy := aNodeSet first attributeAxis: attributeAxisNodeTest.
	aNodeSet allButFirstDo: [:each |
		each
			attributeAxisSelect: attributeAxisNodeTest
			into: copy].
	^ copy.
]

{ #category : #enumerating }
XPathSortOrder >> on: aNodeSet attributeAxis: aNodeTestStringOrBlock predicates: aPredicateCollection [
	| copy attributeAxisNodeTest |

	aNodeSet isEmpty
		ifTrue: [^ aNodeSet copyEmpty].
	attributeAxisNodeTest := aNodeTestStringOrBlock asXPathAttributeAxisNodeTest.
	copy :=
		aNodeSet first
			attributeAxis: attributeAxisNodeTest
			predicates: aPredicateCollection.
	aNodeSet allButFirstDo: [:each |
		(each
			attributeAxis: attributeAxisNodeTest
			predicates: aPredicateCollection)
				addAllTo: copy].
	^ copy.
]

{ #category : #enumerating }
XPathSortOrder >> on: aNodeSet childAxis: aNodeTestStringOrBlock [
	| copy nodeTest |

	aNodeSet isEmpty
		ifTrue: [^ aNodeSet copyEmpty].
	nodeTest := aNodeTestStringOrBlock asXPathNodeTest.
	copy := aNodeSet first childAxis: nodeTest.
	aNodeSet allButFirstDo: [:each |
		each
			childAxisSelect: nodeTest
			into: copy].
	^ copy.
]

{ #category : #enumerating }
XPathSortOrder >> on: aNodeSet childAxis: aNodeTestStringOrBlock predicates: aPredicateCollection [
	| copy nodeTest |

	aNodeSet isEmpty
		ifTrue: [^ aNodeSet copyEmpty].
	nodeTest := aNodeTestStringOrBlock asXPathNodeTest.
	copy :=
		aNodeSet first
			childAxis: nodeTest
			predicates: aPredicateCollection.
	aNodeSet allButFirstDo: [:each |
		(each
			childAxis: nodeTest
			predicates: aPredicateCollection)
				addAllTo: copy].
	^ copy.
]

{ #category : #enumerating }
XPathSortOrder >> on: aNodeSet descendantAxis: aNodeTestStringOrBlock [
	| copy nodeTest |

	aNodeSet isEmpty
		ifTrue: [^ aNodeSet copyEmpty].
	nodeTest := aNodeTestStringOrBlock asXPathNodeTest.
	copy := aNodeSet first descendantAxis: nodeTest.
	aNodeSet allButFirstDo: [:each |
		each
			descendantAxisSelect: nodeTest
			ifNotPresentInto: copy].
	^ copy.
]

{ #category : #enumerating }
XPathSortOrder >> on: aNodeSet descendantAxis: aNodeTestStringOrBlock predicates: aPredicateCollection [
	| copy nodeTest |

	aNodeSet isEmpty
		ifTrue: [^ aNodeSet copyEmpty].
	nodeTest := aNodeTestStringOrBlock asXPathNodeTest.
	copy :=
		aNodeSet first
			descendantAxis: nodeTest
			predicates: aPredicateCollection.
	aNodeSet allButFirstDo: [:each |
		(each
			descendantAxis: nodeTest
			predicates: aPredicateCollection)
				addAllIfNotPresentTo: copy].
	^ copy.
]

{ #category : #enumerating }
XPathSortOrder >> on: aNodeSet descendantOrSelfAxis: aNodeTestStringOrBlock [
	| copy nodeTest |

	aNodeSet isEmpty
		ifTrue: [^ aNodeSet copyEmpty].
	nodeTest := aNodeTestStringOrBlock asXPathNodeTest.
	copy := aNodeSet first descendantOrSelfAxis: nodeTest.
	aNodeSet allButFirstDo: [:each |
		each
			descendantOrSelfAxisSelect: nodeTest
			ifNotPresentInto: copy].
	^ copy.
]

{ #category : #enumerating }
XPathSortOrder >> on: aNodeSet descendantOrSelfAxis: aNodeTestStringOrBlock predicates: aPredicateCollection [
	| copy nodeTest |

	aNodeSet isEmpty
		ifTrue: [^ aNodeSet copyEmpty].
	nodeTest := aNodeTestStringOrBlock asXPathNodeTest.
	copy :=
		aNodeSet first
			descendantOrSelfAxis: nodeTest
			predicates: aPredicateCollection.
	aNodeSet allButFirstDo: [:each |
		(each
			descendantOrSelfAxis: nodeTest
			predicates: aPredicateCollection)
				addAllIfNotPresentTo: copy].
	^ copy.
]

{ #category : #enumerating }
XPathSortOrder >> on: aNodeSet followingAxis: aNodeTestStringOrBlock [
	| copy nodeTest |

	aNodeSet isEmpty
		ifTrue: [^ aNodeSet copyEmpty].
	nodeTest := aNodeTestStringOrBlock asXPathNodeTest.
	copy := aNodeSet first followingAxis: nodeTest.
	aNodeSet allButFirstDo: [:each |
		each
			followingAxisSelect: nodeTest
			ifNotPresentInto: copy].
	^ copy.
]

{ #category : #enumerating }
XPathSortOrder >> on: aNodeSet followingAxis: aNodeTestStringOrBlock predicates: aPredicateCollection [
	| copy nodeTest |

	aNodeSet isEmpty
		ifTrue: [^ aNodeSet copyEmpty].
	nodeTest := aNodeTestStringOrBlock asXPathNodeTest.
	copy :=
		aNodeSet first
			followingAxis: nodeTest
			predicates: aPredicateCollection.
	aNodeSet allButFirstDo: [:each |
		(each
			followingAxis: nodeTest
			predicates: aPredicateCollection)
				addAllIfNotPresentTo: copy].
	^ copy.
]

{ #category : #enumerating }
XPathSortOrder >> on: aNodeSet followingSiblingAxis: aNodeTestStringOrBlock [
	| copy nodeTest |

	aNodeSet isEmpty
		ifTrue: [^ aNodeSet copyEmpty].
	nodeTest := aNodeTestStringOrBlock asXPathNodeTest.
	copy := aNodeSet first followingSiblingAxis: nodeTest.
	aNodeSet allButFirstDo: [:each |
		each
			followingSiblingAxisSelect: nodeTest
			ifNotPresentInto: copy].
	^ copy.
]

{ #category : #enumerating }
XPathSortOrder >> on: aNodeSet followingSiblingAxis: aNodeTestStringOrBlock predicates: aPredicateCollection [
	| copy nodeTest |

	aNodeSet isEmpty
		ifTrue: [^ aNodeSet copyEmpty].
	nodeTest := aNodeTestStringOrBlock asXPathNodeTest.
	copy :=
		aNodeSet first
			followingSiblingAxis: nodeTest
			predicates: aPredicateCollection.
	aNodeSet allButFirstDo: [:each |
		(each
			followingSiblingAxis: nodeTest
			predicates: aPredicateCollection)
				addAllIfNotPresentTo: copy].
	^ copy.
]

{ #category : #enumerating }
XPathSortOrder >> on: aNodeSet namespaceAxis: aNodeTestStringOrBlock [
	| copy namespaceAxisNodeTest |

	aNodeSet isEmpty
		ifTrue: [^ aNodeSet copyEmpty].
	namespaceAxisNodeTest := aNodeTestStringOrBlock asXPathNamespaceAxisNodeTest.
	copy := aNodeSet first namespaceAxis: namespaceAxisNodeTest.
	aNodeSet allButFirstDo: [:each |
		each
			namespaceAxisSelect: namespaceAxisNodeTest
			into: copy].
	^ copy.
]

{ #category : #enumerating }
XPathSortOrder >> on: aNodeSet namespaceAxis: aNodeTestStringOrBlock predicates: aPredicateCollection [
	| copy namespaceAxisNodeTest |

	aNodeSet isEmpty
		ifTrue: [^ aNodeSet copyEmpty].
	namespaceAxisNodeTest := aNodeTestStringOrBlock asXPathNamespaceAxisNodeTest.
	copy :=
		aNodeSet first
			namespaceAxis: namespaceAxisNodeTest
			predicates: aPredicateCollection.
	aNodeSet allButFirstDo: [:each |
		(each
			namespaceAxis: namespaceAxisNodeTest
			predicates: aPredicateCollection)
				addAllTo: copy].
	^ copy.
]

{ #category : #enumerating }
XPathSortOrder >> on: aNodeSet parentAxis: aNodeTestStringOrBlock [
	| copy |

	copy := aNodeSet copyEmpty.
	aNodeSet isEmpty
		ifFalse: [| nodeTest |
			nodeTest := aNodeTestStringOrBlock asXPathNodeTest.
			aNodeSet do: [:each |
				each
					parentAxisSelect: nodeTest
					ifNotPresentInto: copy]].
	^ copy.
]

{ #category : #enumerating }
XPathSortOrder >> on: aNodeSet parentAxis: aNodeTestStringOrBlock predicates: aPredicateCollection [
	^ (self
		on: aNodeSet
		parentAxis: aNodeTestStringOrBlock)
			filterEachInSeparateContextWithAll: aPredicateCollection
]

{ #category : #enumerating }
XPathSortOrder >> on: aNodeSet precedingAxis: aNodeTestStringOrBlock [
	| copy nodeTest |

	aNodeSet isEmpty
		ifTrue: [^ aNodeSet copyEmpty].
	nodeTest := aNodeTestStringOrBlock asXPathNodeTest.
	copy := aNodeSet first precedingAxis: nodeTest.
	aNodeSet allButFirstDo: [:each |
		each
			precedingAxisSelect: nodeTest
			ifNotPresentInto: copy].
	^ copy.
]

{ #category : #enumerating }
XPathSortOrder >> on: aNodeSet precedingAxis: aNodeTestStringOrBlock predicates: aPredicateCollection [
	| copy nodeTest |

	aNodeSet isEmpty
		ifTrue: [^ aNodeSet copyEmpty].
	nodeTest := aNodeTestStringOrBlock asXPathNodeTest.
	copy :=
		aNodeSet first
			precedingAxis: nodeTest
			predicates: aPredicateCollection.
	aNodeSet allButFirstDo: [:each |
		(each
			precedingAxis: nodeTest
			predicates: aPredicateCollection)
				addAllIfNotPresentTo: copy].
	^ copy.
]

{ #category : #enumerating }
XPathSortOrder >> on: aNodeSet precedingSiblingAxis: aNodeTestStringOrBlock [
	| copy nodeTest |

	aNodeSet isEmpty
		ifTrue: [^ aNodeSet copyEmpty].
	nodeTest := aNodeTestStringOrBlock asXPathNodeTest.
	copy := aNodeSet first precedingSiblingAxis: nodeTest.
	aNodeSet allButFirstDo: [:each |
		each
			precedingSiblingAxisSelect: nodeTest
			ifNotPresentInto: copy].
	^ copy.
]

{ #category : #enumerating }
XPathSortOrder >> on: aNodeSet precedingSiblingAxis: aNodeTestStringOrBlock predicates: aPredicateCollection [
	| copy nodeTest |

	aNodeSet isEmpty
		ifTrue: [^ aNodeSet copyEmpty].
	nodeTest := aNodeTestStringOrBlock asXPathNodeTest.
	copy :=
		aNodeSet first
			precedingSiblingAxis: nodeTest
			predicates: aPredicateCollection.
	aNodeSet allButFirstDo: [:each |
		(each
			precedingSiblingAxis: nodeTest
			predicates: aPredicateCollection)
				addAllIfNotPresentTo: copy].
	^ copy.
]

{ #category : #enumerating }
XPathSortOrder >> on: aNodeSet selfAxis: aNodeTestStringOrBlock [
	| copy |

	copy := aNodeSet copyEmpty.
	aNodeSet isEmpty
		ifFalse: [| nodeTest |
			nodeTest := aNodeTestStringOrBlock asXPathNodeTest.
			aNodeSet do: [:each |
				each
					selfAxisSelect: nodeTest
					into: copy]].
	^ copy.
]

{ #category : #enumerating }
XPathSortOrder >> on: aNodeSet selfAxis: aNodeTestStringOrBlock predicates: aPredicateCollection [
	^ (self
		on: aNodeSet
		selfAxis: aNodeTestStringOrBlock)
			filterEachInSeparateContextWithAll: aPredicateCollection
]
