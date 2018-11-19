Class {
	#name : #OrderPreservingStringDictionaryTest,
	#superclass : #StandardOrderedDictionaryTest,
	#category : #'Collections-Tests-OrderPreservingDictionary'
}

{ #category : #accessing }
OrderPreservingStringDictionaryTest >> dictionaryClass [
	^ OrderPreservingStringDictionary
]

{ #category : #tests }
OrderPreservingStringDictionaryTest >> testAssociationAt [
	| dictionary |

	dictionary := self emptyDictionary.
	self orderedAssociations do: [:each |
		self assert: (dictionary associationAt: each key) isNil.
	
		dictionary add: each.
		self assert: (dictionary associationAt: each key) = each].
]

{ #category : #tests }
OrderPreservingStringDictionaryTest >> testAt [
	| dictionary |

	dictionary := self emptyDictionary.
	self orderedAssociations do: [:each |
		self assert: (dictionary at: each key) = ''.

		dictionary add: each.
		self assert: (dictionary at: each key) = each value].
]

{ #category : #tests }
OrderPreservingStringDictionaryTest >> testKeyAtIdentityValue [
	| dictionary |

	dictionary := self emptyDictionary.
	self orderedAssociations do: [:each |
		self assert: (dictionary keyAtIdentityValue: each value) = ''.

		dictionary add: each.
		self
			assert: (dictionary keyAtIdentityValue: each value) = each key;
			assert: (dictionary keyAtIdentityValue: each value copy) = ''].
]

{ #category : #tests }
OrderPreservingStringDictionaryTest >> testKeyAtIndex [
	| dictionary |

	dictionary := self emptyDictionary.
	self assert: (dictionary keyAtIndex: 0) = ''.
	self orderedAssociations withIndexDo: [:each :i |
		self assert: (dictionary keyAtIndex: i) = ''.

		dictionary add: each.
		self assert: (dictionary keyAtIndex: i) = each key].
]

{ #category : #tests }
OrderPreservingStringDictionaryTest >> testKeyAtValue [
	| dictionary |

	dictionary := self emptyDictionary.
	self orderedAssociations do: [:each |
		self assert: (dictionary keyAtValue: each value) = ''.

		dictionary add: each.
		self assert: (dictionary keyAtValue: each value) = each key].
]

{ #category : #tests }
OrderPreservingStringDictionaryTest >> testRemoveKey [
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

		self assert: (dictionary removeKey: each key) = '']
]
