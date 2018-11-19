Class {
	#name : #XMLLazyNamespacedAttributeDictionaryTest,
	#superclass : #XMLNamespacedAttributeDictionaryTest,
	#category : #'XML-Tests-Parser'
}

{ #category : #accessing }
XMLLazyNamespacedAttributeDictionaryTest >> dictionaryClass [
	^ XMLLazyNamespacedAttributeDictionary
]

{ #category : #testing }
XMLLazyNamespacedAttributeDictionaryTest >> isTestingLazyDictionary [
	^ true
]
