"
This is an abstract base class for XPath types. Subclasses must implement the #name method to return a printable type name.

Instances of subclasses are immutable and shared.
"
Class {
	#name : #XPathType,
	#superclass : #Object,
	#classInstVars : [
		'instance'
	],
	#category : #'XPath-Core-Types'
}

{ #category : #accessing }
XPathType class >> instance [
	^ instance ifNil: [instance := self basicNew initialize]
]

{ #category : #'instance creation' }
XPathType class >> new [
	^ self instance
]

{ #category : #comparing }
XPathType >> = anObject [
	^ self == anObject
		or: [self species == anObject species]
]

{ #category : #comparing }
XPathType >> hash [
	^ self species hash
]

{ #category : #accessing }
XPathType >> name [
	self subclassResponsibility
]

{ #category : #printing }
XPathType >> printOn: aStream [
	aStream nextPutAll: self name
]
