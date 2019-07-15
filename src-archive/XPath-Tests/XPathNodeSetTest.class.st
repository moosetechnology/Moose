Class {
	#name : #XPathNodeSetTest,
	#superclass : #XMLNodeListTest,
	#category : #'XPath-Tests'
}

{ #category : #testing }
XPathNodeSetTest >> allowsDuplicates [
	^ false
]

{ #category : #assertions }
XPathNodeSetTest >> assertList: aList copiedFrom: aSecondList equals: aThirdList [
	super
		assertList: aList
		copiedFrom: aSecondList
		equals: aThirdList.
	"internal set must be copied"
	self
		assert: aList set = aThirdList set;
		deny: aList set == aSecondList set.
]

{ #category : #assertions }
XPathNodeSetTest >> assertList: aList copiedFrom: aSecondList hasNode: aNode [
	self
		assertList: aList
		copiedFrom: aSecondList
		hasNodes: (Array with: aNode)
]

{ #category : #assertions }
XPathNodeSetTest >> assertList: aList copiedFrom: aSecondList hasNodes: aNodeCollection [
	self
		assertList: aList
		copiedFrom: aSecondList
		equals: (self listClass newFrom: aNodeCollection) sort.
	self assert: (aList sortOrder isKindOf: XPathDocumentSortOrder).
]

{ #category : #assertions }
XPathNodeSetTest >> assertList: aFirstList hasSameSortOrderAs: aSecondList [
	self assert: aFirstList sortOrder class == aSecondList sortOrder class
]

{ #category : #assertions }
XPathNodeSetTest >> assertList: aList hasSortOrder: aSortOrder [
	self assert: aList sortOrder class == aSortOrder
]

{ #category : #assertions }
XPathNodeSetTest >> assertList: aList isCopyOf: aSecondList [
	super assertList: aList isCopyOf: aSecondList.
	"internal set must be copied"
	self
		assert: aList set = aSecondList set;
		deny: aList set == aSecondList set.
]

{ #category : #assertions }
XPathNodeSetTest >> assertListHasUnknownSortOrder: aList [
	self
		assertList: aList
		hasSortOrder: XPathUnknownSortOrder
]

{ #category : #accessing }
XPathNodeSetTest >> listClass [
	^ XPathNodeSet
]

{ #category : #accessing }
XPathNodeSetTest >> listWithSortOrder [
	^ self listWithItems sortOrder: XPathLevelDocumentSortOrder new
]

{ #category : #'instance creation' }
XPathNodeSetTest >> newElementWithAttributes [
	^ (XMLElement named: 'test')
		attributeAt: 'one' put: '1';
		attributeAt: 'two' put: '2';
		attributeAt: 'three' put: '3';
		yourself
]

{ #category : #'instance creation' }
XPathNodeSetTest >> newElementWithNamespaces [
	^ (XMLElement named: 'test')
		declarePrefix: 'one' uri: 'oneNS';
		declarePrefix: 'two' uri: 'twoNS';
		declarePrefix: 'three' uri: 'threeNS';
		yourself
]

{ #category : #accessing }
XPathNodeSetTest >> reverseSortBlock [
	^ [:a :b | (self listItems indexOf: a) >= (self listItems indexOf: b)]
]

{ #category : #accessing }
XPathNodeSetTest >> sortBlock [	
	^ [:a :b | (self listItems indexOf: a) <= (self listItems indexOf: b)]
]

{ #category : #tests }
XPathNodeSetTest >> testAdd [
	super testAdd.

	self assertListHasUnknownSortOrder:
		(self listWithSortOrder
			add: self newListItem;
			yourself).
]

{ #category : #tests }
XPathNodeSetTest >> testAddAfter [
	super testAddAfter.

	self assertListHasUnknownSortOrder:
		(self listWithSortOrder
			add: self newListItem after: self singleListItem;
			yourself).
]

{ #category : #tests }
XPathNodeSetTest >> testAddAfterIndex [
	super testAddAfterIndex.

	self assertListHasUnknownSortOrder:
		(self listWithSortOrder
			add: self newListItem afterIndex: 1;
			yourself).
]

{ #category : #tests }
XPathNodeSetTest >> testAddAll [
	super testAddAll.

	self assertListHasUnknownSortOrder:
		(self listWithSortOrder
			addAll: (Array with: self newListItem);
			yourself).
]

{ #category : #tests }
XPathNodeSetTest >> testAddAllFirst [
	super testAddAllFirst.

	self assertListHasUnknownSortOrder:
		(self listWithSortOrder
			addAllFirst: (Array with: self newListItem);
			yourself).
]

{ #category : #tests }
XPathNodeSetTest >> testAddAllIfNotPresentTo [
	| list listToAdd |

	list := OrderedCollection new.
	listToAdd := self emptyList.
	self
		assert: (listToAdd addAllIfNotPresentTo: list) == listToAdd;
		assert: list isEmpty.

	listToAdd := self listWithItems.
	self
		assert: (listToAdd addAllIfNotPresentTo: list) == listToAdd;
		assert: list = self listItems asOrderedCollection;
		assert: (listToAdd addAllIfNotPresentTo: list) == listToAdd;
		assert: list = self listItems asOrderedCollection.

]

{ #category : #tests }
XPathNodeSetTest >> testAddAllLast [
	super testAddAllLast.

	self assertListHasUnknownSortOrder:
		(self listWithSortOrder
			addAllLast: (Array with: self newListItem);
			yourself).
]

{ #category : #tests }
XPathNodeSetTest >> testAddAllTo [
	| list listToAdd |

	list := OrderedCollection new.
	listToAdd := self emptyList.
	self
		assert: (listToAdd addAllTo: list) == listToAdd;
		assert: list isEmpty.

	listToAdd := self listWithItems.
	self
		assert: (listToAdd addAllTo: list) == listToAdd;
		assert: list = self listItems asOrderedCollection;
		assert: (listToAdd addAllTo: list) == listToAdd;
		assert: list = (self listItems, self listItems) asOrderedCollection.

]

{ #category : #tests }
XPathNodeSetTest >> testAddBefore [
	super testAddBefore.

	self assertListHasUnknownSortOrder:
		(self listWithSortOrder
			add: self newListItem before: self singleListItem;
			yourself).
]

{ #category : #tests }
XPathNodeSetTest >> testAddBeforeIndex [
	super testAddBeforeIndex.

	self assertListHasUnknownSortOrder:
		(self listWithSortOrder
			add: self newListItem beforeIndex: 1;
			yourself).
]

{ #category : #tests }
XPathNodeSetTest >> testAddFirst [
	super testAddFirst.

	self assertListHasUnknownSortOrder:
		(self listWithSortOrder
			addFirst: self newListItem;
			yourself).
]

{ #category : #tests }
XPathNodeSetTest >> testAddLast [
	super testAddLast.

	self assertListHasUnknownSortOrder:
		(self listWithSortOrder
			addLast: self newListItem;
			yourself).
]

{ #category : #tests }
XPathNodeSetTest >> testAllButFirst [
	| list |

	super testAllButFirst.

	list := self listWithSortOrder.
	self
		assertList: list allButFirst
		hasSameSortOrderAs: list.
]

{ #category : #tests }
XPathNodeSetTest >> testAllButFirstFew [
	| list |

	super testAllButFirstFew.

	list := self listWithSortOrder.
	self
		assertList: (list allButFirst: 1)
		hasSameSortOrderAs: list.
]

{ #category : #tests }
XPathNodeSetTest >> testAllButLast [
	| list |

	super testAllButLast.

	list := self listWithSortOrder.
	self
		assertList: list allButLast
		hasSameSortOrderAs: list.
]

{ #category : #tests }
XPathNodeSetTest >> testAllButLastFew [
	| list |

	super testAllButLastFew.

	list := self listWithSortOrder.
	self
		assertList: (list allButLast: 1)
		hasSameSortOrderAs: list.
]

{ #category : #tests }
XPathNodeSetTest >> testAllButLastReverseDo [
	| list |

	list := self emptyList.
	self
		xmlShould: [:block | list allButLastReverseDo: block ]
		enumerate: #().

	list := self listWithItems.
	self
		xmlShould: [:block | list allButLastReverseDo: block]
		enumerate: self listItems allButLast reversed.
]

{ #category : #tests }
XPathNodeSetTest >> testAncestorAxis [
	| list result |

	list := self listWithItems.
	result := list %% '*'.
	self
		assertList: result
		copiedFrom: list
		hasNodes: self listItems first ancestorElements.
	self assert: (result %% '*') isEmpty.

	result := list %% 'root'.
	self
		assertList: result
		copiedFrom: list
		hasNode: self listItems first ancestorElements last.
	self assert: (result %% 'root') isEmpty.
]

{ #category : #tests }
XPathNodeSetTest >> testAncestorAxisPredicates [
	| list result |

	list := self listWithItems.
	result := list %% ('*' ?? 1).
	self
		assertList: result
		copiedFrom: list
		hasNode: self listItems first ancestorElements last.
	self assert: (result %% ('*' ?? 1)) isEmpty.

	result := list %% ('root' ?? 1).
	self
		assertList: result
		copiedFrom: list
		hasNode: self listItems first ancestorElements last.
	self assert: (result %% ('root' ?? 1)) isEmpty.
]

{ #category : #tests }
XPathNodeSetTest >> testAncestorOrSelfAxis [
	| list result |

	list := self listWithItems.
	result := list %%~ '*'.
	self
		assertList: result
		copiedFrom: list
		hasNodes:
			"use #asArray to satisfy GS's Array>>#, argument check"
			(self listElements asArray,
				self listElements first ancestorElements asArray).
	self assert: (result %%~ 'absent') isEmpty.

	result := list %%~ 'root'.
	self
		assertList: result
		copiedFrom: list
		hasNode: self listItems first ancestorElements last.
	self assert: (result %%~ 'absent') isEmpty.
]

{ #category : #tests }
XPathNodeSetTest >> testAncestorOrSelfAxisPredicates [
	| list result |

	list := self listWithItems.
	result := list %%~ ('*' ?? 2).
	self
		assertList: result
		copiedFrom: list
		hasNode: self listItems first ancestorElements first.
	self assert: (result %%~ ('*' ?? 2)) isEmpty.

	result := list %%~ ('root' ?? 1).
	self
		assertList: result
		copiedFrom: list
		hasNode: self listItems first ancestorElements last.
	self assert: (result %%~ ('root' ?? 2)) isEmpty.
]

{ #category : #tests }
XPathNodeSetTest >> testAsSorted [
	| list sorted |

	list := self listWithItems.
	sorted := list asSorted.
	self
		assertList: sorted
		copiedFrom: list
		equals: self listWithItems.
	self
		assertList: sorted
		hasSortOrder: XPathDocumentSortOrder.

	list := self listWithItems sorted.
	sorted := list asSorted.
	self
		assert: sorted = self listWithItems;
		assert: sorted == list.
	self
		assertList: sorted
		hasSortOrder: XPathDocumentSortOrder.

	list := self listWithItems sorted reversed.
	self
		assertList: sorted
		copiedFrom: list
		equals: self listWithItems.
	self
		assertList: sorted
		hasSortOrder: XPathDocumentSortOrder.
]

{ #category : #tests }
XPathNodeSetTest >> testAsXPathBoolean [
	self
		deny: self emptyList asXPathBoolean;
		assert: self listWithSingleItem asXPathBoolean
]

{ #category : #tests }
XPathNodeSetTest >> testAsXPathComparable [
	| comparable |

	comparable := self listWithItems asXPathComparable.
	self
		assert: comparable class == XPathNodeSetComparable;
		assert: comparable value = self listWithItems.
]

{ #category : #tests }
XPathNodeSetTest >> testAsXPathFilterExpressionLocationPathRoot [
	| list |

	list := self emptyList.
	self assert: list asXPathFilterExpressionLocationPathRoot == list.
]

{ #category : #tests }
XPathNodeSetTest >> testAsXPathFilterExpressionPredicateRoot [
	| list filterable |

	list := self listWithItems reversed.
	filterable := list asXPathFilterExpressionPredicateRoot.
	self
		assertList: filterable copiedFrom: list equals: self listWithItems;
		assertList: filterable hasSortOrder: XPathDocumentSortOrder.
]

{ #category : #tests }
XPathNodeSetTest >> testAsXPathNodeSet [
	| list |

	list := self emptyList.
	self assert: list asXPathNodeSet == list.
]

{ #category : #tests }
XPathNodeSetTest >> testAsXPathNumber [
	self
		assert: self emptyList asXPathNumber isNaN;
		assert: self listWithItems asXPathNumber isNaN;
		assert: (self listClass with: ' 1.0 ' asXMLStringNode) asXPathNumber = 1.0;
		assert: (self listClass with: ' 1.0 .' asXMLStringNode) asXPathNumber isNaN
]

{ #category : #tests }
XPathNodeSetTest >> testAsXPathString [
	self
		assert: self emptyList asXPathString = '';
		assert: self listWithItems asXPathString = self singleListItem stringValue;
		assert: self listWithItems reversed asXPathString = self singleListItem stringValue
]

{ #category : #tests }
XPathNodeSetTest >> testAsXPathUnionable [
	| list |

	list := self emptyList.
	self assert: list asXPathUnionable == list.
]

{ #category : #tests }
XPathNodeSetTest >> testAtPut [
	super testAtPut.

	self assertListHasUnknownSortOrder:
		(self listWithSortOrder
			at: 1 put: self newListItem;
			yourself).
]

{ #category : #tests }
XPathNodeSetTest >> testAttributeAxis [
	| element listWithElement |

	element := self newElementWithAttributes.
	listWithElement := self listClass with: element.
	(Array
		with: listWithElement sorted
		with: listWithElement sorted reversed)
		do: [:list | | result |
			result := list @ '*'.
			self
				assertList: result
				copiedFrom: list
				hasNodes: element attributeNodes.
			self
				assertList: result
				hasSortOrder: XPathLevelDocumentSortOrder.
			self assert: (result @ '*') isEmpty.

			result := list @ 'two'.
			self
				assertList: result
				copiedFrom: list
				hasNode: element attributeNodes second.
			self
				assertList: result
				hasSortOrder: XPathLevelDocumentSortOrder.
			self assert: (result @ 'two') isEmpty].
]

{ #category : #tests }
XPathNodeSetTest >> testAttributeAxisPredicates [
	| element listWithElement |

	element := self newElementWithAttributes.
	listWithElement := self listClass with: element.
	(Array
		with: listWithElement sorted
		with: listWithElement sorted reversed)
		do: [:list | | result |
			result := list @ ('*' ?? 2).
			self
				assertList: result
				copiedFrom: list
				hasNode: element attributeNodes second.
			self
				assertList: result
				hasSortOrder: XPathLevelDocumentSortOrder.
			self assert: (result @ ('*' ?? 1)) isEmpty.

			result := list @ ('two' ?? 1).
			self
				assertList: result
				copiedFrom: list
				hasNode: element attributeNodes second.
			self
				assertList: result
				hasSortOrder: XPathLevelDocumentSortOrder.
			self assert: (result @ ('two' ?? 1)) isEmpty].
]

{ #category : #tests }
XPathNodeSetTest >> testChildAxis [
	| list result |

	list := self listClass with: self singleListItem parent.
	result := list / '*'.
	self
		assertList: result
		copiedFrom: list
		hasNodes: self listElements.
	self
		assertList: result
		hasSortOrder: XPathLevelDocumentSortOrder.
	self assert: (result / '*') isEmpty.

	result := list / 'three'.
	self
		assertList: result
		copiedFrom: list
		hasNode: self listElements third.
	self
		assertList: result
		hasSortOrder: XPathLevelDocumentSortOrder.
	self assert: (result / 'three') isEmpty.
]

{ #category : #tests }
XPathNodeSetTest >> testChildAxisPredicates [
	| list result |

	list := self listClass with: self singleListItem parent.
	result := list / ('*' ?? 3).
	self
		assertList: result
		copiedFrom: list
		hasNode: self listElements third.
	self
		assertList: result
		hasSortOrder: XPathLevelDocumentSortOrder.
	self assert: (result / ('*' ?? 3)) isEmpty.

	result := list / ('three' ?? 1).
	self
		assertList: result
		copiedFrom: list
		hasNode: self listElements third.
	self
		assertList: result
		hasSortOrder: XPathLevelDocumentSortOrder.
	self assert: (result / ('three' ?? 1)) isEmpty.
]

{ #category : #tests }
XPathNodeSetTest >> testCopy [
	| list |

	super testCopy.

	list := self listWithSortOrder.
	self assertList: list copy hasSameSortOrderAs: list.
]

{ #category : #tests }
XPathNodeSetTest >> testCopyAfter [
	| list |

	super testCopyAfter.

	list := self listWithSortOrder.
	self
		assertList: (list copyAfter: list first)
		hasSameSortOrderAs: list.
]

{ #category : #tests }
XPathNodeSetTest >> testCopyAfterLast [
	| list |

	super testCopyAfterLast.

	list := self listWithSortOrder.
	self
		assertList: (list copyAfterLast: list first)
		hasSameSortOrderAs: list.
]

{ #category : #tests }
XPathNodeSetTest >> testCopyEmpty [
	| list |

	super testCopyEmpty.

	list := self listWithSortOrder.
	self
		assertList: list copyEmpty
		hasSameSortOrderAs: self emptyList.
]

{ #category : #tests }
XPathNodeSetTest >> testCopyFromTo [
	| list |

	super testCopyFromTo.

	list := self listWithSortOrder.
	self
		assertList: (list copyFrom: 1 to: list size)
		hasSameSortOrderAs: list.
]

{ #category : #tests }
XPathNodeSetTest >> testCopyReplaceAllWith [
	| list |

	super testCopyReplaceAllWith.

	list := self listWithSortOrder.
	self assertListHasUnknownSortOrder:
		(list
			copyReplaceAll: self listItems
			with: self listItems).
]

{ #category : #tests }
XPathNodeSetTest >> testCopyReplaceFromToWith [
	| list |

	super testCopyReplaceFromToWith.

	list := self listWithSortOrder.
	self assertListHasUnknownSortOrder:
		(list
			copyReplaceFrom: 1
			to: list size
			with: self listItems).
]

{ #category : #tests }
XPathNodeSetTest >> testCopyUpTo [
	| list |

	super testCopyUpTo.

	list := self listWithSortOrder.
	self
		assertList: (list copyUpTo: list last)
		hasSameSortOrderAs: list.
]

{ #category : #tests }
XPathNodeSetTest >> testCopyUpToLast [
	| list |

	super testCopyUpToLast.

	list := self listWithSortOrder.
	self
		assertList: (list copyUpToLast: list last)
		hasSameSortOrderAs: list.
]

{ #category : #tests }
XPathNodeSetTest >> testCopyWith [
	| list |

	super testCopyWith.

	list := self listWithSortOrder.
	self assertListHasUnknownSortOrder: (list copyWith: self newListItem).
]

{ #category : #tests }
XPathNodeSetTest >> testCopyWithFirst [
	| list |

	super testCopyWithFirst.

	list := self listWithSortOrder.
	self assertListHasUnknownSortOrder: (list copyWithFirst: self newListItem).
]

{ #category : #tests }
XPathNodeSetTest >> testCopyWithout [
	| list |

	super testCopyWithout.

	list := self listWithSortOrder.
	self
		assertList: (list copyWithout: self singleListItem)
		hasSameSortOrderAs: list.
]

{ #category : #tests }
XPathNodeSetTest >> testCopyWithoutAll [
	| list |

	super testCopyWithoutAll.

	list := self listWithSortOrder.
	self
		assertList: (list copyWithoutAll: (Array with: self singleListItem))
		hasSameSortOrderAs: list.
]

{ #category : #tests }
XPathNodeSetTest >> testDefaultSortOrder [
	self
		assertList: self emptyList hasSortOrder: XPathLevelDocumentSortOrder;
		assertList: self listWithSingleItem hasSortOrder: XPathLevelDocumentSortOrder;
		assertListHasUnknownSortOrder: self listWithItems
]

{ #category : #tests }
XPathNodeSetTest >> testDescendantAxis [
	| root list result |

	root := self singleListItem documentRoot.
	list := self listClass with: root.
	result := list // '*'.
	self
		assertList: result
		copiedFrom: list
		hasNodes: root descendantElements.
	self assert: (result // 'absent') isEmpty.

	result := list // 'three'.
	self
		assertList: result
		copiedFrom: list
		hasNode: root descendantElements fourth.
	self assert: (result // 'absent') isEmpty.
]

{ #category : #tests }
XPathNodeSetTest >> testDescendantAxisPredicates [
	| root list result |

	root := self singleListItem documentRoot.
	list := self listClass with: root.
	result := list // ('*' ?? 3).
	self
		assertList: result
		copiedFrom: list
		hasNode: root descendantElements third.
	self assert: (result // ('*' ?? 3)) isEmpty.

	result := list // ('three' ?? 1).
	self
		assertList: result
		copiedFrom: list
		hasNode: root descendantElements fourth.
	self assert: (result // ('three' ?? 1)) isEmpty.
]

{ #category : #tests }
XPathNodeSetTest >> testDescendantOrSelfAxis [
	| root list result |

	root := self singleListItem documentRoot.
	list := self listClass with: root.
	result := list //~ '*'.
	self
		assertList: result
		copiedFrom: list
		hasNodes: root allElements.
	self assert: (result //~ 'absent') isEmpty.

	result := list //~ 'three'.
	self
		assertList: result
		copiedFrom: list
		hasNode: root allElements fourth.
	self assert: (result //~ 'absent') isEmpty.
]

{ #category : #tests }
XPathNodeSetTest >> testDescendantOrSelfAxisPredicates [
	| root list result |

	root := self singleListItem documentRoot.
	list := self listClass with: root.
	result := list //~ ('*' ?? 4).
	self
		assertList: result
		copiedFrom: list
		hasNode: root allElements fourth.
	self assert: (result //~ ('*' ?? 4)) isEmpty.

	result := list //~ ('three' ?? 1).
	self
		assertList: result
		copiedFrom: list
		hasNode: root allElements fourth.
	self assert: (result //~ ('three' ?? 4)) isEmpty.
]

{ #category : #tests }
XPathNodeSetTest >> testDifference [
	self assert:
		(self listWithItems \ self listWithItems) =
			self emptyList.
	self assert:
		(self listWithItems reversed \ self emptyList) =
			self listWithItems.
	self assert:
		(self listWithItems \ self listWithSingleItem) =
			self listWithItems allButFirst.
	self assert:
		(self listWithItems reversed \
			(self listItems select: [:each | each isElement])) =
				(self listWithItems reject: [:each | each isElement]).
]

{ #category : #tests }
XPathNodeSetTest >> testFilterExpressionPositionPredicate [
	1 to: self listItems size do: [:i | | item list filtered |
		item := self listItems at: i.

		list := self listWithItems.
		filtered := list ?? i.
		self
			assertList: filtered copiedFrom: list equals: (self listClass with: item);
			assertList: filtered hasSortOrder: XPathDocumentSortOrder.

		list := self listWithItems reversed.
		filtered := list ?? i.
		self
			assertList: filtered copiedFrom: list equals: (self listClass with: item);
			assertList: filtered hasSortOrder: XPathDocumentSortOrder]
]

{ #category : #tests }
XPathNodeSetTest >> testFilterExpressionPositionPredicates [
	1 to: self listItems size do: [:i | | item list filtered |
		item := self listItems at: i.

		list := self listWithItems.
		filtered := list ?? (Array with: i with: 1).
		self
			assertList: filtered copiedFrom: list equals: (self listClass with: item);
			assertList: filtered hasSortOrder: XPathDocumentSortOrder.

		list := self listWithItems reversed.
		filtered := list ?? (Array with: i with: 1).
		self
			assertList: filtered copiedFrom: list equals: (self listClass with: item);
			assertList: filtered hasSortOrder: XPathDocumentSortOrder]
]

{ #category : #tests }
XPathNodeSetTest >> testFirstFew [
	| list |

	super testFirstFew.

	list := self listWithSortOrder.
	self
		assertList: (list first: list size)
		hasSameSortOrderAs: list.
]

{ #category : #tests }
XPathNodeSetTest >> testFirstInDocumentOrder [
	self
		assert: self emptyList firstInDocumentOrder = self defaultValue;
		assert: self listWithSingleItem firstInDocumentOrder = self singleListItem;
		assert: self listWithItems firstInDocumentOrder = self listItems first;
		assert: self listWithItems reversed firstInDocumentOrder = self listItems first
]

{ #category : #tests }
XPathNodeSetTest >> testIncludes [
	| list element namespaceNode |

	list := self emptyList.
	self listItems do: [:each |
		self deny: (list includes: each).
		list add: each.
		self assert: (list includes: each)].

	self listItems do: [:each |
		list remove: each.
		self deny: (list includes: each)].

	element := XMLElement new.
	namespaceNode := XPathNamespaceNode withXMLNamespaceOnElement: element.
	self deny: (list includes: namespaceNode).
	list add: namespaceNode.
	self assert: (list includes: namespaceNode).

	"namespace nodes define ="
	self assert:
		(list includes:
			(XPathNamespaceNode withXMLNamespaceOnElement: element)).
]

{ #category : #tests }
XPathNodeSetTest >> testIntersection [
	self assert:
		(self listWithItems reversed & self listWithItems) =
			self listWithItems.
	self assert:
		(self listWithItems & self emptyList) =
			self emptyList.
	self assert:
		(self listWithSingleItem & self listWithItems reversed) =
			self listWithSingleItem.
	self assert:
		(self listWithItems &
			(self listWithItems select: [:each | each isElement])) =
				(self listWithItems select: [:each | each isElement])
]

{ #category : #tests }
XPathNodeSetTest >> testIsXPathNodeSet [
	self
		assert: self emptyList isXPathNodeSet;
		deny: self listSpecies new isXPathNodeSet
]

{ #category : #tests }
XPathNodeSetTest >> testLastFew [
	| list |

	super testLastFew.

	list := self listWithSortOrder.
	self
		assertList: (list last: list size)
		hasSameSortOrderAs: list.
]

{ #category : #tests }
XPathNodeSetTest >> testNamespaceAxis [
	| element listWithElement |

	element := self newElementWithNamespaces.
	listWithElement := self listClass with: element.
	(Array
		with: listWithElement sorted
		with: listWithElement sorted reversed)
		do: [:list | | result |
			result := list namespaceAxis: '*'.
			self
				assertList: result
				copiedFrom: list
				equals: (self listClass withAll: element namespaceNodes).
			self
				assertList: result
				hasSortOrder: XPathLevelDocumentSortOrder.
			self assert: (result namespaceAxis: '*') isEmpty.

			result := list namespaceAxis: 'two'.
			self
				assertList: result
				copiedFrom: list
				"there is an implicit 'xml' namespace node that comes first"
				equals: (self listClass with: element namespaceNodes third).
			self
				assertList: result
				hasSortOrder: XPathLevelDocumentSortOrder.
			self assert: (result namespaceAxis: 'two') isEmpty].
]

{ #category : #tests }
XPathNodeSetTest >> testNamespaceAxisPredicates [
	| element listWithElement |

	element := self newElementWithNamespaces.
	listWithElement := self listClass with: element.
	(Array
		with: listWithElement sorted
		with: listWithElement sorted reversed)
		do: [:list | | result |
			result :=
				list
					namespaceAxis: '*'
					predicates: #(3).
			self
				assertList: result
				copiedFrom: list
				"there is an implicit 'xml' namespace node that comes first"
				equals: (self listClass with: element namespaceNodes third).
			self
				assertList: result
				hasSortOrder: XPathLevelDocumentSortOrder.
			self assert:
				(result
					namespaceAxis: '*'
					predicates: #(1)) isEmpty.

			result :=
				list
					namespaceAxis: 'two'
					predicates: #(1).
			self
				assertList: result
				copiedFrom: list
				"there is an implicit 'xml' namespace node that comes first"
				equals: (self listClass with: element namespaceNodes third).
			self
				assertList: result
				hasSortOrder: XPathLevelDocumentSortOrder.
			self assert:
				(result
					namespaceAxis: 'two'
					predicates: #(1)) isEmpty].
]

{ #category : #tests }
XPathNodeSetTest >> testParentAxis [
	(Array
		with: self listWithSortOrder
		with: self listWithSortOrder reversed)
		do: [:list | | result |
			result := list % '*'.
			self
				assertList: result
				copiedFrom: list
				hasNode: self listItems first parent.
			self
				assertList: result
				hasSortOrder: XPathLevelDocumentSortOrder.
			self assert: (result % 'root') isEmpty.

			result := list % 'root'.
			self
				assertList: result
				copiedFrom: list
				hasNode: self listItems first parent.
			self
				assertList: result
				hasSortOrder: XPathLevelDocumentSortOrder.
			self assert: (result % 'root') isEmpty]
]

{ #category : #tests }
XPathNodeSetTest >> testParentAxisPredicates [
	(Array
		with: self listWithSortOrder
		with: self listWithSortOrder reversed)
		do: [:list | | result |
			result := list % ('*' ?? 1).
			self
				assertList: result
				copiedFrom: list
				hasNode: self listItems first parent.
			self
				assertList: result
				hasSortOrder: XPathLevelDocumentSortOrder.
			self assert: (result % ('root' ?? 1)) isEmpty.

			result := list % ('root' ?? 1).
			self
				assertList: result
				copiedFrom: list
				hasNode: self listItems first parent.
			self
				assertList: result
				hasSortOrder: XPathLevelDocumentSortOrder.
			self assert: (result % ('root' ??1)) isEmpty]
]

{ #category : #tests }
XPathNodeSetTest >> testReject [
	| list |

	super testReject.

	list := self listWithSortOrder.
	self
		assertList: (list reject: [:each | false])
		hasSameSortOrderAs: list.
]

{ #category : #tests }
XPathNodeSetTest >> testRemoveAll [
	| list |

	super testRemoveAll.

	(list := self listWithSortOrder) removeAll.
	self
		assertList: list
		hasSameSortOrderAs: self listWithSortOrder.
]

{ #category : #tests }
XPathNodeSetTest >> testRemoveFirst [
	| list |

	super testRemoveFirst.

	(list := self listWithSortOrder) removeFirst.
	self
		assertList: list
		hasSameSortOrderAs: self listWithSortOrder.
]

{ #category : #tests }
XPathNodeSetTest >> testRemoveFirstFew [
	| list |

	super testRemoveFirstFew.

	(list := self listWithSortOrder) removeFirst: 1.
	self
		assertList: list
		hasSameSortOrderAs: self listWithSortOrder.
]

{ #category : #tests }
XPathNodeSetTest >> testRemoveIfAbsent [
	| list |

	super testRemoveIfAbsent.

	(list := self listWithSortOrder)
		remove: self absentListItem ifAbsent: [nil];
		remove: self singleListItem ifAbsent: [nil].
	self
		assertList: list
		hasSameSortOrderAs: self listWithSortOrder.
]

{ #category : #tests }
XPathNodeSetTest >> testRemoveLast [
	| list |

	super testRemoveLast.

	(list := self listWithSortOrder) removeLast.
	self
		assertList: list
		hasSameSortOrderAs: self listWithSortOrder.
]

{ #category : #tests }
XPathNodeSetTest >> testRemoveLastFew [
	| list |

	super testRemoveLastFew.

	(list := self listWithSortOrder) removeLast: 1.
	self
		assertList: list
		hasSameSortOrderAs: self listWithSortOrder.
]

{ #category : #tests }
XPathNodeSetTest >> testReplaceFromToWith [
	| list |

	super testReplaceFromToWith.

	(list := self listWithSortOrder)
		replaceFrom: 1
		to: list size
		with: self listItems.
	self assertListHasUnknownSortOrder: list.
]

{ #category : #tests }
XPathNodeSetTest >> testReplaceFromToWithStartingAt [
	| list |

	super testReplaceFromToWithStartingAt.

	(list := self listWithSortOrder)
		replaceFrom: 1
		to: list size
		with: self listItems
		startingAt: 1.
	self assertListHasUnknownSortOrder: list.
]

{ #category : #tests }
XPathNodeSetTest >> testReverse [
	| list copy |

	super testReverse.

	list := self listWithItems.
	copy := list reverse.
	self
		assertListHasUnknownSortOrder: copy;
		assertList: copy
		copiedFrom: list
		equals: (self listClass newFrom: self listItems reverse).

	list := self listWithSortOrder.
	copy := list reverse.
	self
		assertList: copy hasSortOrder: XPathLevelReverseDocumentSortOrder;
		assertList: copy
		copiedFrom: list
		equals: (self listClass newFrom: self listItems reverse).

	list := copy.
	copy := list reverse.
	self
		assertList: copy hasSortOrder: XPathLevelDocumentSortOrder;
		assertList: copy
		copiedFrom: list
		equals: self listWithItems.
]

{ #category : #tests }
XPathNodeSetTest >> testReverseInPlace [
	| list |

	list := self emptyList.
	self
		assert: list reverseInPlace == list;
		assert: list isEmpty.

	list := self listWithSingleItem.
	self
		assert: list reverseInPlace == list;
		assert: list = self listWithSingleItem;
		assertList: list hasSortOrder: XPathLevelReverseDocumentSortOrder.

	list := self listWithItems.
	self
		assert: list reverseInPlace == list;
		assert: list = (self listClass newFrom: self listItems reversed);
		assertListHasUnknownSortOrder: list.

	list := self listWithSortOrder.
	self
		assert: list reverseInPlace == list;
		assert: list = (self listClass newFrom: self listItems reversed);
		assertList: list hasSortOrder: XPathLevelReverseDocumentSortOrder;
		assert: list reverseInPlace == list;
		assert: list = (self listClass newFrom: self listItems);
		assertList: list hasSortOrder: XPathLevelDocumentSortOrder.
]

{ #category : #tests }
XPathNodeSetTest >> testReversed [
	| list copy |

	super testReversed.

	list := self listWithItems.
	copy := list reversed.
	self
		assertListHasUnknownSortOrder: copy;
		assertList: copy
		copiedFrom: list
		equals: (self listClass newFrom: self listItems reversed).

	list := self listWithSortOrder.
	copy := list reversed.
	self
		assertList: copy hasSortOrder: XPathLevelReverseDocumentSortOrder;
		assertList: copy
		copiedFrom: list
		equals: (self listClass newFrom: self listItems reversed).

	list := copy.
	copy := list reversed.
	self
		assertList: copy hasSortOrder: XPathLevelDocumentSortOrder;
		assertList: copy
		copiedFrom: list
		equals: self listWithItems.
]

{ #category : #tests }
XPathNodeSetTest >> testSelect [
	| list |

	super testSelect.

	list := self listWithSortOrder.
	self
		assertList: (list select: [:each | true])
		hasSameSortOrderAs: list.
]

{ #category : #tests }
XPathNodeSetTest >> testSelfAxis [
	(Array
		with: self listWithSortOrder
		with: self listWithSortOrder reversed)
		do: [:list | | result |
			result := list ~ '*'.
			self
				assertList: result
				copiedFrom: list
				hasNodes: self listElements.
			self
				assertList: result
				hasSortOrder: XPathLevelDocumentSortOrder.
			self assert: (result ~ 'absent') isEmpty.

			result := list ~ 'three'.
			self
				assertList: result
				copiedFrom: list
				hasNode: self listElements third.
			self
				assertList: result
				hasSortOrder: XPathLevelDocumentSortOrder.
			self assert: (result ~ 'absent') isEmpty]
]

{ #category : #tests }
XPathNodeSetTest >> testSelfAxisPredicates [
	(Array
		with: self listWithSortOrder
		with: self listWithSortOrder reversed)
		do: [:list | | result |
			result := list ~ ('*' ?? 1).
			self
				assertList: result
				copiedFrom: list
				hasNodes: self listElements.
			self
				assertList: result
				hasSortOrder: XPathLevelDocumentSortOrder.
			self assert: (result ~ ('*' ?? 3)) isEmpty.

			result := list ~ ('three' ?? 1).
			self
				assertList: result
				copiedFrom: list
				hasNode: self listElements third.
			self
				assertList: result
				hasSortOrder: XPathLevelDocumentSortOrder.
			self assert: (result ~ ('three' ?? 3)) isEmpty]
]

{ #category : #tests }
XPathNodeSetTest >> testSort [
	super testSort.

	self
		assertList: self listWithItems sort
		hasSortOrder: XPathDocumentSortOrder.
	self
		should: [(self listWithItems copyWith: self newListItem) sort]
		raise: XPathDOMException.
	self
		shouldnt: [self emptyList sort]
		raise: Error.

	self assertListHasUnknownSortOrder:
		(self listWithItems
			sort;
			sort: self sortBlock).
]

{ #category : #tests }
XPathNodeSetTest >> testSorted [
	super testSorted.

	self
		assertList: self listWithItems sorted
		hasSortOrder: XPathDocumentSortOrder.
	self
		should: [(self listWithItems copyWith: self newListItem) sorted]
		raise: XPathDOMException.
	self
		shouldnt: [self emptyList sorted]
		raise: Error.
]

{ #category : #tests }
XPathNodeSetTest >> testStringValue [
	| firstStringValue |

	self assert: self emptyList stringValue = ''.

	firstStringValue := self listWithItems stringValues first.
	self
		assert: self listWithItems stringValue = firstStringValue;
		assert: (self listWithItems last <<< 'node()') stringValue = firstStringValue.
]

{ #category : #tests }
XPathNodeSetTest >> testStringValues [
	self
		assert: self emptyList stringValues isEmpty;
		assert:
			self listWithItems stringValues =
				(self listWithItems collect: [:each | each stringValue])
]

{ #category : #tests }
XPathNodeSetTest >> testStringValuesDo [
	| list stringValues |

	list := self emptyList.
	self
		xmlShould: [:block | list stringValuesDo: block]
		enumerate: #().

	stringValues := self listWithItems collect: [:each | each stringValue].
	list := self listWithItems.
	self
		xmlShould: [:block | list stringValuesDo: block]
		enumerate: stringValues.
	list := self listWithItems reversed.
	self
		xmlShould: [:block | list stringValuesDo: block]
		enumerate: stringValues.
]

{ #category : #tests }
XPathNodeSetTest >> testSwapWith [
	| list |

	super testSwapWith.

	(list := self listWithSortOrder)
		swap: 1
		with: list size.
	self assertListHasUnknownSortOrder: list.
]

{ #category : #tests }
XPathNodeSetTest >> testUnion [
	self assert:
		(self listWithItems | self listWithItems reversed) =
			self listWithItems.
	self assert:
		(self listWithItems | self emptyList) =
			self listWithItems.
	self assert:
		(self listWithSingleItem | self listWithItems reversed) =
			self listWithItems.
	self assert:
		((self listWithItems select: [:each | each isElement]) reversed |
			(self listWithItems reject: [:each | each isElement])) =
				self listWithItems.
]
