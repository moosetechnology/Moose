"
This is a document sort order for node sets where all nodes are at the same level, meaning they have the same number of ancestors and share one or more ancestors.
"
Class {
	#name : #XPathLevelDocumentSortOrder,
	#superclass : #XPathDocumentSortOrder,
	#category : #'XPath-Core-DOM'
}

{ #category : #converting }
XPathLevelDocumentSortOrder >> asReversedSortOrder [
	^ XPathLevelReverseDocumentSortOrder new
]

{ #category : #enumerating }
XPathLevelDocumentSortOrder >> on: aNodeSet childAxis: aNodeTestStringOrBlock [
	^ (super
		on: aNodeSet
		childAxis: aNodeTestStringOrBlock) sortOrder: self
]

{ #category : #enumerating }
XPathLevelDocumentSortOrder >> on: aNodeSet childAxis: aNodeTestStringOrBlock predicates: aPredicateCollection [
	^ (super
		on: aNodeSet
		childAxis: aNodeTestStringOrBlock
		predicates: aPredicateCollection) sortOrder: self
]

{ #category : #enumerating }
XPathLevelDocumentSortOrder >> on: aNodeSet descendantAxis: aNodeTestStringOrBlock [
	| copy nodeTest |

	aNodeSet isEmpty
		ifTrue: [^ aNodeSet copyEmpty].
	nodeTest := aNodeTestStringOrBlock asXPathNodeTest.
	copy := aNodeSet first descendantAxis: nodeTest.
	aNodeSet allButFirstDo: [:each |
		each
			descendantAxisSelect: nodeTest
			into: copy].
	"will be in document order after, but not necessarily level document order"
	^ copy sortOrder: XPathDocumentSortOrder new.
]

{ #category : #enumerating }
XPathLevelDocumentSortOrder >> on: aNodeSet descendantAxis: aNodeTestStringOrBlock predicates: aPredicateCollection [
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
				addAllTo: copy].
	"will be in document order after, but not necessarily level document order"
	^ copy sortOrder: XPathDocumentSortOrder new.
]

{ #category : #enumerating }
XPathLevelDocumentSortOrder >> on: aNodeSet descendantOrSelfAxis: aNodeTestStringOrBlock [
	| copy nodeTest |

	aNodeSet isEmpty
		ifTrue: [^ aNodeSet copyEmpty].
	nodeTest := aNodeTestStringOrBlock asXPathNodeTest.
	copy := aNodeSet first descendantOrSelfAxis: nodeTest.
	aNodeSet allButFirstDo: [:each |
		each
			descendantOrSelfAxisSelect: nodeTest
			into: copy].
	"will be in document order after, but not necessarily level document order"
	^ copy sortOrder: XPathDocumentSortOrder new.
]

{ #category : #enumerating }
XPathLevelDocumentSortOrder >> on: aNodeSet descendantOrSelfAxis: aNodeTestStringOrBlock predicates: aPredicateCollection [
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
				addAllTo: copy].
	"will be in document order after, but not necessarily level document order"
	^ copy sortOrder: XPathDocumentSortOrder new.
]
