Class {
	#name : #StandardOrderedIdentityDictionaryTest,
	#superclass : #StandardOrderedDictionaryTest,
	#category : #'Collections-Tests-OrderPreservingDictionary'
}

{ #category : #accessing }
StandardOrderedIdentityDictionaryTest >> dictionaryClass [
	^ StandardOrderedIdentityDictionary
]

{ #category : #testing }
StandardOrderedIdentityDictionaryTest >> isTestingIdentityDictionary [
	^ true
]
