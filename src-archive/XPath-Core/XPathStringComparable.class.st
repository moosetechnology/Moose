"
A class for wrapping XPath strings to polymorphically implement XPath comparison operators.
"
Class {
	#name : #XPathStringComparable,
	#superclass : #XPathComparable,
	#category : #'XPath-Core-Compilation'
}

{ #category : #comparing }
XPathStringComparable >> < aComparable [
	^ aComparable greaterThanString: value
]

{ #category : #comparing }
XPathStringComparable >> <= aComparable [
	^ aComparable greaterThanOrEqualToString: value
]

{ #category : #comparing }
XPathStringComparable >> = aComparable [
	^ aComparable equalToString: value
]

{ #category : #comparing }
XPathStringComparable >> > aComparable [
	^ aComparable lessThanString: value
]

{ #category : #comparing }
XPathStringComparable >> >= aComparable [
	^ aComparable lessThanOrEqualToString: value
]

{ #category : #private }
XPathStringComparable >> equalToBoolean: aBoolean [
	^ value asXPathBoolean = aBoolean
]

{ #category : #private }
XPathStringComparable >> equalToNodeSet: aNodeSet [
	^ aNodeSet anySatisfy: [:each |
		value = each stringValue]
]

{ #category : #private }
XPathStringComparable >> equalToNumber: aNumber [
	^ value asXPathNumber = aNumber
]

{ #category : #private }
XPathStringComparable >> equalToString: aString [
	^ value = aString
]

{ #category : #private }
XPathStringComparable >> greaterThanBoolean: aBoolean [
	^ value asXPathNumber > aBoolean asXPathNumber
]

{ #category : #private }
XPathStringComparable >> greaterThanNodeSet: aNodeSet [
	| number |
	
	number := value asXPathNumber.
	^ aNodeSet anySatisfy: [:each |
		number > each stringValue asXPathNumber].
]

{ #category : #private }
XPathStringComparable >> greaterThanNumber: aNumber [
	^ value asXPathNumber > aNumber
]

{ #category : #private }
XPathStringComparable >> greaterThanOrEqualToBoolean: aBoolean [
	^ value asXPathNumber >= aBoolean asXPathNumber
]

{ #category : #private }
XPathStringComparable >> greaterThanOrEqualToNodeSet: aNodeSet [
	| number |
	
	number := value asXPathNumber.
	^ aNodeSet anySatisfy: [:each |
		number >= each stringValue asXPathNumber].
]

{ #category : #private }
XPathStringComparable >> greaterThanOrEqualToNumber: aNumber [
	^ value asXPathNumber >= aNumber
]

{ #category : #private }
XPathStringComparable >> greaterThanOrEqualToString: aString [
	^ value asXPathNumber >= aString asXPathNumber
]

{ #category : #private }
XPathStringComparable >> greaterThanString: aString [
	^ value asXPathNumber > aString asXPathNumber
]

{ #category : #private }
XPathStringComparable >> lessThanBoolean: aBoolean [
	^ value asXPathNumber < aBoolean asXPathNumber
]

{ #category : #private }
XPathStringComparable >> lessThanNodeSet: aNodeSet [
	| number |
	
	number := value asXPathNumber.
	^ aNodeSet anySatisfy: [:each |
		number < each stringValue asXPathNumber].
]

{ #category : #private }
XPathStringComparable >> lessThanNumber: aNumber [
	^ value asXPathNumber < aNumber
]

{ #category : #private }
XPathStringComparable >> lessThanOrEqualToBoolean: aBoolean [
	^ value asXPathNumber <= aBoolean asXPathNumber
]

{ #category : #private }
XPathStringComparable >> lessThanOrEqualToNodeSet: aNodeSet [
	| number |
	
	number := value asXPathNumber.
	^ aNodeSet anySatisfy: [:each |
		number <= each stringValue asXPathNumber].
]

{ #category : #private }
XPathStringComparable >> lessThanOrEqualToNumber: aNumber [
	^ value asXPathNumber <= aNumber
]

{ #category : #private }
XPathStringComparable >> lessThanOrEqualToString: aString [
	^ value asXPathNumber <= aString asXPathNumber
]

{ #category : #private }
XPathStringComparable >> lessThanString: aString [
	^ value asXPathNumber < aString asXPathNumber
]

{ #category : #private }
XPathStringComparable >> notEqualToBoolean: aBoolean [
	^ value asXPathBoolean ~= aBoolean
]

{ #category : #private }
XPathStringComparable >> notEqualToNodeSet: aNodeSet [
	^ aNodeSet anySatisfy: [:each |
		value ~= each stringValue]
]

{ #category : #private }
XPathStringComparable >> notEqualToNumber: aNumber [
	^ value asXPathNumber ~= aNumber
]

{ #category : #private }
XPathStringComparable >> notEqualToString: aString [
	^ value ~= aString
]

{ #category : #comparing }
XPathStringComparable >> ~= aComparable [
	^ aComparable notEqualToString: value
]
