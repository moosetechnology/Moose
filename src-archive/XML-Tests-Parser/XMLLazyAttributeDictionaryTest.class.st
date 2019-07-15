Class {
	#name : #XMLLazyAttributeDictionaryTest,
	#superclass : #XMLAttributeDictionaryTest,
	#category : #'XML-Tests-Parser'
}

{ #category : #accessing }
XMLLazyAttributeDictionaryTest >> dictionaryClass [
	^ XMLLazyAttributeDictionary
]

{ #category : #testing }
XMLLazyAttributeDictionaryTest >> isTestingLazyDictionary [
	^ true
]
