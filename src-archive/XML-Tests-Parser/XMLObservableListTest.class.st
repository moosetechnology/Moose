Class {
	#name : #XMLObservableListTest,
	#superclass : #XMLOrderedListTest,
	#category : #'XML-Tests-Parser-DOM'
}

{ #category : #testing }
XMLObservableListTest class >> shouldInheritSelectors [
	^ true
]

{ #category : #accessing }
XMLObservableListTest >> afterAddingToNotifications [
	^ #(added:to:)
]

{ #category : #accessing }
XMLObservableListTest >> afterRemovingFromNotifications [
	^ #(removed:from:)
]

{ #category : #assertions }
XMLObservableListTest >> assertList: aFirstList copiedFrom: aSecondList equals: aThirdList [
	super
		assertList: aFirstList
		copiedFrom: aSecondList
		equals: aThirdList.
	self
		denyList: aFirstList
		sharesObserverWith: aSecondList.
]

{ #category : #assertions }
XMLObservableListTest >> assertList: aFirstList isCopyOf: aSecondList [
	super
		assertList: aFirstList
		isCopyOf: aSecondList.
	self
		denyList: aFirstList
		sharesObserverWith: aSecondList.
]

{ #category : #assertions }
XMLObservableListTest >> assertList: aList receivedNotificationOfAdding: anObject [
	self
		assertList: aList
		receivedNotificationOfAfterAdding: anObject
]

{ #category : #assertions }
XMLObservableListTest >> assertList: aList receivedNotificationOfAfterAdding: anObject [
	self
		assertNotification: aList observer nextNotification
		for: anObject
		withList: aList
		hasType: self afterAddingToNotifications
]

{ #category : #assertions }
XMLObservableListTest >> assertList: aList receivedNotificationOfRemoving: anObject [
	self
		assertNotification: aList observer nextNotification
		for: anObject
		withList: aList
		hasType: self afterRemovingFromNotifications
]

{ #category : #assertions }
XMLObservableListTest >> assertList: aList receivedNotificationOfReplacing: anOldObject with: aNewObject [
	self
		assertList: aList
		receivedNotificationOfRemoving: anOldObject.
	self
		assertList: aList
		receivedNotificationOfAfterAdding: aNewObject.
]

{ #category : #assertions }
XMLObservableListTest >> assertNotification: aNotification for: anObject withList: aList hasType: aSelectorCollection [
	self
		assert: aNotification notNil;
		assert: (aSelectorCollection includes: aNotification selector).
	self assert:
		aNotification arguments =
			((Array with: anObject with: aList)
				copyFrom: 1
				to: (aNotification selector asString occurrencesOf: $:)).
]

{ #category : #assertions }
XMLObservableListTest >> denyList: aFirstList sharesObserverWith: aSecondList [
	self deny:
		(aFirstList observer notNil
			and: [aFirstList observer == aSecondList observer])
]

{ #category : #accessing }
XMLObservableListTest >> emptyList [
	| list |

	list := super emptyList.
	self observerOnList: list.
	^ list.
]

{ #category : #accessing }
XMLObservableListTest >> listClass [
	^ XMLObservableList
]

{ #category : #accessing }
XMLObservableListTest >> listWithItems [
	| list |

	list := super listWithItems.
	self observerOnList: list.
	^ list.
]

{ #category : #accessing }
XMLObservableListTest >> listWithSingleItem [
	| list |

	list := super listWithSingleItem.
	self observerOnList: list.
	^ list.
]

{ #category : #accessing }
XMLObservableListTest >> observerClass [
	^ XMLRecordingListObserver
]

{ #category : #accessing }
XMLObservableListTest >> observerOnList: aList [
	| observer |

	observer := self observerClass new.
	aList observer: observer.
	^ observer.
]

{ #category : #assertions }
XMLObservableListTest >> should: aBlock add: anObject toAndNotify: aList [
	self
		should: aBlock
		addAll: (Array with: anObject)
		toAndNotify: aList
]

{ #category : #assertions }
XMLObservableListTest >> should: aBlock addAll: aCollection toAndNotify: aList [
	aList observer clearNotifications.
	aBlock value.
	aCollection do: [:each |
		self assert: (aList includes: each).
		self 
			assertList: aList
			receivedNotificationOfAdding: each].
]

{ #category : #assertions }
XMLObservableListTest >> should: aBlock remove: anObject fromAndNotify: aList [
	self
		should: aBlock
		removeAll: (Array with: anObject)
		fromAndNotify: aList
]

{ #category : #assertions }
XMLObservableListTest >> should: aBlock removeAll: aCollection fromAndNotify: aList [
	aList observer clearNotifications.
	aBlock value.
	aCollection do: [:each |
		self deny: (aList includes: each).
		self
			assertList: aList
			receivedNotificationOfRemoving: each].
]

{ #category : #tests }
XMLObservableListTest >> testAdd [
	| list |

	super testAdd.

	list := self emptyList.
	self listItems do: [:each |
		self
			should: [list add: each]
			add: each
			toAndNotify: list].
]

{ #category : #tests }
XMLObservableListTest >> testAddAfter [
	| list |

	super testAddAfter.

	list := self listWithSingleItem.
	self listItems allButFirst reverseDo: [:each |
		self
			should: [list add: each after: self singleListItem]
			add: each
			toAndNotify: list].
]

{ #category : #tests }
XMLObservableListTest >> testAddAfterIndex [
	| list |

	super testAddAfterIndex.

	list := self listWithSingleItem.
	self listItems allButFirst reverseDo: [:each |
		self
			should: [list add: each afterIndex: 1]
			add: each
			toAndNotify: list].
]

{ #category : #tests }
XMLObservableListTest >> testAddAll [
	| list |

	super testAddAll.

	list := self emptyList.
	self
		should: [list addAll: self listItems]
		addAll: self listItems
		toAndNotify: list.
	self
		should: [list addAll: self changedListItems]
		addAll: self changedListItems
		toAndNotify: list.
]

{ #category : #tests }
XMLObservableListTest >> testAddAllFirst [
	| list |

	super testAddAllFirst.

	list := self emptyList.
	self
		should: [list addAllFirst: self listItems]
		addAll: self listItems reversed
		toAndNotify: list.
	self
		should: [list addAllFirst: self changedListItems]
		addAll: self changedListItems reversed
		toAndNotify: list.
]

{ #category : #tests }
XMLObservableListTest >> testAddAllLast [
	| list |

	super testAddAllLast.

	list := self emptyList.
	self
		should: [list addAllLast: self listItems]
		addAll: self listItems
		toAndNotify: list.
	self
		should: [list addAllLast: self changedListItems]
		addAll: self changedListItems
		toAndNotify: list.
]

{ #category : #tests }
XMLObservableListTest >> testAddBefore [
	| list last |

	super testAddBefore.

	last := self listItems last.
	(list := self emptyList) add: last.
	"allButLastDo: is not portable"
	self listItems allButLast do: [:each |
		self
			should: [list add: each before: last]
			add: each
			toAndNotify: list].
]

{ #category : #tests }
XMLObservableListTest >> testAddBeforeIndex [
	| list |

	super testAddBeforeIndex.

	(list := self emptyList) add: self listItems last.
	self listItems allButLast withIndexDo: [:each :i |
		self
			should: [list add: each beforeIndex: i]
			add: each
			toAndNotify: list].
]

{ #category : #tests }
XMLObservableListTest >> testAddFirst [
	| list |

	super testAddFirst.

	list := self emptyList.
	self listItems reverseDo: [:each |
		self
			should: [list addFirst: each]
			add: each
			toAndNotify: list].
]

{ #category : #tests }
XMLObservableListTest >> testAddLast [
	| list |

	super testAddLast.

	list := self emptyList.
	self listItems do: [:each |
		self
			should: [list addLast: each]
			add: each
			toAndNotify: list].
]

{ #category : #tests }
XMLObservableListTest >> testAtPut [
	| list |

	super testAtPut.

	list := self listWithItems.
	1 to: list size do: [:i | | old new |
		old := list at: i.
		new := self changedListItems at: i.
		list at: i put: new.
		self
			assertList: list
			receivedNotificationOfReplacing: old
			with: new].
	self
		should: [list at: list size + 2 put: self newListItem]
		raise: Error.
	self deny: list observer hasNotifications.
]

{ #category : #tests }
XMLObservableListTest >> testOfSize [
	self
		should: [self listClass ofSize: 10]
		raise: Error
]

{ #category : #tests }
XMLObservableListTest >> testRemoveAll [
	| list |

	super testRemoveAll.

	list := self listWithItems.
	self
		should: [list removeAll]
		removeAll: self listItems reversed
		fromAndNotify: list.
]

{ #category : #tests }
XMLObservableListTest >> testRemoveAt [
	super testRemoveAt.

	self listItems withIndexDo: [:each :i | | list |
		list := self listWithItems.
		self
			should: [list removeAt: i]
			remove: each
			fromAndNotify: list.
		self
			should: [list removeAt: 0] raise: Error;
			should: [list removeAt: list size + 1] raise: Error;
			deny: list observer hasNotifications].
]

{ #category : #tests }
XMLObservableListTest >> testRemoveFirst [
	| list |

	super testRemoveFirst.

	list := self listWithItems.
	self listItems do: [:each |
		self
			should: [list removeFirst]
			remove: each
			fromAndNotify: list].
	self
		should: [list removeFirst] raise: Error;
		deny: list observer hasNotifications.
]

{ #category : #tests }
XMLObservableListTest >> testRemoveFirstFew [
	| list |

	super testRemoveFirstFew.

	1 to: self listItems size do: [:i |
		list := self listWithItems.
		self
			should: [list removeFirst: i]
			removeAll: (self listItemsFirst: i)
			fromAndNotify: list].
	list := self emptyList.
	self
		should: [list removeFirst: list size + 1] raise: Error;
		deny: list observer hasNotifications.
]

{ #category : #tests }
XMLObservableListTest >> testRemoveIfAbsent [
	| list |

	super testRemoveIfAbsent.

	list := self listWithItems.
	self
		should: [
			list
				remove: self singleListItem
				ifAbsent: [self absentListItem]]
		remove: self singleListItem
		fromAndNotify: list.
	self assert:
		(list
			remove: self singleListItem
			ifAbsent: [self absentListItem]) = self absentListItem.
	self deny: list observer hasNotifications.
]

{ #category : #tests }
XMLObservableListTest >> testRemoveLast [
	| list |

	super testRemoveLast.

	list := self listWithItems.
	self listItems reverseDo: [:each |
		self
			should: [list removeLast]
			remove: each
			fromAndNotify: list].
	self
		should: [list removeFirst] raise: Error;
		deny: list observer hasNotifications.
]

{ #category : #tests }
XMLObservableListTest >> testRemoveLastFew [
	| list |
	
	super testRemoveLastFew.

	1 to: self listItems size do: [:i |
		list := self listWithItems.
		self
			should: [list removeLast: i]
			removeAll: (self listItemsLast: i) reversed
			fromAndNotify: list].
	list := self emptyList.
	self
		should: [list removeFirst: list size + 1] raise: Error;
		deny: list observer hasNotifications.
]

{ #category : #tests }
XMLObservableListTest >> testReplaceFromToWith [
	super testReplaceFromToWith.

	1 to: self listItems size do: [:start |
		start to: self listItems size do: [:stop | | list old new |
			list := self listWithItems.
			old := self listItems copyFrom: start to: stop.
			new := self changedListItems copyFrom: 1 to: stop - start + 1.
			list
				replaceFrom: start
				to: stop
				with: self changedListItems.
			old with: new do: [:oldElement :newElement |
				self
					assertList: list
					receivedNotificationOfReplacing: oldElement
					with: newElement].
			self deny: list observer hasNotifications]].
]

{ #category : #tests }
XMLObservableListTest >> testReplaceFromToWithStartingAt [
	super testReplaceFromToWithStartingAt.

	1 to: self listItems size do: [:start |
		start to: self listItems size do: [:stop | | list old new |
			list := self listWithItems.
			old := self listItems copyFrom: start to: stop.
			new := self changedListItems copyFrom: start to: stop.
			list
				replaceFrom: start
				to: stop
				with: self changedListItems
				startingAt: start.
			old with: new do: [:oldElement :newElement |
				self
					assertList: list
					receivedNotificationOfReplacing: oldElement
					with: newElement].
			self deny: list observer hasNotifications]].
]

{ #category : #tests }
XMLObservableListTest >> testReset [
	| list |

	super testReset.
	list := self listWithItems.
	self
		should: [list reset]
		removeAll: self listItems reversed
		fromAndNotify: list.
]
