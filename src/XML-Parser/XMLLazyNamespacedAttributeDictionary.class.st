"
A lazy version of XMLNamespacedAttributeDictionary that uses less memory until it's modified.
"
Class {
	#name : #XMLLazyNamespacedAttributeDictionary,
	#superclass : #XMLLazyAttributeDictionary,
	#instVars : [
		'namespaceScope'
	],
	#category : #'XML-Parser'
}

{ #category : #private }
XMLLazyNamespacedAttributeDictionary class >> emptyAttributeDictionaryClass [
	^ XMLNamespacedAttributeDictionary
]

{ #category : #'class initialization' }
XMLLazyNamespacedAttributeDictionary class >> initialize [
	"self initialize"

	self initializeEmptyAttributeDictionary
]

{ #category : #private }
XMLLazyNamespacedAttributeDictionary >> copyEmptyAttributeDictionary [
	^ super copyEmptyAttributeDictionary setNamespaceScope: self namespaceScope
]

{ #category : #private }
XMLLazyNamespacedAttributeDictionary >> namespaceScope [
	^ namespaceScope
		ifNil: [
			namespaceScope :=
				attributeDictionary == self emptyAttributeDictionary
					ifTrue: [XMLNamespaceScope new]
					ifFalse: [attributeDictionary namespaceScope]]
]

{ #category : #initialization }
XMLLazyNamespacedAttributeDictionary >> setNamespaceScope: aNamespaceScope [
	namespaceScope := aNamespaceScope
]
