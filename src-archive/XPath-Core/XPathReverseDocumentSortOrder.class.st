"
A sort order for nodes in reverse document order.
"
Class {
	#name : #XPathReverseDocumentSortOrder,
	#superclass : #XPathSortOrder,
	#category : #'XPath-Core-DOM'
}

{ #category : #converting }
XPathReverseDocumentSortOrder >> asReversedSortOrder [
	^ XPathDocumentSortOrder new
]

{ #category : #sorting }
XPathReverseDocumentSortOrder >> documentOrderSort: aNodeSet [
	aNodeSet reverseInPlace
]

{ #category : #sorting }
XPathReverseDocumentSortOrder >> documentOrderSorted: aNodeSet [
	^ aNodeSet reversed
]

{ #category : #accessing }
XPathReverseDocumentSortOrder >> firstInDocumentOrderFrom: aNodeSet [
	^ aNodeSet last
]

{ #category : #enumerating }
XPathReverseDocumentSortOrder >> on: aNodeSet attributeAxis: aNodeTestStringOrBlock [
	| copy attributeAxisNodeTest |

	aNodeSet isEmpty
		ifTrue: [^ aNodeSet copyEmpty].
	attributeAxisNodeTest := aNodeTestStringOrBlock asXPathAttributeAxisNodeTest.
	copy := aNodeSet last attributeAxis: attributeAxisNodeTest.
	aNodeSet allButLastReverseDo: [:each |
		each
			attributeAxisSelect: attributeAxisNodeTest
			into: copy].
	^ copy sortOrder: self asReversedSortOrder.
]

{ #category : #enumerating }
XPathReverseDocumentSortOrder >> on: aNodeSet attributeAxis: aNodeTestStringOrBlock predicates: aPredicateCollection [
	| copy attributeAxisNodeTest |

	aNodeSet isEmpty
		ifTrue: [^ aNodeSet copyEmpty].
	attributeAxisNodeTest := aNodeTestStringOrBlock asXPathAttributeAxisNodeTest.
	copy :=
		aNodeSet last
			attributeAxis: attributeAxisNodeTest
			predicates: aPredicateCollection.
	aNodeSet allButLastReverseDo: [:each |
		(each
			attributeAxis: attributeAxisNodeTest
			predicates: aPredicateCollection)
				addAllTo: copy].
	^ copy sortOrder: self asReversedSortOrder.
]

{ #category : #enumerating }
XPathReverseDocumentSortOrder >> on: aNodeSet namespaceAxis: aNodeTestStringOrBlock [
	| copy namespaceAxisNodeTest |

	aNodeSet isEmpty
		ifTrue: [^ aNodeSet copyEmpty].
	namespaceAxisNodeTest := aNodeTestStringOrBlock asXPathNamespaceAxisNodeTest.
	copy := aNodeSet last namespaceAxis: namespaceAxisNodeTest.
	aNodeSet allButLastReverseDo: [:each |
		each
			namespaceAxisSelect: namespaceAxisNodeTest
			into: copy].
	^ copy sortOrder: self asReversedSortOrder.
]

{ #category : #enumerating }
XPathReverseDocumentSortOrder >> on: aNodeSet namespaceAxis: aNodeTestStringOrBlock predicates: aPredicateCollection [
	| copy namespaceAxisNodeTest |

	aNodeSet isEmpty
		ifTrue: [^ aNodeSet copyEmpty].
	namespaceAxisNodeTest := aNodeTestStringOrBlock asXPathNamespaceAxisNodeTest.
	copy :=
		aNodeSet last
			namespaceAxis: namespaceAxisNodeTest
			predicates: aPredicateCollection.
	aNodeSet allButLastReverseDo: [:each |
		(each
			namespaceAxis: namespaceAxisNodeTest
			predicates: aPredicateCollection)
				addAllTo: copy].
	^ copy sortOrder: self asReversedSortOrder.
]

{ #category : #enumerating }
XPathReverseDocumentSortOrder >> on: aNodeSet parentAxis: aNodeTestStringOrBlock [
	| copy |

	copy := aNodeSet copyEmpty.
	aNodeSet isEmpty
		ifFalse: [| nodeTest |
			nodeTest := aNodeTestStringOrBlock asXPathNodeTest.
			aNodeSet reverseDo: [:each |
				each
					parentAxisSelect: nodeTest
					ifNotPresentInto: copy]].
	"parent is a document order axis according to the spec"
	^ copy sortOrder: self asReversedSortOrder.
]

{ #category : #enumerating }
XPathReverseDocumentSortOrder >> on: aNodeSet selfAxis: aNodeTestStringOrBlock [
	| copy |

	copy := aNodeSet copyEmpty.
	aNodeSet isEmpty
		ifFalse: [| nodeTest |
			nodeTest := aNodeTestStringOrBlock asXPathNodeTest.
			aNodeSet reverseDo: [:each |
				each
					selfAxisSelect: nodeTest
					into: copy]].
	^ copy sortOrder: self asReversedSortOrder.
]
