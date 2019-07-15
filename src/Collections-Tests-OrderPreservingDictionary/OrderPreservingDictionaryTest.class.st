Class {
	#name : #OrderPreservingDictionaryTest,
	#superclass : #StandardOrderedDictionaryTest,
	#category : #'Collections-Tests-OrderPreservingDictionary'
}

{ #category : #accessing }
OrderPreservingDictionaryTest >> defaultValue [
	^ 'defaultValue'
]

{ #category : #accessing }
OrderPreservingDictionaryTest >> dictionaryClass [
	^ OrderPreservingDictionary
]

{ #category : #accessing }
OrderPreservingDictionaryTest >> newDefaultValue [
	^ 'newDefaultValue'
]

{ #category : #tests }
OrderPreservingDictionaryTest >> testAssociationAt [
	| dictionary |

	dictionary := self emptyDictionary.
	self orderedAssociations do: [:each |
		self assert: (dictionary associationAt: each key) isNil.

		dictionary add: each.
		self assert: (dictionary associationAt: each key) = each].
]

{ #category : #tests }
OrderPreservingDictionaryTest >> testAssociationsSelect [
	super testAssociationsSelect.

	self assert:
		(self dictionaryWithOrderedAssociations
			defaultValue: self defaultValue;
			associationsSelect: [:each | true]) defaultValue = self defaultValue.
]

{ #category : #tests }
OrderPreservingDictionaryTest >> testAt [
	| dictionary |

	dictionary := self emptyDictionary.
	dictionary defaultValue: self defaultValue.
	self orderedAssociations do: [:each |
		self assert: (dictionary at: each key) = self defaultValue.

		dictionary add: each.
		self assert: (dictionary at: each key) = each value].
]

{ #category : #tests }
OrderPreservingDictionaryTest >> testCapacity [
	| defaultCapacity dictionary |

	super testCapacity.

	defaultCapacity := self defaultCapacity.
	dictionary := self dictionaryClass defaultValue: nil.
	self assert: dictionary capacity >= defaultCapacity.

	dictionary :=
		self dictionaryClass
			new: defaultCapacity * 2
			withDefaultValue: nil.
	self assert: dictionary capacity >= (defaultCapacity * 2).
]

{ #category : #tests }
OrderPreservingDictionaryTest >> testCollect [
	super testCollect.

	self assert:
		(self dictionaryWithOrderedAssociations
			defaultValue: self defaultValue;
			collect: [:each | each]) defaultValue = self defaultValue.
]

{ #category : #tests }
OrderPreservingDictionaryTest >> testCopy [
	| dictionary copy |

	super testCopy.

	dictionary := self dictionaryWithOrderedAssociations.
	dictionary defaultValue: self defaultValue.
	copy := dictionary copy.
	self assert: copy defaultValue = dictionary defaultValue.
]

{ #category : #tests }
OrderPreservingDictionaryTest >> testCopyEmpty [
	| dictionary copy |

	super testCopyEmpty.
	
	dictionary := self dictionaryWithOrderedAssociations.
	dictionary defaultValue: self defaultValue.
	copy := dictionary copyEmpty.
	self assert: copy defaultValue = dictionary defaultValue.
]

{ #category : #tests }
OrderPreservingDictionaryTest >> testDefaultValue [
	| dictionary |
	
	dictionary := self dictionaryClass defaultValue: self defaultValue.
	self
		assert: dictionary defaultValue = self defaultValue;
		assert: (dictionary defaultValue: self newDefaultValue) == dictionary;
		assert: dictionary defaultValue = self newDefaultValue.
]

{ #category : #tests }
OrderPreservingDictionaryTest >> testKeyAtIdentityValue [
	| dictionary |

	dictionary := self emptyDictionary.
	dictionary defaultValue: self defaultValue.
	self orderedAssociations do: [:each |
		self assert:
			(dictionary keyAtIdentityValue: each value) = self defaultValue.

		dictionary add: each.
		self assert:
			(dictionary keyAtIdentityValue: each value) = each key.
		self assert:
			(dictionary keyAtIdentityValue: each value copy) = self defaultValue].
]

{ #category : #tests }
OrderPreservingDictionaryTest >> testKeyAtIndex [
	| dictionary |

	dictionary := self emptyDictionary.
	dictionary defaultValue: self defaultValue.
	self assert: (dictionary keyAtIndex: 0) = self defaultValue.
	self orderedAssociations withIndexDo: [:each :i |
		self assert: (dictionary keyAtIndex: i) = self defaultValue.

		dictionary add: each.
		self assert: (dictionary keyAtIndex: i) = each key].
]

{ #category : #tests }
OrderPreservingDictionaryTest >> testKeyAtValue [
	| dictionary |

	dictionary := self emptyDictionary.
	dictionary defaultValue: self defaultValue.
	self orderedAssociations do: [:each |
		self assert: (dictionary keyAtValue: each value) = self defaultValue.

		dictionary add: each.
		self assert: (dictionary keyAtValue: each value) = each key].
]

{ #category : #tests }
OrderPreservingDictionaryTest >> testNewFrom [
	| dictionary copy |

	super testNewFrom.

	dictionary := self dictionaryClass newFrom: self orderedAssociations.
	dictionary defaultValue: self defaultValue.
	copy := self dictionaryClass newFrom: dictionary.
	self assert: copy defaultValue = dictionary defaultValue.
]

{ #category : #tests }
OrderPreservingDictionaryTest >> testNewWithDefaultValue [
	| dictionary |

	dictionary :=
		self dictionaryClass
			new: 10
			withDefaultValue: self defaultValue.
	self assert: dictionary defaultValue = self defaultValue.
]

{ #category : #tests }
OrderPreservingDictionaryTest >> testRemoveAll [
	| dictionary |

	super testRemoveAll.

	dictionary := self dictionaryWithOrderedAssociations.
	dictionary
		defaultValue: self defaultValue;
		removeAll.
	self assert: dictionary defaultValue = self defaultValue.
]

{ #category : #tests }
OrderPreservingDictionaryTest >> testRemoveKey [
	| dictionary |

	dictionary := self dictionaryWithOrderedAssociations.
	dictionary defaultValue: self defaultValue.
	self orderedAssociations withIndexDo: [:each :i |
		self assert: (dictionary removeKey: each key) = each value.
		self
			assertKey: each key
			wasRemovedfrom: dictionary.
		self
			assertIsDictionary: dictionary
			withOrderedAssociations: (self orderedAssociationsAllButFirst: i).

		self assert: (dictionary removeKey: each key) = self defaultValue]
]

{ #category : #tests }
OrderPreservingDictionaryTest >> testSelect [
	super testSelect.

	self assert:
		(self dictionaryWithOrderedAssociations
			defaultValue: self defaultValue;
			select: [:each | true]) defaultValue = self defaultValue.
]
