"
This class functions as an OrderedCollection that will not raise exceptions when attempts are made to access absent objects. This means messages like #at:, #after:, and #first will return nil when the requested object cannot be retrieved. Messages that modify the collection will still raise exceptions as usual.


"
Class {
	#name : #XMLOrderedList,
	#superclass : #Collection,
	#instVars : [
		'collection'
	],
	#category : #'XML-Parser-DOM'
}

{ #category : #private }
XMLOrderedList class >> collection: aCollection [
	^ self basicNew setCollection: aCollection
]

{ #category : #defaults }
XMLOrderedList class >> collectionClass [
	^ OrderedCollection
]

{ #category : #inspecting }
XMLOrderedList class >> inspectorClass [
	"for pre-GTInspector Pharo"
	^ self collectionClass inspectorClass
]

{ #category : #'instance creation' }
XMLOrderedList class >> new [
	^ self new: 10
]

{ #category : #'instance creation' }
XMLOrderedList class >> new: aCapacity [
	^ self basicNew setCollection: (self collectionClass new: aCapacity)
]

{ #category : #'instance creation' }
XMLOrderedList class >> new: aSize withAll: anObject [
	| newList |

	"reimplement for portability"
	newList := self new: aSize.
	1 to: aSize do: [:i | newList addLast: anObject].
	^ newList.
]

{ #category : #'instance creation' }
XMLOrderedList class >> newFrom: aCollection [
	^ (self new: aCollection size)
		addAll: aCollection;
		yourself
]

{ #category : #'instance creation' }
XMLOrderedList class >> ofSize: aSize [
	^ self new: aSize withAll: nil
]

{ #category : #copying }
XMLOrderedList >> , aCollection [
	"GS doesn't define #, for non-Sequenceable collections"
	^ self copy
		addAll: aCollection;
		yourself
]

{ #category : #comparing }
XMLOrderedList >> = anObject [
	"Returns true if anObject is any kind of XMLOrderedList (not just the
	class of the receiver) and it and the receiver have the same items
	in the same order."

	self == anObject
		ifTrue: [^ true].

	(self species == anObject species
		and: [collection size = anObject size])
		ifFalse: [^ false].

	"Test each position with #= using #to:do: for speed instead of
	just 'collection = anObject collection' because that would
	make equality depend on the internal collection types instead
	of just their items."
	1 to: collection size do: [:i |
		(collection at: i) = (anObject at: i)
			ifFalse: [^ false]].

	^ true.
]

{ #category : #adding }
XMLOrderedList >> add: anObject [
	^ self addLast: anObject
]

{ #category : #adding }
XMLOrderedList >> add: anObject after: aPreviousObject [
	^ collection add: anObject after: aPreviousObject
]

{ #category : #adding }
XMLOrderedList >> add: anObject afterIndex: anIndex [
	^ collection add: anObject afterIndex: anIndex
]

{ #category : #adding }
XMLOrderedList >> add: anObject before: aNextObject [
	^ collection add: anObject before: aNextObject
]

{ #category : #adding }
XMLOrderedList >> add: anObject beforeIndex: anIndex [
	^ collection add: anObject beforeIndex: anIndex
]

{ #category : #adding }
XMLOrderedList >> addAll: aCollection [
	^ self addAllLast: aCollection
]

{ #category : #adding }
XMLOrderedList >> addAllFirst: aCollection [
	aCollection reverseDo: [:each | self addFirst: each].
	^ aCollection.
]

{ #category : #adding }
XMLOrderedList >> addAllLast: aCollection [
	aCollection do: [:each | self addLast: each].
	^ aCollection.
]

{ #category : #adding }
XMLOrderedList >> addFirst: anObject [
	^ collection addFirst: anObject
]

{ #category : #adding }
XMLOrderedList >> addLast: anObject [
	^ collection addLast: anObject
]

{ #category : #private }
XMLOrderedList >> addToCopyLast: anObject [
	"this is used to efficiently append to copies for methods like #copy,
	#copyWithout:, #select:, and #reject: that create copies with no new elements
	(only old ones) so duplicate or other constraint checking can be skipped
	by subclasses"

	^ collection addLast: anObject
]

{ #category : #accessing }
XMLOrderedList >> after: anObject [
	^ self after: anObject ifAbsent: [self defaultValue]
]

{ #category : #accessing }
XMLOrderedList >> after: anObject ifAbsent: aBlock [
	^ collection after: anObject ifAbsent: aBlock
]

{ #category : #accessing }
XMLOrderedList >> allButFirst [
	^ self allButFirst: 1
]

{ #category : #accessing }
XMLOrderedList >> allButFirst: anInteger [
	^ self copyFrom: anInteger + 1 to: self size
]

{ #category : #enumerating }
XMLOrderedList >> allButFirstDo: aBlock [
	"reimplemented for portability"
	2 to: collection size do: [:i |
		aBlock value: (collection at: i)]
]

{ #category : #accessing }
XMLOrderedList >> allButLast [
	^ self allButLast: 1
]

{ #category : #accessing }
XMLOrderedList >> allButLast: anInteger [
	^ self copyFrom: 1 to: self size - anInteger
]

{ #category : #enumerating }
XMLOrderedList >> allButLastDo: aBlock [
	"reimplemented for portability"
	1 to: collection size - 1 do: [:i |
		aBlock value: (collection at: i)]
]

{ #category : #accessing }
XMLOrderedList >> anyOne [
	^ self first
]

{ #category : #converting }
XMLOrderedList >> asArray [
	"use withAll: not newFrom: for portability"
	^ Array withAll: collection
]

{ #category : #converting }
XMLOrderedList >> asOrderedCollection [
	"use withAll: not newFrom: for portability"
	^ OrderedCollection withAll: collection
]

{ #category : #converting }
XMLOrderedList >> asString [
	"don't assume Object>>#asString is defined, for portability"
	^ self printString
]

{ #category : #accessing }
XMLOrderedList >> at: anIndex [
	"optimized"
	(anIndex > 0 and: [anIndex <= collection size])
		ifTrue: [^ collection at: anIndex]
		ifFalse: [^ self defaultValue]
]

{ #category : #accessing }
XMLOrderedList >> at: anIndex ifAbsent: aBlock [
	^ collection at: anIndex ifAbsent: aBlock
]

{ #category : #accessing }
XMLOrderedList >> at: anIndex put: aValue [
	"treats index = size + 1 as addLast: gemstone compatibility"
	anIndex = (collection size + 1)
		ifTrue: [^ collection addLast: aValue]
		ifFalse: [^ collection at: anIndex put: aValue]
]

{ #category : #accessing }
XMLOrderedList >> atLast: anIndexFromEnd [
	^ self atLast: anIndexFromEnd ifAbsent: [self defaultValue]
]

{ #category : #accessing }
XMLOrderedList >> atLast: anIndexFromEnd ifAbsent: aBlock [
	^ collection atLast: anIndexFromEnd ifAbsent: aBlock
]

{ #category : #accessing }
XMLOrderedList >> before: anObject [
	^ self before: anObject ifAbsent: [self defaultValue]
]

{ #category : #accessing }
XMLOrderedList >> before: anObject ifAbsent: aBlock [
	 ^ collection before: anObject ifAbsent: aBlock
]

{ #category : #testing }
XMLOrderedList >> beginsWith: aCollection [
	^ collection beginsWith: aCollection
]

{ #category : #accessing }
XMLOrderedList >> capacity [
	^ collection capacity
]

{ #category : #enumerating }
XMLOrderedList >> collect: aBlock [
	| collected |

	collected := self copyEmptyForCollect.
	"use #to:do: for speed"
	1 to: collection size do: [:i |
		collected addLast: (aBlock value: (collection at: i))].
	^ collected.
]

{ #category : #enumerating }
XMLOrderedList >> collect: aCollectBlock thenSelect: aSelectBlock [
	| selected |

	selected := self copyEmpty.
	"use #to:do: for speed"
	1 to: collection size do: [:i | | item |
		item := aCollectBlock value: (collection at: i).
		(aSelectBlock value: item)
			ifTrue: [selected addLast: item]].
	^ selected.
]

{ #category : #private }
XMLOrderedList >> collection [
	^ collection
]

{ #category : #copying }
XMLOrderedList >> copy [
	| copy |

	copy := self copyEmpty.
	"use #to:do: for speed with direct access"
	1 to: collection size do: [:i |
		copy addToCopyLast: (collection at: i)].
	^ copy.
]

{ #category : #copying }
XMLOrderedList >> copyAfter: anObject [
	| copy |

	copy := self copyEmpty.
	(self
		indexOf: anObject
		ifAbsent: [^ copy]) + 1
			to: self size
			do: [:i | copy addToCopyLast: (self at: i)].
	^ copy.
]

{ #category : #copying }
XMLOrderedList >> copyAfterLast: anObject [
	| copy |

	copy := self copyEmpty.
	(self
		lastIndexOf: anObject
		ifAbsent: [^ copy]) + 1
			to: self size
			do: [:i | copy addToCopyLast: (self at: i)].
	^ copy.
]

{ #category : #defaults }
XMLOrderedList >> copyClass [
	"the class to use for copies"
	^ self class
]

{ #category : #copying }
XMLOrderedList >> copyEmpty [
	^ self copyClass collection: collection copyEmpty
]

{ #category : #private }
XMLOrderedList >> copyEmptyForCollect [
	"collect: methods return instances of the generic ordered list species class
	because a collect block can return any value, which may not be appropiate to
	store in copies of particular subclasses (like XMLNodeList)"

	^ self species new: self size
]

{ #category : #copying }
XMLOrderedList >> copyFrom: aStart to: anEnd [
	| copy |

	copy := self copyEmpty.
	(aStart max: 1)
		to: (anEnd min: self size)
		do: [:i | copy addToCopyLast: (self at: i)].
	^ copy.
]

{ #category : #copying }
XMLOrderedList >> copyReplaceAll: aSearchCollection with: aReplacementCollection [
	| copy index size searchCollectionSize |

	"this implementation always returns a copy, even if it doesn't replace"
	(searchCollectionSize := aSearchCollection size) > 0
		ifFalse: [^ self copy].

	copy := self copyEmpty.
	index := 1.
	size := self size.
	[index <= size]
		whileTrue: [
			(self at: index) = (aSearchCollection at: 1)
				ifTrue: [| searchCollectionIndex |
					searchCollectionIndex := 2.
					[searchCollectionIndex <= searchCollectionSize
						and: [
							(self at: index + searchCollectionIndex - 1) =
								(aSearchCollection at: searchCollectionIndex)]]
						whileTrue: [searchCollectionIndex := searchCollectionIndex + 1].
					searchCollectionIndex > searchCollectionSize
						ifTrue: [
							"found a match, add the replacement and skip the replaced"
							copy addAll: aReplacementCollection.
							index := index + searchCollectionSize]
						ifFalse: [
							copy addLast: (self at: index).
							index := index + 1]]
				ifFalse: [ 
					copy addLast: (self at: index).
					index := index + 1]].
	^ copy.
]

{ #category : #copying }
XMLOrderedList >> copyReplaceFrom: aStart to: aStop with: aReplacementCollection [
	| copy start stop |

	(self size < 1
		or: [self size < aStart])
		ifTrue: [
			^ self copy
				addAll: aReplacementCollection;
				yourself].

	copy := self copyEmpty.
	start := aStart max: 1.
	stop := aStop min: self size.
	1 to: self size do: [:i |
		(i = start)
			ifTrue: [
				copy addAll: aReplacementCollection.
				start > stop
					ifTrue: [copy addLast: (self at: i)]]
			ifFalse: [
				(i > start and: [i <= stop])
					ifFalse: [copy addLast: (self at: i)]]].
	^ copy.
]

{ #category : #copying }
XMLOrderedList >> copyUpTo: anObject [
	| copy |

	copy := self copyEmpty.
	1
		to:
			(self
				indexOf: anObject
				ifAbsent: [self size + 1]) - 1
		do: [:i | copy addToCopyLast: (self at: i)].
	^ copy.
]

{ #category : #copying }
XMLOrderedList >> copyUpToLast: anObject [
	| copy |

	copy := self copyEmpty.
	1
		to:
			(self
				lastIndexOf: anObject
				ifAbsent: [collection size + 1]) - 1
		do: [:i | copy addToCopyLast: (self at: i)].
	^ copy.
]

{ #category : #copying }
XMLOrderedList >> copyWith: anObject [
	^ self copy
		addLast: anObject;
		yourself
]

{ #category : #copying }
XMLOrderedList >> copyWithFirst: anObject [
	^ self copyEmpty
		addLast: anObject;
		addAll: self;
		yourself
]

{ #category : #copying }
XMLOrderedList >> copyWithout: anObject [
	^ self reject: [:each | each = anObject]
]

{ #category : #copying }
XMLOrderedList >> copyWithoutAll: aCollection [
	| rejected |

	rejected :=
		aCollection size > 5
			ifTrue: [aCollection asSet]
			ifFalse: [aCollection].
	^ self reject: [:each | rejected includes: each].
]

{ #category : #defaults }
XMLOrderedList >> defaultValue [
	^ nil
]

{ #category : #enumerating }
XMLOrderedList >> detect: aBlock [
	^ self detect: aBlock ifNone: [self defaultValue]
]

{ #category : #enumerating }
XMLOrderedList >> detect: aBlock ifNone: anExceptionBlock [
	^ collection detect: aBlock ifNone: anExceptionBlock
]

{ #category : #enumerating }
XMLOrderedList >> do: aBlock [
	collection do: aBlock
]

{ #category : #enumerating }
XMLOrderedList >> doWithIndex: aBlock [
	^ self withIndexDo: aBlock
]

{ #category : #accessing }
XMLOrderedList >> eighth [
	^ self at: 8
]

{ #category : #testing }
XMLOrderedList >> endsWith: aCollection [
	^ collection endsWith: aCollection
]

{ #category : #accessing }
XMLOrderedList >> fifth [
	^ self at: 5
]

{ #category : #accessing }
XMLOrderedList >> first [
	"optimized implementation"
	^ collection size > 0
		ifTrue: [collection at: 1]
		ifFalse: [self defaultValue]
]

{ #category : #accessing }
XMLOrderedList >> first: anInteger [
	^ self copyFrom: 1 to: anInteger
]

{ #category : #accessing }
XMLOrderedList >> fourth [
	^ self at: 4
]

{ #category : #comparing }
XMLOrderedList >> hash [
	| hash |

	hash := self species hash.
	self size > 10
		ifFalse: [
			self do: [:each |
				hash := hash bitXor: each hash]].
	^ hash bitXor: self size hash.
]

{ #category : #accessing }
XMLOrderedList >> identityIndexOf: anObject [
	^ self identityIndexOf: anObject ifAbsent: [0]
]

{ #category : #accessing }
XMLOrderedList >> identityIndexOf: anObject ifAbsent: aBlock [
	^ collection identityIndexOf: anObject ifAbsent: aBlock
]

{ #category : #accessing }
XMLOrderedList >> indexOf: anObject [
	^ self indexOf: anObject ifAbsent: [0]
]

{ #category : #accessing }
XMLOrderedList >> indexOf: anObject ifAbsent: aBlock [
	^ collection
		indexOf: anObject
		ifAbsent: aBlock
]

{ #category : #accessing }
XMLOrderedList >> indexOf: anObject startingAt: anIndex [ 
	^ self
		indexOf: anObject
		startingAt: anIndex
		ifAbsent: [0]
]

{ #category : #accessing }
XMLOrderedList >> indexOf: anObject startingAt: anIndex ifAbsent: aBlock [
	^ collection
		indexOf: anObject
		startingAt: (anIndex max: 1)
		ifAbsent: aBlock
]

{ #category : #accessing }
XMLOrderedList >> indexOfSubCollection: aSubCollection startingAt: anIndex [
	^ self
		indexOfSubCollection: aSubCollection
		startingAt: anIndex
		ifAbsent: [0]
]

{ #category : #accessing }
XMLOrderedList >> indexOfSubCollection: aSubCollection startingAt: anIndex ifAbsent: aBlock [
	^ collection
		indexOfSubCollection: aSubCollection
		startingAt: anIndex
		ifAbsent: aBlock
]

{ #category : #inspecting }
XMLOrderedList >> inspectorClass [
	"for Squeak"
	^ collection inspectorClass
]

{ #category : #testing }
XMLOrderedList >> isEmpty [
	"Squeak's Collection>>#isEmpty is inefficient"
	^ self size = 0
]

{ #category : #testing }
XMLOrderedList >> isSequenceable [
	^ true
]

{ #category : #accessing }
XMLOrderedList >> last [
	| lastIndex |

	"optimized implementation"
	^ (lastIndex := collection size) > 0
		ifTrue: [collection at: lastIndex]
		ifFalse: [self defaultValue]
]

{ #category : #accessing }
XMLOrderedList >> last: anInteger [
	^ self copyFrom: self size - anInteger + 1 to: self size
]

{ #category : #accessing }
XMLOrderedList >> lastIndexOf: anObject [
	^ self lastIndexOf: anObject ifAbsent: [0]
]

{ #category : #accessing }
XMLOrderedList >> lastIndexOf: anObject ifAbsent: aBlock [
	^ collection lastIndexOf: anObject ifAbsent: aBlock
]

{ #category : #accessing }
XMLOrderedList >> ninth [
	^ self at: 9
]

{ #category : #enumerating }
XMLOrderedList >> pairsDo: aBlock [
	collection pairsDo: aBlock
]

{ #category : #converting }
XMLOrderedList >> readStream [
	"use #readStream to get a 0-based position stream on GS"
	^ collection readStream
]

{ #category : #enumerating }
XMLOrderedList >> reject: aBlock [
	| selected |

	selected := self copyEmpty.
	"use #to:do: for speed"
	1 to: collection size do: [:i | | item |
		item := collection at: i.
		(aBlock value: item)
			ifFalse: [selected addToCopyLast: item]].
	^ selected.
]

{ #category : #enumerating }
XMLOrderedList >> reject: aRejectBlock thenCollect: aCollectBlock [
	| collected |

	collected := self copyEmptyForCollect.
	"use #to:do: for speed"
	1 to: collection size do: [:i | | item |
		item := collection at: i.
		(aRejectBlock value: item)
			ifFalse: [collected addLast: (aCollectBlock value: item)]].
	^ collected.
]

{ #category : #removing }
XMLOrderedList >> remove: anObject ifAbsent: aBlock [
	^ collection remove: anObject ifAbsent: aBlock
]

{ #category : #removing }
XMLOrderedList >> removeAll [
	"Redefined because Collection>>#removeAll assumes the collection can
	be safely modified while iterating it with #do:"

	self size timesRepeat: [self removeLast]
]

{ #category : #removing }
XMLOrderedList >> removeAt: anIndex [
	^ collection removeAt: anIndex
]

{ #category : #removing }
XMLOrderedList >> removeFirst [
	^ self removeAt: 1
]

{ #category : #removing }
XMLOrderedList >> removeFirst: aNumber [
	| removed |

	removed := self copyFrom: 1 to: aNumber.
	aNumber timesRepeat: [self removeFirst].
	^ removed.
]

{ #category : #removing }
XMLOrderedList >> removeLast [
	^ self removeAt: self size
]

{ #category : #removing }
XMLOrderedList >> removeLast: aNumber [
	| removed |

	removed := self copyFrom: self size - (aNumber - 1) to: self size.
	aNumber timesRepeat: [self removeLast].
	^ removed.
]

{ #category : #accessing }
XMLOrderedList >> replaceFrom: aStart to: aStop with: aReplacementCollection [
	^ self
		replaceFrom: aStart
		to: aStop
		with: aReplacementCollection
		startingAt: 1
]

{ #category : #accessing }
XMLOrderedList >> replaceFrom: aStart to: aStop with: aReplacementCollection startingAt: aReplacementStart [
	| offset |

	offset := 0.
	[aStart + offset <= aStop]
		whileTrue: [
			self
				at: aStart + offset
				put: (aReplacementCollection at: aReplacementStart + offset).
			offset := offset + 1].
]

{ #category : #removing }
XMLOrderedList >> reset [
	collection reset
]

{ #category : #converting }
XMLOrderedList >> reverse [
	"returns a copy like #reversed instead of doing in-place reversal to
	be compatible with SequenceableCollection>>#reverse"

	^ self reversed
]

{ #category : #enumerating }
XMLOrderedList >> reverseDo: aBlock [
	collection reverseDo: aBlock
]

{ #category : #converting }
XMLOrderedList >> reversed [
	| reversed |

	reversed := self copyEmpty.
	self reverseDo: [:each | reversed addToCopyLast: each].
	^ reversed.
]

{ #category : #accessing }
XMLOrderedList >> second [
	^ self at: 2
]

{ #category : #enumerating }
XMLOrderedList >> select: aBlock [
	| selected |

	selected := self copyEmpty.
	"use #to:do: for speed"
	1 to: collection size do: [:i | | item |
		item := collection at: i.
		(aBlock value: item)
			ifTrue: [selected addToCopyLast: item]].
	^ selected.
]

{ #category : #enumerating }
XMLOrderedList >> select: aSelectBlock thenCollect: aCollectBlock [
	| collected |

	collected := self copyEmptyForCollect.
	"use #to:do: for speed"
	1 to: collection size do: [:i | | item |
		item := collection at: i.
		(aSelectBlock value: item)
			ifTrue: [collected addLast: (aCollectBlock value: item)]].
	^ collected.
]

{ #category : #private }
XMLOrderedList >> setCollection: aCollection [
	collection := aCollection
]

{ #category : #accessing }
XMLOrderedList >> seventh [
	^ self at: 7
]

{ #category : #accessing }
XMLOrderedList >> sixth [
	^ self at: 6
]

{ #category : #accessing }
XMLOrderedList >> size [
	^ collection size
]

{ #category : #sorting }
XMLOrderedList >> sort [
	self sort: [:a :b | a <= b]
]

{ #category : #sorting }
XMLOrderedList >> sort: aSortBlock [
	collection sort: aSortBlock
]

{ #category : #sorting }
XMLOrderedList >> sorted [
	^ self copy sort
]

{ #category : #sorting }
XMLOrderedList >> sorted: aSortBlock [
	^ self copy sort: aSortBlock
]

{ #category : #private }
XMLOrderedList >> species [
	"this makes instances of this class and all subclasses with the same
	items in the same order be equal"
	^ XMLOrderedList
]

{ #category : #accessing }
XMLOrderedList >> swap: aFirstIndex with: aSecondIndex [
	"swap positions of the objects at aFirstIndex and aSecondIndex,
	raising an error if either index is out of bounds"

	| temp |

	temp := collection at: aFirstIndex.
	collection
		at: aFirstIndex
		put: (collection at: aSecondIndex).
	collection
		at: aSecondIndex
		put: temp.
]

{ #category : #accessing }
XMLOrderedList >> third [
	^ self at: 3
]

{ #category : #enumerating }
XMLOrderedList >> with: aCollection collect: aBlock [
	| collected |

	collected := self copyEmptyForCollect.
	1 to: (collection size min: aCollection size) do: [:i |
		collected addLast:
			(aBlock
				value: (collection at: i)
				value: (aCollection at: i))].
	^ collected.
]

{ #category : #enumerating }
XMLOrderedList >> with: aCollection do: aBlock [
	1 to: (collection size min: aCollection size) do: [:i |
		aBlock
			value: (collection at: i)
			value: (aCollection at: i)]
]

{ #category : #enumerating }
XMLOrderedList >> withIndexCollect: aTwoArgumentBlock [
	| collected |

	collected := self copyEmptyForCollect.
	1 to: collection size do: [:i |
		collected addLast:
			(aTwoArgumentBlock
				value: (collection at: i)
				value: i)].
	^ collected.
]

{ #category : #enumerating }
XMLOrderedList >> withIndexDo: aBlock [
	collection withIndexDo: aBlock
]

{ #category : #converting }
XMLOrderedList >> writeStream [
	"This is not supported because the collection already supports WriteStream
	behavior with #addLast: and the Pharo/Squeak WriteStream works by expanding
	its collection with #grownBy:, which should fill the new space with nils,
	but some subclasses cannot contain nil"

	self shouldNotImplement
]

{ #category : #accessing }
XMLOrderedList >> xmlLastOrNil [
	^ self last
]
