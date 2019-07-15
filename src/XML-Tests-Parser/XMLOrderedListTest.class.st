Class {
	#name : #XMLOrderedListTest,
	#superclass : #TestCase,
	#category : #'XML-Tests-Parser-DOM'
}

{ #category : #accessing }
XMLOrderedListTest >> absentListItem [
	^ 'absent'
]

{ #category : #testing }
XMLOrderedListTest >> allowsDuplicates [
	^ true
]

{ #category : #assertions }
XMLOrderedListTest >> assertList: aList collectedFrom: aSecondList equals: aThirdList [
	self
		assert: aList = aThirdList;
		assert: aList class = aSecondList species;
		deny: aList == aSecondList;
		deny: aList collection == aSecondList collection
]

{ #category : #assertions }
XMLOrderedListTest >> assertList: aList copiedFrom: aSecondList equals: aThirdList [
	self
		assert: aList = aThirdList;
		assert: aList class == self listCopyClass;
		assert: aList collection class == aSecondList collection class;
		deny: aList == aSecondList;
		deny: aList collection == aSecondList collection
]

{ #category : #assertions }
XMLOrderedListTest >> assertList: aFirstList equals: aSecondList [
	self
		assert: aFirstList = aFirstList;
		assert: aSecondList = aSecondList;
		assert: aFirstList = aSecondList;
		assert: aSecondList = aFirstList
]

{ #category : #assertions }
XMLOrderedListTest >> assertList: aList isCopyOf: aSecondList [
	self
		assert: aList = aSecondList;
		assert: aList class == self listCopyClass;
		assert: aList collection class == aSecondList collection class;
		assert: aList collection = aSecondList collection;
		deny: aList == aSecondList;
		deny: aList collection == aSecondList collection
]

{ #category : #assertions }
XMLOrderedListTest >> assertList: aList replacedItems: anOldItemCollection withItems: aNewItemCollection from: aStart to: aStop [
	"items before aStart should not have been replaced"
	1 to: aStart - 1 do: [:i |
		self assert: (aList at: i) = (anOldItemCollection at: i)].

	"items within the range should be replaced"
	aStart to: aStop do: [:i |
		self assert: (aList at: i) = (aNewItemCollection at: i)].

	"items after aStop should not have been replaced"
	aStop + 1 to: aList size do: [:i |
		self assert: (aList at: i) = (anOldItemCollection at: i)].
]

{ #category : #accessing }
XMLOrderedListTest >> changedListItem: anObject [
	^ anObject asUppercase
]

{ #category : #accessing }
XMLOrderedListTest >> changedListItems [
	^ self listItems collect: [:each | self changedListItem: each]
]

{ #category : #accessing }
XMLOrderedListTest >> changedSingleListItem [
	^ self changedListItem: self singleListItem
]

{ #category : #accessing }
XMLOrderedListTest >> customCollection [
	^ XMLStubOrderedListCustomCollection new
]

{ #category : #accessing }
XMLOrderedListTest >> customCollectionEmptyList [
	^ self listClass collection: self customCollection
]

{ #category : #accessing }
XMLOrderedListTest >> customCollectionListWithItems [
	^ (self listClass collection: self customCollection)
		addAll: self listItems;
		yourself
]

{ #category : #accessing }
XMLOrderedListTest >> customCollectionListWithSingleItem [
	^ (self listClass collection: self customCollection)
		add: self singleListItem;
		yourself
]

{ #category : #accessing }
XMLOrderedListTest >> defaultValue [
	^ nil
]

{ #category : #assertions }
XMLOrderedListTest >> denyList: aFirstList equals: aSecondList [
	self
		deny: aFirstList = aSecondList;
		deny: aSecondList = aFirstList
]

{ #category : #accessing }
XMLOrderedListTest >> emptyList [
	^ self listClass new
]

{ #category : #testing }
XMLOrderedListTest >> hasCapacity [
	"for portability"
	^ self listClass collectionClass includesSelector: #capacity
]

{ #category : #accessing }
XMLOrderedListTest >> listClass [
	^ XMLOrderedList
]

{ #category : #accessing }
XMLOrderedListTest >> listCopyClass [
	^ self listClass
]

{ #category : #accessing }
XMLOrderedListTest >> listItems [
	^ #('one' 'two' 'three' 'four' 'five'
		'six' 'seven' 'eight' 'nine' 'ten'
		'eleven') copy
]

{ #category : #accessing }
XMLOrderedListTest >> listItemsFirst: anInteger [
	"first: is not portable to GS"
	^ self listItems
		copyFrom: 1
		to: ((anInteger max: 0) min: self listItems size)
]

{ #category : #accessing }
XMLOrderedListTest >> listItemsLast: anInteger [
	"last: is not portable to GS"
	anInteger > 0
		ifFalse: [^ #()].
	^ self listItems
		copyFrom: ((self listItems size - anInteger + 1) max: 1)
		to: self listItems size.
]

{ #category : #accessing }
XMLOrderedListTest >> listSpecies [
	^ XMLOrderedList
]

{ #category : #accessing }
XMLOrderedListTest >> listWithItems [
	^ self listClass new
		addAll: self listItems;
		yourself
]

{ #category : #accessing }
XMLOrderedListTest >> listWithSingleItem [
	^ self listClass new
		add: self singleListItem;
		yourself
]

{ #category : #accessing }
XMLOrderedListTest >> newListItem [
	^ 'new'
]

{ #category : #accessing }
XMLOrderedListTest >> reverseSortBlock [
	^ [:a :b | a > b]
]

{ #category : #accessing }
XMLOrderedListTest >> singleListItem [
	^ self listItems first
]

{ #category : #accessing }
XMLOrderedListTest >> sortBlock [
	^ [:a :b | a <= b]
]

{ #category : #tests }
XMLOrderedListTest >> testAdd [
	| list |

	list := self emptyList.
	self
		deny: list = self listWithItems;
		assert: (self listItems allSatisfy: [:each | (list add: each) == each]);
		assert: (list = self listWithItems).
]

{ #category : #tests }
XMLOrderedListTest >> testAddAfter [
	| list |

	list := self listWithSingleItem.
	self
		assert:
			(self listItems allButFirst reversed
				allSatisfy: [:each | (list add: each after: self singleListItem) = each]);
		assert: list = self listWithItems;
		should: [list add: self newListItem after: self absentListItem] raise: Error.
]

{ #category : #tests }
XMLOrderedListTest >> testAddAfterIndex [
	| list |

	list := self listWithSingleItem.
	self
		assert:
			(self listItems allButFirst reversed
				allSatisfy: [:each | (list add: each afterIndex: 1) = each]);
		assert: list = self listWithItems;
		should: [list add: self newListItem afterIndex: self listItems size + 1] raise: Error;
		should: [list add: self newListItem afterIndex: -1] raise: Error.
]

{ #category : #tests }
XMLOrderedListTest >> testAddAll [
	| list |

	list := self emptyList.
	self
		deny: list = self listWithItems;
		assert: (list addAll: self listItems) = self listItems;
		assert: list = self listWithItems;
		assert: (list addAll: self changedListItems) = self changedListItems;
		assert: list = (self listClass newFrom: (self listItems, self changedListItems)).
]

{ #category : #tests }
XMLOrderedListTest >> testAddAllFirst [
	| list |

	list := self emptyList.
	self
		assert: (list addAllFirst: self listItems) = self listItems;
		assert: list = self listWithItems;
		assert: (list addAllFirst: self changedListItems) = self changedListItems;
		assert: list = (self listClass newFrom: self changedListItems, self listItems).
]

{ #category : #tests }
XMLOrderedListTest >> testAddAllLast [
	| list |

	list := self emptyList.
	self
		assert: (list addAllLast: self listItems) = self listItems;
		assert: list = self listWithItems;
		assert: (list addAllLast: self changedListItems) = self changedListItems;
		assert: list = (self listClass newFrom: self listItems, self changedListItems).
]

{ #category : #tests }
XMLOrderedListTest >> testAddBefore [
	| list last |

	last := self listItems last.
	(list := self emptyList) add: last.
	self
		assert:
			(self listItems allButLast
				allSatisfy: [:each | (list add: each before: last) = each]);
		assert: list = self listWithItems;
		should: [list add: self newListItem before: self absentListItem] raise: Error.
]

{ #category : #tests }
XMLOrderedListTest >> testAddBeforeIndex [
	| list |

	(list := self emptyList) add: self listItems last.
	self listItems allButLast withIndexDo: [:each :i |
		self assert: (list add: each beforeIndex: i) = each].
	self
		assert: list = self listWithItems;
		should: [list add: self newListItem beforeIndex: self listItems size + 2] raise: Error;
		should: [list add: self newListItem beforeIndex: 0] raise: Error.
]

{ #category : #tests }
XMLOrderedListTest >> testAddFirst [
	| list |

	list := self emptyList.
	self
		assert: (self listItems reversed allSatisfy: [:each | (list addFirst: each) = each]);
		assert: list = self listWithItems.

	self assert: (self listItems allSatisfy: [:each | (list addFirst: each) = each]).
	self assert:
		list =
			(self listClass newFrom: 
				(self allowsDuplicates
					ifTrue: [self listItems reversed, self listItems]
					ifFalse: [self listItems reversed])).
]

{ #category : #tests }
XMLOrderedListTest >> testAddLast [
	| list |

	list := self emptyList.
	self
		assert: (self listItems allSatisfy: [:each | (list addLast: each) = each]);
		assert: list = self listWithItems.

	self assert: (self listItems allSatisfy: [:each | (list addLast: each) = each]).
	self assert:
		list =
			(self listClass newFrom: 
				(self allowsDuplicates
					ifTrue: [self listItems, self listItems]
					ifFalse: [self listItems])).
]

{ #category : #tests }
XMLOrderedListTest >> testAfter [
	| list |

	list := self listWithItems.
	1 to: list size - 1 do: [:i |
		self assert:
			(list after: (self listItems at: i)) =
				(self listItems at: i + 1)].
	self
		assert: (list after: self listItems last) = self defaultValue;
		assert: (list after: self absentListItem) = self defaultValue.
]

{ #category : #tests }
XMLOrderedListTest >> testAfterIfAbsent [
	| list |

	list := self listWithItems.
	1 to: list size - 1 do: [:i |
		self assert:
			(list
				after: (self listItems at: i)
				ifAbsent: [self fail]) = (self listItems at: i + 1)].
	self assert:
		(list
			after: self listItems last
			ifAbsent: [self newListItem]) = self newListItem.
	self assert:
		(list
			after: self absentListItem
			ifAbsent: [self newListItem]) = self newListItem.
]

{ #category : #tests }
XMLOrderedListTest >> testAllButFirst [
	| list |

	self assert: self emptyList allButFirst = self emptyList.

	list := self listWithItems.
	self
		assertList: list allButFirst
		copiedFrom: list
		equals: (self listClass newFrom: self listItems allButFirst).
]

{ #category : #tests }
XMLOrderedListTest >> testAllButFirstDo [
	self
		xmlShould: [:block | self emptyList allButFirstDo: block]
		enumerate: #().
	self
		xmlShould: [:block | self listWithItems allButFirstDo: block]
		enumerate: self listItems allButFirst.
]

{ #category : #tests }
XMLOrderedListTest >> testAllButFirstFew [
	| list |

	list := self listWithItems.
	1 to: list size do: [:i |
		self
			assertList: (list allButFirst: i)
			copiedFrom: list
			equals: (self listClass newFrom: (self listItems allButFirst: i)).
		self
			assertList: (list allButFirst: i + list size)
			copiedFrom: list
			equals: self emptyList.
		self
			assertList: (list allButFirst: i * -1)
			copiedFrom: list
			equals: list.
		self assert: (self emptyList allButFirst: i) = self emptyList].
	self
		assertList: (list allButFirst: 0)
		copiedFrom: list
		equals: list.
]

{ #category : #tests }
XMLOrderedListTest >> testAllButLast [
	| list |

	self assert: self emptyList allButLast = self emptyList.

	list := self listWithItems.
	self
		assertList: list allButLast
		copiedFrom: list
		equals: (self listClass newFrom: self listItems allButLast).
]

{ #category : #tests }
XMLOrderedListTest >> testAllButLastDo [
	self
		xmlShould: [:block | self emptyList allButLastDo: block]
		enumerate: #().
	self
		xmlShould: [:block | self listWithItems allButLastDo: block]
		enumerate: self listItems allButLast.
]

{ #category : #tests }
XMLOrderedListTest >> testAllButLastFew [
	| list |

	list := self listWithItems.
	1 to: list size do: [:i |
		self
			assertList: (list allButLast: i)
			copiedFrom: list
			equals: (self listClass newFrom: (self listItems allButLast: i)).
		self
			assertList: (list allButLast: i + list size)
			copiedFrom: list
			equals: self emptyList.
		self
			assertList: (list allButLast: i * -1)
			copiedFrom: list
			equals: list.
		self assert: (self emptyList allButLast: i) = self emptyList].
	self
		assertList: (list allButLast: 0)
		copiedFrom: list
		equals: list.
]

{ #category : #tests }
XMLOrderedListTest >> testAnyOne [
	self
		assert: self emptyList anyOne = self defaultValue;
		assert: self listWithItems anyOne = self listItems first.
]

{ #category : #tests }
XMLOrderedListTest >> testAsArray [
	self
		assert: self emptyList asArray = #();
		assert: self listWithItems asArray = self listItems asArray
]

{ #category : #tests }
XMLOrderedListTest >> testAsOrderedCollection [
	| list |

	list := self listWithItems.
	self
		assert: self emptyList asOrderedCollection = OrderedCollection new;
		assert: list asOrderedCollection = self listItems asOrderedCollection;
		deny: list asOrderedCollection == list collection.
]

{ #category : #tests }
XMLOrderedListTest >> testAt [
	| list |

	list := self listWithItems.
	self
		assert: ((1 to: list size) allSatisfy: [:i | (list at: i) = (self listItems at: i)]);
		assert: (list at: 0) = self defaultValue;
		assert: (list at: list size + 1) = self defaultValue.
]

{ #category : #tests }
XMLOrderedListTest >> testAtIfAbsent [
	| list |

	list := self listWithItems.
	1 to: list size do: [:i |
		self assert:
			(list
				at: i
				ifAbsent: [self fail]) = (self listItems at: i)].
	self
		assert: (list at: 0 ifAbsent: [self newListItem]) = self newListItem;
		assert: (list at: list size + 1 ifAbsent: [self newListItem]) = self newListItem.
]

{ #category : #tests }
XMLOrderedListTest >> testAtLast [
	| list |

	list := self listWithItems.
	1 to: list size do: [:i | self assert: (list atLast: i) = (self listItems atLast: i)].
	self
		assert: (list atLast: 0) = self defaultValue;
		assert: (list atLast: list size + 1) = self defaultValue.
]

{ #category : #tests }
XMLOrderedListTest >> testAtLastIfAbsent [
	| list |

	list := self listWithItems.
	1 to: list size do: [:i |
		self assert: (list atLast: i ifAbsent: [self newListItem]) = (self listItems atLast: i)].
	self
		assert: (list atLast: 0 ifAbsent: [self newListItem]) = self newListItem;
		assert: (list atLast: list size + 1 ifAbsent: [self newListItem]) = self newListItem.
]

{ #category : #tests }
XMLOrderedListTest >> testAtPut [
	| list |

	list := self listWithItems.
	1 to: list size do: [:i | | replacement |
		replacement := list at: i.
		self
			assert: (list at: i put: replacement) == replacement;
			assert: (list at: i) == replacement].
	self assert: list = self listWithItems.

	self assert: (list at: list size + 1 put: self newListItem) = self newListItem.
	self assert:
		list =
			(self listClass newFrom: (self listItems copyWith: self newListItem)).

	list := self listWithItems.
	1 to: list size do: [:i | | replacement |
		replacement := self changedListItems at: i.
		self
			assert: (list at: i put: replacement) == replacement;
			assert: (list at: i) == replacement].
	self assert: list = (self listClass newFrom: self changedListItems).

	list := self listWithItems.
	self listItems do: [:each |
		self assert: (list at: list size + 1 put: each) == each].
	self assert:
		list =
			(self allowsDuplicates
				ifTrue: [self listClass newFrom: self listItems, self listItems]
				ifFalse: [self listWithItems]).
	self
		should: [list at: 0 put: self newListItem]
		raise: Error.
	self
		should: [list at: list size + 2 put: self newListItem]
		raise: Error.
]

{ #category : #tests }
XMLOrderedListTest >> testBefore [
	| list |

	list := self listWithItems.
	2 to: list size do: [:i |
		self assert: (list before: (self listItems at: i)) = (self listItems at: i - 1)].
	self
		assert: (list before: self listItems first) = self defaultValue;
		assert: (list before: self absentListItem) = self defaultValue.
]

{ #category : #tests }
XMLOrderedListTest >> testBeforeIfAbsent [
	| list |

	list := self listWithItems.
	2 to: list size do: [:i |
		self assert:
			(list
				before: (self listItems at: i)
				ifAbsent: [self fail]) = (self listItems at: i - 1)].
	self assert:
		(list
			before: self listItems first
			ifAbsent: [self newListItem]) = self newListItem.
	self assert:
		(list
			before: self absentListItem
			ifAbsent: [self newListItem]) = self newListItem.
]

{ #category : #tests }
XMLOrderedListTest >> testBeginsWith [
	| list |

	self deny: (self emptyList beginsWith: self listItems).
	list := self listWithItems.
	1 to: list size do: [:i |
		self
			assert: (list beginsWith: (self listItems copyFrom: 1 to: i));
			deny: (list beginsWith: ((self listItems copyFrom: 1 to: i) copyWith: self absentListItem));
			deny: (list beginsWith: ((self listItems copyFrom: 1 to: i) copyWithFirst: self absentListItem))].
]

{ #category : #tests }
XMLOrderedListTest >> testCapacity [
	self hasCapacity
		ifTrue: [
			self
				assert: self emptyList capacity >= 0;
				assert: self listWithSingleItem capacity >= 1;
				assert: self listWithItems capacity >= self listItems size]
]

{ #category : #tests }
XMLOrderedListTest >> testCollect [
	| list |

	list := self listWithItems.
	self
		assertList: (list collect: [:each | self changedListItem: each])
		collectedFrom: list
		equals: (self listSpecies newFrom: self changedListItems).
]

{ #category : #tests }
XMLOrderedListTest >> testCollectThenSelect [
	| list |

	list := self listWithItems.
	self
		assertList:
			(list
				collect: [:each | self changedListItem: each]
				thenSelect: [:each | each ~= self changedSingleListItem])
		copiedFrom: list
		equals:
			(self listClass newFrom:
				(self changedListItems copyWithout: self changedSingleListItem)).
]

{ #category : #tests }
XMLOrderedListTest >> testConcatenation [
	| list |

	list := self emptyList.
	self
		assertList: (list, self emptyList) copiedFrom: list equals: self emptyList;
		assertList: (list, self listWithItems) copiedFrom: list equals: self listWithItems.

	list := self listWithItems.
	self assertList: (list, self emptyList) copiedFrom: list equals: self listWithItems.
	self
		assertList: (list, self listWithItems)
		copiedFrom: list
		equals: (self listClass newFrom: (self listItems, self listItems)).
]

{ #category : #tests }
XMLOrderedListTest >> testCopy [
	| list |

	list := self emptyList.
	self assertList: list copy isCopyOf: list.

	list := self listWithSingleItem.
	self assertList: list copy isCopyOf: list.

	list := self listWithItems.
	self assertList: list copy isCopyOf: list.
]

{ #category : #tests }
XMLOrderedListTest >> testCopyAfter [
	| list |

	list := self listWithItems.
	list do: [:each |
		self
			assertList: (list copyAfter: each)
			copiedFrom: list
			equals: (self listClass newFrom: (self listItems copyAfter: each)).
		self assert: (self emptyList copyAfter: each) = self emptyList].
]

{ #category : #tests }
XMLOrderedListTest >> testCopyAfterLast [
	| list |

	list := self listWithItems.
	list do: [:each |
		self
			assertList: (list copyAfterLast: each)
			copiedFrom: list
			equals: (self listClass newFrom: (self listItems copyAfterLast: each)).
		self assert: (self emptyList copyAfterLast: each) = self emptyList].
]

{ #category : #tests }
XMLOrderedListTest >> testCopyEmpty [
	| list |

	list := self emptyList.
	self assertList: list copyEmpty copiedFrom: list equals: self emptyList.

	list := self listWithSingleItem.
	self assertList: list copyEmpty copiedFrom: list equals: self emptyList.

	list := self listWithItems.
	self assertList: list copyEmpty copiedFrom: list equals: self emptyList.
]

{ #category : #tests }
XMLOrderedListTest >> testCopyFromTo [
	| list emptyList |

	list := self listWithItems.
	emptyList  := self emptyList.
	-1 to: list size + 1 do: [:start |
		start to: list size + 1 do: [:stop |
			self
				assertList: (list copyFrom: start to: stop)
				copiedFrom: list
				equals: (self listWithItems copyFrom: (start max: 1) to: (stop min: list size)).
			self
				assertList: (list copyFrom: start to: start - 1)
				copiedFrom: list
				equals: self emptyList.
			self
				assertList: (list copyFrom: start to: start - 2)
				copiedFrom: list
				equals: self emptyList.
			self
				assertList: (emptyList copyFrom: start to: stop)
				copiedFrom: list
				equals: self emptyList]].
]

{ #category : #tests }
XMLOrderedListTest >> testCopyReplaceAllWith [
	| list |

	list := self listClass newFrom: self listItems, self listItems.
	1 to: self listItems size do: [:i | | replacedElements |
		replacedElements := self listItemsLast: i.
		self
			assertList:
				(list
					copyReplaceAll: replacedElements
					with: (replacedElements collect: [:each | self changedListItem: each]))
			copiedFrom: list
			equals: 
				(self listClass newFrom:
					((self listItems, self listItems) 
						copyReplaceAll: replacedElements
						with: (replacedElements collect: [:each | self changedListItem: each]))).
		self
			assertList:
				(list
					copyReplaceAll: (Array with: self absentListItem)
					with: (Array with: self newListItem))
			copiedFrom: list
			equals: list.	
		self
			assertList: (list copyReplaceAll: #() with: (Array with: self newListItem))
			copiedFrom: list
			equals: list.
		self
			assertList: (list copyReplaceAll: (self listItems copyWith: self absentListItem) with: #())
			copiedFrom: list
			equals: list].
]

{ #category : #tests }
XMLOrderedListTest >> testCopyReplaceFromToWith [
	| list emptyList |

	list := self listWithItems.
	emptyList := self emptyList.
	-1 to: list size + 1 do: [:start |
		start to: list size + 1 do: [:stop |
			self
				assertList: (list copyReplaceFrom: start to: stop with: self changedListItems)
				copiedFrom: list
				equals:
					(self listClass newFrom:
						(self listItemsFirst: start - 1),
						(self changedListItems),
						(self listItemsLast: list size - stop)).
			self
				assertList: (emptyList copyReplaceFrom: start to: stop with: self listItems)
				copiedFrom: emptyList
				equals: self listWithItems]].
]

{ #category : #tests }
XMLOrderedListTest >> testCopyUpTo [
	| list |

	list := self listWithItems.
	list do: [:each |
		self
			assertList: (list copyUpTo: each)
			copiedFrom: list
			equals: (self listClass newFrom: (self listItems copyUpTo: each))].
	self
		assertList: (list copyUpTo: self absentListItem)
		copiedFrom: list
		equals: self listWithItems.
]

{ #category : #tests }
XMLOrderedListTest >> testCopyUpToLast [
	| list |

	list := self listClass newFrom: self listItems, self listItems.
	list do: [:each |
		self
			assertList: (list copyUpToLast: each)
			copiedFrom: list
			equals:
				(self listClass newFrom:
					(self allowsDuplicates
						ifTrue: [self listItems, self listItems copyUpToLast: each]
						ifFalse: [self listItems copyUpToLast: each]))].
	self
		assertList: (list copyUpToLast: self absentListItem)
		copiedFrom: list
		equals:
			(self listClass newFrom:
				(self allowsDuplicates
					ifTrue: [self listItems, self listItems]
					ifFalse: [self listItems])).
]

{ #category : #tests }
XMLOrderedListTest >> testCopyWith [
	| list |

	list := self emptyList.
	self
		assertList: (list copyWith: self singleListItem)
		copiedFrom: list
		equals: self listWithSingleItem.

	list := self listWithItems.
	self
		assertList: (list copyWith: self newListItem)
		copiedFrom: list
		equals: (self listClass newFrom: (self listItems copyWith: self newListItem)).
]

{ #category : #tests }
XMLOrderedListTest >> testCopyWithFirst [
	| list |

	list := self emptyList.
	self
		assertList: (list copyWithFirst: self singleListItem)
		copiedFrom: list
		equals: self listWithSingleItem.

	list := self listWithItems.
	self
		assertList: (list copyWithFirst: self newListItem)
		copiedFrom: list
		equals:
			(self listClass newFrom:
				(self listItems copyWithFirst: self newListItem)).
]

{ #category : #tests }
XMLOrderedListTest >> testCopyWithout [
	self listItems do: [:each | | list |
		list := self emptyList.
		self
			assertList: (list copyWithout: each)
			copiedFrom: list
			equals: self emptyList.

		list := self listWithItems.
		self
			assertList: (list copyWithout: self absentListItem)
			copiedFrom: list
			equals: self listWithItems.
		self
			assertList: (list copyWithout: each)
			copiedFrom: list
			equals: (self listClass newFrom: (self listItems copyWithout: each))]
]

{ #category : #tests }
XMLOrderedListTest >> testCopyWithoutAll [
	1 to: self listItems size do: [:i | | itemsToRemove list |
		itemsToRemove := self listItems copyFrom: 1 to: i.
		list := self emptyList.
		self
			assertList: (list copyWithoutAll: itemsToRemove)
			copiedFrom: list
			equals: self emptyList.

		list := self listWithItems.
		self
			assertList: (list copyWithoutAll: (Array with: self absentListItem))
			copiedFrom: list
			equals: self listWithItems.
		self
			assertList: (list copyWithoutAll: itemsToRemove)
			copiedFrom: list
			equals:
				(self listClass newFrom:
					(self listItems copyWithoutAll: itemsToRemove))]
]

{ #category : #tests }
XMLOrderedListTest >> testDefaultValue [
	self assert: self emptyList defaultValue = self defaultValue
]

{ #category : #tests }
XMLOrderedListTest >> testDetect [
	| list |

	list := self listWithItems.
	self listItems do: [:element |
		self assert: (list detect: [:each | each = element]) = element].
	self assert: (list detect: [:each | each = self absentListItem]) = self defaultValue.
]

{ #category : #tests }
XMLOrderedListTest >> testDetectIfNone [
	| list |

	list := self listWithItems.
	self listItems do: [:element |
		self assert:
			(list
				detect: [:each | each = element]
				ifNone: [self newListItem]) = element].
	self assert:
		(list
			detect: [:each | each = self absentListItem]
			ifNone: [self newListItem]) = self newListItem.
]

{ #category : #tests }
XMLOrderedListTest >> testDo [
	self
		xmlShould: [:block | self emptyList do: block] enumerate: #();
		xmlShould: [:block | self listWithItems do: block] enumerate: self listItems
]

{ #category : #tests }
XMLOrderedListTest >> testDoWithIndex [
	| list enumerated |

	list := self listWithItems.
	enumerated := OrderedCollection new.
	list withIndexDo: [:each :i | enumerated addLast: each -> i].
	self assert:
		enumerated =
			(self listItems withIndexCollect: [:each : i | each -> i ])
				asOrderedCollection.
]

{ #category : #tests }
XMLOrderedListTest >> testEighth [
	self
		assert: self emptyList eighth = self defaultValue;
		assert: self listWithItems eighth = (self listItems at: 8).
]

{ #category : #tests }
XMLOrderedListTest >> testEndsWith [
	| list |

	self deny: (self emptyList endsWith: self listItems).
	list := self listWithItems.
	1 to: list size do: [:i |
		self
			assert: (list endsWith: (self listItems copyFrom: i to: list size));
			deny: (list endsWith: ((self listItems copyFrom: i to: list size) copyWith: self absentListItem));
			deny: (list endsWith: ((self listItems copyFrom: i to: list size) copyWithFirst: self absentListItem))].
]

{ #category : #tests }
XMLOrderedListTest >> testEquals [
	self
		assertList: self emptyList equals: self emptyList;
		assertList: self listWithSingleItem equals: self listWithSingleItem;
		assertList: self listWithItems equals: self listWithItems;
		denyList: self emptyList equals: self listWithSingleItem;
		denyList: self emptyList equals: self listWithItems;
		denyList: self listWithSingleItem equals: self listWithItems
]

{ #category : #tests }
XMLOrderedListTest >> testEqualsCustomCollection [
	self
		assertList: self emptyList
		equals: self customCollectionEmptyList.
	self
		assertList: self listWithSingleItem
		equals: self customCollectionListWithSingleItem.
	self
		assertList: self listWithItems
		equals: self customCollectionListWithItems.
	self
		denyList: self emptyList
		equals: self customCollectionListWithSingleItem.
	self
		denyList: self emptyList
		equals: self customCollectionListWithItems.
	self
		denyList: self listWithSingleItem
		equals: self customCollectionEmptyList.
	self
		denyList: self listWithSingleItem
		equals: self customCollectionListWithItems.
	self
		denyList: self listWithItems
		equals: self customCollectionEmptyList.
	self
		denyList: self listWithItems
		equals: self customCollectionListWithSingleItem.
]

{ #category : #tests }
XMLOrderedListTest >> testEqualsSpecies [
	| emptySpeciesList speciesListWithSingleElement speciesListWithElements |

	emptySpeciesList := self listSpecies new.
	speciesListWithSingleElement := self listSpecies with: self singleListItem.
	speciesListWithElements := self listSpecies newFrom: self listItems.
	self
		assertList: self emptyList equals: emptySpeciesList;
		assertList: self listWithSingleItem equals: speciesListWithSingleElement;
		assertList: self listWithItems equals: speciesListWithElements;
		denyList: self emptyList equals: speciesListWithSingleElement;
		denyList: self emptyList equals: speciesListWithElements;
		denyList: self listWithSingleItem equals: emptySpeciesList;
		denyList: self listWithSingleItem equals: speciesListWithElements;
		denyList: self listWithItems equals: emptySpeciesList;
		denyList: self listWithItems equals: speciesListWithSingleElement.
]

{ #category : #tests }
XMLOrderedListTest >> testFifth [
	self
		assert: self emptyList fifth = self defaultValue;
		assert: self listWithItems fifth = (self listItems at: 5).
]

{ #category : #tests }
XMLOrderedListTest >> testFirst [
	self
		assert: self emptyList first = self defaultValue;
		assert: self listWithItems first = (self listItems at: 1).
]

{ #category : #tests }
XMLOrderedListTest >> testFirstFew [
	| list |

	list := self listWithItems.
	1 to: list size do: [:i |
		self
			assertList: (list first: i)
			copiedFrom: list
			equals: (self listClass newFrom: (self listItemsFirst: i)).
		self
			assertList: (list first: list size + i)
			copiedFrom: list
			equals: self listWithItems.
		self
			assertList: (list first: (i * -1))
			copiedFrom: list
			equals: self emptyList].
	self
		assertList: (list first: 0)
		copiedFrom: list
		equals: self emptyList.
]

{ #category : #tests }
XMLOrderedListTest >> testFourth [
	self
		assert: self emptyList fourth = self defaultValue;
		assert: self listWithItems fourth = (self listItems at: 4).
]

{ #category : #tests }
XMLOrderedListTest >> testHash [
	"We can only safely test that equal objects have the same hash; testing
	that different objects have different hashes would be unreliable
	because #hash is non-cryptographic and has collisions."
	self
		assert: self emptyList hash = self emptyList hash;
		assert: self listWithSingleItem hash = self listWithSingleItem hash;
		assert: self listWithItems hash = self listWithItems hash;
		assert:
			(self listWithItems
				removeAll;
				hash) = self emptyList hash.
]

{ #category : #tests }
XMLOrderedListTest >> testHashCustomCollection [
	self assert:
		self emptyList hash = self customCollectionEmptyList hash.
	self assert:
		self listWithSingleItem hash =
			self customCollectionListWithSingleItem hash.
	self assert:
		self listWithItems hash =
			self customCollectionListWithItems hash.
]

{ #category : #tests }
XMLOrderedListTest >> testIdentityIndexOf [
	| list |

	list := self listWithItems.
	1 to: list size do: [:i |
		self
			assert: (list identityIndexOf: (list at: i)) = i;
			assert: (list identityIndexOf: (list at: i) copy) isZero].
]

{ #category : #tests }
XMLOrderedListTest >> testIdentityIndexOfIfAbsent [
	| list |

	list := self listWithItems.
	1 to: list size do: [:i |
		self
			assert: (list identityIndexOf: (list at: i) ifAbsent: [-1]) = i;
			assert: (list identityIndexOf: (list at: i) copy ifAbsent: [-1]) = -1].
]

{ #category : #tests }
XMLOrderedListTest >> testIndexOf [
	| list |

	list := self listWithItems.
	1 to: list size do: [:i |
		self
			assert: (list indexOf: (list at: i)) = i;
			assert: (list indexOf: (self listItems at: i)) = i].
	self assert: (list indexOf: self absentListItem) isZero.
]

{ #category : #tests }
XMLOrderedListTest >> testIndexOfIfAbsent [
	| list |

	list := self listWithItems.
	1 to: list size do: [:i |
		self
			assert: (list indexOf: (list at: i) ifAbsent: [-1]) = i;
			assert: (list indexOf: (self listItems at: i) ifAbsent: [-1]) = i].
	self assert: (list indexOf: self absentListItem ifAbsent: [-1]) = -1.
]

{ #category : #tests }
XMLOrderedListTest >> testIndexOfStartingAt [
	| list |

	list := self listWithItems.
	1 to: list size do: [:i |
		self
			assert: (list indexOf: (list at: i) startingAt: i) = i;
			assert: (list indexOf: (list at: i) startingAt: i + 1) isZero].
]

{ #category : #tests }
XMLOrderedListTest >> testIndexOfStartingAtIfAbsent [
	| list |

	list := self listWithItems.
	1 to: list size do: [:i |
		self
			assert: (list indexOf: (list at: i) startingAt: i ifAbsent: [-1]) = i;
			assert: (list indexOf: (list at: i) startingAt: i + 1 ifAbsent: [-1]) = -1].
]

{ #category : #tests }
XMLOrderedListTest >> testIndexOfSubCollectionStartingAt [
	| list |

	list := self listWithItems.
	1 to: self listItems size do: [:i |
		i to: self listItems size do: [:j |
			self assert:
				(list
					indexOfSubCollection: (self listItems copyFrom: i to: j)
					startingAt: 1) = i.
			self assert:
				(list
					indexOfSubCollection: (self listItems copyFrom: i to: j)
					startingAt: i) = i.
			self assert:
				(list
					indexOfSubCollection: (self listItems copyFrom: i to: j)
					startingAt: i + 1) = 0]].
]

{ #category : #tests }
XMLOrderedListTest >> testIndexOfSubCollectionStartingAtIfAbsent [
	| list |

	list := self listWithItems.
	1 to: self listItems size do: [:i |
		i to: self listItems size do: [:j |
			self assert:
				(list
					indexOfSubCollection: (self listItems copyFrom: i to: j)
					startingAt: 1
					ifAbsent: [-1]) = i.
			self assert:
				(list
					indexOfSubCollection: (self listItems copyFrom: i to: j)
					startingAt: i
					ifAbsent: [-1]) = i.
			self assert:
				(list
					indexOfSubCollection: (self listItems copyFrom: i to: j)
					startingAt: i + 1
					ifAbsent: [-1]) = -1]].
]

{ #category : #tests }
XMLOrderedListTest >> testIsEmpty [
	self
		assert: self emptyList isEmpty;
		deny: self listWithSingleItem isEmpty;
		deny: self listWithItems isEmpty
]

{ #category : #tests }
XMLOrderedListTest >> testLast [
	self
		assert: self emptyList last = self defaultValue;
		assert: self listWithItems last = self listItems last.
]

{ #category : #tests }
XMLOrderedListTest >> testLastFew [
	| list |

	list := self listWithItems.
	1 to: list size do: [:i |
		self
			assertList: (list last: i)
			copiedFrom: list
			equals: (self listClass newFrom: (self listItemsLast: i)).
		self
			assertList: (list last: list size + i)
			copiedFrom: list
			equals: self listWithItems.
		self
			assertList: (list last: (i * -1))
			copiedFrom: list
			equals: self emptyList].
	self
		assertList: (list last: 0)
		copiedFrom: list
		equals: self emptyList.
]

{ #category : #tests }
XMLOrderedListTest >> testLastIndexOf [
	| list |

	list := self listClass newFrom: self listItems, self listItems.
	list do: [:each |
		self assert:
			(list lastIndexOf: each) =
				(self allowsDuplicates
					ifTrue: [self listItems, self listItems lastIndexOf: each]
					ifFalse: [self listItems lastIndexOf: each])].
	self assert: (list lastIndexOf: self newListItem) isZero.
]

{ #category : #tests }
XMLOrderedListTest >> testLastIndexOfIfAbsent [
	| list |

	list := self listClass newFrom: self listItems, self listItems.
	list do: [:each |
		self assert:
			(list lastIndexOf: each ifAbsent: [-1]) =
				(self allowsDuplicates
					ifTrue: [self listItems, self listItems lastIndexOf: each]
					ifFalse: [self listItems lastIndexOf: each])].
	self assert: (list lastIndexOf: self newListItem ifAbsent: [-1])  = -1.
]

{ #category : #tests }
XMLOrderedListTest >> testNew [
	| list |

	list := self listClass new: 20.
	self assert: list = self emptyList.
	self hasCapacity
		ifTrue: [self assert: list capacity >= 20].
]

{ #category : #tests }
XMLOrderedListTest >> testNewFrom [
	self assert: (self listClass newFrom: self listItems) = self listWithItems
]

{ #category : #tests }
XMLOrderedListTest >> testNewWithAll [
	| list |

	list := self listClass new: 10 withAll: self singleListItem.
	self allowsDuplicates
		ifTrue: [self assert: list size = 10]
		ifFalse: [self assert: list size = 1].
	self assert: (list allSatisfy: [:each | each = self singleListItem]).
]

{ #category : #tests }
XMLOrderedListTest >> testNinth [
	self
		assert: self emptyList ninth = self defaultValue;
		assert: self listWithItems ninth = (self listItems at: 9).
]

{ #category : #tests }
XMLOrderedListTest >> testOfSize [
	self assert: (self listClass ofSize: 10) size = 10
]

{ #category : #tests }
XMLOrderedListTest >> testPairsDo [
	"does not require the receiver to have an even number of items"

	0 to: self listItems size do: [:i | | list odd even |
		list := self listClass newFrom: (self listItems allButLast: i).
		odd := OrderedCollection new.
		even := OrderedCollection new.
		list withIndexDo: [:each :oddOrEven |
			oddOrEven odd
				ifTrue: [
					oddOrEven < list size
						ifTrue: [odd addLast: each]]
				ifFalse: [even addLast: each]].
		self
			xmlShould: [:twoArgumentBlock | list pairsDo: twoArgumentBlock]
			enumerate: odd
			and: even]
]

{ #category : #tests }
XMLOrderedListTest >> testReadStream [
	| list stream position |

	list := self listWithItems.
	stream := list readStream.
	position := 0.
	self
		assert: stream isStream;
		assert: stream position = 0.
	self listItems do: [:each |
		self
			deny: stream atEnd;
			assert: stream next = each.
		position := position + 1.
		self assert: stream position = position].
	self assert: stream atEnd.
]

{ #category : #tests }
XMLOrderedListTest >> testReject [
	| list |

	list := self listWithItems.
	self
		assertList: (list reject: [:each | each = self singleListItem])
		copiedFrom: list
		equals:
			(self listClass newFrom:
				(self listWithItems copyWithout: self singleListItem)).
]

{ #category : #tests }
XMLOrderedListTest >> testRejectThenCollect [
	| list |

	list := self listWithItems.
	self
		assertList:
			(list
				reject: [:each | each = self singleListItem]
				thenCollect: [:each | self changedListItem: each])
		collectedFrom: list
		equals:
			(self listSpecies newFrom:
				(self changedListItems copyWithout: self changedSingleListItem)).
]

{ #category : #tests }
XMLOrderedListTest >> testRemoveAll [
	| list |

	list := self listWithItems.
	self
		assert: list removeAll == list;
		assert: list isEmpty;
		assert: list removeAll == list;
		assert: list isEmpty.
]

{ #category : #tests }
XMLOrderedListTest >> testRemoveAt [
	self listItems withIndexDo: [:each :i | | list |
		list := self listWithItems.
		self
			assert: (list removeAt: i) = each;
			assert: (list = (self listClass newFrom: (self listItems copyWithout: each)))].
	self
		should: [self listWithItems removeAt: 0] raise: Error;
		should: [self listWithItems removeAt: self listItems size + 1] raise: Error.
]

{ #category : #tests }
XMLOrderedListTest >> testRemoveFirst [
	| list |

	list := self listWithItems.
	self listItems do: [:each | 
	self
		assert: list removeFirst = each;
		assert: list = (self listClass newFrom: (self listItems copyAfter: each))].
	self should: [list removeFirst] raise: Error.
]

{ #category : #tests }
XMLOrderedListTest >> testRemoveFirstFew [
	1 to: self listItems size do: [:i | | list removedElements |
		list := self listWithItems.
		removedElements := list removeFirst: i.
		self
			assert: removedElements asArray = (self listItemsFirst: i);
			assert: list = (self listClass newFrom: (self listItems allButFirst: i));
			assert: (list removeFirst: 0) isEmpty;
			should: [self emptyList removeFirst: i] raise: Error].
]

{ #category : #tests }
XMLOrderedListTest >> testRemoveIfAbsent [
	| list |

	list := self listWithItems.
	self listItems do: [:each |
		self assert:
			(list
				remove: each
				ifAbsent: [self fail]) = each.
		self deny: (list includes: each).

		self assert:
			(list
				remove: each
				ifAbsent: [self absentListItem]) = self absentListItem].
]

{ #category : #tests }
XMLOrderedListTest >> testRemoveLast [
	| list |

	list := self listWithItems.
	self listItems reverseDo: [:each |
		self
			assert: list removeLast = each;
			assert: list = (self listClass newFrom: (self listItems copyUpTo: each))].
	self should: [list removeLast] raise: Error.
]

{ #category : #tests }
XMLOrderedListTest >> testRemoveLastFew [
	| list removedElements |

	1 to: self listItems size do: [:i |
		list := self listWithItems.
		removedElements := list removeLast: i.
		self
			assert: removedElements asArray = (self listItemsLast: i) asArray;
			assert: list = (self listClass newFrom: (self listItems allButLast: i));
			assert: (list removeLast: 0) isEmpty;
			should: [self emptyList removeLast: i] raise: Error].
]

{ #category : #tests }
XMLOrderedListTest >> testReplaceFromToWith [
	| list |

	1 to: self listItems size do: [:start |
		start to: self listItems size do: [:stop |
			list := self listWithItems.
			self assert:
				(list
					replaceFrom: start
					to: stop
					with: (self changedListItems allButFirst: start - 1)) == list.

			self
				assertList: list
				replacedItems: self listItems
				withItems: self changedListItems
				from: start
				to: stop.

			start > 1
				ifTrue: [
					self
						should: [
							self emptyList
								replaceFrom: start
								to: stop
								with: self listItems]
						raise: Error]
				ifFalse: [
					self assert:
						(self emptyList
							replaceFrom: start
							to: stop
							with: self listItems) =
								(self listClass newFrom: (self listItemsFirst: stop))]]]
]

{ #category : #tests }
XMLOrderedListTest >> testReplaceFromToWithStartingAt [
	1 to: self listItems size do: [:start |
		start to: self listItems size do: [:stop | | list |
			list := self listWithItems.
			self assert:
				(list
					replaceFrom: start
					to: stop
					with: self changedListItems
					startingAt: start) == list.

			self
				assertList: list
				replacedItems: self listItems
				withItems: self changedListItems
				from: start
				to: stop.

			start > 1
				ifTrue: [
					self
						should: [
							self emptyList
								replaceFrom: start
								to: stop
								with: self listItems
								startingAt: start]
						raise: Error]
				ifFalse: [
					self assert:
						(self emptyList
							replaceFrom: start
							to: stop
							with: self listItems
							startingAt: start) =
								(self listClass newFrom: (self listItemsFirst: stop))]]]
]

{ #category : #tests }
XMLOrderedListTest >> testReset [
	| list oldCapacity |

	list := self listWithItems.
	self hasCapacity
		ifTrue: [oldCapacity := list capacity].
	list reset.
	self assert: list isEmpty.
	oldCapacity
		ifNotNil: [self assert: list capacity >= oldCapacity].
]

{ #category : #tests }
XMLOrderedListTest >> testReverse [
	| list |

	list := self listWithItems.
	self
		assertList: list reverse
		copiedFrom: list
		equals: (self listClass newFrom: self listItems reverse).
]

{ #category : #tests }
XMLOrderedListTest >> testReverseDo [
	self
		xmlShould: [:block | self emptyList reverseDo: block] enumerate: #();
		xmlShould: [:block | self listWithItems reverseDo: block] enumerate: self listItems reversed.
]

{ #category : #tests }
XMLOrderedListTest >> testReversed [
	| list |

	list := self listWithItems.
	self
		assertList: list reversed
		copiedFrom: list
		equals: (self listClass newFrom: self listItems reversed).
]

{ #category : #tests }
XMLOrderedListTest >> testSecond [
	self
		assert: self emptyList second = self defaultValue;
		assert: self listWithItems second = (self listItems at: 2).
]

{ #category : #tests }
XMLOrderedListTest >> testSelect [
	| list |

	list := self listWithItems.
	self
		assertList: (list select: [:each | each ~= self singleListItem])
		copiedFrom: list
		equals:
			(self listClass newFrom:
				(self listWithItems copyWithout: self singleListItem)).
]

{ #category : #tests }
XMLOrderedListTest >> testSelectThenCollect [
	| list |

	list := self listWithItems.
	self
		assertList:
			(list
				select: [:each | each ~= self singleListItem]
				thenCollect: [:each | self changedListItem: each])
		collectedFrom: list
		equals:
			(self listSpecies newFrom:
				(self changedListItems copyWithout: self changedSingleListItem)).
]

{ #category : #tests }
XMLOrderedListTest >> testSeventh [
	self
		assert: self emptyList seventh = self defaultValue;
		assert: self listWithItems seventh = (self listItems at: 7).
]

{ #category : #tests }
XMLOrderedListTest >> testSixth [
	self
		assert: self emptyList sixth = self defaultValue;
		assert: self listWithItems sixth = (self listItems at: 6).
]

{ #category : #tests }
XMLOrderedListTest >> testSize [
	self
		assert: self emptyList size isZero;
		assert: self listWithSingleItem size = 1;
		assert: self listWithItems size = self listItems size
]

{ #category : #tests }
XMLOrderedListTest >> testSort [
	| list |

	list := self listWithItems.
	self
		assert: list sort == list;
		assert: list = (self listClass newFrom: (self listItems copy sort: self sortBlock));
		assert: (list sort: self reverseSortBlock) == list;
		assert: list = (self listClass newFrom: (self listItems copy sort: self reverseSortBlock)).
]

{ #category : #tests }
XMLOrderedListTest >> testSorted [
	| list |

	list := self listWithItems.
	self
		assertList: list sorted
		copiedFrom: list
		equals: (self listClass newFrom: (self listItems copy sorted: self sortBlock)).
	self
		assertList: (list sorted: self reverseSortBlock)
		copiedFrom: list
		equals: (self listClass newFrom: (self listItems copy sorted: self reverseSortBlock)).
]

{ #category : #tests }
XMLOrderedListTest >> testSpecies [
	self
		assert: self emptyList species = self listSpecies
]

{ #category : #tests }
XMLOrderedListTest >> testSwapWith [
	| list start end |

	list := self listWithItems.

	start := 1.
	end := list size.
	[start < end]
		whileTrue: [
			list swap: start with: end.
			start := start + 1.
			end := end - 1].
	self assert: list = (self listClass newFrom: self listItems reversed).

	start := 1.
	end := list size.
	[start < end]
		whileTrue: [
			list swap: end with: start.
			start := start + 1.
			end := end - 1].
	self assert: list = self listWithItems.

	1 to: list size do: [:i | list swap: i with: i].
	self assert: list = self listWithItems.

	self
		should: [list swap: 0 with: 1]
		raise: Error.
	self
		should: [list swap: 1 with: 0]
		raise: Error.
	self
		should: [list swap: list size + 1 with: list size]
		raise: Error.
	self
		should: [list swap: list size with: list size + 1]
		raise: Error.
	self assert: list = self listWithItems.
]

{ #category : #tests }
XMLOrderedListTest >> testThird [
	self
		assert: self emptyList third = self defaultValue;
		assert: self listWithItems third = (self listItems at: 3).
]

{ #category : #tests }
XMLOrderedListTest >> testWithCollect [
	| list |

	list := self listWithItems.
	self
		assertList: (list with: (1 to: list size + 1) collect: [:each :i | each -> i])
		collectedFrom: list
		equals:
			(self listSpecies newFrom:
				(self listItems withIndexCollect: [:each :i | each -> i])).
	self
		assertList: (list with: (1 to: list size - 1) collect: [:each :i | each -> i])
		collectedFrom: list
		equals:
			(self listSpecies newFrom:
				(self listItems allButLast
					withIndexCollect: [:each :i | each -> i])).
]

{ #category : #tests }
XMLOrderedListTest >> testWithDo [
	| list enumerated |

	list := self listWithItems.
	enumerated := OrderedCollection new.
	list with: (1 to: list size + 1) do: [:each :i | enumerated addLast: each -> i].
	self assert:
		enumerated =
			(self listItems withIndexCollect: [:each : i | each -> i ])
				asOrderedCollection.

	enumerated removeAll.
	list with: (1 to: list size - 1) do: [:each :i | enumerated addLast: each -> i].
	self assert:
		enumerated =
			(self listItems allButLast
				withIndexCollect: [:each : i | each -> i ])
					asOrderedCollection.
]

{ #category : #tests }
XMLOrderedListTest >> testWithIndexCollect [
	| list |

	list := self listWithItems.
	self
		assertList: (list withIndexCollect: [:each :i | each -> i])
		collectedFrom: list
		equals:
			(self listSpecies newFrom:
				(self listItems withIndexCollect: [:each :i | each -> i])).
]

{ #category : #tests }
XMLOrderedListTest >> testWithIndexDo [
	| enumerated |

	enumerated := OrderedCollection new.
	self listWithItems withIndexDo: [:each :i | enumerated addLast: each -> i].
	self assert:
		enumerated =
			(self listItems withIndexCollect: [:each : i | each -> i ]) asOrderedCollection.
]

{ #category : #tests }
XMLOrderedListTest >> testWriteStream [
	self
		should: [self emptyList writeStream]
		raise: Error
]

{ #category : #tests }
XMLOrderedListTest >> testXMLLastOrNil [
	self
		assert: self emptyList xmlLastOrNil = self defaultValue;
		assert: self listWithSingleItem xmlLastOrNil = self singleListItem;
		assert: self listWithItems xmlLastOrNil = self listItems last
]
