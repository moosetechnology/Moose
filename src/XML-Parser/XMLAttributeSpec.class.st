"
This is a base class for attribute specifications. Subclasses need to implement matchesAttributes: to return true if the argument attribute dictionary matches the spec and false otherwise.
"
Class {
	#name : #XMLAttributeSpec,
	#superclass : #Object,
	#category : #'XML-Parser-Utils'
}

{ #category : #converting }
XMLAttributeSpec >> asXMLAttributeSpec [
	^ self
]

{ #category : #matching }
XMLAttributeSpec >> matchesAttributes: anAttributeDictionary [
	self subclassResponsibility
]
