Class {
	#name : #OrderPreservingIdentityStringDictionaryTest,
	#superclass : #OrderPreservingStringDictionaryTest,
	#category : #'Collections-Tests-OrderPreservingDictionary'
}

{ #category : #accessing }
OrderPreservingIdentityStringDictionaryTest >> dictionaryClass [
	^ OrderPreservingIdentityStringDictionary
]

{ #category : #testing }
OrderPreservingIdentityStringDictionaryTest >> isTestingIdentityDictionary [
	^ true
]
