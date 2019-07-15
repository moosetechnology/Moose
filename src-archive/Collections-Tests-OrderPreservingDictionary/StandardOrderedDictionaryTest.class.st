Class {
	#name : #StandardOrderedDictionaryTest,
	#superclass : #TestCase,
	#instVars : [
		'nonIdentityOrderedAssociations',
		'identityOrderedAssociations'
	],
	#category : #'Collections-Tests-OrderPreservingDictionary'
}

{ #category : #testing }
StandardOrderedDictionaryTest class >> shouldInheritSelectors [
	^ true
]

{ #category : #accessing }
StandardOrderedDictionaryTest >> absentKey [
	self isTestingIdentityDictionary
		ifTrue: [^ self identityAbsentKey]
		ifFalse: [^ self nonIdentityAbsentKey]
]

{ #category : #accessing }
StandardOrderedDictionaryTest >> absentValue [
	^ 'absentValue'
]

{ #category : #assertions }
StandardOrderedDictionaryTest >> assertDictionary: aFirstDictionary doesNotEqual: aSecondDictionary [
	"test symmetric inequality"
	self
		deny: aFirstDictionary = aSecondDictionary;
		deny: aSecondDictionary = aFirstDictionary
]

{ #category : #assertions }
StandardOrderedDictionaryTest >> assertDictionary: aFirstDictionary equals: aSecondDictionary [
	"test reflixive and symmetric equality"
	self
		assert: aFirstDictionary = aFirstDictionary;
		assert: aFirstDictionary = aSecondDictionary;
		assert: aSecondDictionary = aSecondDictionary;
		assert: aSecondDictionary = aFirstDictionary
]

{ #category : #assertions }
StandardOrderedDictionaryTest >> assertIsArray: anArray withElements: aCollection [
	self
		assert: anArray isArray;
		assert: anArray = aCollection asArray
]

{ #category : #assertions }
StandardOrderedDictionaryTest >> assertIsDictionary: aFirstDictionary copiedFrom: aSecondDictionary withOrderedAssociations: anAssociationCollection [
	self
		deny: aFirstDictionary == aSecondDictionary;
		deny: aFirstDictionary dictionary == aSecondDictionary dictionary;
		deny: aFirstDictionary orderedKeys == aSecondDictionary orderedKeys.

	"esnure the associations were copied (the keys and values can be shared)"
	aFirstDictionary associations do: [:each |
		self deny: (aSecondDictionary associations identityIncludes: each)].

	self
		assertIsDictionary: aFirstDictionary
		withOrderedAssociations: anAssociationCollection.
]

{ #category : #assertions }
StandardOrderedDictionaryTest >> assertIsDictionary: anObject withOrderedAssociations: anAssociationCollection [
	"tests that anObject is an instance of the correct dictionary class
	with the specified ordered associations"
	self
		assert: anObject class == self dictionaryClass;
		assert: anObject orderedKeys size >= anAssociationCollection size;
		assert: anObject associations size = anAssociationCollection size.

	anAssociationCollection withIndexDo: [:each :i |
		self isTestingIdentityDictionary
			ifTrue: [
				self
					assert: (anObject orderedKeys at: i) == each key;
					assert: (anObject associations at: i) key == each key]
			ifFalse: [
				self
					assert: (anObject orderedKeys at: i) = each key;
					assert: (anObject associations at: i) key = each key].
		self assert: (anObject associations at: i) value = each value].
]

{ #category : #assertions }
StandardOrderedDictionaryTest >> assertIsDictionary: anObject withUnorderedAssociations: anAssociationCollection [
	"tests that anObject is an instance of the correct dictionary class
	with the specified associations, but ignoring the order"
	self
		assert: anObject class == self dictionaryClass;
		assert: anObject size = anAssociationCollection size.
	anAssociationCollection do: [:each |
		self assert: (anObject includesAssociation: each)].
]

{ #category : #assertions }
StandardOrderedDictionaryTest >> assertKey: aKey wasRemovedfrom: aDictionary [
	self deny: (aDictionary includesKey: aKey).
	aDictionary keys asArray, aDictionary orderedKeys asArray do: [:each |
		self deny:
			(self isTestingIdentityDictionary
				ifTrue: [each == aKey]
				ifFalse: [each = aKey])].
]

{ #category : #accessing }
StandardOrderedDictionaryTest >> changedOrderedAssociations [
	^ self orderedAssociations collect: [:each | each key -> self newValue]
]

{ #category : #accessing }
StandardOrderedDictionaryTest >> changedOrderedAssociationsFirst: anInteger [
	"GS does not have #first:"
	^ self changedOrderedAssociations
		copyFrom: 1
		to: anInteger
]

{ #category : #accessing }
StandardOrderedDictionaryTest >> collectClass [
	^ Array
]

{ #category : #accessing }
StandardOrderedDictionaryTest >> defaultCapacity [
	^ self emptyInternalDictionary capacity
]

{ #category : #accessing }
StandardOrderedDictionaryTest >> dictionaryClass [
	^ StandardOrderedDictionary
]

{ #category : #accessing }
StandardOrderedDictionaryTest >> dictionaryWithOrderedAssociations [
	^ self dictionaryClass newFrom: self orderedAssociations
]

{ #category : #accessing }
StandardOrderedDictionaryTest >> emptyDictionary [
	^ self dictionaryClass new
]

{ #category : #accessing }
StandardOrderedDictionaryTest >> emptyInternalDictionary [
	^ self internalDictionaryClass new
]

{ #category : #accessing }
StandardOrderedDictionaryTest >> identityAbsentKey [
	^ self orderedKeys first copy
]

{ #category : #accessing }
StandardOrderedDictionaryTest >> identityOrderedAssociations [
	"Returns ordered associations to use for identity dictionaries.
	The keys are all #= equal but #== different, so only an
	identity dictionary will be able to distinguish them."
	identityOrderedAssociations
		ifNil: [| key |
			key := 'testKey'.
			identityOrderedAssociations :=
				Array
					with: (key := key copy) -> 'testValue'
					with: (key := key copy) -> 'testValue3'
					with: (key := key copy) -> 'testValue2'
					with: (key := key copy) -> 'testValue4'].
	"return copies of the associations so they can be safely modified
	in one test without affecting another, but do not copy the keys
	and values"
	^ identityOrderedAssociations collect: [:each | each copy].
]

{ #category : #accessing }
StandardOrderedDictionaryTest >> internalDictionaryClass [
	self isTestingIdentityDictionary
		ifTrue: [^ IdentityDictionary]
		ifFalse: [^ Dictionary]
]

{ #category : #accessing }
StandardOrderedDictionaryTest >> internalDictionaryWithAssociations [
	^ self internalDictionaryClass newFrom: self orderedAssociations
]

{ #category : #testing }
StandardOrderedDictionaryTest >> isTestingIdentityDictionary [
	^ false
]

{ #category : #accessing }
StandardOrderedDictionaryTest >> newValue [
	^ 'newValue'
]

{ #category : #accessing }
StandardOrderedDictionaryTest >> nonIdentityAbsentKey [
	^ 'absentKey'
]

{ #category : #accessing }
StandardOrderedDictionaryTest >> nonIdentityOrderedAssociations [
	"Returns ordered associations to use for non-identity dictionaries.
	The keys are all #= and #== different and are returned out of their
	natural sort order."
	nonIdentityOrderedAssociations
		ifNil: [
			nonIdentityOrderedAssociations :=
				Array
					with: 'testKey' -> 'testValue'
					with: 'testKey3' -> 'testValue3'
					with: 'testKey2' -> 'testValue2'
					with: 'testKey4' -> 'testValue4'].
	"return copies of the associations so they can be safely modified
	in one test without affecting another, but do not copy the keys
	and values"
	^ nonIdentityOrderedAssociations collect: [:each | each copy].
]

{ #category : #accessing }
StandardOrderedDictionaryTest >> orderedAssociations [
	self isTestingIdentityDictionary
		ifTrue: [^ self identityOrderedAssociations]
		ifFalse: [^ self nonIdentityOrderedAssociations]
]

{ #category : #accessing }
StandardOrderedDictionaryTest >> orderedAssociationsAllButFirst: anInteger [
	^ self orderedAssociations allButFirst: anInteger
]

{ #category : #accessing }
StandardOrderedDictionaryTest >> orderedAssociationsFirst: anInteger [
	"GS does not have #first:"
	^ self orderedAssociations
		copyFrom: 1
		to: anInteger
]

{ #category : #accessing }
StandardOrderedDictionaryTest >> orderedKeys [
	^ self orderedAssociations collect: [:each | each key]
]

{ #category : #accessing }
StandardOrderedDictionaryTest >> orderedKeysFirst: anInteger [
	"GS does not have #first:"
	^ self orderedKeys
		copyFrom: 1
		to: anInteger
]

{ #category : #accessing }
StandardOrderedDictionaryTest >> orderedValues [
	^ self orderedAssociations collect: [:each | each value]
]

{ #category : #accessing }
StandardOrderedDictionaryTest >> orderedValuesFirst: anInteger [
	"GS does not have #first:"
	^ self orderedValues
		copyFrom: 1
		to: anInteger
]

{ #category : #accessing }
StandardOrderedDictionaryTest >> otherOrderPreservingDictionaryClasses [
	^ StandardOrderedDictionary withAllSubclasses copyWithout: self dictionaryClass
]

{ #category : #assertions }
StandardOrderedDictionaryTest >> should: aBlock enumerate: aCollection [
	| enumerated |

	enumerated := OrderedCollection new.
	aBlock value: [:each | enumerated add: each].
	self assert: enumerated = aCollection asOrderedCollection.
]

{ #category : #assertions }
StandardOrderedDictionaryTest >> should: aBlock enumerate: aFirstCollection and: aSecondCollection [
	| firstEnumerated secondEnumerated |

	firstEnumerated := OrderedCollection new.
	secondEnumerated := OrderedCollection new.
	aBlock value: [:first :second |
		firstEnumerated addLast: first.
		secondEnumerated addLast: second].
	self
		assert: firstEnumerated = aFirstCollection asOrderedCollection;
		assert: secondEnumerated = aSecondCollection asOrderedCollection.
]

{ #category : #tests }
StandardOrderedDictionaryTest >> testAdd [
	| dictionary |

	dictionary := self emptyDictionary.
	self orderedAssociations withIndexDo: [:each :i |
		self
			deny: (dictionary includesAssociation: each);
			assert: (dictionary add: each) == each;
			assert: (dictionary includesAssociation: each).
		self
			assertIsDictionary: dictionary
			withOrderedAssociations: (self orderedAssociationsFirst: i)].

	"ensure adding the same associations doesn't change the order"
	self orderedAssociations reverseDo: [:each |
		self assert: (dictionary add: each) == each.
		self
			assertIsDictionary: dictionary
			withOrderedAssociations: self orderedAssociations].

	self changedOrderedAssociations withIndexDo: [:each :i | | old |
		old := self orderedAssociations at: i.
		self
			assert: (dictionary add: each) == each;
			assert: (dictionary includesAssociation: each);
			deny: (dictionary includesAssociation: old).
		self
			assertIsDictionary: dictionary
			withOrderedAssociations:
				(self changedOrderedAssociationsFirst: i),
				(self orderedAssociationsAllButFirst: i)].
]

{ #category : #tests }
StandardOrderedDictionaryTest >> testAddAll [
	| dictionary addedAssociations |

	dictionary := self emptyDictionary.
	self orderedAssociations do: [:each |
		self deny: (dictionary includesAssociation: each)].

	addedAssociations := self orderedAssociations.
	self assert: (dictionary addAll: addedAssociations) == addedAssociations.
	self
		assertIsDictionary: dictionary
		withOrderedAssociations: self orderedAssociations.

	"ensure adding the same associations doesn't change the order"
	addedAssociations := self orderedAssociations reversed.
	self assert: (dictionary addAll: addedAssociations) == addedAssociations.
	self
		assertIsDictionary: dictionary
		withOrderedAssociations: self orderedAssociations.

	addedAssociations := self changedOrderedAssociations.
	self assert: (dictionary addAll: addedAssociations) == addedAssociations.
	self
		assertIsDictionary: dictionary
		withOrderedAssociations: self changedOrderedAssociations.
]

{ #category : #tests }
StandardOrderedDictionaryTest >> testAssociationAt [
	| dictionary |

	dictionary := self emptyDictionary.
	self orderedAssociations do: [:each |
		self
			should: [dictionary associationAt: each key]
			raise: Error.

		dictionary add: each.
		self assert: (dictionary associationAt: each key) = each].
]

{ #category : #tests }
StandardOrderedDictionaryTest >> testAssociationAtIfAbsent [
	| dictionary |

	dictionary := self emptyDictionary.
	self orderedAssociations do: [:each |
		self assert:
			(dictionary
				associationAt: each key
				ifAbsent: [self absentValue]) = self absentValue.

		dictionary add: each.
		self assert:
			(dictionary
				associationAt: each key
				ifAbsent: [self fail]) = each].
]

{ #category : #tests }
StandardOrderedDictionaryTest >> testAssociationAtIfPresent [
	| dictionary |

	dictionary := self emptyDictionary.
	self orderedAssociations do: [:each |
		self assert:
			(dictionary
				associationAt: each key
				ifPresent: [self fail]) isNil.

		dictionary add: each.
		self assert:
			(dictionary
				associationAt: each key
				ifPresent: [:assoc | self newValue -> assoc]) = (self newValue -> each).
		"ensure cull: is used"
		self assert:
			(dictionary
				associationAt: each key
				ifPresent: [self newValue]) = self newValue].
]

{ #category : #tests }
StandardOrderedDictionaryTest >> testAssociations [
	| dictionary |

	dictionary := self emptyDictionary.
	self
		assertIsArray: dictionary associations
		withElements: #().
	self orderedAssociations withIndexDo: [:each :i |
		dictionary add: each.
		self
			assertIsArray: dictionary associations
			withElements: (self orderedAssociationsFirst: i)].
]

{ #category : #tests }
StandardOrderedDictionaryTest >> testAssociationsDo [
	| dictionary |

	dictionary := self emptyDictionary.
	self
		should: [:block | dictionary associationsDo: block]
		enumerate: #().
	self orderedAssociations withIndexDo: [:each :i |
		dictionary add: each.
		self
			should: [:block | dictionary associationsDo: block]
			enumerate: (self orderedAssociationsFirst: i)].
]

{ #category : #tests }
StandardOrderedDictionaryTest >> testAssociationsSelect [
	| dictionary |

	dictionary := self dictionaryWithOrderedAssociations.
	self orderedAssociations do: [:assoc | | selectedAssociations |
		selectedAssociations := self orderedAssociations copyWithout: assoc.
		self
			assertIsDictionary:
				(dictionary associationsSelect: [:each |
					selectedAssociations includes: each])
			copiedFrom: dictionary
			withOrderedAssociations:
				(self orderedAssociations select: [:each |
					selectedAssociations includes: each])].
]

{ #category : #tests }
StandardOrderedDictionaryTest >> testAt [
	| dictionary |

	dictionary := self emptyDictionary.
	self orderedAssociations do: [:each |
		self
			should: [dictionary at: each key]
			raise: Error.

		dictionary add: each.
		self assert: (dictionary at: each key) = each value].
]

{ #category : #tests }
StandardOrderedDictionaryTest >> testAtIfAbsent [
	| dictionary |

	dictionary := self emptyDictionary.
	self orderedAssociations do: [:each |
		self assert:
			(dictionary
				at: each key
				ifAbsent: [self absentValue]) = self absentValue.

		dictionary add: each.
		self assert:
			(dictionary
				at: each key
				ifAbsent: [self fail]) = each value].
]

{ #category : #tests }
StandardOrderedDictionaryTest >> testAtIfAbsentPut [
	| dictionary |

	dictionary := self emptyDictionary.
	self orderedAssociations do: [:each |
		self assert:
			(dictionary
				at: each key
				ifAbsentPut: [each value]) = each value.
		self assert:
			(dictionary
				at: each key
				ifAbsentPut: [self fail]) = each value].
]

{ #category : #tests }
StandardOrderedDictionaryTest >> testAtIfPresent [
	| dictionary |

	dictionary := self emptyDictionary.
	self orderedAssociations do: [:each |
		self assert:
			(dictionary
				at: each key
				ifPresent: [self fail]) isNil.

		dictionary add: each.
		self assert:
			(dictionary
				at: each key
				ifPresent: [:value | self newValue -> value]) =
					(self newValue -> each value).
		"ensure cull: is used"
		self assert:
			(dictionary
				at: each key
				ifPresent: [self newValue]) = self newValue].
]

{ #category : #tests }
StandardOrderedDictionaryTest >> testAtIfPresentIfAbsent [
	| dictionary |

	dictionary := self emptyDictionary.
	self orderedAssociations do: [:each |
		self assert:
			(dictionary
				at: each key
				ifPresent: [self fail]
				ifAbsent: [self absentValue]) = self absentValue.

		dictionary add: each.
		self assert:
			(dictionary
				at: each key
				ifPresent: [:value | self newValue -> value]
				ifAbsent: [self fail]) = (self newValue -> each value).
		"ensure cull: is used"
		self assert:
			(dictionary
				at: each key
				ifPresent: [self newValue]
				ifAbsent: [self fail]) = self newValue].
]

{ #category : #tests }
StandardOrderedDictionaryTest >> testAtPut [
	| dictionary |

	dictionary := self emptyDictionary.
	self orderedAssociations withIndexDo: [:each :i |
		self assert:
			(dictionary
				at: each key
				put: each value) = each value.
		self
			assertIsDictionary: dictionary
			withOrderedAssociations: (self orderedAssociationsFirst: i)].

	self changedOrderedAssociations withIndexDo: [:each :i |
		self assert:
			(dictionary
				at: each key
				put: each value) = each value.
		self
			assertIsDictionary: dictionary
			withOrderedAssociations:
				(self changedOrderedAssociationsFirst: i),
				(self orderedAssociationsAllButFirst: i)].
]

{ #category : #tests }
StandardOrderedDictionaryTest >> testCapacity [
	"The current Dictionary implementation allocates more than specified.
	The amount allocated may change in the future but it likely won't ever
	be less than specified, so a >= test is used throughout."

	| defaultCapacity dictionary |

	defaultCapacity := self defaultCapacity.
	dictionary := self dictionaryClass new.
	self assert: dictionary capacity >= defaultCapacity.

	dictionary := self dictionaryClass new: (defaultCapacity / 2) asInteger.
	self assert: dictionary capacity >= (defaultCapacity / 2) asInteger.

	dictionary := self dictionaryClass newFrom: self orderedAssociations.
	self assert: dictionary capacity >= self orderedAssociations size.

	self orderedAssociations size to: 0 by: -1 do: [:i |
		self
			shouldnt: [
				dictionary := self dictionaryClass new: i.
				dictionary addAll: self orderedAssociations]
			raise: Error].
]

{ #category : #tests }
StandardOrderedDictionaryTest >> testCollect [
	| dictionary |

	dictionary := self dictionaryWithOrderedAssociations.
	self
		assertIsDictionary:
			(dictionary collect: [:each | each hash])
		copiedFrom: dictionary
		withOrderedAssociations:
			(self orderedAssociations collect: [:each | each key -> each value hash]).
]

{ #category : #tests }
StandardOrderedDictionaryTest >> testCopy [
	| dictionary copy |

	dictionary := self dictionaryWithOrderedAssociations.
	copy := dictionary copy.
	self
		assertIsDictionary: dictionary
		withOrderedAssociations: self orderedAssociations.
	self
		assertIsDictionary: copy
		copiedFrom: dictionary
		withOrderedAssociations: self orderedAssociations.
]

{ #category : #tests }
StandardOrderedDictionaryTest >> testCopyEmpty [
	| dictionary copy |

	dictionary := self dictionaryWithOrderedAssociations.
	copy := dictionary copyEmpty.
	self
		assertIsDictionary: dictionary
		withOrderedAssociations: self orderedAssociations.
	self
		assertIsDictionary: copy
		copiedFrom: dictionary
		withOrderedAssociations: #().
]

{ #category : #tests }
StandardOrderedDictionaryTest >> testDictionary [
	| dictionary |

	dictionary := self emptyDictionary.
	self
		assert: dictionary dictionary class == self internalDictionaryClass;
		assert: dictionary dictionary = self emptyInternalDictionary.

	dictionary := self dictionaryWithOrderedAssociations.
	self
		assert: dictionary dictionary class == self internalDictionaryClass;
		assert: dictionary dictionary = self internalDictionaryWithAssociations.
]

{ #category : #tests }
StandardOrderedDictionaryTest >> testDo [
	| dictionary |

	dictionary := self emptyDictionary.
	self
		should: [:block | dictionary do: block]
		enumerate: #().
	self orderedAssociations withIndexDo: [:each :i |
		dictionary add: each.
		self
			should: [:block | dictionary do: block]
			enumerate: (self orderedValuesFirst: i)].
]

{ #category : #tests }
StandardOrderedDictionaryTest >> testEquals [
	| dictionaryOne dictionaryTwo |

	dictionaryOne := self emptyDictionary.
	dictionaryTwo := self emptyDictionary.
	self
		assertDictionary: dictionaryOne
		equals: dictionaryTwo.

	"For equality, order will not matter"
	self orderedAssociations
		with: self orderedAssociations reversed
		do: [:firstAssociation :secondAssociation |
			dictionaryOne add: firstAssociation.
			dictionaryTwo add: secondAssociation.
			self
				assertDictionary: dictionaryOne
				doesNotEqual: self emptyDictionary.
			self
				assertDictionary: dictionaryTwo
				doesNotEqual: self emptyDictionary.
			dictionaryOne size < self orderedAssociations size
				ifTrue: [
					self
						assertDictionary: dictionaryOne
						doesNotEqual: dictionaryTwo]].

	self
		assertDictionary: dictionaryOne
		equals: dictionaryTwo.
]

{ #category : #tests }
StandardOrderedDictionaryTest >> testEqualsDictionary [
	"cannot use assertDictionary:doesNotEqual: for backwards compatibility with
	older Pharo images where Dictionary>>= uses #isDictionary to test the argument
	because these classes also implement isDictionary"
	self
		deny: self emptyDictionary = self emptyInternalDictionary;
		deny: self dictionaryWithOrderedAssociations = self internalDictionaryWithAssociations
]

{ #category : #tests }
StandardOrderedDictionaryTest >> testEqualsOtherOrderPreservingDictionaries [
	self otherOrderPreservingDictionaryClasses do: [:otherClass |
		| dictionary otherDictionary |
		dictionary := self dictionaryClass new.
		otherDictionary := otherClass new.
		dictionary isIdentityDictionary = otherDictionary isIdentityDictionary
			ifTrue: [
				self
					assertDictionary: dictionary
					equals: otherDictionary.
				self orderedAssociations do: [:each |
					dictionary add: each.
					self
						assertDictionary: dictionary
						doesNotEqual: otherDictionary.
					otherDictionary add: each copy.
					self
						assertDictionary: dictionary
						equals: otherDictionary]]
			ifFalse: [
				self
					assertDictionary: dictionary
					doesNotEqual: otherDictionary.
				self orderedAssociations do: [:each |
					dictionary add: each.
					otherDictionary add: each copy.
					self
						assertDictionary: dictionary
						doesNotEqual: otherDictionary]]]
]

{ #category : #tests }
StandardOrderedDictionaryTest >> testHash [
	| dictionary otherDictionary internalDictionary otherInternalDictionary |

	dictionary := self emptyDictionary.
	otherDictionary := self emptyDictionary.
	internalDictionary := self emptyInternalDictionary.
	otherInternalDictionary := self emptyInternalDictionary.
	self assert: dictionary hash = otherDictionary hash.
	self orderedAssociations do: [:each |
		dictionary add: each.
		internalDictionary add: each copy.
		"if the internal hashes differ after adding to one, the external should too"
		internalDictionary hash = otherInternalDictionary hash
			ifFalse: [self deny: dictionary hash = otherDictionary hash].

		otherDictionary add: each copy.
		otherInternalDictionary add: each copy.
		"should be equal regardless now"
		self assert: dictionary hash = otherDictionary hash].
]

{ #category : #tests }
StandardOrderedDictionaryTest >> testHashOtherOrderPreservingDictionaries [
	self otherOrderPreservingDictionaryClasses do: [:otherClass |
		| dictionary otherDictionary |
		dictionary := self dictionaryClass new.
		otherDictionary := otherClass new.
		dictionary isIdentityDictionary = otherDictionary isIdentityDictionary
			ifTrue: [
				self assert: dictionary hash = otherDictionary hash.
				self orderedAssociations do: [:each |
					dictionary add: each.
					otherDictionary add: each copy.
					self assert: dictionary hash = otherDictionary hash]]]
]

{ #category : #tests }
StandardOrderedDictionaryTest >> testIdentityIndexOfKey [
	| dictionary |

	dictionary := self emptyDictionary.
	self orderedAssociations withIndexDo: [:each :i |
		self assert: (dictionary identityIndexOfKey: each key) = 0.

		dictionary add: each.
		self
			assert: (dictionary identityIndexOfKey: each key) = i;
			assert: (dictionary identityIndexOfKey: each key copy) = 0].
]

{ #category : #tests }
StandardOrderedDictionaryTest >> testIdentityIndexOfKeyIfAbsent [
	| dictionary |

	dictionary := self emptyDictionary.
	self orderedAssociations withIndexDo: [:each :i |
		self assert:
			(dictionary
				identityIndexOfKey: each key
				ifAbsent: [self absentValue]) = self absentValue.

		dictionary add: each.
		self assert:
			(dictionary
				identityIndexOfKey: each key
				ifAbsent: [self fail]) = i.
		self assert:
			(dictionary
				identityIndexOfKey: each key copy
				ifAbsent: [self absentValue]) = self absentValue].
]

{ #category : #tests }
StandardOrderedDictionaryTest >> testIncludes [
	| dictionary |

	dictionary := self emptyDictionary.
	self orderedAssociations do: [:each |
		self deny: (dictionary includes: each value).

		dictionary add: each.
		self assert: (dictionary includes: each value)].
]

{ #category : #tests }
StandardOrderedDictionaryTest >> testIncludesAssociation [
	| dictionary |

	dictionary := self emptyDictionary.
	self orderedAssociations do: [:each |
		self
			deny: (dictionary includesAssociation: each);
			deny: (dictionary includesAssociation: each key -> each value).

		dictionary add: each.
		self
			assert: (dictionary includesAssociation: each);
			assert: (dictionary includesAssociation: each key -> each value)].
]

{ #category : #tests }
StandardOrderedDictionaryTest >> testIncludesIdentity [
	| dictionary |

	dictionary := self emptyDictionary.
	self orderedAssociations do: [:each |
		self deny: (dictionary includesIdentity: each value).

		dictionary add: each.
		self
			assert: (dictionary includesIdentity: each value);
			deny: (dictionary includesIdentity: each value copy)].
]

{ #category : #tests }
StandardOrderedDictionaryTest >> testIncludesKey [
	| dictionary |

	dictionary := self emptyDictionary.
	self orderedAssociations do: [:each |
		self deny: (dictionary includesKey: each key).

		dictionary add: each.
		self assert: (dictionary includesKey: each key)].
]

{ #category : #tests }
StandardOrderedDictionaryTest >> testIndexOfKey [
	| dictionary |

	dictionary := self emptyDictionary.
	self orderedAssociations withIndexDo: [:each :i |
		self assert: (dictionary indexOfKey: each key) = 0.

		dictionary add: each.
		self assert: (dictionary indexOfKey: each key) = i].
]

{ #category : #tests }
StandardOrderedDictionaryTest >> testIndexOfKeyIfAbsent [
	| dictionary |

	dictionary := self emptyDictionary.
	self orderedAssociations withIndexDo: [:each :i |
		self assert:
			(dictionary
				indexOfKey: each key
				ifAbsent: [self absentValue]) = self absentValue.

		dictionary add: each.
		self assert:
			(dictionary
				indexOfKey: each key
				ifAbsent: [self fail]) = i].
]

{ #category : #tests }
StandardOrderedDictionaryTest >> testIsDictionary [
	self assert: self dictionaryClass new isDictionary
]

{ #category : #tests }
StandardOrderedDictionaryTest >> testIsIdentityDictionary [
	self assert: self emptyDictionary isIdentityDictionary = self isTestingIdentityDictionary
]

{ #category : #tests }
StandardOrderedDictionaryTest >> testIsOrderPreservingDictionary [
	self
		assert: self dictionaryWithOrderedAssociations isOrderPreservingDictionary;
		deny: self internalDictionaryWithAssociations isOrderPreservingDictionary;
		deny: self orderedAssociations isOrderPreservingDictionary
]

{ #category : #tests }
StandardOrderedDictionaryTest >> testKeyAtIdentityValue [
	| dictionary |

	dictionary := self emptyDictionary.
	self orderedAssociations do: [:each |
		self
			should: [dictionary keyAtIdentityValue: each value]
			raise: Error.

		dictionary add: each.
		self assert: (dictionary keyAtIdentityValue: each value) = each key.
		self
			should: [dictionary keyAtIdentityValue: each value copy]
			raise: Error].
]

{ #category : #tests }
StandardOrderedDictionaryTest >> testKeyAtIdentityValueIfAbsent [
	| dictionary |

	dictionary := self emptyDictionary.
	self orderedAssociations do: [:each |
		self assert:
			(dictionary
				keyAtIdentityValue: each value
				ifAbsent: [self absentKey]) = self absentKey.

		dictionary add: each.
		self assert:
			(dictionary
				keyAtIdentityValue: each value
				ifAbsent: [self fail]) = each key.
		self assert:
			(dictionary
				keyAtIdentityValue: each value copy
				ifAbsent: [self absentKey]) = self absentKey].
]

{ #category : #tests }
StandardOrderedDictionaryTest >> testKeyAtIndex [
	| dictionary |

	dictionary := self emptyDictionary.
	self
		should: [dictionary keyAtIndex: 0]
		raise: Error.
	self orderedAssociations withIndexDo: [:each :i |
		self
			should: [dictionary keyAtIndex: i]
			raise: Error.

		dictionary add: each.
		self assert: (dictionary keyAtIndex: i) = each key].
]

{ #category : #tests }
StandardOrderedDictionaryTest >> testKeyAtIndexIfAbsent [
	| dictionary |

	dictionary := self emptyDictionary.
	self assert:
		(dictionary
			keyAtIndex: 0
			ifAbsent: [self absentKey]) = self absentKey.
	self orderedAssociations withIndexDo: [:each :i |
		self assert:
			(dictionary
				keyAtIndex: i
				ifAbsent: [self absentKey]) = self absentKey.

		dictionary add: each.
		self assert:
			(dictionary
				keyAtIndex: i
				ifAbsent: [self fail]) = each key].
]

{ #category : #tests }
StandardOrderedDictionaryTest >> testKeyAtValue [
	| dictionary |

	dictionary := self emptyDictionary.
	self orderedAssociations do: [:each |
		self
			should: [dictionary keyAtValue: each value]
			raise: Error.

		dictionary add: each.
		self assert: (dictionary keyAtValue: each value) = each key].
]

{ #category : #tests }
StandardOrderedDictionaryTest >> testKeyAtValueIfAbsent [
	| dictionary |

	dictionary := self emptyDictionary.
	self orderedAssociations do: [:each |
		self assert:
			(dictionary
				keyAtValue: each value
				ifAbsent: [self absentKey]) = self absentKey.

		dictionary add: each.
		self assert:
			(dictionary
				keyAtValue: each value
				ifAbsent: [self fail]) = each key].
]

{ #category : #tests }
StandardOrderedDictionaryTest >> testKeyForIdentity [
	| dictionary |

	dictionary := self emptyDictionary.
	self orderedAssociations do: [:each |
		self assert: (dictionary keyForIdentity: each value) isNil.

		dictionary add: each.
		self
			assert: (dictionary keyForIdentity: each value) = each key;
			assert: (dictionary keyForIdentity: each value copy) isNil].
]

{ #category : #tests }
StandardOrderedDictionaryTest >> testKeys [
	| dictionary |

	dictionary := self emptyDictionary.
	self
		assertIsArray: dictionary keys
		withElements: #().
	self orderedAssociations withIndexDo: [:each :i |
		dictionary add: each.
		self
			assertIsArray: dictionary keys
			withElements: (self orderedKeysFirst: i)].
]

{ #category : #tests }
StandardOrderedDictionaryTest >> testKeysAndValuesDo [
	| dictionary |

	dictionary := self emptyDictionary.
	self
		should: [:block | dictionary keysAndValuesDo: block]
		enumerate: #()
		and: #().
	self orderedAssociations withIndexDo: [:each :i |
		dictionary add: each.
		self
			should: [:block | dictionary keysAndValuesDo: block]
			enumerate: (self orderedKeysFirst: i)
			and: (self orderedValuesFirst: i)].
]

{ #category : #tests }
StandardOrderedDictionaryTest >> testKeysAndValuesRemove [
	| dictionary |

	dictionary := self dictionaryWithOrderedAssociations.
	self orderedAssociations withIndexDo: [:removedAssociation :i |
		| unremovedAssociations |
		unremovedAssociations :=
			(self orderedAssociationsAllButFirst: i) asOrderedCollection.
		dictionary keysAndValuesRemove: [:key :value |
			(self isTestingIdentityDictionary
				ifTrue: [key == removedAssociation key]
				ifFalse: [key = removedAssociation key])
				ifTrue: [
					self assert: value = removedAssociation value.
					true]
				ifFalse: [| unremovedAssociation |
					unremovedAssociation := unremovedAssociations removeFirst.
					self isTestingIdentityDictionary
						ifTrue: [self assert: key == unremovedAssociation key]
						ifFalse: [self assert: key = unremovedAssociation key].
					self assert: value = unremovedAssociation value.
					false]].
		self assert: unremovedAssociations isEmpty.
		self
			assertKey: removedAssociation key
			wasRemovedfrom: dictionary].
	self assert: dictionary isEmpty.
]

{ #category : #tests }
StandardOrderedDictionaryTest >> testKeysDo [
	| dictionary |

	dictionary := self emptyDictionary.
	self
		should: [:block | dictionary keysDo: block]
		enumerate: #().
	self orderedAssociations withIndexDo: [:each :i |
		dictionary add: each.
		self
			should: [:block | dictionary keysDo: block]
			enumerate: (self orderedKeysFirst: i)].
]

{ #category : #tests }
StandardOrderedDictionaryTest >> testKeysSortedSafely [
	| dictionary |

	dictionary := self emptyDictionary.
	self
		assertIsArray: dictionary keysSortedSafely
		withElements: #().
	self orderedAssociations withIndexDo: [:each :i |
		dictionary add: each.
		"The keys are all strings, so the default #sorted implementation is OK."
		self
			assertIsArray: dictionary keysSortedSafely
			withElements: (self orderedKeysFirst: i) sorted].
]

{ #category : #tests }
StandardOrderedDictionaryTest >> testNewFrom [
	| dictionary |
	
	dictionary := self dictionaryClass newFrom: self orderedAssociations.
	self
		assertIsDictionary: dictionary
		withOrderedAssociations: self orderedAssociations.
	self
		assertIsDictionary: (self dictionaryClass newFrom: dictionary)
		copiedFrom: dictionary
		withOrderedAssociations: self orderedAssociations.
	self
		assertIsDictionary:
			(self dictionaryClass newFrom: self internalDictionaryWithAssociations)
		withUnorderedAssociations: self orderedAssociations.
]

{ #category : #tests }
StandardOrderedDictionaryTest >> testNewFromPairs [
	| pairs |

	pairs := OrderedCollection new.
	self orderedAssociations do: [:each |
		pairs
			addLast: each key;
			addLast: each value].

	0 to: pairs size do: [:i |
		self
			assertIsDictionary:
				(self dictionaryClass newFromPairs: (pairs copyFrom: 1 to: i))
			withOrderedAssociations:
				(self orderedAssociationsFirst: (i / 2) floor)].
]

{ #category : #tests }
StandardOrderedDictionaryTest >> testOccurancesOf [
	| dictionary |

	dictionary := self emptyDictionary.
	self assert: (dictionary occurrencesOf: self newValue) = 0.
	self orderedKeys withIndexDo: [:each :i |
		dictionary
			at: each
			put: self newValue.
		self assert: (dictionary occurrencesOf: self newValue) = i]
]

{ #category : #tests }
StandardOrderedDictionaryTest >> testRemoveAll [
	| dictionary removedKeys |

	dictionary := self dictionaryWithOrderedAssociations.
	removedKeys := dictionary keys.
	self
		deny: dictionary isEmpty;
		assert: dictionary removeAll == dictionary;
		assert: dictionary isEmpty.
	removedKeys do: [:each |
		self
			assertKey: each
			wasRemovedfrom: dictionary].
]

{ #category : #tests }
StandardOrderedDictionaryTest >> testRemoveKey [
	| dictionary |

	dictionary := self dictionaryWithOrderedAssociations.
	self orderedAssociations withIndexDo: [:each :i |
		self assert: (dictionary removeKey: each key) = each value.
		self
			assertKey: each key
			wasRemovedfrom: dictionary.
		self
			assertIsDictionary: dictionary
			withOrderedAssociations: (self orderedAssociationsAllButFirst: i).

		self
			should: [dictionary removeKey: each key]
			raise: Error]
]

{ #category : #tests }
StandardOrderedDictionaryTest >> testRemoveKeyIfAbsent [
	| dictionary |

	dictionary := self dictionaryWithOrderedAssociations.
	self orderedAssociations withIndexDo: [:each :i |
		self assert:
			(dictionary
				removeKey: each key
				ifAbsent: [self fail]) = each value.
		self
			assertKey: each key
			wasRemovedfrom: dictionary.
		self
			assertIsDictionary: dictionary
			withOrderedAssociations: (self orderedAssociationsAllButFirst: i).

		self assert:
			(dictionary
				removeKey: each key
				ifAbsent: [self absentValue]) = self absentValue]
]

{ #category : #tests }
StandardOrderedDictionaryTest >> testRemoveKeys [
	0 to: self orderedAssociations size do: [:i | | dictionary keysToRemove |
		dictionary := self dictionaryWithOrderedAssociations.

		"make it a set to ensure it supports non-Sequenceable collections"
		keysToRemove :=
			(self isTestingIdentityDictionary
				ifTrue: [IdentitySet]
				ifFalse: [Set])
				"avoid #newFrom: for GS portability"
				withAll: (self orderedKeysFirst: i).
		self assert: (dictionary removeKeys: keysToRemove) == dictionary.
		keysToRemove do: [:each |
			self
				assertKey: each
				wasRemovedfrom: dictionary].

		self
			assertIsDictionary: dictionary
			withOrderedAssociations: (self orderedAssociationsAllButFirst: i)]
]

{ #category : #tests }
StandardOrderedDictionaryTest >> testSelect [
	| dictionary |

	dictionary := self dictionaryWithOrderedAssociations.
	self orderedValues do: [:value | | selectedValues |
		selectedValues := self orderedValues copyWithout: value.
		self
			assertIsDictionary:
				(dictionary select: [:each |
					selectedValues includes: each])
			copiedFrom: dictionary
			withOrderedAssociations:
				(self orderedAssociations select: [:each |
					selectedValues includes: each value])].
]

{ #category : #tests }
StandardOrderedDictionaryTest >> testSize [
	| dictionary |

	dictionary := self emptyDictionary.
	self assert: dictionary size = 0.

	self orderedAssociations withIndexDo: [:each :i |
		dictionary add: each.
		self assert: dictionary size = i].

	self orderedAssociations size to: 1 by: -1 do: [:i |
		dictionary removeKey: (self orderedKeys at: i).
		self assert: dictionary size = (i - 1)].
]

{ #category : #tests }
StandardOrderedDictionaryTest >> testValues [
	| dictionary |

	dictionary := self emptyDictionary.
	self
		assertIsArray: dictionary values
		withElements: #().
	self orderedAssociations withIndexDo: [:each :i |
		dictionary add: each.
		self
			assertIsArray: dictionary values
			withElements: (self orderedValuesFirst: i)].
]

{ #category : #tests }
StandardOrderedDictionaryTest >> testValuesDo [
	| dictionary |

	dictionary := self emptyDictionary.
	self
		should: [:block | dictionary valuesDo: block]
		enumerate: #().
	self orderedAssociations withIndexDo: [:each :i |
		dictionary add: each.
		self
			should: [:block | dictionary valuesDo: block]
			enumerate: (self orderedValuesFirst: i)].
]
