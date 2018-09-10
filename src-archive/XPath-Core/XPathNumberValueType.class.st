"
This is an XPath type class for Floats and instances of other Number subclasses.
"
Class {
	#name : #XPathNumberValueType,
	#superclass : #XPathValueType,
	#category : #'XPath-Core-Types'
}

{ #category : #testing }
XPathNumberValueType >> isNumberValueType [
	^ true
]

{ #category : #accessing }
XPathNumberValueType >> name [
	^ 'number'
]

{ #category : #'instance creation' }
XPathNumberValueType >> newFrom: anObject [
	^ anObject asXPathNumber
]
