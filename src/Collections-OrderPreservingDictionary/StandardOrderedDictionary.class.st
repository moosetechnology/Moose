"
This class is a dictionary that uses key insertion order when enumerating, printing, or returing collections of keys/values/associations, but not when testing for equality.

Insertion, updating, and inclusion testing have O(1) complexity while removing has O(n) worst-case.
"
Class {
	#name : #StandardOrderedDictionary,
	#superclass : #Collection,
	#instVars : [
		'dictionary',
		'orderedKeys'
	],
	#category : #'Collections-OrderPreservingDictionary'
}

{ #category : #inspecting }
StandardOrderedDictionary class >> inspectorClass [
	^ Dictionary inspectorClass
]

{ #category : #'instance creation' }
StandardOrderedDictionary class >> new [
	^ self new: 10
]

{ #category : #'instance creation' }
StandardOrderedDictionary class >> new: aCapacity [
	^ self basicNew initialize: aCapacity
]

{ #category : #'instance creation' }
StandardOrderedDictionary class >> newFrom: anAssociationCollection [
	| newDictionary |

	newDictionary := self new: anAssociationCollection size.
	anAssociationCollection associationsDo: [:each |
		newDictionary
			at: each key
			put: each value].
	^ newDictionary.
]

{ #category : #'instance creation' }
StandardOrderedDictionary class >> newFromPairs: aSequenceableCollection [
	| newDictionary |

	newDictionary := self new: (aSequenceableCollection size / 2) floor.
	1 to: aSequenceableCollection size - 1 by: 2 do: [:i |
		newDictionary
			at: (aSequenceableCollection at: i)
			put: (aSequenceableCollection at: i + 1)].
	^ newDictionary.
]

{ #category : #comparing }
StandardOrderedDictionary >> = anObject [
	"Returns true if the receiver and argument are identical, or if they
	are both some kind of order-preserving dictionary and if they have
	the same associations regardless of order."

	self == anObject
		ifTrue: [^ true].

	(anObject isOrderPreservingDictionary
		and: [self isIdentityDictionary = anObject isIdentityDictionary
			and: [self size = anObject size]])
		ifFalse: [^ false].

	dictionary associationsDo: [:each |
		(anObject at: each key ifAbsent: [^ false]) = each value
			ifFalse: [^ false]].
	^ true.
]

{ #category : #adding }
StandardOrderedDictionary >> add: anAssociation [
	| oldSize |

	oldSize := dictionary size.
	dictionary add: anAssociation.
	dictionary size > oldSize
		ifTrue: [
			orderedKeys size > oldSize
				ifFalse: [self growOrderedKeys].
			orderedKeys at: oldSize + 1 put: anAssociation key].
	^ anAssociation.
]

{ #category : #adding }
StandardOrderedDictionary >> addAll: anAssociationCollection [
	"Since Collection implements #associationsDo:, this method can accept
	any collection of associations including Arrays and OrderedCollections"

	anAssociationCollection associationsDo: [:each | self add: each].
	^ anAssociationCollection.
]

{ #category : #accessing }
StandardOrderedDictionary >> associationAt: aKey [
	^ dictionary associationAt: aKey
]

{ #category : #accessing }
StandardOrderedDictionary >> associationAt: aKey ifAbsent: aBlock [
	^ dictionary
		associationAt: aKey
		ifAbsent: aBlock
]

{ #category : #accessing }
StandardOrderedDictionary >> associationAt: aKey ifPresent: aBlock [
	"Squeak and GS do not have #associationAt:ifPresent: so it
	is reimplemented for portability"
	^ aBlock cull:
		(dictionary
			associationAt: aKey
			ifAbsent: [^ nil])
]

{ #category : #accessing }
StandardOrderedDictionary >> associations [
	| associations i |

	associations := Array new: self size.
	i := 1.
	self associationsDo: [:each |
		associations at: i put: each.
		i := i + 1].
	^ associations.
]

{ #category : #enumerating }
StandardOrderedDictionary >> associationsDo: aBlock [
	self keysDo: [:each |
		aBlock value: (self associationAt: each)]
]

{ #category : #enumerating }
StandardOrderedDictionary >> associationsSelect: aBlock [
	^ self speciesNewFrom: (self associations select: aBlock)
]

{ #category : #accessing }
StandardOrderedDictionary >> at: aKey [
	^ dictionary at: aKey
]

{ #category : #accessing }
StandardOrderedDictionary >> at: aKey ifAbsent: aBlock [
	^ dictionary
		at: aKey
		ifAbsent: aBlock
]

{ #category : #accessing }
StandardOrderedDictionary >> at: aKey ifAbsentPut: aBlock [
	^ self
		at: aKey
		ifAbsent: [
			self
				at: aKey
				put: aBlock value]
]

{ #category : #accessing }
StandardOrderedDictionary >> at: aKey ifPresent: aBlock [
	"Squeak and GS don't use #cull: for the ifPresent:
	block, so it is reimplemented for portability"
	^ aBlock cull:
		(self
			at: aKey
			ifAbsent: [^ nil])
]

{ #category : #accessing }
StandardOrderedDictionary >> at: aKey ifPresent: aPresentBlock ifAbsent: anAbsentBlock [
	"Squeak and GS don't use #cull: for the ifPresent:
	block, so it is reimplemented for portability"
	self
		at: aKey
		ifPresent: [:value | ^ aPresentBlock cull: value].
	^ anAbsentBlock value.
]

{ #category : #accessing }
StandardOrderedDictionary >> at: aKey put: aValue [
	| oldSize |

	oldSize := dictionary size.
	dictionary
		at: aKey
		put: aValue.
	dictionary size > oldSize
		ifTrue: [
			orderedKeys size > oldSize
				ifFalse: [self growOrderedKeys].
			orderedKeys at: oldSize + 1 put: aKey].
	^ aValue.
]

{ #category : #accessing }
StandardOrderedDictionary >> capacity [
	^ dictionary capacity
]

{ #category : #enumerating }
StandardOrderedDictionary >> collect: aBlock [
	^ self speciesNewFrom:
		(self associations collect: [:each |
			each key -> (aBlock value: each value)])
]

{ #category : #copying }
StandardOrderedDictionary >> copyEmpty [
	"Squeak and GS don't have Collection>>#copyEmpty:, so it is
	reimplemented for portability"
	^ self species new
]

{ #category : #private }
StandardOrderedDictionary >> dictionary [
	^ dictionary
]

{ #category : #accessing }
StandardOrderedDictionary >> dictionaryClass [
	^ Dictionary
]

{ #category : #enumerating }
StandardOrderedDictionary >> do: aBlock [
	self valuesDo: aBlock
]

{ #category : #private }
StandardOrderedDictionary >> errorInvalidIndex: anIndex [
	"Squeak and GS do not have SubscriptOutOfBounds, so Error is used
	for portability"
	Error signal: 'Invalid index: ', anIndex printString
]

{ #category : #private }
StandardOrderedDictionary >> errorValueNotFound: aValue [
	"Squeak and GS do not have ValueNotFound, so Error is used
	for portability"
	Error signal: 'Value not found'
]

{ #category : #private }
StandardOrderedDictionary >> growOrderedKeys [
	orderedKeys :=
		(Array new: ((orderedKeys size * 1.5) asInteger max: 10))
			replaceFrom: 1
			to: orderedKeys size
			with: orderedKeys
			startingAt: 1.
]

{ #category : #comparing }
StandardOrderedDictionary >> hash [
	^ dictionary hash
]

{ #category : #accessing }
StandardOrderedDictionary >> identityIndexOfKey: aKey [
	^ self
		identityIndexOfKey: aKey
		ifAbsent: [0]
]

{ #category : #accessing }
StandardOrderedDictionary >> identityIndexOfKey: aKey ifAbsent: aBlock [
	1 to: self size do: [:i |
		(orderedKeys at: i) == aKey
			ifTrue: [^ i]].
	^ aBlock value.
]

{ #category : #testing }
StandardOrderedDictionary >> includes: anObject [
	^ dictionary includes: anObject
]

{ #category : #testing }
StandardOrderedDictionary >> includesAssociation: anAssociation [
	"IndentityDictionary>>includesAssociation: works differently on GS
	testing both key and value identity, so it is reimplemented here
	to behave like Pharo/Squeak"
	^ (dictionary
		at: anAssociation key
		ifAbsent: [^ false]) = anAssociation value
]

{ #category : #testing }
StandardOrderedDictionary >> includesIdentity: anObject [
	"GS does not have includesIdentity:"
	self valuesDo: [:each |
		each == anObject
			ifTrue: [^ true]].
	^ false.
]

{ #category : #testing }
StandardOrderedDictionary >> includesKey: aKey [
	^ dictionary includesKey: aKey
]

{ #category : #accessing }
StandardOrderedDictionary >> indexOfKey: aKey [
	^ self
		indexOfKey: aKey
		ifAbsent: [0]
]

{ #category : #accessing }
StandardOrderedDictionary >> indexOfKey: aKey ifAbsent: aBlock [
	1 to: self size do: [:i |
		(orderedKeys at: i) = aKey
			ifTrue: [^ i]].
	^ aBlock value.
]

{ #category : #initialization }
StandardOrderedDictionary >> initialize: aCapacity [
	dictionary := self dictionaryClass new: aCapacity.
	orderedKeys := Array new: aCapacity.
]

{ #category : #testing }
StandardOrderedDictionary >> isDictionary [
	^ true
]

{ #category : #testing }
StandardOrderedDictionary >> isEmpty [
	"Squeak's Collection>>#isEmpty is inefficient"
	^ self size = 0
]

{ #category : #testing }
StandardOrderedDictionary >> isIdentityDictionary [
	^ false
]

{ #category : #testing }
StandardOrderedDictionary >> isOrderPreservingDictionary [
	^ true
]

{ #category : #accessing }
StandardOrderedDictionary >> keyAtIdentityValue: aValue [
	^ self
		keyAtIdentityValue: aValue
		ifAbsent: [self errorValueNotFound: aValue]
]

{ #category : #accessing }
StandardOrderedDictionary >> keyAtIdentityValue: aValue ifAbsent: aBlock [
	"GS does not have keyAtIdentityValue:ifAbsent:"
	self keysAndValuesDo: [:key :value |
		value == aValue
			ifTrue: [^ key]].
	^ aBlock value.
]

{ #category : #accessing }
StandardOrderedDictionary >> keyAtIndex: anIndex [
	^ self
		keyAtIndex: anIndex
		ifAbsent: [self errorInvalidIndex: anIndex]
]

{ #category : #accessing }
StandardOrderedDictionary >> keyAtIndex: anIndex ifAbsent: aBlock [
	(anIndex > 0 and: [anIndex <= self size])
		ifTrue: [^ orderedKeys at: anIndex]
		ifFalse: [^ aBlock value]
]

{ #category : #accessing }
StandardOrderedDictionary >> keyAtValue: aValue [
	^ dictionary keyAtValue: aValue
]

{ #category : #accessing }
StandardOrderedDictionary >> keyAtValue: aValue ifAbsent: aBlock [
	^ dictionary
		keyAtValue: aValue
		ifAbsent: aBlock
]

{ #category : #accessing }
StandardOrderedDictionary >> keyForIdentity: anObject [
	"reimplemented for portability"
	self keysAndValuesDo: [:key :value |
		value == anObject
			ifTrue: [^ key]].
	^ nil.
]

{ #category : #accessing }
StandardOrderedDictionary >> keys [
	^ orderedKeys
		copyFrom: 1
		to: self size
]

{ #category : #enumerating }
StandardOrderedDictionary >> keysAndValuesDo: aBlock [
	self keysDo: [:each |
		aBlock
			value: each
			value: (self at: each)]
]

{ #category : #removing }
StandardOrderedDictionary >> keysAndValuesRemove: aTwoArgumentBlock [
	| removedAssociations |

	removedAssociations := OrderedCollection new.
	self associationsDo: [:each |
		(aTwoArgumentBlock
			value: each key
			value: each value)
			ifTrue: [removedAssociations add: each]].
	removedAssociations do: [:each | self removeKey: each key].
]

{ #category : #enumerating }
StandardOrderedDictionary >> keysDo: aBlock [
	"use to:do: for speed"
	1 to: self size do: [:i |
		aBlock value: (orderedKeys at: i)]
]

{ #category : #accessing }
StandardOrderedDictionary >> keysSortedSafely [
	"GS's #keysSortedSafely returns a SortedCollection instead of
	an Array, so this is reimplemented directly for portability, and
	'self keys' is used instead of 'dictionary keys', because GS's
	#keys returns a Set which can't be sorted"
	^ self keys sort
]

{ #category : #private }
StandardOrderedDictionary >> orderedKeys [
	^ orderedKeys
]

{ #category : #private }
StandardOrderedDictionary >> orderedKeysIdentityIndexOf: aKey [
	"GS does not have #identityIndexOf:"
	1 to: orderedKeys size do: [:i |
		(orderedKeys at: i) == aKey
			ifTrue: [^ i]].
	^ 0.
]

{ #category : #private }
StandardOrderedDictionary >> orderedKeysIndexOf: aKey [
	^ orderedKeys indexOf: aKey
]

{ #category : #private }
StandardOrderedDictionary >> orderedKeysRemove: aRemovedKey [
	| index |

	index := self orderedKeysIndexOf: aRemovedKey.

	"shift every remaining key after to the left by one"
	orderedKeys
		replaceFrom: index
		to: self size
		with: orderedKeys
		startingAt: index + 1.

	"one key was removed and the rest shifted, so nil what was the last
	key slot before removing and shifting"
	orderedKeys
		at: self size + 1
		put: nil.
]

{ #category : #copying }
StandardOrderedDictionary >> postCopy [
	orderedKeys := orderedKeys copy.
	dictionary := dictionary copy.
]

{ #category : #printing }
StandardOrderedDictionary >> printElementsOn: aStream [
	aStream nextPut: $(.
	self size > 100
		ifTrue: [
			aStream nextPutAll: 'size '.
			self size printOn: aStream]
		ifFalse: [
			self associations withIndexDo: [:each :i |
				aStream
					print: each key;
					nextPutAll: '->';
					print: each value.
				(i < self size)
					ifTrue: [aStream space]]].
	aStream nextPut: $).
]

{ #category : #removing }
StandardOrderedDictionary >> remove: anObject ifAbsent: aBlock [
	self shouldNotImplement
]

{ #category : #removing }
StandardOrderedDictionary >> removeAll [
	1 to: self size do: [:i |
		orderedKeys
			at: i
			put: nil].
	dictionary removeAll.
]

{ #category : #removing }
StandardOrderedDictionary >> removeKey: aKey [
	| value |

	value := dictionary removeKey: aKey.
	self orderedKeysRemove: aKey.
	^ value.
]

{ #category : #removing }
StandardOrderedDictionary >> removeKey: aKey ifAbsent: aBlock [
	| oldSize value |

	oldSize := dictionary size.
	value :=
		dictionary
			removeKey: aKey
			ifAbsent: aBlock.
	dictionary size < oldSize
		ifTrue: [self orderedKeysRemove: aKey].
	^ value.
]

{ #category : #removing }
StandardOrderedDictionary >> removeKeys: aKeyCollection [
	"Fast removal of multiple keys; returns self to avoid
	having to create a removed value collection and does not
	raise errors."

	aKeyCollection	size > 1
		ifTrue: [| oldSize newOrderedKeys newOrderedKeysIndex |
			oldSize := self size.
			aKeyCollection do: [:each |
				dictionary
					removeKey: each
					ifAbsent: [nil]].

			newOrderedKeys := Array new: oldSize.
			newOrderedKeysIndex := 0.
			1 to: oldSize do: [:i | | key |
				(dictionary includesKey: (key := orderedKeys at: i))
					ifTrue: [
						newOrderedKeys
							at: (newOrderedKeysIndex := newOrderedKeysIndex + 1)
							put: key]].

			orderedKeys := newOrderedKeys]
		ifFalse: [
			aKeyCollection size = 1
				ifTrue: [
					"use #anyOne, because it can be a Set"
					self
						removeKey: aKeyCollection anyOne
						ifAbsent: [nil]]]
]

{ #category : #enumerating }
StandardOrderedDictionary >> select: aBlock [
	^ self speciesNewFrom:
		(self associations select: [:each | aBlock value: each value])
]

{ #category : #accessing }
StandardOrderedDictionary >> size [
	^ dictionary size
]

{ #category : #private }
StandardOrderedDictionary >> speciesNewFrom: anAssociationCollection [
	^ self species newFrom: anAssociationCollection
]

{ #category : #accessing }
StandardOrderedDictionary >> values [
	^ self associations collect: [:each | each value]
]

{ #category : #enumerating }
StandardOrderedDictionary >> valuesDo: aBlock [
	self keysDo: [:each |
		aBlock value: (self at: each)]
]
