"
An IdentityDictionary version that uses == instead of = for key comparing.
"
Class {
	#name : #OrderPreservingIdentityStringDictionary,
	#superclass : #OrderPreservingStringDictionary,
	#category : #'Collections-OrderPreservingDictionary'
}

{ #category : #accessing }
OrderPreservingIdentityStringDictionary >> dictionaryClass [
	^ IdentityDictionary
]

{ #category : #accessing }
OrderPreservingIdentityStringDictionary >> indexOfKey: aKey ifAbsent: aBlock [
	^ self
		identityIndexOfKey: aKey
		ifAbsent: aBlock
]

{ #category : #testing }
OrderPreservingIdentityStringDictionary >> isIdentityDictionary [
	^ true
]

{ #category : #private }
OrderPreservingIdentityStringDictionary >> orderedKeysIndexOf: aKey [
	^ self orderedKeysIdentityIndexOf: aKey
]
