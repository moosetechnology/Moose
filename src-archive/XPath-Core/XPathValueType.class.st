"
This is an XPath type class for any XPath value. Subclasses must implement #newFrom: to return the argument converted to the receiver type.
"
Class {
	#name : #XPathValueType,
	#superclass : #XPathType,
	#category : #'XPath-Core-Types'
}

{ #category : #testing }
XPathValueType >> isBooleanValueType [
	^ false
]

{ #category : #testing }
XPathValueType >> isNodeSetValueType [
	^ false
]

{ #category : #testing }
XPathValueType >> isNumberValueType [
	^ false
]

{ #category : #testing }
XPathValueType >> isStringValueType [
	^ false
]

{ #category : #accessing }
XPathValueType >> name [
	^ 'object'
]

{ #category : #'instance creation' }
XPathValueType >> newFrom: anObject [
	^ anObject
]
