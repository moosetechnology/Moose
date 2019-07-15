"
A class for wrapping XPath numbers to polymorphically implement XPath comparison operators.
"
Class {
	#name : #XPathNumberComparable,
	#superclass : #XPathComparable,
	#category : #'XPath-Core-Compilation'
}

{ #category : #comparing }
XPathNumberComparable >> < aComparable [
	^ aComparable greaterThanNumber: value
]

{ #category : #comparing }
XPathNumberComparable >> <= aComparable [
	^ aComparable greaterThanOrEqualToNumber: value
]

{ #category : #comparing }
XPathNumberComparable >> = aComparable [
	^ aComparable equalToNumber: value
]

{ #category : #comparing }
XPathNumberComparable >> > aComparable [
	^ aComparable lessThanNumber: value
]

{ #category : #comparing }
XPathNumberComparable >> >= aComparable [
	^ aComparable lessThanOrEqualToNumber: value
]

{ #category : #private }
XPathNumberComparable >> equalToBoolean: aBoolean [
	^ value asXPathBoolean = aBoolean
]

{ #category : #private }
XPathNumberComparable >> equalToNodeSet: aNodeSet [
	^ aNodeSet anySatisfy: [:each |
		value = each stringValue asXPathNumber]
]

{ #category : #private }
XPathNumberComparable >> equalToNumber: aNumber [
	^ value = aNumber
]

{ #category : #private }
XPathNumberComparable >> equalToString: aString [
	^ value = aString asXPathNumber
]

{ #category : #private }
XPathNumberComparable >> greaterThanBoolean: aBoolean [
	^ value > aBoolean asXPathNumber
]

{ #category : #private }
XPathNumberComparable >> greaterThanNodeSet: aNodeSet [
	^ aNodeSet anySatisfy: [:each |
		value > each stringValue asXPathNumber]
]

{ #category : #private }
XPathNumberComparable >> greaterThanNumber: aNumber [
	^ value > aNumber
]

{ #category : #private }
XPathNumberComparable >> greaterThanOrEqualToBoolean: aBoolean [
	^ value >= aBoolean asXPathNumber
]

{ #category : #private }
XPathNumberComparable >> greaterThanOrEqualToNodeSet: aNodeSet [
	^ aNodeSet anySatisfy: [:each |
		value >= each stringValue asXPathNumber]
]

{ #category : #private }
XPathNumberComparable >> greaterThanOrEqualToNumber: aNumber [
	^ value >= aNumber
]

{ #category : #private }
XPathNumberComparable >> greaterThanOrEqualToString: aString [
	^ value >= aString asXPathNumber
]

{ #category : #private }
XPathNumberComparable >> greaterThanString: aString [
	^ value > aString asXPathNumber
]

{ #category : #private }
XPathNumberComparable >> lessThanBoolean: aBoolean [
	^ value < aBoolean asXPathNumber
]

{ #category : #private }
XPathNumberComparable >> lessThanNodeSet: aNodeSet [
	^ aNodeSet anySatisfy: [:each |
		value < each stringValue asXPathNumber]
]

{ #category : #private }
XPathNumberComparable >> lessThanNumber: aNumber [
	^ value < aNumber
]

{ #category : #private }
XPathNumberComparable >> lessThanOrEqualToBoolean: aBoolean [
	^ value <= aBoolean asXPathNumber
]

{ #category : #private }
XPathNumberComparable >> lessThanOrEqualToNodeSet: aNodeSet [
	^ aNodeSet anySatisfy: [:each |
		value <= each stringValue asXPathNumber]
]

{ #category : #private }
XPathNumberComparable >> lessThanOrEqualToNumber: aNumber [
	^ value <= aNumber
]

{ #category : #private }
XPathNumberComparable >> lessThanOrEqualToString: aString [
	^ value <= aString asXPathNumber
]

{ #category : #private }
XPathNumberComparable >> lessThanString: aString [
	^ value < aString asXPathNumber
]

{ #category : #private }
XPathNumberComparable >> notEqualToBoolean: aBoolean [
	^ value asXPathBoolean ~= aBoolean
]

{ #category : #private }
XPathNumberComparable >> notEqualToNodeSet: aNodeSet [
	^ aNodeSet anySatisfy: [:each |
		value ~= each stringValue asXPathNumber]
]

{ #category : #private }
XPathNumberComparable >> notEqualToNumber: aNumber [
	^ value ~= aNumber
]

{ #category : #private }
XPathNumberComparable >> notEqualToString: aString [
	^ value ~= aString asXPathNumber
]

{ #category : #comparing }
XPathNumberComparable >> ~= aComparable [
	^ aComparable notEqualToNumber: value
]
