"
This is an XPath type class for string values.
"
Class {
	#name : #XPathStringValueType,
	#superclass : #XPathValueType,
	#category : #'XPath-Core-Types'
}

{ #category : #testing }
XPathStringValueType >> isStringValueType [
	^ true
]

{ #category : #accessing }
XPathStringValueType >> name [
	^ 'string'
]

{ #category : #'instance creation' }
XPathStringValueType >> newFrom: anObject [
	^ anObject asXPathString
]
