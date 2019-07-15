"
A class for wrapping XPath booleans to polymorphically implement XPath comparison operators.
"
Class {
	#name : #XPathBooleanComparable,
	#superclass : #XPathComparable,
	#category : #'XPath-Core-Compilation'
}

{ #category : #comparing }
XPathBooleanComparable >> < aComparable [
	^ aComparable greaterThanBoolean: value
]

{ #category : #comparing }
XPathBooleanComparable >> <= aComparable [
	^ aComparable greaterThanOrEqualToBoolean: value
]

{ #category : #comparing }
XPathBooleanComparable >> = aComparable [
	^ aComparable equalToBoolean: value
]

{ #category : #comparing }
XPathBooleanComparable >> > aComparable [
	^ aComparable lessThanBoolean: value
]

{ #category : #comparing }
XPathBooleanComparable >> >= aComparable [
	^ aComparable lessThanOrEqualToBoolean: value
]

{ #category : #private }
XPathBooleanComparable >> equalToBoolean: aBoolean [
	^ value = aBoolean
]

{ #category : #private }
XPathBooleanComparable >> equalToNodeSet: aNodeSet [
	^ value = aNodeSet asXPathBoolean
]

{ #category : #private }
XPathBooleanComparable >> equalToNumber: aNumber [
	^ value = aNumber asXPathBoolean
]

{ #category : #private }
XPathBooleanComparable >> equalToString: aString [
	^ value = aString asXPathBoolean
]

{ #category : #private }
XPathBooleanComparable >> greaterThanBoolean: aBoolean [
	^ value asXPathNumber > aBoolean asXPathNumber
]

{ #category : #private }
XPathBooleanComparable >> greaterThanNodeSet: aNodeSet [
	^ value asXPathNumber > aNodeSet asXPathBoolean asXPathNumber
]

{ #category : #private }
XPathBooleanComparable >> greaterThanNumber: aNumber [
	^ value asXPathNumber > aNumber asXPathNumber
]

{ #category : #private }
XPathBooleanComparable >> greaterThanOrEqualToBoolean: aBoolean [
	^ value asXPathNumber >= aBoolean asXPathNumber
]

{ #category : #private }
XPathBooleanComparable >> greaterThanOrEqualToNodeSet: aNodeSet [
	^ value asXPathNumber >= aNodeSet asXPathBoolean asXPathNumber
]

{ #category : #private }
XPathBooleanComparable >> greaterThanOrEqualToNumber: aNumber [
	^ value asXPathNumber >= aNumber asXPathNumber
]

{ #category : #private }
XPathBooleanComparable >> greaterThanOrEqualToString: aString [
	^ value asXPathNumber >= aString asXPathNumber
]

{ #category : #private }
XPathBooleanComparable >> greaterThanString: aString [
	^ value asXPathNumber > aString asXPathNumber
]

{ #category : #private }
XPathBooleanComparable >> lessThanBoolean: aBoolean [
	^ value asXPathNumber < aBoolean asXPathNumber
]

{ #category : #private }
XPathBooleanComparable >> lessThanNodeSet: aNodeSet [
	^ value asXPathNumber < aNodeSet asXPathBoolean asXPathNumber
]

{ #category : #private }
XPathBooleanComparable >> lessThanNumber: aNumber [
	^ value asXPathNumber < aNumber asXPathNumber
]

{ #category : #private }
XPathBooleanComparable >> lessThanOrEqualToBoolean: aBoolean [
	^ value asXPathNumber <= aBoolean asXPathNumber
]

{ #category : #private }
XPathBooleanComparable >> lessThanOrEqualToNodeSet: aNodeSet [
	^ value asXPathNumber <= aNodeSet asXPathBoolean asXPathNumber
]

{ #category : #private }
XPathBooleanComparable >> lessThanOrEqualToNumber: aNumber [
	^ value asXPathNumber <= aNumber asXPathNumber
]

{ #category : #private }
XPathBooleanComparable >> lessThanOrEqualToString: aString [
	^ value asXPathNumber <= aString asXPathNumber
]

{ #category : #private }
XPathBooleanComparable >> lessThanString: aString [
	^ value asXPathNumber < aString asXPathNumber
]

{ #category : #private }
XPathBooleanComparable >> notEqualToBoolean: aBoolean [
	^ value ~= aBoolean
]

{ #category : #private }
XPathBooleanComparable >> notEqualToNodeSet: aNodeSet [
	^ value ~= aNodeSet asXPathBoolean
]

{ #category : #private }
XPathBooleanComparable >> notEqualToNumber: aNumber [
	^ value ~= aNumber asXPathBoolean
]

{ #category : #private }
XPathBooleanComparable >> notEqualToString: aString [
	^ value ~= aString asXPathBoolean
]

{ #category : #comparing }
XPathBooleanComparable >> ~= aComparable [
	^ aComparable notEqualToBoolean: value
]
