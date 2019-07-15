"
An abstract class for wrapping XPath types to polymorphically implement XPath comparison operators.
"
Class {
	#name : #XPathComparable,
	#superclass : #Object,
	#instVars : [
		'value'
	],
	#category : #'XPath-Core-Compilation'
}

{ #category : #'instance creation' }
XPathComparable class >> value: aValue [
	^ self new setValue: aValue
]

{ #category : #comparing }
XPathComparable >> < aComparable [
	self subclassResponsibility
]

{ #category : #comparing }
XPathComparable >> <= aComparable [
	self subclassResponsibility
]

{ #category : #comparing }
XPathComparable >> = aComparable [
	self subclassResponsibility
]

{ #category : #comparing }
XPathComparable >> > aComparable [
	self subclassResponsibility
]

{ #category : #comparing }
XPathComparable >> >= aComparable [
	self subclassResponsibility
]

{ #category : #converting }
XPathComparable >> asXPathComparable [
	^ self
]

{ #category : #private }
XPathComparable >> equalToBoolean: aBoolean [
	self subclassResponsibility
]

{ #category : #private }
XPathComparable >> equalToNodeSet: aNodeSet [
	self subclassResponsibility
]

{ #category : #private }
XPathComparable >> equalToNumber: aNumber [
	self subclassResponsibility
]

{ #category : #private }
XPathComparable >> equalToString: aString [
	self subclassResponsibility
]

{ #category : #private }
XPathComparable >> greaterThanBoolean: aBoolean [
	self subclassResponsibility
]

{ #category : #private }
XPathComparable >> greaterThanNodeSet: aNodeSet [
	self subclassResponsibility
]

{ #category : #private }
XPathComparable >> greaterThanNumber: aNumber [
	self subclassResponsibility
]

{ #category : #private }
XPathComparable >> greaterThanOrEqualToBoolean: aBoolean [
	self subclassResponsibility
]

{ #category : #private }
XPathComparable >> greaterThanOrEqualToNodeSet: aNodeSet [
	self subclassResponsibility
]

{ #category : #private }
XPathComparable >> greaterThanOrEqualToNumber: aNumber [
	self subclassResponsibility
]

{ #category : #private }
XPathComparable >> greaterThanOrEqualToString: aString [
	self subclassResponsibility
]

{ #category : #private }
XPathComparable >> greaterThanString: aString [
	self subclassResponsibility
]

{ #category : #private }
XPathComparable >> lessThanBoolean: aBoolean [
	self subclassResponsibility
]

{ #category : #private }
XPathComparable >> lessThanNodeSet: aNodeSet [
	self subclassResponsibility
]

{ #category : #private }
XPathComparable >> lessThanNumber: aNumber [
	self subclassResponsibility
]

{ #category : #private }
XPathComparable >> lessThanOrEqualToBoolean: aBoolean [
	self subclassResponsibility
]

{ #category : #private }
XPathComparable >> lessThanOrEqualToNodeSet: aNodeSet [
	self subclassResponsibility
]

{ #category : #private }
XPathComparable >> lessThanOrEqualToNumber: aNumber [
	self subclassResponsibility
]

{ #category : #private }
XPathComparable >> lessThanOrEqualToString: aString [
	self subclassResponsibility
]

{ #category : #private }
XPathComparable >> lessThanString: aString [
	self subclassResponsibility
]

{ #category : #private }
XPathComparable >> notEqualToBoolean: aBoolean [
	self subclassResponsibility
]

{ #category : #private }
XPathComparable >> notEqualToNodeSet: aNodeSet [
	self subclassResponsibility
]

{ #category : #private }
XPathComparable >> notEqualToNumber: aNumber [
	self subclassResponsibility
]

{ #category : #private }
XPathComparable >> notEqualToString: aString [
	self subclassResponsibility
]

{ #category : #printing }
XPathComparable >> printOn: aStream [
	super printOn: aStream.

	aStream
		nextPut: $(;
		print: value;
		nextPut: $).
]

{ #category : #initialization }
XPathComparable >> setValue: anObject [
	value := anObject
]

{ #category : #accessing }
XPathComparable >> value [
	^ value
]

{ #category : #comparing }
XPathComparable >> ~= aComparable [
	self subclassResponsibility
]
