"
This is a reverse document sort order for node sets where all nodes are at the same level, meaning they have the same number of ancestors and share one or more ancestors.
"
Class {
	#name : #XPathLevelReverseDocumentSortOrder,
	#superclass : #XPathReverseDocumentSortOrder,
	#category : #'XPath-Core-DOM'
}

{ #category : #converting }
XPathLevelReverseDocumentSortOrder >> asReversedSortOrder [
	^ XPathLevelDocumentSortOrder new
]

{ #category : #enumerating }
XPathLevelReverseDocumentSortOrder >> on: aNodeSet childAxis: aNodeTestStringOrBlock [
	| copy nodeTest |

	aNodeSet isEmpty
		ifTrue: [^ aNodeSet copyEmpty].
	nodeTest := aNodeTestStringOrBlock asXPathNodeTest.
	copy := aNodeSet last childAxis: nodeTest.
	aNodeSet allButLastReverseDo: [:each |
		each
			childAxisSelect: nodeTest
			into: copy].
	^ copy sortOrder: self asReversedSortOrder.
]

{ #category : #enumerating }
XPathLevelReverseDocumentSortOrder >> on: aNodeSet childAxis: aNodeTestStringOrBlock predicates: aPredicateCollection [
	| copy nodeTest |

	aNodeSet isEmpty
		ifTrue: [^ aNodeSet copyEmpty].
	nodeTest := aNodeTestStringOrBlock asXPathNodeTest.
	copy :=
		aNodeSet last
			childAxis: nodeTest
			predicates: aPredicateCollection.
	aNodeSet allButLastReverseDo: [:each |
		(each
			childAxis: nodeTest
			predicates: aPredicateCollection)
				addAllTo: copy].
	^ copy sortOrder: self asReversedSortOrder.
]

{ #category : #enumerating }
XPathLevelReverseDocumentSortOrder >> on: aNodeSet descendantAxis: aNodeTestStringOrBlock [
	| copy nodeTest |

	aNodeSet isEmpty
		ifTrue: [^ aNodeSet copyEmpty].
	nodeTest := aNodeTestStringOrBlock asXPathNodeTest.
	copy := aNodeSet last descendantAxis: nodeTest.
	aNodeSet allButLastReverseDo: [:each |
		each
			descendantAxisSelect: nodeTest
			into: copy].
	"will be in document order after, but not necessarily level document order"
	^ copy sortOrder: XPathDocumentSortOrder new.
]

{ #category : #enumerating }
XPathLevelReverseDocumentSortOrder >> on: aNodeSet descendantAxis: aNodeTestStringOrBlock predicates: aPredicateCollection [
	| copy nodeTest |

	aNodeSet isEmpty
		ifTrue: [^ aNodeSet copyEmpty].
	nodeTest := aNodeTestStringOrBlock asXPathNodeTest.
	copy :=
		aNodeSet last
			descendantAxis: nodeTest
			predicates: aPredicateCollection.
	aNodeSet allButLastReverseDo: [:each |
		(each
			descendantAxis: nodeTest
			predicates: aPredicateCollection)
				addAllTo: copy].
	"will be in document order after, but not necessarily level document order"
	^ copy sortOrder: XPathDocumentSortOrder new.
]

{ #category : #enumerating }
XPathLevelReverseDocumentSortOrder >> on: aNodeSet descendantOrSelfAxis: aNodeTestStringOrBlock [
	| copy nodeTest |

	aNodeSet isEmpty
		ifTrue: [^ aNodeSet copyEmpty].
	nodeTest := aNodeTestStringOrBlock asXPathNodeTest.
	copy := aNodeSet last descendantOrSelfAxis: nodeTest.
	aNodeSet allButLastReverseDo: [:each |
		each
			descendantOrSelfAxisSelect: nodeTest
			into: copy].
	"will be in document order after, but not necessarily level document order"
	^ copy sortOrder: XPathDocumentSortOrder new.
]

{ #category : #enumerating }
XPathLevelReverseDocumentSortOrder >> on: aNodeSet descendantOrSelfAxis: aNodeTestStringOrBlock predicates: aPredicateCollection [
	| copy nodeTest |

	aNodeSet isEmpty
		ifTrue: [^ aNodeSet copyEmpty].
	nodeTest := aNodeTestStringOrBlock asXPathNodeTest.
	copy :=
		aNodeSet last
			descendantOrSelfAxis: nodeTest
			predicates: aPredicateCollection.
	aNodeSet allButLastReverseDo: [:each |
		(each
			descendantOrSelfAxis: nodeTest
			predicates: aPredicateCollection)
				addAllTo: copy].
	"will be in document order after, but not necessarily level document order"
	^ copy sortOrder: XPathDocumentSortOrder new.
]
