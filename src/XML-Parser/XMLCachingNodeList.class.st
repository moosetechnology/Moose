"
This is a node list that caches child elements by name, keeping both an ordered list of elements and a dictionary that allows for faster retrieval of elements by qualified or local name. To use it, inject it into a DOM parser before parsing:
	(parser := XMLDOMParser on: xmlSource)
		nodeFactory:
			(XMLPluggableNodeFactory new
				nodeListClass: XMLCachingNodeList);
		parseDocument.

It should only be used when you know the DOM tree will be queried much more often than parsed or modified and the extra memory use is OK.
"
Class {
	#name : #XMLCachingNodeList,
	#superclass : #XMLNodeList,
	#instVars : [
		'cachedElements',
		'cachedElementsByName'
	],
	#category : #'XML-Parser-DOM'
}

{ #category : #private }
XMLCachingNodeList >> afterAdding: aNode at: anIndex [
	(aNode hasParentWithNodeList: self)
		ifTrue: [
			self
				removeDuplicateOf: aNode
				notAt: anIndex.
			aNode isElement
				ifTrue: [self rebuildCachedElements]]
		ifFalse: [
			aNode isElement
				ifTrue: [
					self
						cacheElement: aNode
						addedAt: anIndex].
			observer
				ifNotNil: [observer addedNode: aNode]]
]

{ #category : #private }
XMLCachingNodeList >> afterAddingLast: aNode [
	(aNode hasParentWithNodeList: self)
		ifTrue: [
			self
				removeDuplicateOf: aNode
				notAt: self size.
			aNode isElement
				ifTrue: [self rebuildCachedElements]]
		ifFalse: [
			aNode isElement
				ifTrue: [self cacheElementAddedLast: aNode].
			observer
				ifNotNil: [observer addedNode: aNode]]
]

{ #category : #private }
XMLCachingNodeList >> afterAddingToCopyLast: aNode [
	aNode isElement
		ifTrue: [self cacheElementAddedLast: aNode].
	observer
		ifNotNil: [observer addedNode: aNode].
]

{ #category : #private }
XMLCachingNodeList >> afterRemoving: aNode [
	aNode isElement
		ifTrue: [self uncacheElement: aNode].
	observer
		ifNotNil: [observer removedNode: aNode].
]

{ #category : #private }
XMLCachingNodeList >> cacheElement: anElement addedAt: anIndex [
	anIndex = self size
		ifTrue: [^ self cacheElementAddedLast: anElement].

	(self findElementAfterIndex: anIndex)
		ifNil: [self cachedElements addLast: anElement]
		ifNotNil: [:elementAfter |
			self cachedElements
				add: anElement
				before: elementAfter].
	self
		cachedElementsByNameAt: anElement name
		add: anElement
		beforeNextAfterIndex: anIndex.
	anElement hasPrefix
		ifTrue: [
			self
				cachedElementsByNameAt: anElement localName
				add: anElement
				beforeNextAfterIndex: anIndex].
]

{ #category : #private }
XMLCachingNodeList >> cacheElementAddedLast: anElement [
	self cachedElements addLast: anElement.
	self
		cachedElementsByNameAt: anElement name
		addLast: anElement.
	anElement hasPrefix
		ifTrue: [
			self
				cachedElementsByNameAt: anElement localName
				addLast: anElement].
]

{ #category : #private }
XMLCachingNodeList >> cachedElements [
	^ cachedElements ifNil: [cachedElements := OrderedCollection new]
]

{ #category : #private }
XMLCachingNodeList >> cachedElementsByName [
	^ cachedElementsByName ifNil: [cachedElementsByName := Dictionary new]
]

{ #category : #private }
XMLCachingNodeList >> cachedElementsByNameAt: aName add: anElement beforeNextAfterIndex: anIndex [
	| elementAfter elementsWithName |

	(elementAfter :=
		self
			findElementAfterIndex: anIndex
			named: aName)
		ifNil: [
			^ self
				cachedElementsByNameAt: aName
				addLast: anElement].

	(elementsWithName := self cachedElementsByName at: aName) isCollection
		ifTrue: [elementsWithName add: anElement before: elementAfter]
		ifFalse: [
			self cachedElementsByName
				at: aName
				put: (OrderedCollection with: anElement with: elementAfter)].
]

{ #category : #private }
XMLCachingNodeList >> cachedElementsByNameAt: aName addLast: anElement [
	| elementsWithName |

	elementsWithName :=
		self cachedElementsByName
			at: aName
			ifAbsent: [
				self cachedElementsByName at: aName put: anElement.
				^ self].

	 elementsWithName isCollection
		ifTrue: [elementsWithName addLast: anElement]
		ifFalse: [
			self cachedElementsByName
				at: aName
				put: (OrderedCollection with: elementsWithName with: anElement)].
]

{ #category : #private }
XMLCachingNodeList >> cachedElementsByNameAt: aName remove: anElement [
	| elementsWithName |

	(elementsWithName := self cachedElementsByName at: aName) isCollection
		ifTrue: [
			elementsWithName remove: anElement.
			elementsWithName isEmpty
				ifTrue: [self cachedElementsByName removeKey: aName]]
		ifFalse: [self cachedElementsByName removeKey: aName]
]

{ #category : #defaults }
XMLCachingNodeList >> copyClass [
	"use the non-caching superclass for copies for performance"
	^ XMLNodeList
]

{ #category : #accessing }
XMLCachingNodeList >> elementAt: aName ifAbsent: aBlock [
	| elementsWithName |

	(elementsWithName :=
		self cachedElementsByName
			at: aName
			ifAbsent: [^ aBlock value]) isCollection
		ifTrue: [^ elementsWithName first]
		ifFalse: [^ elementsWithName]
]

{ #category : #accessing }
XMLCachingNodeList >> elements [
	^ self copyEmpty
		addAll: self cachedElements;
		yourself
]

{ #category : #accessing }
XMLCachingNodeList >> elementsAt: aName [
	| elementsWithName copiedElements |

	copiedElements := self copyEmpty.
	(elementsWithName :=
		self cachedElementsByName
			at: aName
			ifAbsent: [^ copiedElements]) isCollection
		ifTrue: [
			elementsWithName do: [:each |
				copiedElements addToCopyLast: each]]
		ifFalse: [
			copiedElements addToCopyLast: elementsWithName].
	^ copiedElements.
]

{ #category : #enumerating }
XMLCachingNodeList >> elementsAt: aName do: aBlock [
	| elementsWithName |

	(elementsWithName :=
		self cachedElementsByName
			at: aName
			ifAbsent: [^ self]) isCollection
		ifTrue: [elementsWithName do: aBlock]
		ifFalse: [aBlock value: elementsWithName]
]

{ #category : #enumerating }
XMLCachingNodeList >> elementsDo: aBlock [
	self cachedElements do: aBlock
]

{ #category : #private }
XMLCachingNodeList >> findElementAfterIndex: anIndex [
	anIndex + 1 to: self size do: [:i | | node |
		node := self at: i.
		node isElement
			ifTrue: [^ node]].
	^ nil.
]

{ #category : #private }
XMLCachingNodeList >> findElementAfterIndex: anIndex named: aName [
	anIndex + 1 to: self size do: [:i | | node |
		node := self at: i.
		(node isElement
			and: [node isNamed: aName])
			ifTrue: [^ node]].
	^ nil.
]

{ #category : #accessing }
XMLCachingNodeList >> firstElement [
	^ self cachedElements
		at: 1
		ifAbsent: [self defaultValue]
]

{ #category : #testing }
XMLCachingNodeList >> hasElements [
	^ cachedElements notNil and: [cachedElements notEmpty]
]

{ #category : #testing }
XMLCachingNodeList >> includesElement: aName [
	^ self cachedElementsByName includesKey: aName
]

{ #category : #accessing }
XMLCachingNodeList >> lastElement [
	^ self cachedElements
		at: self cachedElements size
		ifAbsent: [self defaultValue]
]

{ #category : #private }
XMLCachingNodeList >> rebuildCachedElements [
	self cachedElements removeAll.
	self cachedElementsByName removeAll.
	self do: [:each |
		each isElement
			ifTrue: [self cacheElementAddedLast: each]].
]

{ #category : #notifying }
XMLCachingNodeList >> renamedElement: anElement from: anOldName to: aNewName [
	| oldPrefix index |

	self
		cachedElementsByNameAt: anOldName
		remove: anElement.
	(oldPrefix := anOldName xmlPrefixBeforeLocalName) notEmpty
		ifTrue: [
			self
				cachedElementsByNameAt: (anOldName xmlLocalNameAfterPrefix: oldPrefix)
				remove: anElement].
	index := self indexOf: anElement.
	self
		cachedElementsByNameAt: anElement name
		add: anElement
		beforeNextAfterIndex: index.
	anElement hasPrefix
		ifTrue: [
			self
				cachedElementsByNameAt: anElement localName
				add: anElement
				beforeNextAfterIndex: index].
]

{ #category : #sorting }
XMLCachingNodeList >> sort: aSortBlock [
	super sort: aSortBlock.

	self cachedElements sort: aSortBlock.
	self cachedElementsByName valuesDo: [:each |
		each isCollection
			ifTrue: [each sort: aSortBlock]].
]

{ #category : #accessing }
XMLCachingNodeList >> swap: aFirstIndex with: aSecondIndex [
	super swap: aFirstIndex with: aSecondIndex.

	((self at: aFirstIndex) isElement
		or: [(self at: aSecondIndex) isElement])
		ifTrue: [self rebuildCachedElements].
]

{ #category : #private }
XMLCachingNodeList >> uncacheElement: anElement [
	self cachedElements remove: anElement.
	self
		cachedElementsByNameAt: anElement name
		remove: anElement.
	anElement hasPrefix
		ifTrue: [
			self
				cachedElementsByNameAt: anElement localName
				remove: anElement].
]
