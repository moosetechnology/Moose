Class {
	#name : #XMLNodeListTest,
	#superclass : #XMLObservableListTest,
	#instVars : [
		'document',
		'nodes',
		'newNode',
		'absentNode',
		'changedNodes'
	],
	#category : #'XML-Tests-Parser-DOM'
}

{ #category : #accessing }
XMLNodeListTest >> absentListItem [
	^ absentNode ifNil: [absentNode := super absentListItem asXMLStringNode]
]

{ #category : #accessing }
XMLNodeListTest >> afterAddingToNotifications [
	^ #(addedNode:)
]

{ #category : #accessing }
XMLNodeListTest >> afterRemovingFromNotifications [
	^ #(removedNode:)
]

{ #category : #accessing }
XMLNodeListTest >> changedListItem: anObject [
	^ (changedNodes ifNil: [changedNodes := IdentityDictionary new])
		at: anObject
		ifAbsentPut: [anObject copy]
]

{ #category : #accessing }
XMLNodeListTest >> listClass [
	^ XMLNodeList
]

{ #category : #accessing }
XMLNodeListTest >> listContentNodes [
	^ self listItems select: [:each | each isContentNode]
]

{ #category : #accessing }
XMLNodeListTest >> listElementNames [
	^ self listElements collect: [:each | each name]
]

{ #category : #accessing }
XMLNodeListTest >> listElements [
	^ self listItems select: [:each | each isElement]
]

{ #category : #accessing }
XMLNodeListTest >> listItems [
	nodes
		ifNil: [
			document := XMLDocument new.
			(document addElementNamed: 'root')
				addElementNamed: 'one';
				addString: 'two';
				addElementNamed: 'prefix:three' namespaceURI: 'prefixNS';
				addNode: (XMLComment string: 'four');
				addElementNamed: 'three';
				addString: 'five';
				addElementNamed: 'six';
				addNode: (XMLPI target: 'seven' data: 'seven');
				addElementNamed: 'eight';
				addString: 'nine'.
			nodes := document root nodes asArray].
	"return a copy of the array, but share the nodes"
	^ nodes copy.
]

{ #category : #accessing }
XMLNodeListTest >> listStringNodes [
	^ self listItems select: [:each | each isStringNode]
]

{ #category : #accessing }
XMLNodeListTest >> listStrings [
	^ self listStringNodes collect: [:each | each string]
]

{ #category : #accessing }
XMLNodeListTest >> newListItem [
	^ newNode ifNil: [newNode := super newListItem asXMLStringNode]
]

{ #category : #accessing }
XMLNodeListTest >> observerClass [
	^ XMLRecordingNodeListObserver
]

{ #category : #accessing }
XMLNodeListTest >> reverseSortBlock [
	^ [:a :b | a sortKey > b sortKey]
]

{ #category : #accessing }
XMLNodeListTest >> sortBlock [
	^ [:a :b | a sortKey <= b sortKey]
]

{ #category : #tests }
XMLNodeListTest >> testContentNodes [
	| list |

	list := self listWithItems.
	self
		assertList: list contentNodes
		copiedFrom: list
		equals: (self listClass newFrom: self listContentNodes).
]

{ #category : #tests }
XMLNodeListTest >> testContentNodesDo [
	| list |

	list := self emptyList.
	self
		xmlShould: [:block | list contentNodesDo: block ]
		enumerate: #().

	list addAll: self listItems.
	self
		xmlShould: [:block | list contentNodesDo: block ]
		enumerate: self listContentNodes.
]

{ #category : #tests }
XMLNodeListTest >> testContentStringAt [
	| list |

	list := self listWithItems.
	self listElements do: [:each |
		self assert:
			(list contentStringAt: each name) = each contentString].
]

{ #category : #tests }
XMLNodeListTest >> testElementAfter [
	| list elementAfter |

	list := self listWithItems.
	elementAfter := nil.
	self listElements reverseDo: [:each |
		self assert: (list elementAfter: each) = elementAfter.
		elementAfter := each].
]

{ #category : #tests }
XMLNodeListTest >> testElementAt [
	| list |

	list := self listWithItems.
	self listElements do: [:each | | changedElement |
		self assert: (list elementAt: each name) = each.

		changedElement := self changedListItem: each.
		list addFirst: changedElement.
		self assert: (list elementAt: each name) = changedElement.

		list
			remove: each;
			remove: changedElement.
		self assert: (list elementAt: each name) = self defaultValue].
]

{ #category : #tests }
XMLNodeListTest >> testElementAtIfAbsent [
	| list |

	list := self listWithItems.
	self listElements do: [:each | | changedElement |
		self assert:
			(list
				elementAt: each name
				ifAbsent: [self fail]) = each.

		changedElement := self changedListItem: each.
		list addFirst: changedElement.
		self assert:
			(list
				elementAt: each name
				ifAbsent: [self fail]) = changedElement.

		list
			remove: each;
			remove: changedElement.
		self assert:
			(list
				elementAt: each name
				ifAbsent: [self newListItem]) = self newListItem].
]

{ #category : #tests }
XMLNodeListTest >> testElementBefore [
	| list elementBefore |

	list := self listWithItems.
	elementBefore := nil.
	self listElements do: [:each |
		self assert: (list elementBefore: each) = elementBefore.
		elementBefore := each].
]

{ #category : #tests }
XMLNodeListTest >> testElementNames [
	| list |

	list := self listWithItems.
	self
		assertList: list elementNames
		collectedFrom: list
		equals: (self listSpecies newFrom: self listElementNames).
]

{ #category : #tests }
XMLNodeListTest >> testElements [
	| list |

	list := self listWithItems.
	self
		assertList: list elements
		copiedFrom: list
		equals: (self listClass newFrom: self listElements).
]

{ #category : #tests }
XMLNodeListTest >> testElementsAt [
	self listElements do: [:element | | list elementsAt changedElement |
		list := self listWithItems.
		elementsAt :=
			self listElements select: [:each |
				each isNamed: element name].
		self assert:
			(list elementsAt: element name) =
				(self listClass newFrom: elementsAt).

		changedElement := self changedListItem: element.
		list addFirst: changedElement.
		elementsAt := elementsAt copyWithFirst: changedElement.
		self assert:
			(list elementsAt: element name) =
				(self listClass newFrom: elementsAt).

		list remove: element.
		elementsAt := elementsAt copyWithout: element.
		self assert:
			(list elementsAt: element name) =
				(self listClass newFrom: elementsAt)].
]

{ #category : #tests }
XMLNodeListTest >> testElementsCollect [
	| list |

	list := self listWithItems.
	self
		assertList: (list elementsCollect: [:each | each name])
		collectedFrom: list
		equals: (self listSpecies newFrom: self listElementNames).
]

{ #category : #tests }
XMLNodeListTest >> testElementsDo [
	| list |

	list := self emptyList.
	self
		xmlShould: [:block | list elementsDo: block ]
		enumerate: #().

	list addAll: self listItems.
	self
		xmlShould: [:block | list elementsDo: block ]
		enumerate: self listElements.
]

{ #category : #tests }
XMLNodeListTest >> testElementsSelect [
	| list selectedElements |

	list := self listWithItems.
	selectedElements :=
		self listElements
			copyFrom: 1
			to: (self listElements size / 2) floor.
	self
		assertList: (list elementsSelect: [:each | selectedElements includes: each])
		copiedFrom: list
		equals: (self listClass newFrom: selectedElements).
]

{ #category : #tests }
XMLNodeListTest >> testFirstElement [
	| list |

	list := self listWithItems.
	self listElements do: [:each |
		self assert: list firstElement = each.
		list remove: each].
	self assert: list firstElement = self defaultValue.
]

{ #category : #tests }
XMLNodeListTest >> testHasContentNodes [
	| list |

	list := self emptyList.
	self deny: list hasContentNodes.

	list addAll: self listItems.
	self assert: list hasContentNodes.

	list removeAll: self listContentNodes.
	self deny: list hasContentNodes.
]

{ #category : #tests }
XMLNodeListTest >> testHasElements [
	| list |

	list := self emptyList.
	self deny: list hasElements.

	list addAll: self listItems.
	self assert: list hasElements.

	list removeAll: self listElements.
	self deny: list hasElements.
]

{ #category : #tests }
XMLNodeListTest >> testHasStringNodes [
	| list |

	list := self emptyList.
	self deny: list hasStringNodes.

	list addAll: self listItems.
	self assert: list hasStringNodes.

	list removeAll: self listStringNodes.
	self deny: list hasStringNodes.
]

{ #category : #tests }
XMLNodeListTest >> testLastElement [
	| list |

	list := self listWithItems.
	self listElements reverseDo: [:each |
		self assert: list lastElement = each.
		list remove: each].
	self assert: list lastElement = self defaultValue.
]

{ #category : #tests }
XMLNodeListTest >> testRawContentStringAt [
	| list |

	list := self listWithItems.
	self listElements do: [:each |
		self assert:
			(list rawContentStringAt: each name) = each rawContentString].
]

{ #category : #tests }
XMLNodeListTest >> testStringNodes [
	| list |

	list := self listWithItems.
	self
		assertList: list stringNodes
		copiedFrom: list
		equals: (self listClass newFrom: self listStringNodes).
]

{ #category : #tests }
XMLNodeListTest >> testStringNodesDo [
	| list |

	list := self emptyList.
	self
		xmlShould: [:block | list stringNodesDo: block ]
		enumerate: #().

	list addAll: self listItems.
	self
		xmlShould: [:block | list stringNodesDo: block ]
		enumerate: self listStringNodes.
]

{ #category : #tests }
XMLNodeListTest >> testStrings [
	| list |

	list := self listWithItems.
	self
		assertList: list strings
		collectedFrom: list
		equals: (self listSpecies newFrom: self listStrings).
]

{ #category : #tests }
XMLNodeListTest >> testStringsDo [
	| list |

	list := self emptyList.
	self
		xmlShould: [:block | list stringsDo: block ]
		enumerate: #().

	list addAll: self listItems.
	self
		xmlShould: [:block | list stringsDo: block ]
		enumerate: self listStrings.
]
